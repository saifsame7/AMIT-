--CREATE DATABASE SAIF_DEPI;
--GO 
--USE SAIF_DEPI
--GO

--1-1- Basic SQL Queries:
-- Write a SQL query to retrieve all columns from a table named employees.

--CREATE TABLE employees(
--Emp_id int ,
--Emp_name nvarchar(50),
--Location_ nvarchar(100)
--)
--insert into employees (Emp_id,Emp_name,Location_)
--values 
--(100,'saif sameh','cairo')
--insert into employees (Emp_id,Emp_name,Location_)
--values 
--(101,'anas sameh','menofia')
--insert into employees (Emp_id,Emp_name,Location_)
--values 
--(102,'hams sameh','dammam')
--select * from employees ;

--1-2- Write a SQL query to retrieve the emp_id, emp_name, and dept_id from the employees table, where the location is 'Cairo'.

--select Emp_id,Emp_name,Location_ 
--from employees 
--where Location_ = 'cairo';

--2-Write a SQL query that displays distinct dept_id values from the 

--select distinct Emp_id 
--from employees 

--3-1 Write a SQL query to create a table students with the following columns: ID (Primary Key)
--  , First_Name (not null), Last_Name (default 'Unknown'), Address (default 'N/A'), City (default 'N/A'), and Birth_Date.

--create table students (
--ID int primary key ,
--first_name nvarchar(50) NOT NULL,
--last_name nvarchar (50) default 'unknown' ,
--address_ nvarchar(100) default 'N/A',
--city nvarchar(50) default 'N/A',
--birth_date date	not null	
--)

--3-2- Write a SQL query to drop the students table.

--drop table students

--create table students (
--first_name nvarchar(50) NOT NULL,
--last_name nvarchar (50) default 'unknown' ,
--address_ nvarchar(100) default 'N/A',
--city nvarchar(50) default 'N/A',
--birth_date date	not null,
--ID int primary key identity (1,1) 
--)

--4-1- Write a SQL query to insert the following values into the students table: ('Ahmed', 'Ali', 'Downtown', 'Cairo', '1995-01-01').

--insert into students 
--values 
--('Ahmed', 'Ali', 'Downtown', 'Cairo', '1995-01-01')
--insert into students 
--values 
--('khalid', 'ahmed', 'madena nasr', 'Cairo', '1997-08-15')

--4-2- Write a SQL query to update the Address of the student with Last_Name = 'Ahmed' to 'Garden City'.
--update students

--set address_='garden'
--where last_name='ahmed'
  
  --Write a SQL query to delete the rows from the students table where City is 'Cairo', and then rollback the transactio
--begin transaction ;
--delete from students where city ='cairo';
--select * from students ;
--rollback;
