"
SQL Query to retrive third highest salary from the employees table.

## Schema:
	EmployeeID: INT
	Name: VARCHAR(100)
	Department: VARCHAR(100)
	Salary: DECIMAL(10, 2)
	HireDate: Date
"


## Create Query

CREATE TABLE Employees(
	EmployeeID,
	Name,
	Department,
	Salary,
	HireDate
);

## Insert Query

INSERT INTO Employees(EmployeeID, Name, Department, Salary, HireDate)
	VALUES
		(1, 'Alice Johnson', 'HR', 55000, '2020-01-15'),
		(2, 'Bob Smith', 'IT', 75000, '2019-03-22'),
		(3, 'Charlie Brown', 'Finance', 67000, '2021-07-11'),
		(4, 'Diana Ross', 'IT', 82000, '2018-05-30'),
		(5, 'Ethan Hunt', 'Marketing', 59000, '2022-02-12'),
		(6, 'Fiona Davis', 'HR', 52000, '2020-08-19'),
		(7, 'George Miller', 'Finance', 73000, '2019-10-05'),
		(8, 'Hannah Lee', 'IT', 91000, '2018-12-01'),
		(9, 'Ian Clark', 'Marketing', 60000, '2021-04-14'),
		(10, 'Jessica Adams', 'HR', 56000, '2020-06-20'),
		(11, 'Kyle Rogers', 'IT', 78000, '2019-09-10'),
		(12, 'Laura White', 'Finance', 65000, '2021-11-25'),
		(13, 'Michael Scott', 'Marketing', 62000, '2022-03-15'),
		(14, 'Natalie Brooks', 'HR', 58000, '2020-10-18'),
		(15, 'Oliver Green', 'Finance', 72000, '2019-01-27'),
		(16, 'Patricia Hall', 'IT', 80000, '2018-07-29'),
		(17, 'Quincy Wright', 'Marketing', 64000, '2021-02-17'),
		(18, 'Rachel Turner', 'HR', 54000, '2020-03-08'),
		(19, 'Samuel Wilson', 'Finance', 69000, '2021-08-13'),
		(20, 'Tina Baker', 'IT', 85000, '2019-06-24'),
		(21, 'Uma Nelson', 'Marketing', 61000, '2022-01-09'),
		(22, 'Victor Harris', 'HR', 53000, '2020-12-30'),
		(23, 'Wendy James', 'Finance', 71000, '2019-04-03'),
		(24, 'Xavier King', 'IT', 87000, '2018-10-15'),
		(25, 'Yvonne Carter', 'Marketing', 63000, '2021-05-21'),
		(26, 'Zachary Moore', 'HR', 57000, '2020-07-13'),
		(27, 'Abigail Price', 'Finance', 74000, '2019-11-16'),
		(28, 'Benjamin Ross', 'IT', 89000, '2018-03-07'),
		(29, 'Charlotte Scott', 'Marketing', 65000, '2021-09-28'),
		(30, 'Daniel Thompson', 'HR', 56000, '2020-02-18'),
		(31, 'Eliza Gray', 'Finance', 70000, '2019-08-20'),
		(32, 'Francis Reed', 'IT', 81000, '2018-11-12'),
		(33, 'Grace Lewis', 'Marketing', 62000, '2021-12-23'),
		(34, 'Henry Cooper', 'HR', 55000, '2020-05-07'),
		(35, 'Isabella Parker', 'Finance', 69000, '2019-03-14'),
		(36, 'Jack Foster', 'IT', 83000, '2018-06-29'),
		(37, 'Katherine Evans', 'Marketing', 60000, '2021-03-05'),
		(38, 'Liam Hughes', 'HR', 52000, '2020-08-08'),
		(39, 'Megan Wright', 'Finance', 73000, '2019-07-11'),
		(40, 'Noah Barnes', 'IT', 86000, '2018-09-22'),
		(41, 'Olivia Campbell', 'Marketing', 64000, '2021-06-30'),
		(42, 'Peter Edwards', 'HR', 54000, '2020-10-01'),
		(43, 'Quinn Jenkins', 'Finance', 72000, '2019-12-06'),
		(44, 'Rebecca Simmons', 'IT', 80000, '2018-02-25'),
		(45, 'Steven Torres', 'Marketing', 61000, '2022-04-18'),
		(46, 'Tracy Phillips', 'HR', 57000, '2020-01-10'),
		(47, 'Ulysses Campbell', 'Finance', 68000, '2021-07-19'),
		(48, 'Victoria Morgan', 'IT', 88000, '2019-05-25'),
		(49, 'William Fisher', 'Marketing', 65000, '2021-11-14'),
		(50, 'Zoe Johnson', 'HR', 56000, '2020-03-22');


## Query to fetch third highest salary

SELECT
	*
	FROM
		(
			SELECT
				*,
				DENSE_RANK() OVER(ORDER BY Salary DESC) as drnk)
			FROM
				Employees
		)
		as salary_ranks
WHERE drnk = 3;

