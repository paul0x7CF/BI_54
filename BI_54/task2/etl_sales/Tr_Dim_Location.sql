SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE BI_BikesDW_54.Dim_Location;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO BI_BikesDW_54.Dim_Location (
    LocationKey, 				-- = CountryID
    Country, 
    Region, 
    TaxRate, 
    ShipCoeff
)
SELECT 
    C.CountryID AS LocationKey, 
    C.Country, 
    C.Region, 
    C.TaxRate, 
    C.ShipCoeff
FROM BI_Bikes_54.TB_Country C;
