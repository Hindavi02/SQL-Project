-- SQL PROJECT  

#-----------------------------------------------------DDl-----------------------------------------------------
/* create database project*/
create database project;

use project;

# create table student
 
create table student(
id int primary key auto_increment,
last_name varchar(50),
age int check (age>=18),
city varchar(20),
phone int(10),
email varchar(50) default 'abc@gmail.com');

desc student;

create table employee(
id int primary key auto_increment,
name varchar(50),
age int not null check (age>=25),
department varchar(50),
salary int default 0,
city varchar(50) not null,
contact varchar(20) not null);

desc employee;

/* add column first_name after id in the student table */
alter table student
add first_name varchar(50) after id;

desc student;

/* change the column name first_name to student_name in the customers table */
alter table student
rename column first_name to student_name;

desc student;

/* change the column name cust_name to first_name in the customers table */
alter table student
change student_name first_name varchar(50);

desc student;

/* Add column Sr no. at first in student table */
alter table student
add Sr_No int(10) first;

desc student;

/* modify the data type of first_name column to varchar(300) */
alter table student
modify column first_name varchar(300);

desc student;

/* drop column Sr_No from student table */
alter table student
drop column Sr_No;

desc student;

#------------------------------------------------DML-------------------------------------------------------------

/* Insert a records in the table */
insert into student(first_name,last_name,age,city,phone)
values('Yadnesh','Devrukhkar',28,'Mumbai',35453),
('Laukik','Mankame',25,'Thane',3545),
('Siddhi','Dabadee',25,'Thane',54564),
('Tanishkaa','Thakur',28,'Mumbai',7634564),
('Prerana','Bhosale',29,'Thane',4545),
('Yash','Jadhav',26,'Dombivili',545152);

# insert values in the table 
insert into employee(name,age,department,salary,city,contact)
values('Yadnesh',28,'IT',85000,'Mumbai',35453),
('Laukik',25,'HR',89000,'Thane',3545), 
('Siddhi',25,'HR',55000,'Pune',54564),
('Tanishkaa',28,'IT',65000,'Mumbai',7634564),
('Prerana',29,'IT',75000,'Thane',4545),
('Yash','26','HR',60000,'Dombivili',545152);

#update the name of city where the name is Laukik
update student
set city= 'Mumbai';

#update the surame where the name is Siddhi and city is chennai
update student
set last_name='Dabade'
where id=3;

#update the surname as Chavan and city as Pune where the name is Siddhi
update student
set last_name='Chavan',city='Pune'
where id=3;

#---------------------------------------------Where Clause------------------------------------------------------

#display all the records of all the columns of employees working in IT department
select * 
from employee
where department='IT';

#display all the records of all the columns of employees working excluding IT department
select * 
from employee
where department!='IT';

#display all the records of all the columns of employees whose salary is greater than 80000
select * 
from employee
where salary > 80000; 

#display all the records of all the columns of employees whose salary is lesser than 80000
select *
from employee
where salary < 80000;

#display all the records of all the columns of employees whose salary is either or above 80000
select * 
from employee
where salary >= 80000;

#display all the records of all the columns of employees whose salary is either or below 80000
select * 
from employee
where salary <= 80000; 

#display all the records of all the columns of employees working in IT department whose salary is above 80000
select *
from employee
where department='IT' and salary > 80000;

#display all the records of all the columns of employees working in IT department whose salary is below 80000
select *
from employee
where department='IT' and salary < 80000; 

#display all the records of all the columns of employees living in mumbai or thane
select *
from employee
where city='mumbai' or city='thane'; 

#display all the records of all the columns of employees not living in mumbai or pune
select * 
from employee
where not (city='mumbai' or city='pune'); 

#display all the records of all the columns of employees living in excluding Mumbai
select *
from employee
where not city='mumbai';

#display all the records of all the columns of employees whose salary lies within 55000 to 85000.
select *
from employee
where salary between 55000 and 85000;

#display all the records of all the columns of employees whose salary not lies within 55000 to 85000.
select *
from employee
where salary not between 55000 and 85000;

#display all the unique departments from the emp table
select department from employee; -- department columns 

# display all the records of all the columns of employees living in mumbai or thane
select * 
from employee
where city in ('mumbai','thane');

#display all the records of all the columns of employees not living in mumbai or thane
select * 
from employee
where city not in ('mumbai','thane'); 

#------------------------------------------Order by/distinct/Limit----------------------------------------------

/* Display all the records from 3 to 5*/
select * 
from employee 
limit 2,3;

select * 
from employee
where id>=2 and id<=5;

# display all the records of all the columns from emp table in increasing order of salary
select * 
from employee
order by salary; 

select *
from employee
order by salary asc;

# display all the records of all the columns from emp table in decreasing order of salary
select *
from employee
order by salary desc; 

/* Display the person who is earning the highest salary */
select *
from employee
order by salary desc limit 1;

/* Display the person who is earning the second highest salary */
select * 
from employee
order by salary desc limit 1,1; 

#display all the unique cities from the employee table
select distinct city from employee; 

#-----------------------------------------Built in Functions---------------------------------------------------

select * from employee;

select * from employee where name like 'H%'; -- starting from H
select * from employee where name like '%h'; -- ending with H
select * from employee where name like '_a%'; -- second alphabet is A 
select * from employee where name like '%a%'; -- A is anywhere 
select * from employee where name like '_i_d%'; -- second alphabet is I and fourth alphabet is D

