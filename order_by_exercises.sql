use employees;

select * from employees
where first_name in ('irena', 'vidya','maya')
order by last_name,first_name ;

SELECT * from employees
where last_name LIKE 'e%'
ORDER BY emp_no;

SELECT * from employees
where hire_date BETWEEN '1990-01-01' and '1999-12-31';

SELECT * from employees
where birth_date LIKE '%12-25';

SELECT * from employees
where last_name LIKE '%q%';


select * from employees
where first_name in ('irena', 'vidya','maya')
      and gender = 'M';

select * from employees
where last_name like 'e%'
      and last_name like '%e';

SELECT * from employees
where hire_date BETWEEN '1990-01-01' and '1999-12-31'
      and birth_date like '%12-25'
ORDER BY hire_date DESC, birth_date;

select * from employees
where last_name LIKE '%q%' and last_name NOT like'%qu%';