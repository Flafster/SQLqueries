use dbo

IF OBJECT_ID ('dbo.TR_Basket_insert_update') IS NOT NULL
    DROP TRIGGER TR_Basket_insert_update;
GO

create trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert, update
as

declare @ID_SKU int
declare @Count int

select @ID_SKU=ID_SKU
from inserted

select @Count=Count(*)
from dbo.Basket
where @ID_SKU=ID_SKU

if @Count>=2
begin
update dbo.Basket
set DiscountValue="Value"*0.05
where @ID_SKU=ID_SKU
end

else

begin
update dbo.Basket
set DiscountValue=0
where @ID_SKU=ID_SKU
end