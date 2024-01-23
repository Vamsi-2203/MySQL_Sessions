# Session 2
/* 
SQL Null Values
SQL update Statement
SQL Delete Statement
SQL ALter TAble
---- Add Column in Existing Column
---- Alter Table - Drop Column

*/

#create Database
Create database customer;

use customer;
# create customer_info Table
create table customer_info(
id integer auto_increment,
first_name varchar(25),
last_name varchar(25),
salary integer,
primary key(id)
);

show tables;
select * from customer_info;
#insert records into tables
insert into customer_info(first_name,last_name,salary)
values
('Vamsi','Reddy','150000'),
('Siva','Sai','67000'),
('Krishna','Kumar',60000),
('Vicky','Sai',Null);  #it means that value is missing here

#Gettinh the all null values in table
select * from customer_info where salary is null;

#sql update statement it used to Replace the null values

update customer_info set salary=70000 where id=4;
select * from customer_info;

# delete statement - used to delete the data
delete from customer_info where id=4;

select * from customer_info;

# Alter Table main
# Add the column using Alter to existing table

alter table customer_info add phonenumber integer;
select * from customer_info;

alter table customer_info add dob Date;
select * from customer_info;

#to view schema
desc customer_info;

#drop the column  using alter
alter table customer_info drop column dob;
select * from customer_info;














