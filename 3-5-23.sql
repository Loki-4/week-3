select * from manager;
-- FINDIMG THE 1 st LARGEST SALARY FROM MANAGRER TABLE
select name,salary from manager order by salary desc limit 1;
-- FINDIMG THE 2ND LARGEST SALARY FROM MANAGRER TABLE
select name,salary from manager order by salary desc limit 1,1;
-- FINDIMG THE 3rd LARGEST SALARY FROM MANAGRER TABLE
select name,salary from manager order by salary desc limit 2,1;
-- FINDIMG THE 4 th LARGEST SALARY FROM MANAGRER TABLE
select name,salary from manager order by salary desc limit 3,1;

create table table1(id int,date date,customer_id int);
create table table2(cus_id int,cus_name varchar(45),contact_name varchar(45),country varchar(34));
insert into table1 values(110,"2023-5-1",200),(111,"2023-5-2",201),(112,"2023-5-3",202),
(113,"2023-5-4",203),(114,"2023-5-5",204),(115,"2023-5-6",205);
insert into table2 values(200,"loki","loki1","india"),
(201,"shanthi","shanthi1","india"),
(202,"thrisha","thrisha1","uk"),
(203,"seena","seena1","america"),
(204,"sangeetha","sangeetha1","uk"),
(205,"gayi","gayi1","africa");

-- JOIN
select table1.id,table2.cus_name,table1.date 
from table1 inner join table2 
on table1.customer_id=table2.cus_id;

create table staff(id int ,name varchar(45),age int,package int);
create table payment(id int,date date,staff_id int,amount int);
insert into staff values(100,"loki",29,15000),(101,"seena",45,18000),
(102,"shanthi",34,23000),(103,"sai",23,45000),(104,"gayi",24,98000);
insert into payment values(300,"2023-5-2",100,10000),
(301,"2023-5-3",101,34000),
(302,"2023-5-4",102,78000),
(304,"2023-5-5",103,45000),
(305,"2023-5-6",104,43980);
select s.id,s.name,s.age,p.amount from staff s,payment p where s.id=p.staff_id;
alter table table1 add shipping_id int;
-- alter table table1 drop columns shipping_id;
update table1 set shipping_id=1234 where id=110;
update table1 set shipping_id=1235 where id=111;
update table1 set shipping_id=1236 where id=112;
update table1 set shipping_id=1235 where id=113;
update table1 set shipping_id=1237 where id=114;
update table1 set shipping_id=1238 where id=115;

create table shipping(
id int,name varchar(34));
insert into shipping values (1234,"a"),(1235,"b"),
(1236,"c"),(1237,"d"),(1238,"e");
-- JOINING TABLES TABLE1,TABLE2 AND SHIPPING
select table1.id,table2.cus_name,shipping.name from
((table1 inner join table2 on table1.customer_id=table2.cus_id)
 inner join shipping on table1.shipping_id=shipping.id);
 -- LEFT JOIN OF TABLE1 AND TABLE2
select table2.cus_name,table1.id from table2
left join table1 on table2.cus_id=table1.customer_id;
-- RIGHT JOIN OF TABLE1 AND TABLE2
select table2.cus_name,table1.date from table2
right join table1 on table2.cus_id=table1.customer_id;
select table2.cus_name,table1.date from table2
right join table1 on table2.cus_id=table1.customer_id order by table2.cus_name;