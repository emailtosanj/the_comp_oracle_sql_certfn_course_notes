--Group By

SELECT max(salary) as highest_salary, min(salary) as lowest_salary FROM professors WHERE last_name != 'Wilson';

--
SELECT min(hire_date) from professors;


can the analytic function max() and min() could be used in a single select statement