USE master;
GO
alter database TestCreate set single_user with rollback immediate --通常在删除数据库的时候可能提示该库被使用因此删除失败，当出现这种情况后粘贴该语句在删除语句之前
DROP DATABASE TestCreate ;  
GO

CREATE DATABASE TestCreate ON
(NAME = TestCreateDat,
    FILENAME = 'E:\Data\SQL\TestCreateDat.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5)
LOG ON --创建数据库的日志，记录了所有操作信息
(NAME = TestCreateLog,
    FILENAME = 'E:\Data\SQL\TestCreateLog.ldf',
    SIZE = 5 MB,
    MAXSIZE = 25 MB,
    FILEGROWTH = 5 MB);
GO

ALTER DATABASE TestCreate
    MODIFY FILE (NAME = TestCreateDat, SIZE = 20 MB);
GO
