--go 
--USE SAIF_DEPI
--go

--begin transaction ;
--delete from students where city ='cairo';
--select * from students ;
--rollback;

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
--2nd assignment 
-- 1st question 
--Write a SQL query to retrieve the emp_id, last_name, and salary of employees whose salary 
--is between 2,000 and 5,000 and do not have a manager ID of 101 or 200. 
SELECT emp_id,l_name,salary
FROM employees
WHERE salary between 2000 and 5000 
AND
maneger_id NOT IN (101,200);

