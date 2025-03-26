INSERT into movies (title, release_year, genre, rating) values
('Interstellar', 2014, 'Sci-Fi', 8),
('Inception', 2010, 'Sci-Fi', 8),
('The Godfather', 1972, 'Crime', 9),
('Titanic', 1997, 'Romance', 7);

insert into subscriptions (subscription_type, price) values
('Gold',12.99),
('Silver',10.99),
('Bronze',7.99);

insert into users (name, subscription_id) values
('Lewis Hamilton',1),
('Max Verstappen',2),
('Lando Norris',3),
('George Russell',1);

insert into watch_history (date, duration, movie_id,user_id) values
('2024-02-18', 40.00,2,2),
('2022-02-10', 58.25,2,3),
('2021-02-10', 108.50,3,4),
('2022-02-10', 58.25,3,2),
('2022-02-10', 58.25,4,3);

