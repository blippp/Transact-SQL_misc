USE [AdventureWorksDW2014]
GO


SELECT fis.DiscountAmount AS'Internet Discount Amount',
frs.DiscountAmount AS 'Reseller Discount Amount',
prod.EnglishProductName AS 'English Name'

FROM [dbo].[FactInternetSales] AS fis
JOIN [dbo].[FactResellerSales] AS frs
ON fis.ProductKey = frs.ProductKey
JOIN [dbo].[DimProduct] as prod
ON prod.ProductKey = frs.ProductKey
ORDER BY prod.ListPrice
