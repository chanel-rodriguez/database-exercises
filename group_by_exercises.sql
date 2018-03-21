use employees;


SELECT COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%';

SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;


SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;


use employees;

select DISTINCT title from titles;

select first_name, last_name from employees
where last_name like 'e%'
      and last_name like '%e'
group by first_name, last_name;

select last_name, count(last_name) from employees
where last_name LIKE '%q%' AND
  last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY count(last_name);


select gender, count(*) AS GenderCount from employees
where first_name in ('irena', 'vidya','maya')
GROUP BY gender;
