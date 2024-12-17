"
Problem Statement:
	Find the employee details who has highest salary from each department.

Steps to Solve the Problem:
	1. Understand the Requirements and Design the Schema.
		- We need to identify the employee(s) with the highest salary in each department.
	2.Schema Defination as per the requirement.

		Employees Table:
			- EmployeeId INT PRIMARY KEY
			- Name VARCHAR(100)
			- Department VARCHAR(100)
			- Salary DECIMAL(10,2)

	3.Preparing the sample data.

		| EmployeeId | Name            | Department  | Salary   | DateOfJoining |
		|------------|-----------------|-------------|----------|---------------|
		| 1          | Alice Johnson   | HR          | 55000.00 | 2020-01-15    |
		| 2          | Bob Smith       | IT          | 75000.00 | 2019-03-22    |
		| 3          | Charlie Brown   | Finance     | 67000.00 | 2021-07-11    |
		| 4          | Diana Ross      | IT          | 82000.00 | 2018-05-30    |
		| 5          | Ethan Hunt      | Marketing   | 59000.00 | 2022-02-12    |
		| 6          | Fiona Davis     | HR          | 52000.00 | 2020-08-19    |
		| 7          | George Miller   | Finance     | 73000.00 | 2019-10-05    |
		| 8          | Hannah Lee      | IT          | 91000.00 | 2018-12-01    |
		| 9          | Ian Clark       | Marketing   | 60000.00 | 2021-04-14    |
		| 10         | Jessica Adams   | HR          | 56000.00 | 2020-06-20    |
	
	4.Expected result.

		| EmployeeId | Name            | Department  | Salary   | DateOfJoining |
		|------------|-----------------|-------------|----------|---------------|
		| 1          | Alice Johnson   | HR          | 55000.00 | 2020-01-15    |
		| 8          | Hannah Lee      | IT          | 91000.00 | 2018-12-01    |
		| 7          | George Miller   | Finance     | 73000.00 | 2019-10-05    |
		| 9          | Ian Clark       | Marketing   | 60000.00 | 2021-04-14    |




	5.Breaking the problem statement and writing down the steps to achive the results.
		- Apply Dense_rank function with partition by Deparment and Order By Salary in Decending order
		- Use where condition with rank value is 1 it will fetch the all the employees with highest salary from each deparment.

"

SELECT *
FROM (
	SELECT *,
            DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS salary_rnk
     FROM employees
) AS ranked_employees
WHERE salary_rnk =1;
