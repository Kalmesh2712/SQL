sql syntax

SELECT * FROM customer;
CREATE DATABASE employee;
USE DATABASE employee;
----------------------------
sql drop STATEMENT

drop DATABASE employee;
---------------------------
create TABLE

CREATE TABLE deppartment(
       id INTEGER NOT NULL
	   dept VARCHAR(20)
	   dept_id INTEGER NOT NULL
	   )
--------------------------
DROP table department;
--------------------------
ALTER to ADD COLUMNS

ALTER table department
ADD dept_Name VARCHAR(30)

alter table drop COLUMNS

ALTER table department
DROP COLUMN dept

RENAME COLUMN
ALTER TABLE department
RENAME dept_id to department_id

datatype name UPDATE
ALTER TABLE department
ALTER COLUMN department_id INTEGER
-----------------------------------

SQL NOT NULL on CREATE TABLE
CREATE TABLE employee(
       emp_id INTEGER NOT NULL,
	   emp_name VARCHAR(89),
	   emp_salary INTEGER NOT NULL
	   )
	   
ALTER TABLE employee
ALTER COLUMN emp_name NOT NULL

SQL UNIQUE on CREATE TABLE
CREATE TABLE employee(
       emp_id INTEGER NOT NULL UNIQUE,
	   emp_name VARCHAR(89),
	   emp_salary INTEGER NOT NULL
	   )
-------------------------------------
SELECT DISTINCT COLUMN FROM TABLE;
SELECT COUNT(DISTINCT COLUMN) FROM TABLE;
SELECT * FROM TABLE ORDER BY COLUMN1,COLUMN2 DESC;

-------------
The SQL AND Operator

SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

SELECT *
FROM Customers
WHERE Country = 'Spain' AND CustomerName LIKE 'G%';

SQL OR Operator
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2...;

SELECT *
FROM Customers
WHERE Country = 'Spain' OR CustomerName OR 'G%';

--------------------------
SQL NOT Operator
SELECT * FROM Customers
WHERE NOT Country = 'Spain';

SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

SQL INSERT INTO Statement

INSERT INTO employee ('emp_id','emp_name','emp_sal')
VALUES(1,'Kalmesh',34000);

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norw
ay');

Insert Data Only in Specified Columns
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

