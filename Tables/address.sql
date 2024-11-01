﻿CREATE TABLE `address` (
  `address_id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `address2` VARCHAR(50) DEFAULT NULL,
  `district` VARCHAR(20) NOT NULL,
  `city_id` SMALLINT(5) UNSIGNED NOT NULL,
  `postal_code` VARCHAR(10) DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `location` GEOMETRY NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (address_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

ALTER TABLE `address` 
  ADD INDEX idx_fk_city_id(city_id);

ALTER TABLE `address` 
  ADD SPATIAL INDEX idx_location(location);

ALTER TABLE `address` 
  ADD CONSTRAINT `fk_address_city` FOREIGN KEY (city_id)
    REFERENCES city(city_id) ON UPDATE CASCADE;