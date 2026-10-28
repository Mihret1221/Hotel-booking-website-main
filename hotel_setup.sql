CREATE DATABASE IF NOT EXISTS `hotel-booking-website`;
USE `hotel-booking-website`;

CREATE TABLE IF NOT EXISTS `admin_cred` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(150) NOT NULL,
  `admin_pass` varchar(150) NOT NULL,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `settings` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `site_title` varchar(255) DEFAULT NULL,
  `site_about` text,
  `shutdown` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contact_details` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `gmap` varchar(500) DEFAULT NULL,
  `pn1` varchar(30) DEFAULT NULL,
  `pn2` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fb` varchar(255) DEFAULT NULL,
  `insta` varchar(255) DEFAULT NULL,
  `tw` varchar(255) DEFAULT NULL,
  `iframe` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `user_cred` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phonenum` varchar(30) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `confirm_password` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `user_queries` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `features` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `facilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `area` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `adult` int NOT NULL,
  `children` int NOT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT 1,
  `removed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `room_features` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `features_id` int NOT NULL,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `room_facilities` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `facilities_id` int NOT NULL,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `room_images` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumb` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `carousel` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `team_details` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `admin_cred` (`admin_name`, `admin_pass`) VALUES ('admin', 'admin123')
ON DUPLICATE KEY UPDATE `admin_pass` = VALUES(`admin_pass`);

INSERT INTO `settings` (`sr_no`, `site_title`, `site_about`, `shutdown`) VALUES (1, 'Addis Hotel', 'Welcome to Addis Hotel', 0)
ON DUPLICATE KEY UPDATE `site_title` = VALUES(`site_title`), `site_about` = VALUES(`site_about`), `shutdown` = VALUES(`shutdown`);

INSERT INTO `contact_details` (`sr_no`, `address`, `gmap`, `pn1`, `pn2`, `email`, `fb`, `insta`, `tw`, `iframe`) VALUES
(1, 'Addis Ababa, Ethiopia', 'https://maps.google.com', '+251 911 111 111', '+251 922 222 222', 'info@addishotel.com', 'https://facebook.com', 'https://instagram.com', 'https://twitter.com', 'https://www.google.com/maps')
ON DUPLICATE KEY UPDATE `address` = VALUES(`address`), `gmap` = VALUES(`gmap`), `pn1` = VALUES(`pn1`), `pn2` = VALUES(`pn2`), `email` = VALUES(`email`), `fb` = VALUES(`fb`), `insta` = VALUES(`insta`), `tw` = VALUES(`tw`), `iframe` = VALUES(`iframe`);

INSERT INTO `features` (`name`) VALUES
('Air Conditioning'),
('Free WiFi'),
('Private Bathroom'),
('Breakfast Included')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

INSERT INTO `facilities` (`icon`, `name`, `description`) VALUES
('wifi.svg', 'WiFi', 'Fast and free internet access'),
('wifi.svg', 'Parking', 'Secure parking area'),
('wifi.svg', 'Restaurant', 'On-site dining services')
ON DUPLICATE KEY UPDATE `icon` = VALUES(`icon`), `name` = VALUES(`name`), `description` = VALUES(`description`);

INSERT INTO `rooms` (`id`, `name`, `area`, `price`, `quantity`, `adult`, `children`, `description`, `status`, `removed`) VALUES
(1, 'Deluxe Room', '350 sq ft', 120.00, 5, 2, 2, 'Comfortable room with city view', 1, 0),
(2, 'Family Suite', '500 sq ft', 180.00, 3, 4, 2, 'Spacious room for family stays', 1, 0)
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `area` = VALUES(`area`), `price` = VALUES(`price`), `quantity` = VALUES(`quantity`), `adult` = VALUES(`adult`), `children` = VALUES(`children`), `description` = VALUES(`description`), `status` = VALUES(`status`), `removed` = VALUES(`removed`);

INSERT INTO `room_features` (`room_id`, `features_id`) VALUES (1,1), (1,2), (2,1), (2,3);
INSERT INTO `room_facilities` (`room_id`, `facilities_id`) VALUES (1,1), (1,2), (2,1), (2,3);
INSERT INTO `room_images` (`room_id`, `image`, `thumb`) VALUES (1,'1.jpg',1), (1,'I1.jpg',0), (2,'I2.jpg',1);
INSERT INTO `carousel` (`image`) VALUES ('hot.jpg'), ('hot2.jpg'), ('im1.jpg');
INSERT INTO `team_details` (`name`, `picture`) VALUES ('Hotel Manager', 'team1.jpg');
