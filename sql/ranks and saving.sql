select * from  swiggy.restaurants ;
 # how many restaurants are there listed on swiggy ?
 select count(*) from swiggy.restaurants ;    -- 6238
select count(distinct id )from swiggy.restaurants ;   -- 6238

select city , count(*) from swiggy.restaurants 
     group by city order by count(*) desc ;
	
select id , count(*) from swiggy.restaurants 
group by  id order by count(*) desc ;

# top 5 most expensive restaurants ?
 select * from swiggy.restaurants 
  order by cost desc
    limit 5;

 select * from swiggy.restaurants 
   where city =' Banglore'
  order by cost desc
    limit 5;
    
    
  select city, count(*) from swiggy.restaurants 
    group by city 
         order by count(*) desc ;
         
         
select city, cuisine , count(*) from swiggy.restaurants 
    group by city,cuisine
         order by count(*) desc ;
         
 # no of cities where no of estaurants is more than 1000       
select city, count(*) from swiggy.restaurants 
    group by city having count(*) > 500
         order by count(*) desc ;    
       #  cities vg cost more than 350
       
select city, avg (cost)from swiggy.restaurants 
    group by city having avg (cost) > 350
         order by count(*) desc ; 
       
# top 5 restaurants of every city based on rating count   
     
select *, dense_rank () over ( order by rating_count desc ) from swiggy.restaurants ;
   select *, row_number () over ( order by rating_count desc ) from swiggy.restaurants ; 
   
select * from
   (
     select *, 
     row_number () over ( partition by city order by rating_count desc ) as 'ranking' from swiggy.restaurants
     ) t1
          where ranking<=5 ;
    
  #  top 5 cities which generated maximum revenue 
  create table top_5_cum_revenue as
  (
  select city ,sum(rating_count*cost) as 'revenue' from  
     (
     select *, 
     row_number () over ( partition by city order by rating_count desc ) as 'ranking' from swiggy.restaurants
     ) t1
          where ranking<=5 
          group by city 
          order by revenue desc 
          limit 5 
          );
  
  -- create a temp table storing only the restro of banglore cinese
  create temporary table if not exists abc as 
  (
  select * from swiggy.restaurants 
where city ='Bangalore'
  and cuisine = 'chinese'
  );
  
  
  
    
       
       