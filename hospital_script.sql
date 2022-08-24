-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hospital_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hospital_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hospital_database` DEFAULT CHARACTER SET utf8 ;
USE `Hospital_database` ;

-- -----------------------------------------------------
-- Table `Hospital_database`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_database`.`patients` (
  `patients_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `residence` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`patients_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital_database`.`doctors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_database`.`doctors` (
  `doctor_id` INT NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`doctor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital_database`.`admissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_database`.`admissions` (
  `date` DATETIME NOT NULL,
  `fee` DECIMAL(9,2) NOT NULL,
  `patients_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  INDEX `fk_admissions_patients_idx` (`patients_id` ASC) VISIBLE,
  PRIMARY KEY (`patients_id`, `doctor_id`),
  INDEX `fk_admissions_doctors1_idx` (`doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_admissions_patients`
    FOREIGN KEY (`patients_id`)
    REFERENCES `Hospital_database`.`patients` (`patients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admissions_doctors1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `Hospital_database`.`doctors` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital_database`.`diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_database`.`diagnosis` (
  `diagnosis_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `patients_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  PRIMARY KEY (`diagnosis_id`),
  INDEX `fk_diagnosis_admissions1_idx` (`patients_id` ASC, `doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_diagnosis_admissions1`
    FOREIGN KEY (`patients_id` , `doctor_id`)
    REFERENCES `Hospital_database`.`admissions` (`patients_id` , `doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital_database`.`laboratory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_database`.`laboratory` (
  `test` VARCHAR(50) NOT NULL,
  `result` VARCHAR(50) NOT NULL,
  `diagnosis_id` INT NOT NULL,
  INDEX `fk_laboratory_diagnosis1_idx` (`diagnosis_id` ASC) VISIBLE,
  PRIMARY KEY (`diagnosis_id`),
  CONSTRAINT `fk_laboratory_diagnosis1`
    FOREIGN KEY (`diagnosis_id`)
    REFERENCES `Hospital_database`.`diagnosis` (`diagnosis_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital_database`.`essentials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_database`.`essentials` (
  `product_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital_database`.`clearance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_database`.`clearance` (
  `date` DATE NOT NULL,
  `essentials` VARCHAR(45) NOT NULL,
  `quantity` VARCHAR(45) NOT NULL,
  `product_id` INT NOT NULL,
  `patients_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  INDEX `fk_clearance_essentials1_idx` (`product_id` ASC) VISIBLE,
  PRIMARY KEY (`product_id`),
  INDEX `fk_clearance_admissions1_idx` (`patients_id` ASC, `doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_clearance_essentials1`
    FOREIGN KEY (`product_id`)
    REFERENCES `Hospital_database`.`essentials` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clearance_admissions1`
    FOREIGN KEY (`patients_id` , `doctor_id`)
    REFERENCES `Hospital_database`.`admissions` (`patients_id` , `doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital_database`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital_database`.`table1` (
  `essentials_product_id` INT NOT NULL,
  `patients_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  INDEX `fk_table1_essentials1_idx` (`essentials_product_id` ASC) VISIBLE,
  PRIMARY KEY (`essentials_product_id`),
  INDEX `fk_table1_admissions1_idx` (`patients_id` ASC, `doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_table1_essentials1`
    FOREIGN KEY (`essentials_product_id`)
    REFERENCES `Hospital_database`.`essentials` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_admissions1`
    FOREIGN KEY (`patients_id` , `doctor_id`)
    REFERENCES `Hospital_database`.`admissions` (`patients_id` , `doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
