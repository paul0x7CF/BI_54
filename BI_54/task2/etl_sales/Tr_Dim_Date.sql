SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE BI_BikesDW_54.Dim_Date;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO BI_BikesDW_54.Dim_Date (
    DateKey,                -- YEAR(@date) * 10000 + MONTH(@date) * 100 + DAYOFMONTH(@date) AS DateKey
    FullDateAlternateKey,   
    DayNumberOfWeek,        
    EnglishDayNameOfWeek,   
    DayNumberOfMonth,       
    DayNumberOfYear,        
    WeekNumberOfYear,       
    EnglishMonthName,       
    MonthNumberOfYear,      
    CalendarQuarter,        
    CalendarYear            
)
SELECT DISTINCT				-- Using Distinct for removing possible duplicates
    YEAR(D.DateField) * 10000 + MONTH(D.DateField) * 100 + DAYOFMONTH(D.DateField) AS DateKey, 
    D.DateField AS FullDateAlternateKey,                      
    DAYOFWEEK(D.DateField) AS DayNumberOfWeek,                
    DAYNAME(D.DateField) AS EnglishDayNameOfWeek,             
    DAY(D.DateField) AS DayNumberOfMonth,                   
    DAYOFYEAR(D.DateField) AS DayNumberOfYear,               
    WEEK(D.DateField, 3) AS WeekNumberOfYear,               
    MONTHNAME(D.DateField) AS EnglishMonthName,               
    MONTH(D.DateField) AS MonthNumberOfYear,                
    QUARTER(D.DateField) AS CalendarQuarter,                 
    YEAR(D.DateField) AS CalendarYear                         
FROM (
    SELECT OrderDate AS DateField FROM BI_Bikes_54.TB_SalesOrderHeader
    UNION																-- Union Combine select statements whithout duplicates
    SELECT DueDate AS DateField FROM BI_Bikes_54.TB_SalesOrderHeader
    UNION
    SELECT ShipDate AS DateField FROM BI_Bikes_54.TB_SalesOrderHeader
) D;
