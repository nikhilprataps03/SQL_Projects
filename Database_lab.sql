--DDL(Data Definition Language) Queries
--Q.no-1-write a query to create a table employee with empno,ename,designation and salary.
create table emp
(
    empno number(3),
    ename varchar2(30),
    designation varchar2(15),
    salary number(9,3)
    );
    
--Q.no-2-write a query for create a query from an existing table with all the fields.
create table emp1 as select *from emp;
desc emp1;

--Q.no.3-write a query to alter the column empno number(3) to empno number(6).
alter table emp modify empno number(6);
desc emp;

--Q.no-4-write a query to add a new column into an employee
alter table emp add qualification varchar(10);
desc emp;

--Q.no-5-write a query to drop a column from an existing table employee
alter table emp drop column qualification;
desc emp;

--Q.no-6-write a query to drop an existing table employee
drop table emp;
desc emp;
select *from emp;

--DML(Data Manipulation Language) Queries
--Q.no-1-write a queries to insert a record into an employee.
create table emp
(
    empno number(3),
    ename varchar2(30),
    designation varchar2(15),
    salary number(9,3)
    );
    
insert into emp values(01,'NIKHIL','Data Analytics',50000);

--Q.no-2-write a query to display the records from an employee.
select *from emp;

--Q.no-3-write a query to display the records into an employee using substitution method.
--Q.no-4-write a query to update the records from employee.
update emp
set salary=60000;
select *from emp;

--LOGICAL OPERATIONS AND OPERATORS
create table customers
(
    ID number(3),
    NAME VARCHAR2(30),
    AGE NUMBER(3),
    ADDRESS VARCHAR2(30),
    SALARY NUMBER(9,3)
    );
insert into customers
select 1,'Nikhil',25,'Noida',50000 from dual
union all
select 2,'Alok',24,'Delhi',55000 from dual
union all
select 3,'Nikita',29,'Lucknow',60000 from dual
union all
select 4,'Pallavi',24,'Noida',40000 from dual
union all
select 5,'Nishant',25,'Noida',45000 from dual
union all
select 6,'Kajal',23,'Ballia',30000 from dual
union all
select 7,'Sapna',21,'Noida',53000 from dual;

select *from customers;

--Q.no-1-Write a query to find the salary of a person where age is <= 26 and salary >= 25000 from customer table.
select * from customers
where age<=26 and salary>=25000;

--Q.no-2-Write a query to find the salary of a person where age is <= 26 or salary > =33000 from customer table.
select *from customers
where age<=24 and salary>=50000;

--Q.no-3-Write a query to find the name of customer whose name is like “Ni%”.
select *from customers
where name like 'Ni%';

--Q.no-4-Write a query to find the customer details using “IN” and “Between” operator where age can be 25 or 27.
select *from customers where age in(24,27);
select *from customers where age between 21 and 26;

--GROUP FUNCTIONS(COUNT,SUM,AVG,MAX,MIN)

create table product
(
    Product_ID number(10),
    Prod_name varchar2(15),
    Prod_Description varchar2(30),
    price number(8,2)
    );
insert into product
select 1000001,'Printer','Inkjet 300 colour Printer',2600 from dual
union all
select 1000002,'Printer','1220XI Inkjet Printer',1600 from dual
union all
select 1000003,'Printer','Photo 890 Inkjet Printer',1100 from dual
union all
select 1000004,'Printer','Photo 890 Inkjet Printer',1900 from dual;

select *from product;

--Q1. Write a query find the total price of the product.
select sum(price) from product;

--Q2. Write a query find the average price of the product.
select avg(price) from product;

--Q3. Write a query find the max price and count id of the product.
select max(price) from product;
select count(product_id) from product;

--write a sql queries to create views.
--Q1. Write a SQL query to create a view of customer table created in PRACTICAL no 1.

create view cust as
select id,age
from customers;

desc cust;
select *from cust;
select *from customers; 

select commission_pct from employees;
select sum(commission_pct),count(commission_pct),min(commission_pct) from employees;

select salary from employees;
select max(salary) from employees;
select max(salary) (select max(salary) from employees)employees;

select *from employees;

--find the salary step by step
--highest salary
select max(salary) from employees;

--second highest salary
select max(salary) from employees where salary<24000;

--third highest salary
select max(salary) from employees where salary<17000;

--find the salary in single line
--First highest salary from employees
select max(salary) from employees;

--Second highest salary from employees
select max(salary) from employees 
where salary<(select max(salary) from employees);

--third highest salary from employees
select max(salary) from employees
where salary<(select max(salary) from employees 
where salary<(select max(salary) from employees));

select *from employees;

-- who is taking second highest salary
select max(salary) from employees
where salary<(select max(salary) from employees);

select first_name,last_name,salary from employees
where salary=17000;

-- who is taking third highetst salary
select max(salary) from employees
where salary<(select max(salary) from employees
where salary<(select max(salary) from employees));

select first_name,last_name,salary from employees
where salary=14000; 

-- find duplicate row  from the table employees
select first_name,last_name from employees
group by first_name,last_name
having count(*)>1;

select *from emp;
insert into emp
select 2,'Alok','Testing',55000 from dual
union all
select 3,'Suyash','Developer',58000 from dual
union all
select 4,'Anand','Engineer',45000 from dual
union all
select 5,'Alok','Testing',55000 from dual;

select *from emp;

select ename,designation from emp
group by ename,designation
having count(*)>1;

-- delete the duplicate row
Delete from emp where ename='Alok';

select *from emp;
select distinct empno,ename,salary from emp;
delete from emp where empno=5;

--first minimum salary
select min(salary) from employees;

--second lowest salary
select min(salary) from employees 
where salary>(select min(salary) from employees);

--third lowest salary
select min(salary) from employees 
where salary>(select min(salary) from employees
where salary>(select min(salary) from employees));

-- who is taking second lowest salary
select *from employees;
select min(salary) from employees
where salary>(select min(salary) from employees);

select first_name,last_name from employees
where salary=2200;

-- who is taking third lowest salary
select min(salary) from employees
where salary>(select min(salary) from employees
where salary>(select min(salary) from employees));

select first_name,last_name from employees
where salary=2400;

