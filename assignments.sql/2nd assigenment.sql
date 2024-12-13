-----i will start the second assignment with new data base 
--create database second_one;
--go 
--use second_one
--go
CREATE TABLE employees (
emp_id int PRIMARY KEY IDENTITY (1,1),
f_name NVARCHAR(50) NOT NULL,
l_name NVARCHAR(50),
salary int ,
maneger_id int 
); 
insert into employees (f_name,l_name,salary)
values('reda','elbahrawy',4000)
insert into employees (f_name,l_name,salary)
values('khalid','mostafa',1999)
insert into employees 
values('saif','sameh',12000,101)
insert into employees 
values('layla','samir',5000)
insert into employees 
values('sied','khamis',16000,100)
insert into employees 
values('mohamed','badr',3500,200)
CREATE TABLE department (
    department_id INT PRIMARY KEY,      -- department_id as the primary key
    department_name NVARCHAR(100) NOT NULL  -- department_name column with a NOT NULL constraint
);
ALTER TABLE employee
ADD department_id INT;
ALTER TABLE employee
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES department(department_id);

INSERT INTO department (department_id, department_name)
VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Sales'),
(4, 'Marketing'),
(5, 'Finance'),
(6, 'IT Support'),
(7, 'Operations');

UPDATE employees
SET department_id = 1
WHERE emp_id = 1;

UPDATE employees
SET department_id = 2
WHERE emp_id = 10;

UPDATE employees
SET department_id = 3
WHERE emp_id = 11;

UPDATE employees
SET department_id = 4
WHERE emp_id = 12;

UPDATE employees
SET department_id = 5
WHERE emp_id = 13;

UPDATE employees
SET department_id = 6
WHERE emp_id = 14;

UPDATE employees
SET department_id = 7
WHERE emp_id = 15;


--2nd assignment 
-- 1st question 
--Write a SQL query to retrieve the emp_id, last_name, and salary of employees whose salary 
--is between 2,000 and 5,000 and do not have a manager ID of 101 or 200. 
SELECT emp_id,l_name,salary
FROM employees
WHERE salary between 2000 and 5000 
AND
maneger_id NOT IN (101,200);

--second quesion Write a SQL query to display the employee names along with their respective department names. Use aliases for table names for better readability
select e.f_name,e.l_name,d.department_name
from employees e
inner join department d on d.department_id=e.department_id
order by department_name asc
--third question Write a SQL query to find the number of employees and the average salary for each department. Ensure that the results are grouped by department ID.
select count(*) as employees_for_dep ,AVG(e.salary) as salary_for_dep
from employees e
inner join department d on d.department_id=e.department_id
group by e.department_id
