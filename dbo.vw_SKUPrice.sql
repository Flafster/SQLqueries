use dbo

IF OBJECT_ID ('dbo.vw_SKUPrice') IS NOT NULL
    DROP VIEW dbo.vw_SKUPrice;
GO

create view dbo.vw_SKUPrice
as

select SKU.*, dbo.udf_GetSKUPrice(SKU.ID) as Price
from dbo.SKU