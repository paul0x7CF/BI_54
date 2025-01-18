SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE BI_BikesDW_54.Fact_InternetSales;
SET FOREIGN_KEY_CHECKS = 1;

-- Insert new data into Fact_InternetSales
INSERT INTO BI_BikesDW_54.Fact_InternetSales (
    SalesOrderLineNumber,       -- The Sales Order Line Number is built by concatenating ‘SOL’ + SalesOrderID + ‘-‘ + SalesOrderDetailID NO Whitespaces
    SalesOrderNumber,           
    OrderDateKey,               
    OrderDate,                  -- 10000 * Year(OrderDate)+ 100 * Month(OrderDate)+ DayOfMonth(OrderDate)  
    DueDateKey,                 -- 10000 * Year(DueDate)+ 100 * Month(DueDate)+ DayOfMonth(DueDate)   
    DueDate,                    
    ShipDateKey,                -- 10000 * Year(ShipDate)+ 100 * Month(ShipDate)+ DayOfMonth(ShipDate)  
    ShipDate,                  
    ProductKey,                 --  = ProductID 
    CustomerKey,                --  = CustomerID       
    ShipToLocationKey,          
    OrderStatus,                -- Use the order status name  
    ShipMethod,                 -- Use the shipment method's name.
    OrderQty,                   
    UnitPrice,                  
    OrderLineTotal,             -- calculate the total revenue per order line with the formula OrderLineTotal = OrderQty * UnitPrice   
    OrderLineProfit,            -- calculate the profit per order line with the formula OrderLineProfit = OrderLineTotal – OrderQty * StandardCost
    OrderLineTaxAmt,            -- calculate the tax amount of an order line with the formula OrderLineTaxAmount = OrderLineTotal * TaxRate
    OrderLineShippingCost       -- calculate the shipping costs for each line as follows: OrderLineShippingCost = ShipSurcharge + ShipBase + (OrderQty * ShipRate * ShipCoeff)
)
SELECT 
    CONCAT('SOL', SOH.SalesOrderID, '-', SOD.SalesOrderDetailID) AS SalesOrderLineNumber, 
    SOH.SalesOrderNumber,                          
    YEAR(SOH.OrderDate) * 10000 + MONTH(SOH.OrderDate) * 100 + DAY(SOH.OrderDate) AS OrderDateKey, 
    SOH.OrderDate,                                 
    YEAR(SOH.DueDate) * 10000 + MONTH(SOH.DueDate) * 100 + DAY(SOH.DueDate) AS DueDateKey,         
    SOH.DueDate,                                  
    CASE WHEN SOH.ShipDate IS NOT NULL THEN 		-- Handle possiple null value of shipdate from source table
        YEAR(SOH.ShipDate) * 10000 + MONTH(SOH.ShipDate) * 100 + DAY(SOH.ShipDate) 
    ELSE NULL END AS ShipDateKey,                 
    SOH.ShipDate,                                  
    SOD.ProductID AS ProductKey,                  
    SOH.CustomerID AS CustomerKey,                
    C.CountryID AS ShipToLocationKey,    
    OS.OrderStatusName AS OrderStatus,            
    SM.ShipMethodName AS ShipMethod,              
    SOD.OrderQty,                                 
    SOD.UnitPrice,                                
    SOD.OrderQty * SOD.UnitPrice AS OrderLineTotal, 
    (SOD.OrderQty * SOD.UnitPrice) - (SOD.OrderQty * P.StandardCost) AS OrderLineProfit, 
    ROUND(SOD.OrderQty * SOD.UnitPrice * C.TaxRate, 4) AS OrderLineTaxAmt,
    (SM.ShipBase + PTC.ShipSurcharge + (SOD.OrderQty * SM.ShipRate * C.ShipCoeff)) AS OrderLineShippingCost
FROM BI_Bikes_54.TB_SalesOrderHeader SOH
JOIN BI_Bikes_54.TB_SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
JOIN BI_Bikes_54.TB_Product P ON SOD.ProductID = P.ProductID
JOIN BI_Bikes_54.TB_ProductSubCategory PSC ON P.ProductSubCategoryID = PSC.ProductSubCategoryID
JOIN BI_Bikes_54.TB_ProductTopCategory PTC ON PSC.ProductTopCategoryID = PTC.ProductTopCategoryID
JOIN BI_Bikes_54.TB_Address A ON SOH.ShipToAddressID = A.AddressID
JOIN BI_Bikes_54.TB_Country C ON A.CountryID = C.CountryID
JOIN BI_Bikes_54.TB_OrderStatus OS ON SOH.OrderStatusID = OS.OrderStatusID
JOIN BI_Bikes_54.TB_ShipMethod SM ON SOH.ShipMethodID = SM.ShipMethodID;