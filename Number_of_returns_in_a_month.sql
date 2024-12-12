"""
	Given the Orders table with columns OrderID, 
	OrderDate, and TotalAmount, and the 
	Returns table with columns ReturnID and OrderID, 

	write an SQL query to calculate the total 
	numbers of returned orders for each month
"""

"Schema"

"
Orders table:
	Columns:
		OrderId: INT UNIQUE NOT NULL
		OrderDate: Curretn Date NOT NULL
		TotalAmount: DECIMAL(10,2) NOT NULL

Returns table:
	Columns:
		ReturnID: INT UNIQUE NOT NULL
		OrderID: INT UNIQUE NOT NULL
"

"Table Creations"

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders(
						OrderID INT PRIMARY KEY,
						OrderDate DATE,
						TotalAmount DECIMAL(10, 2) NOT NULL
);

DROP TABLE IF EXISTS Returns;

CREATE TABLE Returns(
						ReturnID INT PRIMARY KEY,
						OrderID INT,
						FOREIGN KEY OrderID REFERENCES Orders(OrderID)
);

 
"Inserting Data to Orders Table"

INSERT INTO Orders(OrderId, OrderDate, TotalAmount) VALUES 
(1, '2023-01-15', 300),
(2, '2024-09-23', 200),
(3, '2022-08-03', 400),
(4, '2023-01-15', 300),
(5, '2024-09-23', 200),
(6, '2022-08-03', 400),
(7, '2023-01-15', 300),
(8, '2024-09-23', 200),
(9, '2022-08-03', 400),
(10, '2023-01-15', 300),
(11, '2024-09-23', 200),
(12, '2022-08-03', 400);

" Inserting Data to Returns Tabale"

INSERT INTO Returns(ReturnID, OrderID) VALUES
(401, 1),
(402, 4),
(403, 2),
(404, 3),
(405, 6),
(406, 7),
(407, 8),
(408, 9),
(409, 11);


"
Approch to solve this process:
	- Retrive the month from OrderDate.
	- Use left join on OrderId column, Using left join because we need to have all Orders details.
"

SELECT
	COUNT(r.ReturnId) as total_returns, 
	o.month 
FROM Returns as r 
LEFT JOIN  
	(SELECT *, EXTRACT(MONTH FROM OrderDate) as month FROM Orders) as o 
ON  r.OrderId = o.OrderId 
Group BY o.month;
