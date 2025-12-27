-- 在服务器A上执行：创建指向服务器B的链接服务器
USE Test;
GO
-- 首先删除已存在的链接服务器（如果存在）
IF EXISTS (SELECT 1 FROM sys.servers WHERE name = 'DESKTOP-IO65CQ4')
BEGIN
    EXEC sp_dropserver 'DESKTOP-IO65CQ4', 'droplogins';
END
GO
-- 方法1：使用SQL Server身份验证
EXEC sp_addlinkedserver 
    @server = 'DESKTOP-IO65CQ4\HP',          -- 链接服务器名称
    @srvproduct = '',
    @provider = 'SQLNCLI11',
    @datasrc = '172.30.5.209,1433';      -- 服务器B的IP和端口

-- 配置登录映射
EXEC sp_addlinkedsrvlogin 
    @rmtsrvname = 'DESKTOP-IO65CQ4\HP',
    @useself = 'FALSE',
    @locallogin = NULL,
    @rmtuser = 'sa',                      -- 服务器B的用户名
    @rmtpassword = 'Fq517469138';    -- 服务器B的密码

-- 测试连接
EXEC sp_testlinkedserver [DESKTOP-IO65CQ4\HP];