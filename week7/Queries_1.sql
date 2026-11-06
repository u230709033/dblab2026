# 1. Show the films with a budget greater than $10 million and a ranking lower than 6.
use movie_db;
SELECT title,budget,ranking
from movies
WHERE budget > 10000000 AND ranking <6;

# 2. Show the action films with a rating higher than 8.8, produced after 2009.

select title,rating,year
from movies m
JOIN genres g 
ON m.movie_id=g.movie_id
Where g.genre_name='Action'
AND rating >8.8 AND year >2009;



# 3. Show the drama films with a duration of more than 150 minutes and more than 2 Oscars.
SELECT title,duration,oscars
from movies m
JOIN genres g 
ON m.movie_id=g.movie_id
where g.genre_name='drama' And duration >150 And oscars>2;

# 4. Show the thriller films whose budget is greater than 25 million$.
SELECT title,budget
From movies m
JOIN genres g 
ON m.movie_id=g.movie_id
WHERE g.genre_name='thriller' AND budget >25000000;




# 5. Show the drama films whose language is Italian and produced between 1990-2000.		 
SELECT title,language_name,year
from movies m 
JOIN languages l
ON l.movie_id=m.movie_id
JOIN genres g 
ON g.movie_id=l.movie_id
WHERE language_name='italian' AND g.genre_name='drama' AND year between 1990 and 2000;


# 6. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.	 




SELECT m.title, d.director_name, m.votes, m.year
FROM movies m
JOIN movie_directors md
    ON md.movie_id = md.movie_id
JOIN directors d 
ON d.director_id=md.director_id
WHERE d.director_name = 'Quentin Tarantino'
  AND m.votes > 500000
  AND m.year < 2000;