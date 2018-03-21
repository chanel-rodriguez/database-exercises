use employees;

# 2
select dept_name, CONCAT(first_name, ' ', last_name) as FullName
  from departments as a
join dept_manager as b
on a.dept_no = b.dept_no
join employees as c
on b.emp_no = c.emp_no
where b.to_date LIKE '%9999%'
ORDER BY dept_name;

# 3

select dept_name, CONCAT(first_name, ' ', last_name) as FullName
from departments as a
  join dept_manager as b
    on a.dept_no = b.dept_no
  join employees as c
    on b.emp_no = c.emp_no
where b.to_date LIKE '%9999%' and c.gender = 'F'
ORDER BY dept_name;

# 4      Customer service no = d009
SELECT title, count(title)
from dept_emp as de
join titles as t
  on de.emp_no = t.emp_no
  where dept_no = 'd009' and t.to_date LIKE '9999%' AND de.to_date LIKE '9999%'
  GROUP BY title;

# SELECT title, count(title)
# FROM dept_emp as de
#   join titles as t
#   on de.emp_no = t.emp_no
#   WHERE dept_no = 'd009' and t.to_date LIKE '9999%' and title = 'Staff'
#   GROUP BY title;

# 5
select dept_name, CONCAT(first_name, ' ', last_name) as FullName, salary
from departments as d
  join dept_manager as dm
    on d.dept_no = dm.dept_no
  join employees as e
    on dm.emp_no = e.emp_no
  join salaries s
    ON dm.emp_no = s.emp_no
where dm.to_date LIKE '%9999%' and s.to_date LIKE '9999%'
ORDER BY dept_name;


# bonus

select concat(e.first_name, ' ', e.last_name) as EmployeeName, dept_name,concat(e2.first_name, ' ',e2.last_name) as Manager
  from employees as e
  join dept_emp as de on e.emp_no = de.emp_no
  join departments d ON de.dept_no = d.dept_no
  join dept_manager dm ON d.dept_no = dm.dept_no
    join employees e2 on dm.emp_no = e2.emp_no
where dm.to_date LIKE '9999%' and de.to_date LIKE '9999%'
ORDER BY dept_name;

# avg salaries bonus

# 1.)
select avg(salary)
from departments as d
  join dept_manager as dm
    on d.dept_no = dm.dept_no
  join employees as e
    on dm.emp_no = e.emp_no
  join salaries s
    ON dm.emp_no = s.emp_no
where dm.to_date LIKE '%9999%' and s.to_date LIKE '9999%'
  GROUP BY gender;

# 2.)

select avg(salary)
from departments as d
  join dept_manager as dm
    on d.dept_no = dm.dept_no
  join employees as e
    on dm.emp_no = e.emp_no
  join salaries s
    ON dm.emp_no = s.emp_no
GROUP BY gender;


# 3.)
  select gender, avg(salary)
    from employees as e
    join salaries s ON e.emp_no = s.emp_no
    where s.to_date LIKE '9999%'
  GROUP BY gender;

# 4.)
select gender, avg(salary)
from employees as e
  join salaries s ON e.emp_no = s.emp_no
GROUP BY gender;


show tables;

describe departments;
DESCRIBE dept_manager;
select * from employees LIMIT 10;
select * from dept_emp LIMIT 10;
select * from dept_manager LIMIT 10;
select * from titles LIMIT 10;
select * from departments LIMIT 10;
select * from salaries LIMIT 10;







