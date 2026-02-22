create database if not exists netflix;
use netflix;
create table netflix (
show_id varchar(5),
type varchar(10),
title varchar(100),
director varchar(550),
cast varchar(200),
country varchar(200),
date_added varchar(70),
release_year year,
rating varchar(20),
duration varchar(20),
listed_in varchar(200),
description varchar(500)
);
-- 1 What is the count the total number of records in the netflix_data table
select count(*) from netflix;
select * from netflix;
-- 2 What is the count the number of TV shows and movies separately

select type,count(type) as count_of_type
from netflix
group by type;

-- 3 Find the top director with the most content on Netflix
select director,count(director) 
from netflix
group by director;

-- 4 Find the most recently added title
select title, date_added
from netflix
order by date_added desc;


-- 5 What is  the Minimum release year for TV shows and movies.  
select type,release_year
from netflix
order by release_year;

-- 6 Find the top country with the most content on Netflix.
SELECT country, COUNT(*) AS total_content
FROM netflix
GROUP BY country
ORDER BY total_content DESC;


-- 7 Find the longest duration movie.  
 select replace(duration ,'min',' ') as new_duration
 from netflix where type='movie' order by new_duration ;

select title , duration from netflix  where type='movie' order by duration asc;


