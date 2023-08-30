
create table dbo.SKU(
ID int IDENTITY UNIQUE not NULL,
Code as 's' + cast(ID as varchar(255)),
Name varchar(255)
);


create table dbo.Family (
ID int IDENTITY UNIQUE not NULL,
SurName varchar(255),
BudgetValue decimal(18, 2)
);

create table dbo.Basket (
ID int IDENTITY UNIQUE not NULL,
ID_SKU int foreign key references SKU(ID),
ID_Family int foreign key references Family(ID),
Quantity int check(Quantity>=0),
"Value" decimal(18,2) check(Value>=0),
PurchaseDate date default sysdatetime(),
DiscountValue decimal(18,2)
);
