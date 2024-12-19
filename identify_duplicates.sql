"
Identifying the duplicated records.

Sample data:
	+----+-----------------+
	| ID | email           |
	+----+-----------------+
	|  1 | vinod@gmail.com |
	|  2 | vinod@gmail.com |
	|  3 | kumar@gmail.com |
	+----+-----------------+

Expected result:
	+-----------------+--------------+
	| email           | COUNT(email) |
	+-----------------+--------------+
	| vinod@gmail.com |            2 |
	+-----------------+--------------+
"

"Approch-1:"
SELECT 
	email,
	COUNT(email)
FROM 
	sample
GROUP BY
	email
Having
	COUNT(email) >1;

"Approch-2: Using self join"

SELECT
	a.ID as record1,
	b.ID as record2,
	a.email
FROM
	sample as a
JOIN 
	sample as b
ON
	a.email = b.email and a.id > b.id;
	

"Using window function"

SELECT
	* 
FROM
	(SELECT 
		*, 
		ROW_NUMBER() OVER(Partition BY email ORDER BY ID) as rn FROM sample) as email_row 
where 
	rn >1;