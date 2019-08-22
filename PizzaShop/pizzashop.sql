/*
 Navicat Premium Data Transfer

 Source Server         : PizzaShop
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : pizzashop

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 22/08/2019 21:35:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for __efmigrationshistory
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory`  (
  `MigrationId` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`MigrationId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of __efmigrationshistory
-- ----------------------------
INSERT INTO `__efmigrationshistory` VALUES ('20190822164136_InitialMigration', '2.1.11-servicing-32099');
INSERT INTO `__efmigrationshistory` VALUES ('20190822164455_AddPriceToPizzaDiametersTable', '2.1.11-servicing-32099');
INSERT INTO `__efmigrationshistory` VALUES ('20190822171346_AddUsersAndRolesTables', '2.1.11-servicing-32099');
INSERT INTO `__efmigrationshistory` VALUES ('20190822171507_AddUsersAndRolesTables2', '2.1.11-servicing-32099');
INSERT INTO `__efmigrationshistory` VALUES ('20190822182406_DeletePizzaDiametersTable', '2.1.11-servicing-32099');
INSERT INTO `__efmigrationshistory` VALUES ('20190822182520_AddPizzaDiametersTable', '2.1.11-servicing-32099');
INSERT INTO `__efmigrationshistory` VALUES ('20190822183352_AddCartAndOrderTables', '2.1.11-servicing-32099');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `PizzaDiameterId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Carts_OrderId`(`OrderId`) USING BTREE,
  INDEX `IX_Carts_PizzaDiameterId`(`PizzaDiameterId`) USING BTREE,
  CONSTRAINT `FK_Carts_Orders_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_Carts_PizzaDiameters_PizzaDiameterId` FOREIGN KEY (`PizzaDiameterId`) REFERENCES `pizzadiameters` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for diameters
-- ----------------------------
DROP TABLE IF EXISTS `diameters`;
CREATE TABLE `diameters`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DiameterValue` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diameters
-- ----------------------------
INSERT INTO `diameters` VALUES (1, 30);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `OrderDate` datetime(0) NOT NULL,
  `FinalPrice` int(11) NOT NULL,
  `Confirmed` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Orders_UserId`(`UserId`) USING BTREE,
  CONSTRAINT `FK_Orders_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pizzadiameters
-- ----------------------------
DROP TABLE IF EXISTS `pizzadiameters`;
CREATE TABLE `pizzadiameters`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DiameterId` int(11) NOT NULL,
  `PizzaId` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_PizzaDiameters_DiameterId`(`DiameterId`) USING BTREE,
  INDEX `IX_PizzaDiameters_PizzaId`(`PizzaId`) USING BTREE,
  CONSTRAINT `FK_PizzaDiameters_Diameters_DiameterId` FOREIGN KEY (`DiameterId`) REFERENCES `diameters` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_PizzaDiameters_Pizzas_PizzaId` FOREIGN KEY (`PizzaId`) REFERENCES `pizzas` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pizzas
-- ----------------------------
DROP TABLE IF EXISTS `pizzas`;
CREATE TABLE `pizzas`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pizzas
-- ----------------------------
INSERT INTO `pizzas` VALUES (1, 'Пепперони');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `Login` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RoleId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Users_RoleId`(`RoleId`) USING BTREE,
  CONSTRAINT `FK_Users_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
