use swiggy ;

select * from restaurants where name like '%pizza%' ;

select * from restaurants where name like '_s%' ;

create view pizza_view  as 
(
      select * from restaurants where name like '%pizza%'
);
select * from pizza_view ;

create view chinese_view as
(
select * from restaurants where name like'%chinese%' 
);

select count(*) from chinese_view ;

drop view if exists rest;

create view rest as 
	(select name, city, rating, rating_count as 'orders', 
		cuisine, cost, rating_count * cost as 'revenue' from restaurants);

select * from rest;


-- 2. Create a view for end_user

drop view if exists user_view;

create view user_view as 
	(select name, city, rating, rating_count as 'orders', cuisine, cost 
		from restaurants);
        
select * from user_view;

-- 3. Create a view of sweet dishes

select distinct cuisine from restaurants;

drop view if exists rest_of_sweets;
create view rest_of_sweets as ( select * from restaurants 
								where cuisine in ('Sweets','Desserts','Ice Cream','Waffle','Ice Cream Cakes'));
select * from rest_of_sweets;

-- 4. Create a view of top 100 restaurants
drop view if exists rest_top_100;
create view rest_top_100 as ( select * from restaurants order by rating_count desc limit 100);
select * from rest_top_100;

-- 5. Create a view of restaurant atleast 100 people visited
drop view if exists rest_atleast_100;
create view rest_atleast_100 as ( select * from restaurants where rating_count >= 100);
select * from rest_atleast_100;

-- 6. Create a view of top 1000 most expensive restaurants
drop view if exists rest_expensive_100;
create view rest_expensive_100 as ( select * from restaurants order by cost desc limit 100);
select * from rest_expensive_100;

create table clean_data as
(
select id , name , trim(lower(city)) , rating , rating_count , cuisine , cost 
from restaurants 
where rating_count >=10 );


-- cte (common table expression )
# top 20% rests (reven)
select round(count(*)/20 , 0 ) as 'top_20' from restaurants ;
 with 
 q1 as
(
select sum(rating_count*cost) as 'revenue' from restaurants
),  -- 705967130

 q2 as
 (
select sum(cost*rating_count) from (
 select * ,  rating_count*cost as 'top_20_revenue' from restaurants
 order by  top_20_revenue desc 
    limit 312 )as t1 
    )-- 244198000

select revenue , top_20_revenue , (top_20_revenue / revenue )*100  from q1,q2 ;





