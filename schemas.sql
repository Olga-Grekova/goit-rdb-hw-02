-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NULL,
  `customer_address` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `order_id` INT NOT NULL,
  `order_date` DATETIME NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `customer_order_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_order`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`amount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`amount` (
  `order_id` INT NOT NULL,
  `product_id` INT NULL,
  `amount` INT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `product_amount_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `orders_product_amount`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_amount`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
