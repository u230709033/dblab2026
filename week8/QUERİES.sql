# 1. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.

SELECT m.title, m.votes, m.year
FROM movies m
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON md.director_id = d.director_id
WHERE m.votes > 500000
  AND m.year < 2000
  AND d.director_name LIKE '%Quentin Tarantino%';

# 2. Show the films that Tom Hanks has act and have won more than 3 Oscars.
SELECT title,oscars
from movies m 
JOIN movie_stars ms 
ON ms.movie_id=m.movie_id
JOIN stars s 
ON ms.star_id=s.star_id
WHERE s.star_name="TOM HANKS" and oscars > 3;

# 3. Show the history films produced in USA and whose duration is between 100-200 minutes.
 
SELECT m.title, g.genre_name, c.country_name, duration
FROM movies m 	
JOIN genres g 
ON g.movie_id=m.movie_id
JOIN producer_countries pc
ON m.movie_id=pc.movie_id
JOIN countries c 
ON c.country_id=pc.country_id
WHERE g.genre_name="history" AND duration between 100 and 200 ;


# 4.Compute the average budget of the films directed by Peter Jackson.

SELECT AVG(m.budget) AS average_budget
FROM movies m
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON md.director_id = d.director_id
WHERE d.director_name = 'Peter Jackson';



# 5.Show the Francis Ford Coppola film that has the maximum budget.

SELECT m.title, m.budget
FROM movies m
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON md.director_id = d.director_id
WHERE d.director_name = 'Francis Ford Coppola'
ORDER BY m.budget DESC
LIMIT 1;

# 6.Show the film that has the most vote and has been produced in USA.



SELECT m.title, m.votes, pc.country
FROM movies m
JOIN producer_countries pc
ON pc.movie_id = m.movie_id
WHERE pc.country = 'USA'
AND m.votes = (
    SELECT MAX(m2.votes)
    FROM movies m2
    JOIN producer_countries pc2
    ON pc2.movie_id = m2.movie_id
    WHERE pc2.country = 'USA'
);




# 7. List all stars who have acted in more than 1 films


SELECT s.star_name, COUNT(DISTINCT ms.movie_id) AS film_count
FROM stars s
JOIN movie_stars ms ON s.star_id = ms.star_id
GROUP BY s.star_id, s.star_name
HAVING COUNT(DISTINCT ms.movie_id) > 1
ORDER BY film_count DESC;

