﻿CREATE TABLE `customer` (
  `customer_id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_id` TINYINT(3) UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) DEFAULT NULL,
  `address_id` SMALLINT(5) UNSIGNED NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `create_date` DATETIME NOT NULL,
  `last_update` TIMESTAMP NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (customer_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

ALTER TABLE `customer` 
  ADD INDEX idx_fk_address_id(address_id);

ALTER TABLE `customer` 
  ADD INDEX idx_fk_store_id(store_id);

ALTER TABLE `customer` 
  ADD INDEX idx_last_name(last_name);

ALTER TABLE `customer` 
  ADD CONSTRAINT `fk_customer_address` FOREIGN KEY (address_id)
    REFERENCES address(address_id) ON UPDATE CASCADE;

ALTER TABLE `customer` 
  ADD CONSTRAINT `fk_customer_store` FOREIGN KEY (store_id)
    REFERENCES store(store_id) ON UPDATE CASCADE;