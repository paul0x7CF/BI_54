SELECT 
    dl.Country,
    SUM(fi.OrderLineTotal) AS `Revenue`
FROM Fact_InternetSales fi
JOIN Dim_Location dl ON fi.ShipToLocationKey = dl.LocationKey
JOIN Dim_Date dd ON fi.OrderDateKey = dd.DateKey
WHERE dd.CalendarYear = 2019
GROUP BY dl.Country
ORDER BY `Revenue` DESC;