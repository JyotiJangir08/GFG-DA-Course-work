--drop database if exists gfg_da;

create database gfg_da;

create table gfg_da.da (
user_id int not null,
 username  VARCHAR(250) not null unique,
email varchar(300) not null unique,
age int,
city varchar(250));


insert into gfg_da.da (user_id , username ,email ,age ,city)
values ( 1 , 'user1', 'user1@gmail.com' ,30 , 'city1'),
	  ( 2  , 'user2', 'user2@gmail.com' ,25 , 'city2'),
       ( 3 , 'user3', 'user3@gmail.com' ,23, 'city3'),
       ( 4 , 'user4', 'user4@gmail.com' ,25, 'city4');
       
       select * from gfg_da.da;
       
       
       
       
