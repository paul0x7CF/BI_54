SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE BI_BikesDW_54.Dim_Customer;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO BI_BikesDW_54.Dim_Customer (
    CustomerKey, 			-- = CustomerID
    AccountNumber, 
    FullName, 				-- Concatenate first, middle and last name to form a customer's full name in the following format: FullName = FirstName MiddleName LastName
    Gender, 
    Age						-- Using a customer's birth date, calculate the age as of 30th of September 2021 (use '2021-09-30' as the end date for the interval calculation)  
)
SELECT 
    C.CustomerID AS CustomerKey, 
    C.AccountNumber, 
    CONCAT(P.FirstName, ' ', COALESCE(P.MiddleName, ''), ' ', P.LastName) AS FullName,		-- Using COALESCE function if middlename is null returns empty string
    P.Gender,
    TIMESTAMPDIFF(YEAR, P.BirthDate, '2021-09-30') AS Age									-- Using Timestampdiff function TIMESTAMPDIFF(unit, start_date, end_date)
FROM BI_Bikes_54.TB_Customer C
JOIN BI_Bikes_54.TB_Person P ON C.PersonID = P.PersonID;									