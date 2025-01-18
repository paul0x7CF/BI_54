CREATE TABLE Dim_Customer (
    CustomerKey 	INT 			NOT NULL,	-- OK, = CustomerID
    AccountNumber 	VARCHAR(30) 	NOT NULL,
    FullName 		VARCHAR(150) 	NOT NULL,	-- OK, Concatenate first, middle and last name to form a customer's full name in the following format: FullName = FirstName MiddleName LastName
    Gender 			VARCHAR(1) 		NOT NULL,    
    Age 			INT 			NOT NULL,	-- OK, Using a customer's birth date, calculate the age as of 30th of September 2021 (use '2021-09-30' as the end date for the interval calculation)                     
    CONSTRAINT PK_DimCustomer 
		PRIMARY KEY (CustomerKey)
);
