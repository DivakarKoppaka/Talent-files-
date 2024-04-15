create database bhanu;
use bhanu;

create table distribution_companies(
id int,
company_name varchar(30),
primary key (id)
);
insert into distribution_companies (id,company_name) values 
(1,"Columbia Pictures"),
(2,	"Paramount Pictures"),
(3,	"Warner Bros. Pictures"),
(4,	"United Artists"),
(5,	"Universal Pictures"),
(6,"New_Line Cinema"),
(7,	"Miramax Films"),
(8,	"Produzioni Europee Associate"),
(9,	"Buena Vista"),
(10,"StudioCanal");

select * from distribution_companies;

create table movies(
              id int primary key auto_increment,
              movie_title varchar(70),
              imdb_rating decimal(2,1),
              year_released int,
              budget Double,
              box_office double,
              distribution_company_id int,
              language varchar(50)
);




insert into movies(movie_title,
              imdb_rating,
              year_released ,
      budget ,
      box_office ,
      distribution_company_id,
      language)
values
              ("The Shawshank Redemption",9.2,1994,25.00,73.30,1,"English"),
              ("The Godfather",9.2,1972,7.20,291.00,2,"English"),
              ("The Dark Knight",9.0,2008,185.00,1006.00,3,"English"),
              ("The Godfather Part II",9.0,1974,13.00,93.00,2,"English,Sicilian"),
              ("12 Angry Men",9.0,1957,0.34,2.00,4,"English"),
              ("Schindler's List",8.9,1993,22.00,322.20,5,"English, German,Yiddish"),
              ("The Lord of the Rings:The Return of the King",8.9,2003,94.00,1146.00,6,"English"),
              ("Pulp Fiction",8.8,1994,8.50,213.90,7,"English"),
              ("The Lord of the Rings:The Fellowship of the Ring",8.8,2001,93.00,898.20,6,"English"),
              ("The Good, the Bad and the Ugly",8.8,1966,1.20,38.90,8,"English, Italian, Spanish");
    
    select * from movies;
    
    select movie_title,imdb_rating,year_released from movies;
    select movie_title,box_office from movies where box_office > 300;


-- Task 4:-  Select the columns movie_title, imdb_rating, and year_released from the table movies. 
--           Show movies that have the word ‘Godfather’ in the title.
select movie_title,imdb_rating,year_released from movies
where movie_title like '%Godfather%';


-- Task 5:- Select the columns movie_title, imdb_rating, and year_released from the table movies. 
--          Show movies that were released before 2001 and had a rating above 9.
select movie_title,imdb_rating,year_released from movies
where year_released < 2001 and imdb_rating >= 9 ;


-- Task 6:- Select the columns movie_title, imdb_rating, and year_released from the table movies. Show movies released after 1991.
-- 		Sort the output by the year released in ascending order.
select movie_title,imdb_rating,year_released from movies
where year_released < 1991
order by year_released;


-- Task 7:- Show the count of movies per each language category.
select language,count(movie_title) from movies
group by language;

-- Task 8:- Show the count of movies by year released and language.
--         Sort results by the release date in ascending order.
select language,year_released,count(movie_title) from movies
group by year_released, language
order by year_released;

-- Task 9:- Show the languages spoken and the average movie budget by language category. 
--          Show only the languages with an average budget above $50 million.
select language,avg(budget) as c from movies
group by language
having c >= 50;

-- Task 10: Show movie titles from the table movies, each with the name of its distribution company. 
select m.distribution_company_id,m.movie_title,d.company_name from movies as m
join distribution_companies as d on m.distribution_company_id=d.id;