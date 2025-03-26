CREATE TABLE `movies`(
    `movie_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `release_year` INT NOT NULL,
    `rating` INT NULL
);
CREATE TABLE `users`(
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `subscription_id` INT UNSIGNED NOT NULL
);
CREATE TABLE `watch_history`(
    `watchhistory_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` DATE NOT NULL,
    `duration` FLOAT(53) NOT NULL,
    `movie_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NOT NULL
);
CREATE TABLE `subscriptions`(
    `subscription_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `subscription_type` VARCHAR(255) NOT NULL,
    `price` FLOAT(53) NOT NULL
);
ALTER TABLE
    `users` ADD CONSTRAINT `users_subscription_id_foreign` FOREIGN KEY(`subscription_id`) REFERENCES `subscriptions`(`subscription_id`);
ALTER TABLE
    `watch_history` ADD CONSTRAINT `watch_history_movie_id_foreign` FOREIGN KEY(`movie_id`) REFERENCES `movies`(`movie_id`);
ALTER TABLE
    `watch_history` ADD CONSTRAINT `watch_history_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`);