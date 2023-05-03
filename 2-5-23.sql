create table car(car_no int primary key,car_name varchar(45),car_price int not null,car_quantity int);
insert into car values(112,"tesla",12000,2),
(113,"tata",13000,3),
(114,"audi",14000,3),
(115,"kia",12450,4),
(116,"bmw",13456,2);
select * from car;
insert into car values(117,"baby audi",12003,5);
select count(car_name) ,car_price from car group by car_price;
select count(car_name),car_quantity from car group by car_quantity;
select count(car_name) as count_name,car_quantity from car group by car_quantity;
select count(car_name) ,car_price from car group by car_price having car_price> 12500;
select count(*) as count,car_price count from car group by car_price having car_price> 12500;

-- creation of visit table
create table visit(entry_date date,price int,duration int);
insert into visit values ("2023-5-1",1000,20),("2023-5-2",2000,30),
("2023-5-3",3000,30),("2023-5-4",4000,40),("2023-5-5",5000,20);
select * from visit;
select entry_date,count(*) from visit group by entry_date;

-- EXTRACT METHOD EXAMPLES
-- round function round the decimal points upto 2 decimals
select extract(year from entry_date) as year,
extract(month from entry_date) as month,
round(avg(price),2) from visit group by extract(year from entry_date),extract(month from entry_date);
select extract(year from entry_date) as year,
extract(month from entry_date) as date,
round(avg(price),2) from visit 
group by extract(year from entry_date),extract(month from entry_date)
order by extract(year from entry_date),extract(month from entry_date);
select extract(year from entry_date) as year,
extract(month from entry_date) as month,
round(avg(price),2) from visit 
group by extract(year from entry_date),extract(month from entry_date),
extract(day from entry_date) 
order by extract(year from entry_date),extract(month from entry_date);
select * from visit;
select entry_date,round(avg(price),3) as avg_price from visit group by entry_date having count(*) >0 order by entry_date;
select entry_date,round(avg(price),3) as avg_price from visit group by entry_date having count(*) >= 1 order by entry_date;
select entry_date,round(avg(price),3) as avg_price from visit group by entry_date having count(*) < 1 order by entry_date;
select entry_date,round(avg(price),3) as avg_price from visit group by entry_date having count(*) <= 1 order by entry_date;
select entry_date,round(avg(price),3) as avg_price from visit group by entry_date having count(*) != 1 order by entry_date;
select entry_date,round(avg(price),3) as avg_price from visit group by entry_date having count(*) >=3 order by entry_date;
select entry_date,round(avg(price),3) as avg_price from visit where duration>10 group by entry_date having count(*) >1 order by entry_date;
select entry_date,round(avg(price),3) as avg_price from visit where duration>10 group by entry_date having count(*) > 1;

select * from customer;
select city,count(*) as customer_city from customer group by city;

create table employee(emp_id int primary key,name varchar(34), age int, country varchar(45));
insert into employee values(100,"loki",24,"india"),
(101,"shanthi",38,"america"),
(103,"praneetha",25,"lundon"),
(104,"pooja",34,"uk"),
(105,"seena",54,"india");
select * from employee;
select count(country),country from employee group by country having count(country) >= 1;
select count(country),country from employee group by country having count(country) >= 2;
select country,count(country) from employee group by country having max(age) > 30;

create table manager(id int primary key, name varchar(45),gender varchar(10), salary int);
insert into manager values(101, "loki","female",60000),
(102,"shanthi","female",100000),
(103,"seena","male",80000),
(104,"gayi","female",60000),
(105,"sai","male",45000);
select * from manager;
select name,sum(salary) as total from manager group by name having sum(salary) > 10000 order by name;
select gender,sum(salary) as total from manager group by gender having min(salary) >1000;

delimiter //
create procedure GetManagerInfo()
  begin 
     select * from manager;
  end //
call GetManagerInfo()
select * from manager;
