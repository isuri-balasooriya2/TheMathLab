CREATE TABLE `Users`(
    `UserID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `Password` VARCHAR(255) NOT NULL,
    `Country` VARCHAR(255) NOT NULL,
    `SubscriptionID` BIGINT NOT NULL,
    `CreatedAt` DATETIME NOT NULL
);
ALTER TABLE
    `Users` ADD UNIQUE `users_subscriptionid_unique`(`SubscriptionID`);
CREATE TABLE `Subscription`(
    `SubscriptionID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `PlanName` VARCHAR(255) NOT NULL,
    `Price` DECIMAL(8, 2) NOT NULL,
    `Duration` INT NOT NULL,
    `Features` VARCHAR(255) NOT NULL
);
CREATE TABLE `Content`(
    `ContentID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Title` VARCHAR(255) NOT NULL,
    `ReleaseYear` INT NULL,
    `Type` VARCHAR(255) NOT NULL,
    `GenreID` INT NOT NULL,
    `Duration` INT NOT NULL,
    `Language` VARCHAR(255) NULL,
    `Review` VARCHAR(255) NOT NULL
);
CREATE TABLE `Genre`(
    `GenreID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `GenreName` VARCHAR(255) NOT NULL
);
CREATE TABLE `WatchHistory`(
    `HistoryID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `UserID` INT NOT NULL,
    `ContentID` INT NOT NULL,
    `WatchedOn` DATETIME NOT NULL,
    `Progress` INT NOT NULL
);
CREATE TABLE `Reviews`(
    `ReviewID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `UserID` INT NOT NULL,
    `ContentID` INT NOT NULL,
    `Review` VARCHAR(255) NOT NULL,
    `ReviewDate` DATETIME NOT NULL
);
ALTER TABLE
    `WatchHistory` ADD CONSTRAINT `watchhistory_userid_foreign` FOREIGN KEY(`UserID`) REFERENCES `Users`(`UserID`);
ALTER TABLE
    `Reviews` ADD CONSTRAINT `reviews_userid_foreign` FOREIGN KEY(`UserID`) REFERENCES `Users`(`UserID`);
ALTER TABLE
    `Reviews` ADD CONSTRAINT `reviews_contentid_foreign` FOREIGN KEY(`ContentID`) REFERENCES `Content`(`ContentID`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_subscriptionid_foreign` FOREIGN KEY(`SubscriptionID`) REFERENCES `Subscription`(`SubscriptionID`);
ALTER TABLE
    `Content` ADD CONSTRAINT `content_genreid_foreign` FOREIGN KEY(`GenreID`) REFERENCES `Genre`(`GenreID`);
ALTER TABLE
    `WatchHistory` ADD CONSTRAINT `watchhistory_contentid_foreign` FOREIGN KEY(`ContentID`) REFERENCES `Content`(`ContentID`);