-- script that creates a table users
-- check if the table exists before attempting to create it

-- define the table and it's columns
CREATE TABLE IF NOT EXISTS users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255),
	country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
