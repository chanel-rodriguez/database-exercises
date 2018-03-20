use employees;

select DISTINCT last_name from employees
ORDER BY last_name DESC
LIMIT 10;

SELECT * from employees
where hire_date BETWEEN '1990-01-01' and '1999-12-31'
      and birth_date like '%12-25'
ORDER BY hire_date DESC, birth_date
LIMIT 5 OFFSET 45;