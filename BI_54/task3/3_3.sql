SELECT 
    RANK() OVER (ORDER BY SUM(fi.OrderLineProfit) DESC) AS `Customer Rank`,
    dc.FullName AS `Customer Name`,
    SUM(fi.OrderLineProfit) AS `Profit`
FROM Fact_InternetSales fi
JOIN Dim_Customer dc ON fi.CustomerKey = dc.CustomerKey
JOIN Dim_Date dd ON fi.OrderDateKey = dd.DateKey
WHERE dd.CalendarYear = 2021
  AND dd.MonthNumberOfYear BETWEEN 1 AND 6
GROUP BY dc.FullName
ORDER BY `Customer Rank`
LIMIT 10;