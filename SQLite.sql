CREATE TABLE appleStore_description_combined AS

SELECT * FROM appleStore_description1

UNION ALL

SELECT * FROM appleStore_description2

UNION ALL

SELECT * FROM appleStore_description3

UNION ALL

SELECT * FROM appleStore_description4

**EXPLORATORY DATA ANLYSIS**

-- check the number of unique apps in both tablesAppleStore --

SELECT COUNT(Distinct id) AS UniqueAPPIds
FROM AppleStore

SELECT COUNT(Distinct id) AS UniqueAPPIds
FROM appleStore_description_combined

--Check for any missing values in key fields

SELECT COUNT(*) AS MissingValues
FROM AppleStore
WHERE track_name IS null OR User_rating is null or prime_genre is null

SELECT COUNT(*) AS MissingValues
FROM appleStore_description_combined
WHERE app_desc is null 

--Find out number of apps per genre 

SELECT prime_genre, COUNT(*) AS NumApps
FROM AppleStore
GROUP by prime_genre
order by NumApps DESC

-- Overivew of apps' ratings

SELECT 	min(user_rating) AS MinRating,
	    max(user_rating) AS MaxRating,
        avg(user_rating) as AvgRating
FROM AppleStore        


**DATA ANALYSIS**

--Determine whether paid apps have higher ratings than free apps

Select case
			when price > 0 then 'Paid'
            else 'Free'
            end as App_Type,
            avg(user_rating) as Avg_Rating
from AppleStore
group by App_Type
   
   
--Vheck if apps with more supported languages have higher ratings

select case 
			when lang_num < 10 then '<10 languages'
            when lang_num between 10 and 10 then '10-30 languages'
            else '>30 languages'
         end as language_bucket,
         avg(user_rating) as Avg_Rating
from AppleStore
group by language_bucket
order by Avg_Rating Desc

--Check genres with low ratings

select prime_genre,
	avg(user_rating) as Avg_Rating
from AppleStore
group by prime_genre
order by Avg_Rating ASC
limit 10

--Check if there is correlation between the lenght of the app description and user rating

SELECt case
			when length(b.app_desc) <500 THEN 'Short'
        	when length(b.app_desc) Between 500 and 1000 then 'Medium'
        	else 'Long'
      End as description_length_bucket,
      avg(a.user_rating) as average_rating
        
FROM 
	 AppleStore as A
join
	 appleStore_description_combined as b
on    
     a.id = b.id
    
Group BY description_length_bucket
order by average_rating desc 

--Check top-rated apps for each genre

Select 
	prime_genre,
    track_name,
    user_rating
From (
  	select
    prime_genre,
    track_name,
    user_rating,
    RANK() OVER(PARTITION by prime_genre order by user_rating desc, rating_count_tot desc) as rank
    from
    AppleStore
 )  as a
 where
 a.rank = 1
   