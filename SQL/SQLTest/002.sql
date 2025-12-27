USE master
GO
ALTER DATABASE Test --确保数据库名称存在
ADD FILEGROUP NewTestFiles; --创建一个新文件组，右键数据库文件的属性，在打开的文件组窗口中没有同名变量即可
GO
ALTER DATABASE Test 
ADD FILE 
(
    NAME = test1dat3,
    FILENAME = 'E:\Data\SQL\t1dat3.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
),
(
    NAME = test1dat4,
    FILENAME = 'E:\Data\SQL\t1dat4.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
TO FILEGROUP NewTestFiles;
GO