CREATE TABLE Fact_InternetSales (
    SalesOrderLineNumber 	VARCHAR(50) 	NOT NULL, 	-- OK, The Sales Order Line Number is built by concatenating ‘SOL’ + SalesOrderID + ‘-‘ + SalesOrderDetailID NO Whitespaces
    SalesOrderNumber 		VARCHAR(30) 	NOT NULL,    
    OrderDateKey 			INT 			NOT NULL,                
    OrderDate 				DATE 			NOT NULL,	-- OK, 10000 * Year(OrderDate)+ 100 * Month(OrderDate)+ DayOfMonth(OrderDate)                  
    DueDateKey 				INT 			NOT NULL,	-- OK, 10000 * Year(DueDate)+ 100 * Month(DueDate)+ DayOfMonth(DueDate)                  
    DueDate 				DATE 			NOT NULL,                    
    ShipDateKey 			INT,                     	-- OK, 10000 * Year(ShipDate)+ 100 * Month(ShipDate)+ DayOfMonth(ShipDate)   
    ShipDate 				DATE,                            
    ProductKey 				INT 			NOT NULL,                  
    CustomerKey 			INT 			NOT NULL,  	-- OK, = CustomerID             
    ShipToLocationKey 		INT 			NOT NULL,           
    OrderStatus 			VARCHAR(50) 	NOT NULL,   -- OK, Use the order status name       
    ShipMethod 				VARCHAR(50) 	NOT NULL,	-- OK, Use the shipment method's name.           
    OrderQty 				INT 			NOT NULL,                    
    UnitPrice 				DECIMAL(13,4) 	NOT NULL,         
    OrderLineTotal 			DECIMAL(13,4) 	NOT NULL,	-- OK, calculate the total revenue per order line with the formula OrderLineTotal = OrderQty * UnitPrice    
    OrderLineProfit 		DECIMAL(13,4) 	NOT NULL,   -- OK, calculate the profit per order line with the formula OrderLineProfit = OrderLineTotal – OrderQty * StandardCost
    OrderLineTaxAmt 		DECIMAL(13,4) 	NOT NULL,   -- OK, calculate the tax amount of an order line with the formula OrderLineTaxAmount = OrderLineTotal * TaxRate 
    OrderLineShippingCost 	DECIMAL(13,4) 	NOT NULL,   -- OK, calculate the shipping costs for each line as follows: OrderLineShippingCost = ShipSurcharge + ShipBase + (OrderQty * ShipRate * ShipCoeff)
    CONSTRAINT PK_FactInternetSales 
		PRIMARY KEY (SalesOrderLineNumber),      
	CONSTRAINT FK_OrderDate_FactInternetSales 
		FOREIGN KEY (OrderDateKey) 
		REFERENCES Dim_Date(DateKey),
    -- CONSTRAINT FK_ShipDate_FactInternetSales FOREIGN KEY (ShipDateKey) REFERENCES Dim_Date(DateKey),
    CONSTRAINT FK_Customer_FactInternetSales 
		FOREIGN KEY (CustomerKey) 
		REFERENCES Dim_Customer(CustomerKey),
    CONSTRAINT FK_ShipToLocationKey_FactInternetSales 
		FOREIGN KEY (ShipToLocationKey) 
		REFERENCES Dim_Location(LocationKey),
    CONSTRAINT FK_Product_FactInternetSales 
		FOREIGN KEY (ProductKey) 
		REFERENCES Dim_Product(ProductKey)
);
