-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Lab3_BatDongSan
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Lab3_BatDongSan` ;

-- -----------------------------------------------------
-- Schema Lab3_BatDongSan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Lab3_BatDongSan` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `Lab3_BatDongSan` ;

-- -----------------------------------------------------
-- Table `VanPhong`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VanPhong` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `VanPhong` (
  `idVanPhong` INT NOT NULL,
  `DiaChi` VARCHAR(30) NOT NULL,
  `TenVanPhong` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVanPhong`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `NhanVien`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NhanVien` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `NhanVien` (
  `idNhanVien` INT NOT NULL,
  `TenNV` VARCHAR(30) NOT NULL,
  `DiaChi` VARCHAR(45) NOT NULL,
  `SoDT` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `idVanPhong` INT NOT NULL,
  PRIMARY KEY (`idNhanVien`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `NhanThan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NhanThan` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `NhanThan` (
  `idNhanThan` INT NOT NULL,
  `TenNhanThan` TEXT(20) NULL,
  `NgaySinh` DATE NULL,
  `MoiQH` TEXT(5) NULL,
  `idNhanVien` INT NOT NULL,
  PRIMARY KEY (`idNhanThan`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ChuSoHuu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChuSoHuu` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ChuSoHuu` (
  `idChuSoHuu` INT NOT NULL,
  `TenChu` VARCHAR(20) NOT NULL,
  `DiaChi` VARCHAR(20) NOT NULL,
  `SoDT` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idChuSoHuu`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `SPBatDongSan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SPBatDongSan` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `SPBatDongSan` (
  `idBDS` INT NOT NULL,
  `DiaChi` TEXT(15) NULL,
  `idChuSoHuu` INT NOT NULL,
  `idVanPhong` INT NOT NULL,
  PRIMARY KEY (`idBDS`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
