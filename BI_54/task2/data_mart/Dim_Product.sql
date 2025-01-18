CREATE TABLE Dim_Product (
    ProductKey 				INT 			NOT NULL,	-- OK, = ProductID            
    ProductName 			VARCHAR(50) 	NOT NULL,      
    ProductModelName 		VARCHAR(50) 	NOT NULL,    
    ProductSubCategoryName 	VARCHAR(50) 	NOT NULL, 
    ProductTopCategoryName 	VARCHAR(50) 	NOT NULL, 
    StandardCost 			DECIMAL(13,4) 	NOT NULL,      
    ListPrice 				DECIMAL(13,4) 	NOT NULL,        
    StartDate 				DATE 			NOT NULL,                  
    EndDate 				DATE,                             
    ProductStatus 			VARCHAR(50) 	NOT NULL,	-- Ok, If SellEndDate is NULL or SellEndDate is later than '2021-09-30' then 'Current', otherwise SellEndDate is 'Discontinued'       
    CONSTRAINT PK_DimProduct 
		PRIMARY KEY (ProductKey)
);
