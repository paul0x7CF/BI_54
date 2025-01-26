SELECT 
    dd.CalendarYear AS `Calendar Year`,
    dd.EnglishMonthName AS `Month`,
    dl.Country,
    SUM(fi.OrderLineTaxAmt) AS `Tax Amount`
FROM Fact_InternetSales fi
JOIN Dim_Location dl ON fi.ShipToLocationKey = dl.LocationKey
JOIN Dim_Date dd ON fi.OrderDateKey = dd.DateKey
WHERE dl.Country IN ('France', 'Germany')
  AND dd.CalendarYear = 2021
  AND dd.MonthNumberOfYear BETWEEN 1 AND 6
GROUP BY dd.CalendarYear, dd.EnglishMonthName, dl.Country, dd.MonthNumberOfYear
ORDER BY dd.CalendarYear, dd.MonthNumberOfYear, dl.Country;