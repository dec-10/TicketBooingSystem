-- 完整的数据库创建脚本
USE master;
GO

-- 创建测试数据库
IF EXISTS(SELECT name FROM sys.databases WHERE name = 'ProjectionDemo')
    DROP DATABASE ProjectionDemo;
CREATE DATABASE ProjectionDemo;
GO

USE ProjectionDemo;
GO

-- 创建所有表（按依赖顺序）
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE,
    Email VARCHAR(100)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName VARCHAR(100),
    ContactName VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    UnitPrice DECIMAL(10,2),
    UnitsInStock INT,
    ReorderLevel INT,
    Category VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ProductReviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    CustomerID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 插入所有示例数据
INSERT INTO Employees VALUES
('张','明','销售部',45000.00,'2019-03-15','zhang.ming@company.com'),
('李','华','技术部',65000.00,'2018-06-20','li.hua@company.com'),
('王','芳','销售部',48000.00,'2020-01-10','wang.fang@company.com'),
('赵','强','技术部',72000.00,'2017-09-05','zhao.qiang@company.com'),
('刘','伟','人力资源部',52000.00,'2019-11-30','liu.wei@company.com'),
('陈','静','财务部',58000.00,'2018-12-01','chen.jing@company.com'),
('杨','阳','技术部',68000.00,'2021-02-14','yang.yang@company.com'),
('周','敏','销售部',46000.00,'2020-08-22','zhou.min@company.com'),
('吴','刚','技术部',75000.00,'2016-05-18','wu.gang@company.com'),
('黄','丽','人力资源部',51000.00,'2021-07-09','huang.li@company.com');

INSERT INTO Customers VALUES
('北京科技公司','张经理','北京','中国','010-12345678'),
('上海贸易集团','李总监','上海','中国','021-87654321'),
('广州发展有限公司','王总','广州','中国','020-55556666'),
('深圳创新科技','赵工程师','深圳','中国','0755-88889999'),
('成都食品公司','刘主任','成都','中国','028-33334444'),
('杭州电子商务','陈经理','杭州','中国','0571-66667777'),
('南京制造企业','杨主管','南京','中国','025-22223333'),
('天津物流公司','周运营','天津','中国','022-44445555'),
('武汉咨询公司','吴顾问','武汉','中国','027-77778888'),
('西安旅游集团','黄总监','西安','中国','029-99990000');

INSERT INTO Products VALUES
('笔记本电脑',899.99,25,10,'电子产品'),
('无线鼠标',29.99,100,20,'电子产品'),
('办公椅',199.50,15,5,'办公家具'),
('机械键盘',129.99,30,15,'电子产品'),
('显示器',299.00,8,5,'电子产品'),
('文件柜',159.75,12,3,'办公家具'),
('USB闪存盘',19.99,200,50,'电子产品'),
('打印机',249.00,5,2,'办公设备'),
('投影仪',599.00,3,2,'办公设备'),
('书桌',299.99,20,8,'办公家具');

INSERT INTO Orders VALUES
(1,1,'2023-01-15',1299.98),
(2,3,'2023-01-18',459.49),
(3,1,'2023-02-05',899.99),
(4,2,'2023-02-10',329.98),
(1,3,'2023-02-15',199.50),
(5,1,'2023-03-01',599.00),
(6,4,'2023-03-08',129.99),
(2,3,'2023-03-12',299.00),
(7,2,'2023-03-20',159.75),
(8,1,'2023-04-05',249.00);

INSERT INTO OrderDetails VALUES
(1,1,1,899.99),
(1,2,2,29.99),
(2,3,2,199.50),
(2,4,1,129.99),
(3,1,1,899.99),
(4,4,1,129.99),
(4,5,1,299.00),
(5,3,1,199.50),
(6,9,1,599.00),
(7,4,1,129.99);

INSERT INTO ProductReviews VALUES
(1,1,5,'非常好用的笔记本电脑，性能强劲','2023-01-20'),
(1,3,4,'性价比很高，推荐购买','2023-02-10'),
(2,2,3,'鼠标手感一般，但价格便宜','2023-01-25'),
(3,4,5,'办公椅很舒适，长时间工作不累','2023-02-15'),
(4,5,4,'机械键盘打字手感很好','2023-03-05'),
(1,6,5,'第二次购买了，质量稳定','2023-03-12');