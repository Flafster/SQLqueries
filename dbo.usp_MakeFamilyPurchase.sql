use dbo

IF OBJECT_ID ('dbo.usp_MakeFamilyPurchase') IS NOT NULL
    DROP PROCEDURE dbo.usp_MakeFamilyPurchase;
GO

create procedure dbo.usp_MakeFamilyPurchase
@FamilySurName varchar(255)
as

begin
if not exists
(select *
from dbo.Family
where SurName=@FamilySurName)
throw 50000, 'Такой семьи не существует', 1

else

update dbo.Family
set dbo.Family.BudgetValue=
(select sum("Value")
from dbo.Basket
where SurName=@FamilySurName)
end