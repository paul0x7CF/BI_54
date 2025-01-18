SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE BI_BikesDW_54.Dim_Product;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO BI_BikesDW_54.Dim_Product (
    ProductKey, 						-- = ProductID    
    ProductName, 
    ProductModelName, 
    ProductSubCategoryName, 
    ProductTopCategoryName, 
    StandardCost, 
    ListPrice, 
    StartDate, 
    EndDate, 
    ProductStatus						-- If SellEndDate is NULL or SellEndDate is later than '2021-09-30' then 'Current', otherwise SellEndDate is 'Discontinued'
)
SELECT 
    P.ProductID AS ProductKey, 
    P.ProductName, 
    PM.ProductModelName, 
    PSC.Name AS ProductSubCategoryName, 
    PTC.Name AS ProductTopCategoryName, 
    P.StandardCost, 
    P.ListPrice, 
    P.SellStartDate AS StartDate, 
    P.SellEndDate AS EndDate, 
    CASE 
        WHEN P.SellEndDate IS NULL OR P.SellEndDate > '2021-09-30' THEN 'Current'
        ELSE 'Discontinued'
    END AS ProductStatus
FROM BI_Bikes_54.TB_Product P
JOIN BI_Bikes_54.TB_ProductModel PM ON P.ProductModelID = PM.ProductModelID
JOIN BI_Bikes_54.TB_ProductSubCategory PSC ON P.ProductSubCategoryID = PSC.ProductSubCategoryID
JOIN BI_Bikes_54.TB_ProductTopCategory PTC ON PSC.ProductTopCategoryID = PTC.ProductTopCategoryID;
