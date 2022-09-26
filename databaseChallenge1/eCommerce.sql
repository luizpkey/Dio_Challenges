-- -----------------------------------------------------
-- Schema ECommerce
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ECommerce` ;

-- -----------------------------------------------------
-- Schema ECommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ECommerce` DEFAULT CHARACTER SET utf8 ;
USE `ECommerce` ;

-- -----------------------------------------------------
-- Table `ECommerce`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`Client` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`Client` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `Identification` VARCHAR(18) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(20) NULL,
  `Country` VARCHAR(20) NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`Identification` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECommerce`.`Provider`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`Provider` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`Provider` (
  `idProvider` INT NOT NULL AUTO_INCREMENT,
  `DeliveryCust` DECIMAL(10,2) NULL,
  `Name` VARCHAR(45) NULL,
  `Providercol` VARCHAR(45) NULL,
  PRIMARY KEY (`idProvider`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECommerce`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`Product` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT,
  `Category` VARCHAR(45) NULL,
  `Decription` VARCHAR(45) NULL,
  `Value` DECIMAL(10,3) NULL,
  PRIMARY KEY (`idProduct`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECommerce`.`PurchaseOrder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`PurchaseOrder` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`PurchaseOrder` (
  `idPurchaseOrder` INT NOT NULL AUTO_INCREMENT,
  `Client_idClient` INT NOT NULL,
  `AddressDelivery` VARCHAR(45) NULL,
  `Status` VARCHAR(45) NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`idPurchaseOrder`, `Client_idClient`),
  INDEX `fk_PurchaseOrder_Client1_idx` (`Client_idClient` ASC),
  CONSTRAINT `fk_PurchaseOrder_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `ECommerce`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECommerce`.`Delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`Delivery` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`Delivery` (
  `PurchaseOrder_idPurchaseOrder` INT NOT NULL,
  `Cust` DECIMAL(10,2) NULL,
  `Date` DATETIME NULL,
  `OrderID` VARCHAR(15) NULL,
  PRIMARY KEY (`PurchaseOrder_idPurchaseOrder`),
  CONSTRAINT `fk_Delivery_PurchaseOrder1`
    FOREIGN KEY (`PurchaseOrder_idPurchaseOrder`)
    REFERENCES `ECommerce`.`PurchaseOrder` (`idPurchaseOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECommerce`.`Card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`Card` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`Card` (
  `Client_idClient` INT NOT NULL,
  `Number` VARCHAR(20) NULL,
  `NameImpress` VARCHAR(45) NULL,
  `ValidateMonth` VARCHAR(2) NULL,
  `ValidateYear` VARCHAR(4) NULL,
  `Alias` VARCHAR(45) NULL,
  `idCard` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCard`, `Client_idClient`),
  CONSTRAINT `fk_Card_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `ECommerce`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECommerce`.`Provider_has_Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`Provider_has_Product` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`Provider_has_Product` (
  `Provider_idProvider` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  PRIMARY KEY (`Provider_idProvider`, `Product_idProduct`),
  INDEX `fk_Provider_has_Product_Product1_idx` (`Product_idProduct` ASC),
  INDEX `fk_Provider_has_Product_Provider1_idx` (`Provider_idProvider` ASC),
  CONSTRAINT `fk_Provider_has_Product_Provider1`
    FOREIGN KEY (`Provider_idProvider`)
    REFERENCES `ECommerce`.`Provider` (`idProvider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Provider_has_Product_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `ECommerce`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECommerce`.`WareHouse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`WareHouse` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`WareHouse` (
  `idWareHouse` INT NOT NULL AUTO_INCREMENT,
  `Locale` VARCHAR(45) NULL,
  PRIMARY KEY (`idWareHouse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECommerce`.`Product_has_WareHouse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`Product_has_WareHouse` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`Product_has_WareHouse` (
  `Product_idProduct` INT NOT NULL,
  `WareHouse_idWareHouse` INT NOT NULL,
  `Stock` DECIMAL(10,3) NULL,
  `Product_has_WareHousecol` VARCHAR(45) NULL,
  PRIMARY KEY (`Product_idProduct`, `WareHouse_idWareHouse`),
  INDEX `fk_Product_has_WareHouse_WareHouse1_idx` (`WareHouse_idWareHouse` ASC),
  INDEX `fk_Product_has_WareHouse_Product1_idx` (`Product_idProduct` ASC),
  CONSTRAINT `fk_Product_has_WareHouse_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `ECommerce`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_WareHouse_WareHouse1`
    FOREIGN KEY (`WareHouse_idWareHouse`)
    REFERENCES `ECommerce`.`WareHouse` (`idWareHouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECommerce`.`Product_has_PurchaseOrder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECommerce`.`Product_has_PurchaseOrder` ;

CREATE TABLE IF NOT EXISTS `ECommerce`.`Product_has_PurchaseOrder` (
  `Product_idProduct` INT NOT NULL,
  `PurchaseOrder_idPurchaseOrder` INT NOT NULL,
  `Ammount` DECIMAL(12,3) NULL,
  PRIMARY KEY (`Product_idProduct`, `PurchaseOrder_idPurchaseOrder`),
  INDEX `fk_Product_has_PurchaseOrder_PurchaseOrder1_idx` (`PurchaseOrder_idPurchaseOrder` ASC),
  INDEX `fk_Product_has_PurchaseOrder_Product1_idx` (`Product_idProduct` ASC),
  CONSTRAINT `fk_Product_has_PurchaseOrder_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `ECommerce`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_PurchaseOrder_PurchaseOrder1`
    FOREIGN KEY (`PurchaseOrder_idPurchaseOrder`)
    REFERENCES `ECommerce`.`PurchaseOrder` (`idPurchaseOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

