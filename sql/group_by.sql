
use myntra;

 
          select product_name , brand_name , marked_price ,
           discounted_price , revenue , rating_count 
            from products 
            order by revenue desc 
                   limit 10 , 15 ;
                   
		    select count(*) from products;
            select count(distinct brand_name )  from products ;
            
	        select count(distinct brand_name),
             count(brand_name) from products;
            
            select avg (marked_price) from products;    
		  
			# average price of a product nike
             select avg (discounted_price) from products
             where  brand_name = 'nike';
            
            # most expensive brand based on average price of the product of that brand 
            -- step 1
            select * from products where brand_name = 'max' ;
            
           --    step 2
            select discounted_price from products 
            where brand_name = 'max';
            
            -- step 3
            select avg (discounted_price) from products 
            where brand_name = 'max';
            
          select brand_name , avg (discounted_price) as 'avg_discounted_price'
             from products 
               group by brand_name 
            order by avg_discounted_price desc 
            limit 5;
            
         # top 5 brands with max number of product listed    
            select brand_name , count(*) as 'products'
            from products 
            group by brand_name 
	        order by products desc
            limit 5;
            
            # top 5 bestselling products 
            select brand_name , sum(rating_count) as 'orders'from products
            group by brand_name 
           order by orders  desc 
            limit 5;    
            
            #top 5 least expensive brands (average price )
            
            select brand_name , avg(discounted_price) from products 
               group by brand_name
			     order by avg(discounted_price) asc
		              limit 5;
            
            # top 10 most expensive product_categories 
            
            select category , avg (discounted_price) as 'avg_price'  from products 
            group by category
               order by avg_price desc 
               limit 10 ;
            
 # top 10 most bestselling product_category while is sold the most            
       select category , sum(rating_count ) as 'best_sell' from products 
       group by category 
       order by best_sell desc 
       limit 10;
            
            
# top 10 most bestselling product_category while has generated max revenue  
         select category , max(revenue) from products
         group by category 
         order by max(revenue) desc
         limit 10 ;
            
            
            
            
            
            
            
            
            