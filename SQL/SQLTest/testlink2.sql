-- 创建存储过程测试网络连接
CREATE PROCEDURE sp_TestSQLConnection
    @server_ip NVARCHAR(45),
    @port INT
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    
    PRINT '测试连接到: ' + @server_ip + ':' + CAST(@port AS NVARCHAR(10));
    
    -- 尝试多种连接方式
    BEGIN TRY
        -- 方式1: 使用IP和端口
        SET @sql = 'SELECT @@VERSION as version';
        EXEC('EXEC(''' + @sql + ''') AT [LINKED_SERVER_B]');
        PRINT '✓ 方式1: 使用IP和端口连接成功';
    END TRY
    BEGIN CATCH
        PRINT '✗ 方式1失败: ' + ERROR_MESSAGE();
    END CATCH
   /* 
    BEGIN TRY
        -- 方式2: 只使用计算机名
        SET @sql = 'SELECT @@VERSION as version';
        EXEC('EXEC(''' + @sql + ''') AT [DESKTOP-IO65CQ4]');
        PRINT '✓ 方式2: 使用计算机名连接成功';
    END TRY
    BEGIN CATCH
        PRINT '✗ 方式2失败: ' + ERROR_MESSAGE();
    END TRY
    */
END;
GO