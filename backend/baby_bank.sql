-- MySQL Script generated by MySQL Workbench
-- Tue Jan  3 19:56:47 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema baby_bank
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema baby_bank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `baby_bank` DEFAULT CHARACTER SET utf8 ;
USE `baby_bank` ;

-- -----------------------------------------------------
-- Table `baby_bank`.`tb_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `baby_bank`.`tb_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `surname` VARCHAR(30) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(8) NOT NULL,
  `dtBirth` DATETIME NOT NULL,
  `dtCreated` DATETIME DEFAULT now(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baby_bank`.`tb_origin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `baby_bank`.`tb_origin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baby_bank`.`tb_income`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `baby_bank`.`tb_income` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` DOUBLE NOT NULL,
  `description` VARCHAR(80) NULL,
  `dtCreated` DATETIME DEFAULT now(),
  `idUser` INT NOT NULL,
  `idOrigin` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_income_user1_idx` (`idUser` ASC) ,
  INDEX `fk_income_origin1_idx` (`idOrigin` ASC) ,
  CONSTRAINT `fk_income_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `baby_bank`.`tb_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_income_origin1`
    FOREIGN KEY (`idOrigin`)
    REFERENCES `baby_bank`.`tb_origin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baby_bank`.`tb_savings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `baby_bank`.`tb_savings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dtCreated` DATETIME DEFAULT now(),
  `description` VARCHAR(80) NOT NULL,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_savings_user1_idx` (`idUser` ASC) ,
  CONSTRAINT `fk_savings_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `baby_bank`.`tb_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baby_bank`.`tb_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `baby_bank`.`tb_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baby_bank`.`tb_expenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `baby_bank`.`tb_expenses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` DOUBLE NOT NULL,
  `description` VARCHAR(80) NULL,
  `dtCreated` DATETIME DEFAULT now(),
  `idCategory` INT NOT NULL,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_expenses_category1_idx` (`idCategory` ASC),
  INDEX `fk_expenses_user1_idx` (`idUser` ASC),
  CONSTRAINT `fk_expenses_category1`
    FOREIGN KEY (`idCategory`)
    REFERENCES `baby_bank`.`tb_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_expenses_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `baby_bank`.`tb_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
