SELECT 
    dl.Country AS `Country`,
    dd.CalendarYear AS `Year`,
    dd.EnglishMonthName AS `Month`,
    SUM(fi.OrderLineShippingCost) AS `Shipping Costs`
FROM Fact_InternetSales fi
JOIN Dim_Location dl ON fi.ShipToLocationKey = dl.LocationKey
JOIN Dim_Date dd ON fi.OrderDateKey = dd.DateKey
WHERE dl.Country = 'United Kingdom'
  AND dd.CalendarYear = 2020
  AND fi.ShipMethod = 'Cargo International'
  AND dd.MonthNumberOfYear BETWEEN 1 AND 6
GROUP BY dl.Country, dd.CalendarYear, dd.MonthNumberOfYear, dd.EnglishMonthName
ORDER BY dd.MonthNumberOfYear;