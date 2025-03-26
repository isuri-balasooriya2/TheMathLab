/*most watched in terms of duration*/
SELECT movie_id, SUM(duration)
FROM watch_history
GROUP BY movie_id
ORDER BY SUM(duration) DESC
LIMIT 1;

/* most watched movies*/
SELECT m.title, count(w.watchhistory_id) as Total
FROM watch_history w
JOIN movies m ON m.movie_id=w.movie_id
GROUP BY m.title
ORDER BY Total DESC
LIMIT 1;

/* average rating by genre*/
SELECT genre, AVG(rating) AS avg_rating
FROM movies
GROUP BY genre;

/*Users who watched more than one movie*/
SELECT u.name, COUNT(w.watchhistory_id) AS num_movies
FROM watch_history w
JOIN users u ON u.user_id=w.user_id
GROUP BY u.name
HAVING num_movies>1;

/*rank movies based on popularity*/
SELECT title,
RANK() OVER (order by SUM(rating) DESC) AS rankk
from movies
group by title;

