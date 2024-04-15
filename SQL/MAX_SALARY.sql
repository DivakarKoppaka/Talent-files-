create database new;
use new;
create table employee(
id int,
name varchar(20),
amount int,
date date);
insert into employee (id,name,amount,date) values
(101,"wipro",2000,'2023-01-01'),
(102,"hcl",3000,'2023-01-02'),
(101,"wipro",2000,'2023-02-15'),
(102,"hcl",1500,'2023-02-15');

select * from employee;

select id,name,amount,date from employee
where (month(date),amount) in 
(select month(date) as dt,max(amount) as amnt from employee
group by month(date));

