create database assignment;
use assignment;
create table salespeople(snum int primary key, sname varchar(255) unique, city varchar(255), comm double);
insert into salespeople values (1001, 'Peel', 'London', 0.12) ,(1002,'Serres', 'Sanjose',0.13);
insert into salespeople values (1004, 'Motika', 'London', 0.11);
INSERT into salespeople values (1007, 'Rifkin', 'Barcelona', 0.15) ,(1003,'Axelrod','Newyork',0.10);
select * from salespeople;

CREATE TABLE customers (cnum int primary key ,cname varchar(255), city varchar(255) not null, snum int,
    FOREIGN KEY (snum) REFERENCES salespeople(snum));
insert into customers values (2001,'Hoffman',' London',1001),(2002,'Giovanni' ,'Rome', 1003);
insert into customers values(2003,'Liu','Sanjose' ,1002),(2004 , 'Grass' ,'Berlin' ,1002);
insert into customers values (2006, 'Clemens' ,'London' ,1001),(2008, 'Cisneros' ,'Sanjose' ,1007);
insert into customers values (2007,'Pereira','Rome', 1004);
select * from customers;

CREATE TABLE orders (onum int primary key ,amt double, odate date , cnum int, snum int,
    FOREIGN KEY (snum) REFERENCES salespeople(snum),FOREIGN KEY (cnum) REFERENCES customers(cnum));
insert into orders values (3001, 18.69, '1990-10-3' ,2008 ,1007);
insert into orders values(3003, 767.19, '1990-10-3', 2001 ,1001),(3002, 1900.10 ,'1990-10-3' ,2007, 1004);
insert into orders values(3005 , 5160.45,'1990-10-3', 2003 ,1002),(3006  ,1098.16, '1990-10-3', 2008 ,1007);
insert into orders values(3009 ,1713.23, '1990-10-4', 2002, 1003),(3007,  75.75, '1990-10-4', 2004 ,1002);
insert into orders values(3008,  4273.00, '1990-10-5', 2006 ,1001),(3010 , 1309.95, '1990-10-6',2004, 1002);
insert into orders values(3011 , 9891.88, '1990-10-6', 2006, 1001);
select * from orders;

-- Q1 Count the number of Salesperson whose name begin with ‘a’/’A’.
select count(*) as count from salespeople where (sname like '%A' or sname like '%a');


-- Q2 Display all the Salesperson whose all orders worth is more than Rs. 2000.
select orders.snum from orders where orders.amt>2000;

-- Q3 Count the number of Salesperson belonging to Newyork.
select count(*) as count from salespeople where city='Newyork';


-- Q4 Display the number of Salespeople belonging to London and belonging to Paris.
select salespeople.snum  from salespeople where city='London' or city ='Paris';


-- Q5 Display the number of orders taken by each Salesperson and their date of orders.
select orders.odate, salespeople.sname, count(*) as count from salespeople inner join orders on salespeople.snum=orders.snum group by salespeople.sname;

