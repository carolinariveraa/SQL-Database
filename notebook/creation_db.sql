-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blockbuster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blockbuster` ;

-- -----------------------------------------------------
-- Table `blockbuster`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(100) NULL,
  `language` VARCHAR(100) NULL,
  `rental_duration` INT NULL,
  `rental_rate` FLOAT NULL,
  `length` INT NULL,
  `replacement_cost` FLOAT NULL,
  `rating` VARCHAR(100) NULL,
  `special_features` VARCHAR(300) NULL,
  `category` VARCHAR(100) NULL,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`inventory` (
  `inventory_id` INT NOT NULL,
  `qty` INT NULL,
  `location` VARCHAR(100) NULL,
  `film_film_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`, `film_film_id`),
  INDEX `fk_inventory_film_idx` (`film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `blockbuster`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`customer` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(200) NULL,
  `last_name` VARCHAR(200) NULL,
  `phone_number` VARCHAR(200) NULL,
  `email` VARCHAR(200) NULL,
  `adress` VARCHAR(200) NULL,
  `membership` VARCHAR(200) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` VARCHAR(200) NULL,
  `return_date` VARCHAR(200) NULL,
  `film_film_id` INT NOT NULL,
  `customer_customer_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `film_film_id`, `customer_customer_id`),
  INDEX `fk_rental_film1_idx` (`film_film_id` ASC) VISIBLE,
  INDEX `fk_rental_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `blockbuster`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `blockbuster`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`actor_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`actor_film` (
  `actor_actor_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  PRIMARY KEY (`actor_actor_id`, `film_film_id`),
  INDEX `fk_actor_film_film1_idx` (`film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_actor_film_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `blockbuster`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actor_film_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `blockbuster`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
