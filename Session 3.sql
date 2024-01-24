# Session 3
/*
What is SQL Contraints?
- SQL constraints are used to specify rules for the data in a table.
- Constraints are used to limit the type of data that can go into a table.

1) Not Null - A column cannot have a NULL value
2) Unique - All values in a column are different
3) Primary Key - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
4) Foreign Key - Prevents actions that would destroy links between tables
5) Default - Sets a default value for a column if no value is specified
6) Check - the values in a column satisfies a specific condition
7) Index - Used to create and retrieve data from the database very quickly

*/

create database person;
show databases;
use person;

#create a not null Constraint 
create table person_info(
id int not null,
First_name varchar(35) not null,
Last_name varchar(35) not null,
age int 
);

select * from person_info;

# to view the schema 
desc person_info;

#use the modify method to do changes in table
alter table person_info modify age int not null;

# unique contraist 
use person;
create table student(
id int not null,
first_name varchar(34),
last_name varchar(23),
age int not null,
unique(id)
);

#insert the values
insert into student values(1,'vamsi','reddy',24);
#repeating the same id 
insert into student values(1,'vamsi1','reddy1',24);
select * from student;

#make a unique for another column
alter table student add unique (first_name);

#adding two feature as unique
alter table student
add  constraint uqi_student unique(age,first_name);

desc student;

#can we drop the constraint 

alter table student
drop index uqi_student;

## primary key constraint

create table student2(
id int not null,
fname varchar(25) not null,
lname varchar(25),
age int,
primary key(id)
);

desc student2;

#drop the primary key
alter table student2 drop primary key;

# Foreign Key - it is used to link 2 tables together and it sometime knows as referenc key

create table student3(
id int not null,
first_name varchar(34) not null,
last_name varchar(23) not null,
age int not null,
salary int,
primary key(id)
);

desc student3;

#creating another table

create table department(
id int not null,
department_id int not null,
department_name varchar(35),
primary key(department_id),
constraint fk_studentdepart foreign key(id) references student3(id)
);
desc department;

# check constraints
# it is used 

create table student4(
id int not null,
first_name varchar(34) not null,
last_name varchar(23) not null,
age int not null,
salary int,
primary key(id),
check(salary<50000)
);

desc student4;

 insert into student4 values(1,'Vamsi','Reddy',23,30000);

select * from student4;

## Default Constraint
create table student5(
id int not null,
first_name varchar(34) not null,
last_name varchar(23) not null,
location varchar(34) default 'Hyderabad'
);

desc student5;










