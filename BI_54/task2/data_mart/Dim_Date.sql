CREATE TABLE Dim_Date (
    DateKey 				INT 			NOT NULL,	-- OK, YEAR(@date) * 10000 + MONTH(@date) * 100 + DAYOFMONTH(@date) AS DateKey
    FullDateAlternateKey 	DATE 			NOT NULL,     
    DayNumberOfWeek 		INT 			NOT NULL,            
    EnglishDayNameOfWeek 	VARCHAR(20) 	NOT NULL, 
    DayNumberOfMonth 		INT 			NOT NULL,           
    DayNumberOfYear 		INT 			NOT NULL,            
    WeekNumberOfYear 		INT 			NOT NULL,           
    EnglishMonthName 		VARCHAR(20) 	NOT NULL,   
    MonthNumberOfYear 		INT 			NOT NULL,          
    CalendarQuarter 		INT 			NOT NULL,            
    CalendarYear 			INT 			NOT NULL,               
    CONSTRAINT PK_DimDate 
		PRIMARY KEY (DateKey)
);
