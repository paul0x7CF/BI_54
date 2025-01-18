CREATE TABLE Dim_Location (
    LocationKey 	INT 			NOT NULL,	-- OK, = CountryID
    Country 		VARCHAR(50) 	NOT NULL,           
    Region 			VARCHAR(50) 	NOT NULL,          
    TaxRate 		DECIMAL(13,4) 	NOT NULL,         
    ShipCoeff 		DECIMAL(13,4) 	NOT NULL,       
    CONSTRAINT PK_DimLocation 
		PRIMARY KEY (LocationKey)
);
