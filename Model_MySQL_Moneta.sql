-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex_MySQL_Moneta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex_MySQL_Moneta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex_MySQL_Moneta` DEFAULT CHARACTER SET utf8 ;
USE `Ex_MySQL_Moneta` ;

-- -----------------------------------------------------
-- Table `Ex_MySQL_Moneta`.`PROVIDER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex_MySQL_Moneta`.`PROVIDER` (
  `idProvider` INT NOT NULL,
  `provider_name` VARCHAR(120) NOT NULL,
  `provider_street` VARCHAR(120) NOT NULL,
  `provider_number` VARCHAR(45) NOT NULL,
  `provider_floor` VARCHAR(45) NOT NULL,
  `provider_door` VARCHAR(45) NOT NULL,
  `provider_city` VARCHAR(45) NOT NULL,
  `provider_postal_code` VARCHAR(45) NOT NULL,
  `provider_country` VARCHAR(45) NOT NULL,
  `provider_phone` VARCHAR(45) NOT NULL,
  `provider_fax` VARCHAR(20) NULL DEFAULT '-',
  `provider_nif` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProvider`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex_MySQL_Moneta`.`BRAND`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex_MySQL_Moneta`.`BRAND` (
  `idBrand` INT NOT NULL,
  `brand_name` VARCHAR(120) NULL,
  `PROVIDER_idProvider` INT NOT NULL,
  PRIMARY KEY (`idBrand`),
  INDEX `fk_BRAND_PROVIDER_idx` (`PROVIDER_idProvider` ASC),
  CONSTRAINT `fk_BRAND_PROVIDER`
    FOREIGN KEY (`PROVIDER_idProvider`)
    REFERENCES `Ex_MySQL_Moneta`.`PROVIDER` (`idProvider`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex_MySQL_Moneta`.`GLASSES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex_MySQL_Moneta`.`GLASSES` (
  `idGlasses` INT NOT NULL,
  `graduation` VARCHAR(45) NULL,
  `frame` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `glass_color` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `BRAND_idBrand` INT NOT NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `fk_GLASSES_BRAND1_idx` (`BRAND_idBrand` ASC),
  CONSTRAINT `fk_GLASSES_BRAND1`
    FOREIGN KEY (`BRAND_idBrand`)
    REFERENCES `Ex_MySQL_Moneta`.`BRAND` (`idBrand`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex_MySQL_Moneta`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex_MySQL_Moneta`.`CLIENT` (
  `idClient` INT NOT NULL,
  `client_name` VARCHAR(120) NOT NULL,
  `client_postal_code` VARCHAR(45) NOT NULL,
  `client_phone` VARCHAR(45) NOT NULL,
  `client_email` VARCHAR(120) NOT NULL,
  `client_registration` DATETIME NOT NULL,
  `recommended_by_id` INT NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex_MySQL_Moneta`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex_MySQL_Moneta`.`EMPLOYEE` (
  `idEmployee` INT NOT NULL,
  `Employee_name` VARCHAR(120) NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex_MySQL_Moneta`.`SALES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex_MySQL_Moneta`.`SALES` (
  `idSales` INT NOT NULL,
  `GLASSES_idGlasses` INT NOT NULL,
  `EMPLOYEE_idEmployee` INT NOT NULL,
  `CLIENT_idClient` INT NOT NULL,
  PRIMARY KEY (`idSales`),
  INDEX `fk_SALES_GLASSES1_idx` (`GLASSES_idGlasses` ASC),
  INDEX `fk_SALES_EMPLOYEE1_idx` (`EMPLOYEE_idEmployee` ASC),
  INDEX `fk_SALES_CLIENT1_idx` (`CLIENT_idClient` ASC),
  CONSTRAINT `fk_SALES_GLASSES1`
    FOREIGN KEY (`GLASSES_idGlasses`)
    REFERENCES `Ex_MySQL_Moneta`.`GLASSES` (`idGlasses`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_SALES_EMPLOYEE1`
    FOREIGN KEY (`EMPLOYEE_idEmployee`)
    REFERENCES `Ex_MySQL_Moneta`.`EMPLOYEE` (`idEmployee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_SALES_CLIENT1`
    FOREIGN KEY (`CLIENT_idClient`)
    REFERENCES `Ex_MySQL_Moneta`.`CLIENT` (`idClient`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Ex_MySQL_Moneta`.`PROVIDER`
-- -----------------------------------------------------
START TRANSACTION;
USE `Ex_MySQL_Moneta`;
INSERT INTO `Ex_MySQL_Moneta`.`PROVIDER` (`idProvider`, `provider_name`, `provider_street`, `provider_number`, `provider_floor`, `provider_door`, `provider_city`, `provider_postal_code`, `provider_country`, `provider_phone`, `provider_fax`, `provider_nif`) VALUES (1, 'provider_one', 'cabanes', '23', '4', '0', 'barcelona', '08004', 'españa', '987654321', '0', '1234NIF');
INSERT INTO `Ex_MySQL_Moneta`.`PROVIDER` (`idProvider`, `provider_name`, `provider_street`, `provider_number`, `provider_floor`, `provider_door`, `provider_city`, `provider_postal_code`, `provider_country`, `provider_phone`, `provider_fax`, `provider_nif`) VALUES (2, 'provider_two', 'mata', '60', '0', '0', 'barcelona', '08004', 'españa', '965432176', '0', '6543NIF');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Ex_MySQL_Moneta`.`BRAND`
-- -----------------------------------------------------
START TRANSACTION;
USE `Ex_MySQL_Moneta`;
INSERT INTO `Ex_MySQL_Moneta`.`BRAND` (`idBrand`, `brand_name`, `PROVIDER_idProvider`) VALUES (1, 'gafitas', 1);
INSERT INTO `Ex_MySQL_Moneta`.`BRAND` (`idBrand`, `brand_name`, `PROVIDER_idProvider`) VALUES (2, 'lasgafas', 1);
INSERT INTO `Ex_MySQL_Moneta`.`BRAND` (`idBrand`, `brand_name`, `PROVIDER_idProvider`) VALUES (3, 'lentillas', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Ex_MySQL_Moneta`.`GLASSES`
-- -----------------------------------------------------
START TRANSACTION;
USE `Ex_MySQL_Moneta`;
INSERT INTO `Ex_MySQL_Moneta`.`GLASSES` (`idGlasses`, `graduation`, `frame`, `color`, `glass_color`, `price`, `BRAND_idBrand`) VALUES (1, '0-01-09L', 'm', 'black', 'transparent', '90€', 2);
INSERT INTO `Ex_MySQL_Moneta`.`GLASSES` (`idGlasses`, `graduation`, `frame`, `color`, `glass_color`, `price`, `BRAND_idBrand`) VALUES (2, '7-9-006-4', 'p', 'green', 'transparent', '45€', 1);
INSERT INTO `Ex_MySQL_Moneta`.`GLASSES` (`idGlasses`, `graduation`, `frame`, `color`, `glass_color`, `price`, `BRAND_idBrand`) VALUES (3, '0', 'f', 'brown', 'brown', '110€', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Ex_MySQL_Moneta`.`CLIENT`
-- -----------------------------------------------------
START TRANSACTION;
USE `Ex_MySQL_Moneta`;
INSERT INTO `Ex_MySQL_Moneta`.`CLIENT` (`idClient`, `client_name`, `client_postal_code`, `client_phone`, `client_email`, `client_registration`, `recommended_by_id`) VALUES (1, 'Lola', '08007', '12343245676', 'lola@blabla.com', '2019-08-20', 3);
INSERT INTO `Ex_MySQL_Moneta`.`CLIENT` (`idClient`, `client_name`, `client_postal_code`, `client_phone`, `client_email`, `client_registration`, `recommended_by_id`) VALUES (2, 'Juan', '23451', '9876876542', 'juan@hotmail.com', '2016-10-01', 1);
INSERT INTO `Ex_MySQL_Moneta`.`CLIENT` (`idClient`, `client_name`, `client_postal_code`, `client_phone`, `client_email`, `client_registration`, `recommended_by_id`) VALUES (3, 'Pedro', '00988', '5464493921', 'pedro@gmail.com', '2020-01-15', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Ex_MySQL_Moneta`.`EMPLOYEE`
-- -----------------------------------------------------
START TRANSACTION;
USE `Ex_MySQL_Moneta`;
INSERT INTO `Ex_MySQL_Moneta`.`EMPLOYEE` (`idEmployee`, `Employee_name`) VALUES (1, 'Cecilia');
INSERT INTO `Ex_MySQL_Moneta`.`EMPLOYEE` (`idEmployee`, `Employee_name`) VALUES (2, 'María');
INSERT INTO `Ex_MySQL_Moneta`.`EMPLOYEE` (`idEmployee`, `Employee_name`) VALUES (3, 'Edu');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Ex_MySQL_Moneta`.`SALES`
-- -----------------------------------------------------
START TRANSACTION;
USE `Ex_MySQL_Moneta`;
INSERT INTO `Ex_MySQL_Moneta`.`SALES` (`idSales`, `GLASSES_idGlasses`, `EMPLOYEE_idEmployee`, `CLIENT_idClient`) VALUES (1, 2, 2, 3);
INSERT INTO `Ex_MySQL_Moneta`.`SALES` (`idSales`, `GLASSES_idGlasses`, `EMPLOYEE_idEmployee`, `CLIENT_idClient`) VALUES (2, 3, 1, 2);
INSERT INTO `Ex_MySQL_Moneta`.`SALES` (`idSales`, `GLASSES_idGlasses`, `EMPLOYEE_idEmployee`, `CLIENT_idClient`) VALUES (3, 1, 3, 1);

COMMIT;

