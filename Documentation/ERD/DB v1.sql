-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `privilege` VARCHAR(45) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Category_User_idx` (`User_id` ASC),
  CONSTRAINT `fk_Category_User`
    FOREIGN KEY (`User_id`)
    REFERENCES `mydb`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Author` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstLastName` VARCHAR(1000) NOT NULL,
  `biography` VARCHAR(50000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tag` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Quote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Quote` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Quote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(50000) NOT NULL,
  `source` VARCHAR(1000) NOT NULL,
  `datetime` DATETIME NOT NULL,
  `comment` VARCHAR(45) NULL,
  `favorite` TINYINT(1) NULL,
  `rate` VARCHAR(45) NOT NULL,
  `Category_id` INT NOT NULL,
  `Author_id` INT NOT NULL,
  `Tag_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Author_id`),
  INDEX `fk_Quote_Category1_idx` (`Category_id` ASC),
  INDEX `fk_Quote_Author1_idx` (`Author_id` ASC),
  INDEX `fk_Quote_Tag1_idx` (`Tag_id` ASC),
  CONSTRAINT `fk_Quote_Category1`
    FOREIGN KEY (`Category_id`)
    REFERENCES `mydb`.`Category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quote_Author1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quote_Tag1`
    FOREIGN KEY (`Tag_id`)
    REFERENCES `mydb`.`Tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
