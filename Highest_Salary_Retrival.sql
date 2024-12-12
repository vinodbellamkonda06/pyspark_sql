Write an SQL Query to find the Second highest salary.

## Table Schema

"
Columns:
	Name: Varchar
	Department: Varchar
	Salary: Decimal
	Age: INT
"
	

## Create Statement

CREATE TABLE IF NOT EXISTS Employe(
										Name VARCHAR(100),
										AGE INT,
										Department VARCHAR(100),
										Salary DECIMAL(10, 2)
)


## Inserting Data

INSERT INTO Employe VALUES
							('Employee1', 27, 'IT', 10000),
							('Employee2', 32, 'IT', 200000),
							('Employee3', 28, 'HR', 45000),
							('Employee4', 26, 'Finanace', 33000),
							('Employee5', 38, 'Production', 60000),
							('Employee6', 45, 'IT', 300000),
							('Employee7', 34, 'HR',60000),
							('Employee8', 39, 'Finanace', 45000);
							
## Approch-1: Using Limit and OFFSET methods 

Limit: 
	Limit function is used to restrict the number of records return by the Query.
OFFSET:
		- OFFSET function is used for skip the specified number of rows before starting to return rows from the query result.
		- It is used along with LIMIT function.
		
SELECT * FROM Employe ORDER BY Salary DESC LIMIT 1 OFFSET 1;


## Approch -2: Using Window function i.e Dense_Rank function

DENSE_RANK:
		- Dense_Rank function assigns a rank to each row based on the Ordering of a Specified Column.
		- If there are ties(Rows with same value in the specified column), will be assigned with the same rank.
		- No gaps will occur after ties.

SELECT * FROM	
	(SELECT *,
			DENSE_RANK() OVER(ORDER BY Salary DESC) AS rank
	FROM Employe) AS sub_query
WHERE rank = 2;