# display the name and city of an employee in a single column 
select concat(name,city)
from employee;

select concat(name,'   ',city)
from employee;

select concat(name,'   ',city) as name_city
from employee;

#display name and department in a single column of Mumbai location only
select concat(name,'  ',department)
from employee
where city='Mumbai';

#display name in lowercase
select lower(name) AS lowercase_name
from employee;

# display name in lowercase as age,department,salary from emp table
select lower(age),department,salary
from employee;

# display name in uppercase,age,department,salary from emp table
select upper(name),age,department,salary
from employee;

# display city and length of the city from employee table
select city, length(city)
from employee;

#Date difference

select datediff('2023-09-02','2002-10-02');
select datediff(curdate(),'2002-10-02');
select datediff(date(now()),'2002-10-02');

select count(name) from employee;
select count(name) as no_of_employee from employee;

# Calculate the total salary
select sum(salary) from employee;
select sum(salary) as total_salary from employee;

#Calculate the minimum salary
select min(salary) from employee;
select min(salary) as min_salary from employee;

#Calculate the maximum salary
select max(salary) from employee;
select max(salary) as max_salary from employee;

#Calculate the average salary
select avg(salary) from employee;
select avg(salary) as avg_salary from employee;

#-------------------------------------------Group by with having------------------------------------------------

select city,count(name) from employee group by city;

#display departmentwise count of employees
select department,count(name) from employee group by department;

#department wise count of employees group by age
select department,age,count(name) from employee group by department,age;

#display citywise min,max,average salary
select city,min(salary),max(salary),avg(salary)
from employee
group by city;

#display cities whose min salary is atleast 60000
select city , min(salary) from employee group by city;-- group by

select city, min(salary) from employee group by city where min(salary) >=60000;

select city, min(salary) from employee group by city having min(salary) >=60000;

#display cities whose max salary is atleast 80000
select city, max(salary) 
from employee
group by city having max(salary) >= 80000;

#display agess whose max salary is atleast 80000
select age, max(salary) 
from employee 
group by age having max(salary) >= 80000;

#------------------------------------------------Subquery-------------------------------------------------------

#display all the records who is earning same salary as yadnesh (don't know the yadnesh's salary so write a subquery)
select * from employee;-- all records

select salary from employee where name='yadnesh';

select * from employee where salary = 85000;

select * from employee where salary = (select salary from employee where name='yadnesh'); -- actual answer

#display all the records of employees who is earning highest salary (don't know the max salary so write a subquery)

select max(salary) from employee;-- max salary

select * from employee
where salary = (select max(salary) from employee);

#display all the records of employees who is earning second highest salary (don't know the salary so write a subquery)
select * from employee;-- all records

select max(salary) from employee;-- first max

select max(salary) from employee
where salary != (select max(salary) from employee);-- second max

select * from employee
where salary = (select max(salary) from employee
where salary != (select max(salary) from employee));-- actual answer with a subquery

#display all the records of employees whos salary is greater than employees lives in thane
select * from employee;
select salary from employee where city='thane';-- salary of employee lives in thane
select * from employee where salary > (select salary from employee where city='thane');

#display all the records of employees whos salary is greater than employees lives in pune
select salary from employee where city='pune';
select * from employee where salary > (select salary from employee where city='pune');
select * from employee where salary > any(select salary from employee where city='pune');
select * from employee where salary > all(select salary from employee where city='pune');

#--------------------------------------------------Joins---------------------------------------------------------

# creating a table 
create table player(
player_id int primary key,
name varchar(50) not null,
age int not null,
city varchar(50),
leader_id int);

desc player;

-- inserting values a table 
insert into player(player_id,name,age,city,leader_id)
values(101,'Mandar',26,'Pune',105),
(102,'Sakshi',27,'Delhi',105),
(103,'Shivani',28,'Mumbai',106),
(104,'Shubham',26,'Pune',106),
(105,'Yashshree',26,'Delhi',Null),
(106,'Jayshree',25,'Chennai',Null);

select * from player;

-- create another table 
create table game(
id int primary key auto_increment,
name varchar(50),
pid int not null);

desc player;

-- inserting values in a table 
insert into game(name,pid)
values('cricket',101),
('football',102),
('cricket',102),
('chess',101),
('hockey',103),
('cricket',205);

select * from game;

--  List all player name and their corresponding games
select player.name as player_name, game.name as game_name
from player
join game
on player.player_id = game.pid;

select player.name as player_name, game.name as game_name
from player
inner join game
on player.player_id = game.pid;

-- Left join 
select player.name as player_name, game.name as game_name
from player
left join game 
on player.player_id = game.pid;

# Right join 
select player.name as player_name, game.name as game_name
from player
right join game 
on player.player_id = game.pid;

# Outer join 
select player.name as player_name, game.name as game_name
from player
left join game 
on player.player_id = game.pid
union all 
select player.name as player_name, game.name as game_name
from player
right join game 
on player.player_id = game.pid; 

select player.name as player_name, game.name as game_name
from player
left join game 
on player.player_id = game.pid
union
select player.name as player_name, game.name as game_name
from player
right join game 
on player.player_id = game.pid; 

# self join 
select * from player;

select p1.name as leader,p2.name as player
from player as p1 join player as p2
on p1.player_id = p2.leader_id;

#------------------------------------------------The End-------------------------------------------------------