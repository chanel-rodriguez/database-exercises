use employees;


# 1.)
select * from employees
where emp_no IN (
  SELECT emp_no
  FROM employees
  where hire_date = '1990-10-22'
);


# 2.)
select title, count(title)
from  titles
where emp_no in (
  SELECT emp_no
  FROM employees
  WHERE first_name = 'Aamod'
)
GROUP BY title;


# 3.)


# first_name | last_name  |
# +------------+------------+
# | Isamu      | Legleitner |
# | Karsten    | Sigstam    |
# | Leon       | DasSarma   |
# | Hilary     | Kambil     |
# +------------+------------+



# WBA3B1C59FK138960



#   Find all the titles held by all employees with the first name Aamod.
#
# 314 total titles, 6 unique titles