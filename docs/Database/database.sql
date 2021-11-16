-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Teamder
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Teamder
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Teamder` DEFAULT CHARACTER SET utf8 ;
USE `Teamder` ;

-- -----------------------------------------------------
-- Table `Teamder`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Teamder`.`Role` (
  `Role_id` INT NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Teamder`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Teamder`.`Person` (
  `Person_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NULL,
  `Age` INT NULL,
  `Gender` VARCHAR(45) NULL,
  `Nickname` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Role` INT NULL,
  PRIMARY KEY (`Person_id`),
  UNIQUE INDEX `Nickname_UNIQUE` (`Nickname` ASC) VISIBLE,
  INDEX `Role_idx` (`Role` ASC) VISIBLE,
  CONSTRAINT `Role`
    FOREIGN KEY (`Role`)
    REFERENCES `Teamder`.`Role` (`Role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Teamder`.`Goals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Teamder`.`Goals` (
  `Goal_id` INT NOT NULL AUTO_INCREMENT,
  `Goal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Goal_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Teamder`.`Ad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Teamder`.`Ad` (
  `Ad_id` INT NOT NULL AUTO_INCREMENT,
  `User_id` INT NOT NULL,
  `Age` INT NULL,
  `Game` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(45) NULL,
  `Text` VARCHAR(500) NOT NULL,
  `Elo` VARCHAR(45) NULL,
  `Goal_id` INT NOT NULL,
  `Active` TINYINT NOT NULL,
  PRIMARY KEY (`Ad_id`),
  INDEX `User_id_idx` (`User_id` ASC) VISIBLE,
  INDEX `Goal_id_idx` (`Goal_id` ASC) VISIBLE,
  CONSTRAINT `User_id`
    FOREIGN KEY (`User_id`)
    REFERENCES `Teamder`.`Person` (`Person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Goal_id`
    FOREIGN KEY (`Goal_id`)
    REFERENCES `Teamder`.`Goals` (`Goal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Teamder`.`Dialogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Teamder`.`Dialogs` (
  `Dialog_id` INT NOT NULL AUTO_INCREMENT,
  `User1_id` INT NOT NULL,
  `User2_id` INT NOT NULL,
  PRIMARY KEY (`Dialog_id`),
  INDEX `User2_id_idx` (`User2_id` ASC) VISIBLE,
  INDEX `User1_id_idx` (`User1_id` ASC) VISIBLE,
  CONSTRAINT `User1_id`
    FOREIGN KEY (`User1_id`)
    REFERENCES `Teamder`.`Person` (`Person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User2_id`
    FOREIGN KEY (`User2_id`)
    REFERENCES `Teamder`.`Person` (`Person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Teamder`.`Messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Teamder`.`Messages` (
  `Message_id` INT NOT NULL AUTO_INCREMENT,
  `Dialog_id` INT NOT NULL,
  `Text` VARCHAR(500) NOT NULL,
  `Read` TINYINT NOT NULL,
  PRIMARY KEY (`Message_id`),
  INDEX `Dialog_id_idx` (`Dialog_id` ASC) VISIBLE,
  CONSTRAINT `Dialog_id`
    FOREIGN KEY (`Dialog_id`)
    REFERENCES `Teamder`.`Dialogs` (`Dialog_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