Insert Multiple Rows
INSERT INTO Customers 
(CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');
----------------------------------------------------------------------------------
LinkedIN


Most commonly asked SQL interview questions 

1. What is the difference between `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `FULL JOIN`?
2. How do you optimize a slow-running query?
3. Explain the difference between `WHERE` and `HAVING` clauses.
4. What is a `GROUP BY` clause and how is it used?
5. What is a subquery, and how does it differ from a `JOIN`?
6. How do you find the second-highest salary in a table?
7. What are `ACID` properties in databases?
8. What is the difference between `UNION` and `UNION ALL`?
9. Explain `RANK()`, `DENSE_RANK()`, and `ROW_NUMBER()`.
10. What are indexes, and how do they impact query performance?
11. What is a `PRIMARY KEY` and a `FOREIGN KEY`?
12. Explain the use of `TRIGGERS` in SQL.
13. How can you delete duplicate records in a table?
14. What is normalization, and what are the different normal forms?
15. What are window functions in SQL, and how are they used?
16. Explain the difference between `TRUNCATE`, `DELETE`, and `DROP`.
17. How can you retrieve data from multiple tables using `JOIN`?
18. What is the difference between `VARCHAR` and `CHAR` data types?
19. What is a `CTE` (Common Table Expression)?
20. How can you find the `N`th record from a result set?



leet codes practice
182-find the duplicate mails
select email
from person
group by email
having count(*)>1

with cte AS
(
select email,DENSE_RANK() over(partition by email) as RANK
FROM person
)
select email from cte where rank>1

183-customer who never ORDER

select d.name as Department,e.name as Employee,e.salary
from Employee e
join Department d on e.departmentId=d.id
where (e.salary,e.departmentId) in (select max(salary),departmentId from Employee group by departmentId)

CREATE TABLE tbl(
    id CHAR(1)
);

INSERT INTO tbl (id)
VALUES 
    ('A'),
    ('B'),
    ('C'),
    ('D');
	
select t1.id,t2.id
from tbl t1
join tbl t2 on t1.id=t2.id

select t1.id,t2.id
from tbl t1
join tbl t2 on t1.id=t2.id;

select t1.id,t2.id
from tbl t1
join tbl t2 on t1.id>t2.id;

select t1.id,t2.id
from tbl t1
join tbl t2 on t1.id<t2.id;



Write a query to delete duplicate rows from a table.
with CTE as
(select *,ROW_NUMBER() over(partition by name,email order by id) as rn
from tbl)

DELETE FROM cte
where rn>1

delete
from tbl
where id in ( select col,count(*) from tbl group by col having count(*)>1)

select * from tbl


3. Write a query to display the second highest salary from the Employee table.
with cte as
(
select *,DENSE_RANK() over(partition by Department order by salary desc) as rnk
from employee
)

select emp,salary
from cte
where rnk=2


4. Write a query to find all customers who have made more than Two orders.

SELECT 
    CustomerID,
    COUNT(OrderID) AS OrderCount
FROM 
    Orders
GROUP BY 
    CustomerID
HAVING 
    COUNT(OrderID) > 2;
	
	
5. Write a query to count the number of orders placed by each customer.
select customerid,count(orderId) as no_of_orders,customer
from Orders
group by customer

6. Write a query to retrieve the list of employees who joined in the last 3 months.
select name,id,joiningdate
from emp
where joiningdate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);


Here is the code:- 
create table adult as
(select *, row_number() over(order by age desc) as row1
from family
where type = 'adult');
create table child as
(select *, row_number() over(order by age asc) as row2
from family
where type = 'child');
select adult.person,child.person from adult
left join child on adult.row1=child.row2


1.Find the second highest salary from a table. 


with cte AS
(select *, dense_rank() over(orde by salary desc) as rn
from tbl
)
select * from cte where rn=2

2.Retrieve duplicate rows from a table.
select dept,count(9) from tbl group by dept having count(9)>1;

3.Remove duplicate rows, keeping only one instance. 
select dept,count(9) from tbl group by dept having count(9)=1;

4.


Alti_2.O preparation
1.
select *
from employees;

2.
select name,salary
from employee;

3.
select employee
from employees
where salary>50,000;

4.
select employee
from employee
where Department='IT';

5.
select employee
from employees
where city='Bangalore';

6.
select employee
from employees
where hire_date>'2023-01-01';

7.
select employee 
from employees 
where salary between 40000 and 70000;

8.
select employee
from employees
where name like '%A';

9.
select employee
from employees
where name like 'n%';

10.
select employee
from employees
where name like '%ra%';

11.
select employee
from employees
where city is null;

12.
select employee
from employees
where salary IS NOT NULL;

13.
select *
from employees
where dept_name <> 'HR';

14.
select *
FROM employees
where status='ACTIVE';

15.
select * from employees
where salary>=60000;

16.
select * from employees
where gender='F';

17.
select * from employees
where hire_date<2022;

18.
select * from employees
where salary=50000;

19.select * from employees
where city in ('pune','Mumbai');
OR
where city='Pune' or city='Mumbai';

20.
select * from employees
where city <> 'Bangalore';

21.
select * from employees
where emp_id>100;

22.
select * from employees
where salary<(select max(salary) from employee);

23.
select * from employees
where status<>'INACTIVE';

24.
select * from employees
where len(name)=5;

25.
select * from employees
where hire_date=2024;

26.
select * from employees
where salary%5000=0;

27.
select * from emloyees
where name like '[aeiou]%';

28.
select * from employees
where dept_name is null;

29.
select * from employees
where salary not between 30000 and 60000;

30.
select * from employees
where name='Ravi';

31.
select * from employees
where dept_name='IT' and salary>60000;

32.
select * from employees
where dept_name='HR' and city='Chennai';

33.
select * from employees
where hire_date>2022 and salary>50000;

34.
select * from employees
where gender='F' and dept_name='Finance';

35.
select * from employees
where city in ('banglore','Hydrabad');

36.
select * from employees
where dept_name != 'IT'; or <> 'IT';

37.
select * from employees
where salary in (80000,40000);

38.
select * from employees
where city='Mumbai' and status='ACTIVE';

39.
select * from employees
where gender<>'male';

40.
select * from employees
where hire_date between '2022-01-01' and '2023-01-01';
where year(hire_date) between 2021 and 2023;

41.
select * from employees
where city is null or salary is null;

42.
select * from employees
where dept_name in ('HR','IT');

43.
select * from employees
where salary>50000 and salary<90000;

44.
select * from employees
where name not like 's%';

45.
select * from employees
where year(hire_date)<2020 or salary>90000;
where hire_date<'01-01-2020' or salary>90000;

46.
select * from employees
where city not in ('Delhi','Pune');

47.
select * from employees
where name like 'A%' and name like '%h';

48.
select * from employees
where dept_name is null and status='ACTIVE';

49.
select * from employees
where salary>50000 and city='Bangalore';

50.
select * from employees
where year(hire_date) 2023;

51.
select * from employees
where gender='Male' and salary<60000;

52.
select * from employees
where city is not null and salary is not null;

53.
select * from employees
where dept_name='Finace' and city <>'Mumbai';

54.
select * from employees
where year(hire_date) between 2021 and 2024--->X
where hire_date between '2022-01-01' and '2023-12-31';

55.
select * from employees
where status='ACTIVE' and salary between 40000 and 60000;

56.
select * from employees
where dept_name like '%an%' and city ='Chennai';


57.
select * from employees
where dept_name='HR' and salary<=50000;

58.
select * from employees
where status <>'ACTIVE'
where staus='INACTIVE';

59.
select * from employees
where city like '[BC]%'

60.
select * from employees
where hire_date<'2019-01-01' and status='ACTIVE';

61.
select distinct dept_name from employees

62.
select distinct city from employees

63.
select distinct(city,depat_name) from employees

64.
select distinct salary from employees

65.
select count(distinct dept_name) from employees
66.
select distinct (year(hire_date)) from employees

67.
select distinct gender from employees

68.
select distinct status from employees

69.
select distinct city from employees
where saalry>50000

70.
select distinct dept_name from employees
where city='Bangalore'

71.
select distinct city from employees
where dept_name='IT'

72.
select distinct salary from employees
where dept_name='HR'

73.
select distinct city from employees
where city<>'Bangalore';

74.
select distinct dept_name from employees
where gender='F';

75.
select distinct city from employees
where status='ACTIVE';

76.
select distinct(year(hire_date)) from employees

77.
select distinct name from employees

78.
select distinct salary from employees

79.
select count(distinct dept_name),city from employees
group by city

80.
select distinct city,dept_name from employees
group by dept_Name

81.
select distinct salary from employees
where salary>80000;

82.
select distinct city from employees
where hire_date<'2021-12-31';

83.
select distinct dept_name from employees where salary>80000

84.
select distinct gender from employees
where dept_name='IT';

85.
select distinct city from employees
where salary is null;

86.
select distinct dept_name from employees
where dept_name<>'HR';

87.
select distinct status from employees
where city='Bangalore';

88.
select distinct year(hire_date) from employees

89.
select distinct city from employees
where gender='Male';

90.
select distinct salary from employees
where status='ACTIVE';

91.
select distinct (dept_name,city) from employees

92.
select distinct city from employees
where city like 'B%'

93.
select distinct salary from employees
where salary<40000

94.
select distinct dept_name from employees
where year(hire_date)=2024;

95.
select distinct city from employees
where dept_name is null;

96.
select distinct gender from employees
where gender<>'M';

97.
select distinct hire_date from employees
where hire_date<'2020-12-31';

98.
select distinct dept_name from employees
where city ='Pune'

99.
select distinct city from employees
where salary between 50000 and 80000;

100.
select distinct dept_name from employees
where status='ACTIVE';

order by/limit/featch
1.
select * from employees
order by salary asc;

2.
select * from employees 
order by salary desc;

3.
select * from employees
order by name asc;

4.
select * from employees
order by hire_date;

5.
select * from employees
order by hire_date desc;

6.
select * from employees
order by dept_name,salary;

7.
select * from employees
order by city,name;

8.
select * from employees
order by salary asc,emp_id asc;

9.
select * from employees
order by length(name) asc;

10.
select * from employees
order by substring(name,-1) asc;
order by right(name,1) asc;

11.
select * from employees
order by year(hire_date) asc;

12.
select * from employees
order by month(hire_date) asc;

13.
select *,(salary%1000) from employees
order by salary%1000 asc

14.
select * from employees
order by performance_score asc;

15.
select * from employees
order by performance_score desc;

16.
select * from employees
order by city asc,salary desc;

17.
select * from employees
order by department asc,hire_date asc;

18.
select * from employees
order by 
(case when salary is null then 1 else 0 end) asc,salary asc

19.
select * from employees
order by 
(case when salary is null then 0 else 1 end) asc,salary asc;

20.
select * from employees
order by upper(name) asc;

21.
select * from employees
order by emp_id asc;
order by cast(substring(emp_id,4) as int) asc

22.
select *,round(salary,0) from employees
order by round(salary,0) asc;

23.
select abs(salary-50000) as abs_sal_diff from employees
order by abs(salary-50000) asc

24.
select * from employees
order by trim(name) asc;

25.
select * from employees
order by case when dept_name='HR' then 1
              when dept_name='IT' then 2
			  when dept_name='Finance' then 3
			  else 4
			  end ASC,
			  dept_name asc
			  
--select * from employee order by salary desc limit 5;
--select * from employee order by salary asc limit 10;
--select * from employee order by hire_date asc limit 3;
--select * from employee order by hire_date desc limit 5;
--select emp_id,name,dept from employee group by dept order by salary desc limit 1 
with CTE as
( select *,rank() over(partition by dept order by salary desc) as rnk
from employee
)
select * from CTE where rnk=1;

take home
salry-(tax+insurance+pf+ptax)

--select *,(salary+bonus) as Hike from employees
--select *,(salary+bonus-tax) as NetSalary from employees;
--select *,(salary+salary*.1) as '10%IncSalary' from employees;
--select *,(salary-salary*.05) as '5%DecSalary' from employees;
--select *,(salary*12) as AnnualSal from employees;
--select *,(salary*12/(12)) as MontlySal from employees;
--select *,(salary*.20) as NewTax from employees;
--select *,(salary*.15) as NewBonus from employees;
--select *,(salary-tax) as NetSalary from employees;
/*with CTE as
(select *,(salary-tax) as NetSalary from employees)
select * from CTE where NetSalary>60000;*/
--select *,(salary*12 +coalesce(bonus,0)) as TotalEarning from employees;
--select * from employees where bonus >5000;
/*select *,  
case when experience_years<1 then salary
else (salary/experience_years)
end as saalry_per_year
from employees;*/
select *,(round(salary,-2)) from employees;
--select * from employees where salary%5000=0
/*select *,case when emp_id%2=1 then 'Odd'
else 'Even'
end as OddEven
from employees;*/
--select *,(salary%3) as ReminderSalBy_3 from employees;
--select round(salary,2) from employees;
select cast(salary as int) from employees;


--select * from employees where salary>50000;
--select * from employees where salary<40000;
--select * from employees where salary=60000;
--select * from employees where salary !=45000;
--select * from employees where experience_years>5;
--select * from employees where experience_years<=3;
--select * from employees where bonus >=5000;
--select * from employees where tax<bonus;
--select * from employees where salary>bonus;
--select * from employees where bonus=tax;
--select * from employees where salary>=70000;
--select * from employees where salary<=35000;
--select * from employees where experience_years!=10;
--select * from employees where city='Bangalore';
--select * from employees where city!='Mumbai';
--select * from employees where joining_date>'2021-01-01';
--select * from employees where joining_date<'2019-01-01';
--select * from employees where salary>tax;
--select * from employees where bonus<tax;
--select *,(salary/10000) from employees; --where experience_years>(salary/10000);
--select * from employees where salary=(2*bonus);
--select * from employees where tax>(2*bonus);
--select * from employees where experience_years>=8;
--select * from employees where salary >50000;
--select * from employees where salary>50000 and bonus>5000;
--select * from employees where salary>70000 and tax>10000;
--select * from employees where experience_years>5 and salary>55000;
--select * from employees where bonus>5000 and tax<7000;
--select * from employees where dept in ('HR','IT');
--select * from employees where city in ('Bangalore','Chennai');
--select *,year(joining_date) from employees where year(joining_date)<2018 or experience_year>12;
SELECT *
FROM employees
WHERE joining_date < '2018-01-01' OR experience_years > 12
--select * from employees where city in ('Bangalore','Hyderabad','Pune')
/*SELECT *
FROM employees
WHERE joining_date>='2021-01-01' and joining_date<='2021-12-31'
or joining_date>='2023-01-01' and joining_date<='2023-12-31'*/
--select * from employees where city not in ('Mumbai','Pune');
--select * from employees where email like '%@gmail.com%' or email like '%@yahoo.com%'
/*SELECT *
FROM employees
WHERE MONTHNAME(joining_date) IN ('January', 'June');*/
--select * from employees where dept=(select dept from employees where email='karan@company.com');
--select dept from employees where email='karan@company.com'

select * from (
select *,dense_rank() over(order by salary desc) dn
  from employees)
where dn<=5;

--select * from employees where salary is NULL and bonus is NULL;
--select * from employees where salary is NULL or bonus is NULL;
--select * from employees where dept is null or manager_id is null
--select * from employees where tax is null and salary is not null;
--select * from employees where dept='IT' and salary is NULL;
--select * from employees where dept='Finance' and email is NULL;
--select * from employees where manager_id is null and status ='Active';
--select * from employees where bonus is null and salary>50000;
--select * from employees where salary is null or tax is null;
--select * from employees where dept is not null and salary is null;
--select * from employees where manager_id is null and joining_date is null;
--select * from employees where salary is not null and tax is not null;
--select * from employees where bonus is null and tax is not null;
--select * from employees where salary is null and experience_years is null;
--select * from employees where dept is null and status ='Active';
--select * from employees where manager_id is null and experience_years>3;
--select * from employees where city is null and joining_date<'2021-01-01';
--select * from employees where email is NULL;
--select * from employees where bonus is NULL;
--select * from employees where tax is NULL;
--select * from employees where experience_years is NULL and status ='Active';
--select * from employees where dept is NULL and salary is not NULL;
--select * from employees where manager_id is null and dept is NULL;
--select * from employees where salary is NULL and bonus is NOT NULL;
--select * from employees where joining_date is NULL;
--select * from employees where manager_id is null and status='Inactive';
--select * from employees where city is NULL and status ='Active';
--select * from employees where email is null and bonus is null;
--select * from employees where salary is not null and dept is null;
--select * from employees where status='Inactive' and manager_id is NULL;
/*SELECT *
FROM employees
WHERE (
    (CASE WHEN name IS NULL THEN 1 ELSE 0 END) +
    (CASE WHEN dept IS NULL THEN 1 ELSE 0 END) +
    (CASE WHEN email IS NULL THEN 1 ELSE 0 END) +
    (CASE WHEN salary IS NULL THEN 1 ELSE 0 END) +
    (CASE WHEN manager_id IS NULL THEN 1 ELSE 0 END) +
    (CASE WHEN city IS NULL THEN 1 ELSE 0 END)
) > 2;*/
--select coalesce(salary,0) from employees;
--select * from employees where (coalesce(salary,0)+coalesce(bonus,0)-coalesce(tax,0)) is null;
--select coalesce(city,'Unknown') from employees;
--select name,salary,tax,bonus,(coalesce(salary,0)+coalesce(bonus,0)-coalesce(tax,0)) as NetSalary
--from employees;
--select *,(salary+bonus-tax) as NetSalary from employees where NetSalary is NULL;
--select count(8) from employees where salary is not null;
SELECT 
    AVG(CASE WHEN bonus IS NULL THEN 1.0 ELSE 0.0 END) * 100 AS null_bonus_percentage
FROM employees;
case when
/*select *,case when salary<=50000 then 'Low_salary'
                when salary>50000 and salary<75000 then 'Medium'
                when salary>=75000 then 'High'
                else 'NoSalary'
                end as SalaryLabel
 from employees*/
 /*select *,case when salary>90000 then 'High'
               when salary>50000 and salary<=89999 then 'Medium'
               when salary<=50000 then 'Low'
               else 'NoSalary'
               end as SalGrade
 from employees;*/
 /*select name,salary,dept,
        case when coalesce(salary,0)>40000 then bonus
        else 'NotEligible'
        end as BonusStatus
 from employees;*/
 /*select name,salary,tax,
        case when coalesce(salary,0) between 10000 and 49999 then 'NonTaxable'
             when coalesce(salary,0)>=50000 then 'Taxable'
             else 'NotApplicable'
        end as taxStatus
 from employees;*/
/* select name,dept,performance_score,
        case when performance_score<=3 then 'Review Required'
             when performance_score>3 and performance_score<=6 then 'Medium Performer'
             else 'Best Performer'
        end as PerformanceScore
 from employees;*/
 /*select name,salary,
 		case when salary is null then 1
        else 0
        end as SalFlag
 from employees;*/
 
 
 30 SQL Coding Interview Questions on CONCAT
🟢 BASIC CONCAT (1–10)

Concatenate first_name and last_name to form a full name

Concatenate employee name and department

Add a space between two concatenated columns
select first_name ||' '|| last_name from employees;

Concatenate a constant string with a column value
select Mr||' '||first_name as correct_name from employees;
Display employee name with prefix Mr./Ms.
select concat(('mr')||' '|| first_name) as correctName from employees;
Concatenate city and country columns
select concat(city||' '||country) from employees
select city||' '||country from employees;
Concatenate multiple columns using CONCAT()
select concat(city,'-',country) from employees;
Create a display string: Name - Salary
select *,concat(coalesce(first_name,'NA'),' ',coalesce(last_name,''),'-',coalesce(salary,0)) 
from employees;
Concatenate date and name into one column
seelct concat(coalesce(first_name,' '),' ',coalesce(last_name,' '),'-',date) as EmpJoinDate from Employees;
Create a greeting message using employee name
select concat('Hello',' ',first_name) from employees;
🟡 CONCAT WITH NULL HANDLING (11–15)

Concatenate columns when one column may be NULL
already covered
Replace NULL values while concatenating using COALESCE
already covered
Show difference between CONCAT and || operator

Concatenate values but return NULL if any column is NULL
select concat(first_name,' ',last_name) as full_name from employees;
Concatenate empty string when bonus is NULL

🟠 CONCAT WITH SEPARATORS (16–20)

Create comma-separated values using CONCAT
select concat(first_name,',',last_name) from employees;
Build a pipe (|) separated string
select concat(city,'|',country) from employees;
Create email IDs using name and domain
select concat(coalesce(first_name,last_name),'@','altimetrik','.com') as email from employees
Concatenate phone country code and number
select concat(country_code,'-',number) as contact_number from employees;
Create full address using street, city, and state
select concat(city,'-',state,'-',country) from employees;
🔴 REAL INTERVIEW / ADVANCED SCENARIOS (21–30)

Generate a unique employee key using multiple columns
select concat(emp_id,' ',first_name,',',last_name,'-',contact_no) from employees;
Concatenate department and joining year
select concat(dept,'-',joinig_date) from employees;
Create dynamic file names using date and department

Build JSON-like strings using CONCAT
SELECT CONCAT('{', '"first_name":"', first_name, '",', '"last_name":"', last_name, '",', '"age":', age, '}') AS employee_json FROM employees;
Create reporting labels using multiple columns

Concatenate salary range and department
with Sal_range as(
select max(salary) as maxsalary,min(salary) as minsalary,dept
from employees group by dept)
select concat(dept,':',minsalary,'-',maxsalary) as salary_range from Sal_range;
Create audit log messages using CONCAT

Build URLs using base URL and parameters

Concatenate column values conditionally

Create display column using CONCAT and CASE WHEN



🟢 SUBSTRING / SUBSTR (1–15)

Extract the first 3 characters from an employee name
select substring(full_name,1,3) from employee;

Extract the last 4 characters from a phone number
select substring(phone,-1,-4) from employee

Extract the domain name from an email address
select substring_index(email,'@',-1) as one,
substring(email,instr(email,'@')+1) as two,
upper(substring(email,instr(email,'@')+1)) as three,
lower(substring_index(email,'@',-1)) as four from employee;

Extract the year from a date string
--select join_date_str from employee;
select join_date_str,year(join_date_str) as one,
substring(join_date_str,1,4) as two,
substring_index(join_date_str,'-',+1) as three,
substring(join_date_str,instr(join_date_str,'')-1) as four,
left(join_date_str,4) as five from employee;

Extract initials from first and last name
select substring(first_name,1,1) as fn,substring(last_name,1,1) as ln from employee

Extract everything after @ in an email
select substring_index(email,'@',-1) as domain from Employee

Extract department code from IT_001 format
select right(dept,3) as dept_code from employee

Extract characters between positions 2 and 5

Extract last name from full name

Extract first word from a sentence

Extract month from YYYY-MM-DD string

Extract numeric part from EMP12345

Extract characters before _ symbol

Extract middle characters from a string

Extract city code from address string

🟡 INSTR / POSITION / CHARINDEX (16–25)

Find position of @ in email address
select instr(email,'@') from employee
Find position of _ in department code
select instr(dept_code,'_') from Employee;
Find position of space in full name
select instr(full_name,' ') from employee;
Find index of first numeric character

Find index of last occurrence of a character

Find position of . in file name
select instr(file_name,'.') from employee
Check if a string contains a substring

Identify rows where name contains 'an'

Find position of - in date string
select joing_date_str,instr(joining_date_str,'-') from employee
Find position of / in path string

🟠 LENGTH / LEN (26–30)

Find length of employee name
select len(full_name) from employee
Find employees whose name length > 5
select * from employee where len(full_name)>5;
Find length of trimmed string
select len(trim(full_name)) from employee;
Identify records with unusually long names
select len(trim(full_name)) as longName from Employee order by longName desc
Compare length of first and last name
select len(first_name),len(last_name) from employee
🔵 TRIM / LTRIM / RTRIM (31–35)

Remove leading and trailing spaces from names
select rtrim(full_name),ltrim(full_name) from employee
Remove only leading spaces
select ltrim(full_name) from employee
Remove only trailing spaces
select rtrim(full_name) from employee
Clean address fields using TRIM
select trim(address) from employee
Identify records where trimming changes value

🔴 UPPER / LOWER (36–45)

Convert employee names to uppercase
select first_name,upper(first_name) from employee
Convert department names to lowercase
select dept,lower(dept) from employee
Perform case-insensitive comparison

Find employees whose name starts with 'a' (case-insensitive)
use like function
Normalize email addresses
select coalesce(lower(trim(email))) as normalisedEmail from employee;
Compare strings ignoring case

Detect inconsistent casing in department names

Standardize city names to uppercase
upper(city)
Convert mixed-case strings to lowercase
lower()
Validate uppercase codes

🟣 COMBINATION & REAL INTERVIEW SCENARIOS (46–50)

Extract and uppercase first 3 characters of name
select full_name,upper(coalesce(substring(trim(full_name),1,3),'NA')) from employee;

Trim and convert department name to lowercase
select lower(trim(dept_code)) from Employee
Check if trimmed name length > 5

Extract substring after trimming spaces
select full_name,upper(coalesce(substring(trim(full_name),1,3),'NA')) from employee;
same
Clean and format string columns for reporting


🟢 REPLACE (1–15)

Replace spaces in full_name with underscores
select replace(full_name,' ','_') as normalizedform from employee;
Replace @ with [at] in email addresses
select replace(email,'@','[at]') as email1 from employee;
Remove hyphens (-) from phone numbers
select phone,replace(phone,'-',' ') as newphone from employee;
Replace .com with .org in email domain
select email,replace(email,'.com','.org') as newemail from employee;
Replace multiple spaces in address with a single space
select address,regexp_replace(address,'\\s+',' ') as newaddress from employee;
Replace _ with - in dept_code
select dept_code,replace(dept_code,'_','-') as newdept_code from employee;
Mask phone numbers by replacing last 4 digits with XXXX
select phone,replace(phone,right(phone,4),'xxxx') as test from employee;
Replace .xlsx extension with .csv in file names
done
Replace BANGALORE with Bangalore in city column
select city,replace('BANGALORE','Bangalore') from employee
Replace tar.gz with zip in file names
done
Remove plus sign (+) from phone numbers
select phone,replace(phone,'+',' ') from employee;
Replace leading and trailing spaces in city using REPLACE (after TRIM)
select city,trim(city) as one,regexp_replace(city,'\\s+','') as second from employee
Replace digits in address with #
select address,regexp_replace(address,'[0-9]','#') from employee;
Replace all dots (.) in email with underscores
select replace(email,'.','_') from employee;
Replace file extensions with .bak
select file_name,replace(file_name,'[.]','.bak') from employee 
🟡 SPLIT / SPLIT_PART (16–25)

Split email to extract username (before @)
select email,split_part(email,'@',1) as username from employee;
Split email to extract domain (after @)
select email,split_part(email,'@',2) as domain_name from employee;
Extract first name from full_name using split
select full_name,split_part(ltrim(full_name),' ',1) as first_name from employee;
Extract last name from full_name using split
select full_name,split_part(full_name,' ',2) as last_name from employee
Split dept_code to get department name (IT, HR, FIN)
select dept_code,SPLIT_PART(dept_code,'_',1) as deptname from employee
Extract year from join_date_str using split
select join_date_str,year(join_date_str) as one,split_part(join_date_str,'-',1) as second from employee;
Extract month from join_date_str using split
select join_date_str,month(join_date_str) as one,split_part(join_date_str,'-',2) as second from employee;
Extract file extension using split
select file_name,split_part(file_name,'.',2) as extension from employee;
Extract base file name without extension
select file_name,split_part(file_name,'.',1) as base_file_name from employee;
Split phone number into country code and number
select phone,split_part(phone,'-',1) as cntrycode,split_part(phone,'-',2) as mobileno from employee;
🔴 REGEXP (26–40)

Extract numeric part from dept_code using REGEXP
select phone,regexp_replace(phone,'[^0-9]','') from employee;
Remove all non-numeric characters from phone number
select phone,regexp_replace(phone,'[a-zA-Z]','') from employee;
Validate email format using REGEXP

Extract file extension using REGEXP
select file_name,regexp_replace(file_name,'.',
Identify employees whose email domain is company.com

Replace multiple spaces in address using REGEXP
select address,regexp_replace(address,'\\s+','') from employee
Extract digits from address

Mask email usernames using REGEXP

Find records where full_name contains extra spaces

Convert mixed-case city names to lowercase using REGEXP

Identify file names with multiple extensions (.tar.gz)

Replace all digits in phone numbers with X

Extract first word from address using REGEXP

Find rows where phone number is missing digits

Validate join_date_str format (YYYY-MM-DD) using REGEXP


14/1/2026
A. CURRENT_DATE / NOW (1–15)

Fetch current date
select current_date()
Fetch current timestamp
select current_timestamp()
Display current date and time in a query
select current_date()
Compare joining_date with today’s date
select event_date,current_date() from events;
Find employees who joined today
select * from event where joining_date=current_date()
Calculate employee tenure using current date
select (current_date()-joining_date) as tenure from events
select emp_id,emp_name,hire_date,(year(current_date)-year(hire_date)) from events
Filter records created in last 24 hours
select * from events where current_date()-1
Show date-only part from NOW()
select date(now());
Show time-only part from NOW()

Calculate age of record using current timestamp
select year(hire_date)-year(current_date())
Identify active records as of today
select status from events where status='Active' and (hire_date<current_date());
Compare two timestamps using NOW

Flag late-arriving records
select *,case when load_time<current_date() then 'late' else 'ontime' end as 'arrival'
from events
Capture ingestion timestamp

Audit query using current date

🟡 B. DATE_ADD / DATE_SUB (16–30)

Add 7 days to joining date
select event_date+7,event_date from events;
Subtract 30 days from joining date
select event_date,event_date-30 from events;
Calculate date after 1 month
select event_date,event_date+30 from events
Calculate date before 1 year
select event_date,event_date-365 from events;
Add hours to timestamp
select date_add(event_date+3) from events
Subtract minutes from timestamp
select date_sub(event_date-3) from events;
Add weeks to date

Calculate expiry date using DATE_ADD

Find records expiring in next 10 days

Backfill dates using DATE_SUB

Calculate reminder dates

Shift dates for time correction

Create rolling window dates

Generate future schedule dates

Compute SLA deadlines

🟠 C. DATEDIFF (31–45)

Calculate days between joining date and today
select date_diff(current_date,joining_date) from employee_events;
Calculate years of experience using DATEDIFF
select floor(date_diff(current_date,joining_date))/365 from employee_events;
Find difference between two timestamps
select date_diff(joining_date,resignation_date) from employee_events;
Identify employees with tenure > 5 years
select * from employee_events where date_diff(current_date,joining_date)>365*5;
Find late records using date difference
select * from employee_events where date_diff(delivery_date,order_date)>7;
Calculate delay between order and delivery
select date_diff(delivery_date,order_date) as delay from employee_events;
Find records older than 90 days
select *,date_diff(current_date,delivery_date) from employee_events where date_diff(current_date,delivery_date)>90;
Calculate days between promotions
select *,DATEDIFF(promotion_date, joining_date) AS days_to_promotion
from employee_events where promotion_date is not null;
Detect negative date differences
select date_diff(joining_date,promotion_date) from employee_events where date_diff(joining_date,promotion_date)<0
Calculate aging bucket using DATEDIFF
select date_diff(joining_date,promotion_date) from employee_events
Group records by age range

Identify stale records

Calculate average tenure
select avg(date_diff(current_date,joining_date)/365) as avgtenure from employee_events;
Find maximum gap in dates
select * from employee_events where date(order_date)<date(delivery_date)
SELECT MAX(DATEDIFF(delivery_date, order_date)) AS max_gap
FROM employee_events;
Identify same-day events
select * from employee_events where date(order_date)=date(delivery_date)


🔵 D. EXTRACT (YEAR, MONTH, DAY) (46–60)

Extract year from joining date
select year(joining_date) as joining_year from employee_events;
Extract month from joining date
select month(joining_date) as joining_month from employee_events;
Extract day from joining date
select day(joining_date) as joining_day from employee_events;
Group records by year
select year(joining_date) as joining_year from employee_events
group by 1;
Group records by month
%sql
select month(joining_date) as joining_month,count(*) from employee_events
group by 1;
Filter records by joining year
select * from employee_events where year(joining_date)>2014
Filter records by joining month
same as above.just replace yaer by month
Calculate yearly hires
select year(joing_date) as joining_year,count(*) as yearlyhire
from employee_events group by 1;
Monthly trend analysis
select month(joing_date) as joining_month,count(*) as monthlytrend
from employee_events group by 1;
Daily record count
SELECT joining_date, COUNT(*) AS cnt
FROM employee_events
GROUP BY joining_date;
Extract quarter from date
SELECT 
    joining_date,
    MONTH(joining_date) AS joining_month,
    CASE 
        WHEN MONTH(joining_date) IN (1, 2, 3) THEN '1st Quarter'
        WHEN MONTH(joining_date) IN (4, 5, 6) THEN '2nd Quarter'
        WHEN MONTH(joining_date) IN (7, 8, 9) THEN '3rd Quarter'
        ELSE '4th Quarter'
    END AS Quarter
FROM employee_events;
select quarter(joining_date) from employee_events;
Identify end-of-month records
select * from employee_events where joining_date=LAST_DAY(joining_date)
Find weekend dates
select joining_date,case when dayname(joining_date) in ('Saturady','Sunday') then weekend
else 'weekdays'
end as dayname
from employee_events;
Identify leap-year dates feb 29
SELECT *
FROM employee_events
WHERE EXTRACT(MONTH FROM joining_date) = 2
  AND EXTRACT(DAY FROM joining_date) = 29;	   
		   
		   
Calculate fiscal year

🔴 E. DATE_TRUNC (61–75)

Truncate timestamp to day

Truncate timestamp to month

Truncate timestamp to year

Aggregate data at daily level

Monthly aggregation using DATE_TRUNC

Weekly aggregation

Hourly aggregation

Compare truncated dates

Align timestamps to month start

Create time-series buckets

Find first day of month

Find last day of month (with trunc)

Normalize timestamps

Remove time part from timestamp

Roll up data by period

🟣 F. Time Zone Conversion (76–85)

Convert UTC timestamp to IST

Convert IST to UTC

Display current time in multiple time zones

Compare timestamps across time zones

Store timestamps in UTC

Adjust timestamps during DST

Convert event time to local time

Normalize timestamps across regions

Detect timezone mismatch

Validate timezone offsets

⚫ G. Finding Gaps in Dates (86–100)

Find missing dates in a date sequence

Identify gaps between consecutive dates

Find missing business days

Detect gaps in transaction dates

Identify inactive periods

Find longest gap in dates

Identify days with no activity

Generate continuous date series

Compare expected vs actual dates

Detect late-arriving records

Find gaps using window functions

Find gaps without window functions

Identify missing months in data

Identify missing years in data

UNION vs UNION ALL

INTERSECT

EXCEPT / MINUS

🔁 UNION vs UNION ALL (Questions 1–20)

Fetch all employees from current and previous tables (remove duplicates).
select * from employees_current
Union
select * from employees_previous
order by emp_id;
Fetch all employees from current and previous tables (keep duplicates).
select * from employees_current
Union all
select * from employees_previous
order by emp_id;
List all unique departments from both tables.
select department
from employees_current
Union
select department from employees_previous;
List all departments including duplicates.
select department
from employees_current
Union all
select department from employees_previous;
Combine current and previous employees with salary > 50,000.
select * from employees_current
Union
select * from employees_previous
where salary>50000;
Get all employee names (unique) from both tables.
select emp_name from employees_current
Union
select emp_name from employees_previous;
Get employee names with duplicates preserved.
select emp_name from employees_current
Union all
select emp_name from employees_previous;
Count total rows returned by UNION.
select count(*) UnionCount
from ( 
select * from employees_current
Union
select * from employees_previous
)
Count total rows returned by UNION ALL.
select count(*) UnionAllCount
from ( 
select * from employees_current
Union all
select * from employees_previous
)
Identify duplicate records by comparing UNION and UNION ALL counts.

Fetch all IT employees from both tables (no duplicates).
select * from employees_current
Union
select * from employees_previous
where department='IT'
Fetch all IT employees including duplicates.
select * from employees_current
Union all
select * from employees_previous
where department='IT'
Combine employees and contractors (matching column count).
select emp_id,emp_name,department from employees_current
Union
select emp_id,emp_name,department from contractors;

select count(*)
from (select emp_id,emp_name,department from employees_current
Union
select emp_id,emp_name,department from contractors);

Union employee names with contractor names.
select emp_name from employees_current
Union
select emp_name from contractors;

Show UNION result ordered by emp_name.
select emp_name from employees_current
Union
select emp_name from contractors
order by emp_name;

Why does UNION require same column count and data type? (Explain with query)

Find employees appearing more than once using UNION ALL + GROUP BY.
select emp_id,count(*)
from(
select *
from employees_current
union all
select *
from employees_previous
)
group by emp_id
having count(*)>1
group by emp_id
having count(*)>1
Combine employee IDs from both tables.
select emp_id from employees_current
union
select emp_id from contractors;
Fetch salaries from both tables without duplication.
select salary from employees_current
union 
select salary from employees_previous;

Fetch salaries from both tables with duplication.
select salary from employees_current
union all
select salary from employees_previous;
🔄 INTERSECT (Questions 21–35)

Note: INTERSECT is supported in PostgreSQL, Oracle, SQL Server (not MySQL).

Find employees present in both current and previous tables.
select * from employees_current
INTERSECT
select * from employees_previous;
Find common employee names.
select * from employees_current
INTERSECT
select * from employees_previous;
Find common departments.
select department from employees_current
INTERSECT
select department from employees_previous;
Identify employees with same emp_id in both tables.
select emp_name,emp_id from employees_current
INTERSECT
select emp_name,emp_id from employees_previous;
Find employees with same emp_id and salary.
select salary,emp_id from employees_current
INTERSECT
select salary,emp_id from employees_previous;
Get common IT employees.
select * from employees_current
INTERSECT
select * from employees_previous
where department='IT';
Get common HR employees.
select * from employees_current
INTERSECT
select * from employees_previous
where department='HR';-----NULL

Find employees who didn’t change departments.

Find employees common across employees and contractors.
select emp_id,emp_name,department from employees_current
INTERSECT
select emp_id,emp_name,department from contractors;

Find common emp_ids across all three tables.
select emp_id,emp_name,department from employees_current
INTERSECT
select emp_id,emp_name,department from contractors
INTERSECT
select emp_id,emp_name,department from employees_previous;
Find employees common between current and previous with salary > 60,000.

select emp_id,emp_name,department,salary from employees_current
INTERSECT
select emp_id,emp_name,department,salary from employees_previous
where salary>60000;

Find common employees sorted by emp_name.

select emp_id,emp_name,department,salary from employees_current
INTERSECT
select emp_id,emp_name,department,salary from employees_previous
order by emp_name;

Use INTERSECT to validate CDC overlap.

Detect unchanged records using INTERSECT.

select emp_id,emp_name,department,salary from employees_current
INTERSECT
select emp_id,emp_name,department,salary from employees_previous;

Compare UNION vs INTERSECT results (logical difference).

➖ EXCEPT / MINUS (Questions 36–50)

EXCEPT → PostgreSQL / SQL Server
MINUS → Oracle

Find employees only in current but not in previous.
select * from employees_current
EXCEPT
select * from employees_previous;
Find employees who left the organization.
select * from employees_previous
EXCEPT
select * from employees_current;
Find new joiners.
select * from employees_previous
EXCEPT
select * from employees_current;
Find employees present in previous but missing in current.
select * from employees_previous
EXCEPT
select * from employees_current;
Find departments no longer present.
select * from employees_current
EXCEPT
select * from employees_previous;
Find employees whose salary changed.

Find IT employees present only in current table.

Find employees not present in contractors.

Find employees removed after migration.

Detect data loss using EXCEPT.
minus query
Validate incremental load using EXCEPT.
new
MINUS
old;
Compare EXCEPT vs LEFT JOIN results.
select * from employees_current c
left join employees_previous p on c.emp_id=p.emp_id;
Find records present in current but missing in previous using MINUS.

Find employees present in contractors but not employees.

Find records unique to each table.
















 

































































