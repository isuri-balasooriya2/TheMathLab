CREATE TABLE `Books`(
    `book_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `author` VARCHAR(255) NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `year` INT NOT NULL,
    `price` FLOAT(53) NOT NULL,
    `stock` INT NOT NULL
);
CREATE TABLE `Customers`(
    `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,
    `address` VARCHAR(255) NULL
);
CREATE TABLE `Sales`(
    `sales_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` DATE NOT NULL,
    `total` FLOAT(53) NOT NULL,
    `quantity` INT NOT NULL,
    `book_id` INT NOT NULL,
    `customer_id` INT NOT NULL
);
CREATE TABLE `Payments`(
    `payment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `amount` FLOAT(53) NOT NULL,
    `date` DATE NOT NULL,
    `sales_id` INT NOT NULL,
    `customer_id` INT NOT NULL
);
ALTER TABLE
    `Payments` ADD CONSTRAINT `payments_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Customers`(`customer_id`);
ALTER TABLE
    `Payments` ADD CONSTRAINT `payments_sales_id_foreign` FOREIGN KEY(`sales_id`) REFERENCES `Sales`(`sales_id`);
ALTER TABLE
    `Sales` ADD CONSTRAINT `sales_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `Books`(`book_id`);
ALTER TABLE
    `Sales` ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Customers`(`customer_id`);