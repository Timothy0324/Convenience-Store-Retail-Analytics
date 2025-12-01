# Q1
# This query identifies the top 3 best-selling products in the North region. These products are recommended for stores to always keep in stock.
SELECT 
    p.ProductNo,
    p.ProductDesc,
    SUM(si.SalesQTY) AS TotalUnitsSold
FROM sp_conveniencestore.SalesItem si
JOIN sp_conveniencestore.`Order` o 
      ON si.SalesOrderID = o.SalesOrderID
JOIN sp_conveniencestore.StoreMaster sm 
      ON o.RegStoreNo = sm.RegStoreNo
JOIN sp_conveniencestore.Product p 
      ON si.ProductNo = p.ProductNo
WHERE sm.Region = 'North'
GROUP BY p.ProductNo, p.ProductDesc
ORDER BY TotalUnitsSold DESC

#Q2 Which products should stores in the North region consider not carrying?
SELECT 
    p.ProductNo,
    p.ProductDesc,
    SUM(si.SalesQTY) AS TotalUnitsSold
FROM sp_conveniencestore.SalesItem si
JOIN sp_conveniencestore.`Order` o 
      ON si.SalesOrderID = o.SalesOrderID
JOIN sp_conveniencestore.StoreMaster sm 
      ON o.RegStoreNo = sm.RegStoreNo
JOIN sp_conveniencestore.Product p 
      ON si.ProductNo = p.ProductNo
WHERE sm.Region = 'North'
GROUP BY p.ProductNo, p.ProductDesc
ORDER BY TotalUnitsSold ASC

# Q3
# Business Decision 1 — Identify Underperforming Stores by Total Sales
SELECT 
    sm.RegStoreNo,
    SUM(si.SalesAmt) AS TotalSales
FROM sp_conveniencestore.SalesItem si
JOIN sp_conveniencestore.`Order` o 
      ON si.SalesOrderID = o.SalesOrderID
JOIN sp_conveniencestore.StoreMaster sm
      ON sm.RegStoreNo = o.RegStoreNo
WHERE sm.Region = 'North'
GROUP BY sm.RegStoreNo
ORDER BY TotalSales ASC

# Business Decision 2 — Identify Highest Grossing Product Categories
SELECT 
    pg.ProductGroupDesc,
    SUM(si.SalesAmt) AS TotalRevenue
FROM sp_conveniencestore.SalesItem si
JOIN sp_conveniencestore.Product p 
      ON si.ProductNo = p.ProductNo
JOIN sp_conveniencestore.ProductGroup pg
      ON p.ProductGroupID = pg.ProductGroupID
GROUP BY pg.ProductGroupDesc
ORDER BY TotalRevenue DESC

# Business Decision 3 — Identify the Stores with the Fewest Transactions
SELECT 
    sm.RegStoreNo,
    COUNT(o.SalesOrderID) AS TotalTransactions
FROM sp_conveniencestore.`Order` o
JOIN sp_conveniencestore.StoreMaster sm
      ON o.RegStoreNo = sm.RegStoreNo
WHERE sm.Region = 'North'
GROUP BY sm.RegStoreNo
ORDER BY TotalTransactions ASC
