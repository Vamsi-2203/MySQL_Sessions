# Session 1
/*
1. SQL Create Databases
	- show the databases
2. SQL Drop Databases
3. SQL Create Table
	- Show the table
4. SQL insert into table
	- single values
    - Multiple values
5. Retrive the data from the tables
6. SQL Drop Table
*/

show databases;
use persons;


create table person_info(
id integer,
first_name varchar(250),
Last_name varchar(250));

show tables;

select * from person_info;

# inserting the multiple values into tables
insert into person_info(id,first_name,last_name)
values
(1,'vamsi','reddy'),
(2, 'Sam' , 'reddy'),
(3, 'Vijay', 'Kumar');

select * from person_info;

drop table person_info;

show tables;




