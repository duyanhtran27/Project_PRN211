create database ECommerce

create table Category
(
CategoryId int primary key identity(1,1),
CategoryName Varchar(100) NOT NULL,
CategoryImageUrl varchar(max) NOT NULL,
IsActive BIT NOT NULL,
CreateDate DateTime NOT NULL
)

create table SubCategory
(
SubCategoryId int primary key identity(1,1),
SubCategoryName Varchar(100) NOT NULL,
CategoryId int foreign key references Category(CategoryId) on delete cascade Not Null,
IsActive BIT NOT NULL,
CreateDate DateTime NOT NULL
)

create table Product
(
ProductId Int primary key identity(1,1),
ProductName Varchar(100) not null,
ShortDescription varchar(200) null,
LongDescription varchar(max) null,
AdditionalDescription varchar(max) null,
Price Decimal(18,2) not null,
Quantity int not null,
Size varchar(30) null,
Color varchar(50) null,
CompanyName varchar(100) null,
CategoryId int foreign key references Category(CategoryId) on delete cascade Not Null,
SubCategoryId int not null,
Sold int null,
IsCustomized BIT not null,
IsActive BIT NOT NULL,
CreateDate DateTime NOT NULL
)

create table ProductImages
(
ImageId Int primary key identity(1,1),
ImageUrl varchar(max) null,
ProductId int foreign key references Product(ProductId) on delete cascade Not Null,
DefaultImage Bit null
)
create table Roles
(
RoleId Int primary key,
RoleName Varchar(50) not null
)

insert into Roles values (1, 'Admin')
insert into Roles values (2, 'Customer')

create table Users
(
UserId int primary key identity(1,1),
Name varchar(50) null,
Username varchar(50) null unique,
Mobile varchar(20) null,
Email varchar(50) null,
Address varchar(Max) null,
PostCode varchar(50) null,
ImageUrl varchar(Max) null,
RoleId int foreign key references Roles(RoleId) on delete cascade Not Null,
CreateDate DateTime NOT NULL
)

create table ProductReview
(
ReviewId int primary key identity(1,1),
Rating int not null,
Comment varchar(Max) null,
ProductId int foreign key references Product(ProductId) on delete cascade Not Null,
UserId int foreign key references Users(UserId) on delete cascade Not Null,
CreateDate Datetime not null
)

create table Wishlist
(
WishlistId int primary key identity(1,1),
ProductId int foreign key references Product(ProductId) on delete cascade Not Null,
UserId int foreign key references Users(UserId) on delete cascade Not Null,
CreateDate Datetime not null
)

create table Cart
(
CartId int primary key identity(1,1),
ProductId int foreign key references Product(ProductId) on delete cascade Not Null,
Quantity int null,
UserId int foreign key references Users(UserId) on delete cascade Not Null,
CreateDate Datetime not null
)

create table Contact
(
ContactId int primary key identity(1,1),
Name Varchar(50) null,
Email Varchar(50) null,
Subject Varchar(200) null,
Message Varchar(Max) null,
CreateDate Datetime not null
)

create table Payment
(
PaymentId int primary key identity(1,1),
Name Varchar(50) null,
CardNo Varchar(50) null,
ExpiryDate Varchar(50) null,
CvvNo Int null,
Address varchar(Max) null,
PaymentMode Varchar(50) null
)

create table Orders
(
OrderDetailsId int primary key identity(1,1),
OrderNo varchar(Max) null,
ProductId int foreign key references Product(ProductId) on delete cascade Not Null,
Quantity int null,
UserId int foreign key references Users(UserId) on delete cascade Not Null,
Status Varchar(50) null,
PaymentId int foreign key references Payment(PaymentId) on delete cascade Not Null,
OrderDate DateTime not null,
IsCancel Bit not null Default 0
)