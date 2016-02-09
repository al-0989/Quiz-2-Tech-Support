-- Write a SQL query that returns a sorted list of the departments and the
-- number of support requests per each department.

SELECT COUNT(requests.department) AS count FROM requests GROUP BY requests.department ORDER BY count 
