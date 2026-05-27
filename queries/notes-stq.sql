--Single Table Queries
--SELECT
    -- columns
--FROM
    -- table
 --WHERE
    --and / or - operators
    --relational - !, =, >   operators)
    -- like operator
 -- order by - clause for descend order "dsc", asc is default
 -- limit <number> - records only to show from the result set.
 -- concatenation operator "||" / concat(<col/string>,>
     --  to be used in SELECT statement/
--===
--SRF - Single Row Function
   ---applied after SELECT before FROM
    --lower(<string/column>) - to convert to lower case
    --upper(<string/column>) - to convert to upper case
    --SUBSTR(col/<string>, start_position, length) - to extract a substring from a string/column
            --start_position - starts with 1
            --length - num. of chars from start_position
--===
--Group Function - multiple rows application
    --max() -   column datatype of number, date, string
    --min() -   column datatype of number, date, string
    --sum() -   column datatype of number
    --avg() -   column datatype of number
    --count() - column datatype of number, date, string

    --can only apply multiple group function by using OVER clause having
        --partition by an identified column.
         --example : (gets the records of each students completion rate and
            --min rate , max rate of all students in the same record)
         SELECT completion_rate, max(completion_rate) over(partition by student_id),
         min(completion_rate) over (partition by student_id), names
         FROM students;

--===
-- GROUP BY Clause & HAVING Clause
    -- cannot have group function in WHERE clause.
    -- group by is used to aggregate the rows/records based on a common value of a column
    -- having is used to filter the grouped records based on a condition.

    SELECT department_id, SUM(salary) AS total_sal
    FROM employees
    GROUP BY department_id
    HAVING SUM(salary) = MAX(SUM(salary));
--===

--  JOIN's - DO's & DONTs
    --Do use INNER JOIN, LEFT JOIN, CROSS JOIN explicitly.
    --Do use the ON clause to define how tables relate to one another.
    --Do reserve the WHERE clause exclusively for filtering your final result set.





--SELECT sum(spent) total_spent_last_year FROM marketing_campaigns WHERE year = 2024;

-- UNIT, DEPT, AVG_BUDGET_ALLOCATED
SELECT unit_id, department, avg(budget_usd) as avg_budget_allocated FROM
business_units GROUP BY unit_id, department
ORDER BY avg_budget_allocated DESC, unit_id asc;
--

--computes total cost

SELECT category, sum(
(units_received * unit_cost))
OVER (PARTITION BY category) as total_cost
FROM inventory_purchase
GROUP BY category

--

--outputs only state from the internal subquery
SELECT st AS state
FROM (
    SELECT state AS st
    FROM fruit_imports
    GROUP BY state
    HAVING SUM(supply) = MAX(SUM(supply))
) top_state

---



SELECT supplier_name, state, city, total_spent FROM suppliers
WHERE state='Georgia' or state='California';

SELECT supplier_name, total_spent, city, state FROM suppliers
WHERE total_spent between 35000 AND 95000;

SELECT supplier_name, total_spent, city, state FROM suppliers
WHERE supplier_name like '%wo%' and (supplier_name like '%I%' or supplier_name like '%i%');

SELECT ename, job, sal FROM employees
where (comm is null or comm = 0)
and (sal > 1100 and sal < 5000)
and sal <> 3000

--
SELECT ename, job, sal, comm FROM employees
WHERE job = 'SALESMAN' and
comm > 1000;

