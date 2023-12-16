-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: A2
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(255) NOT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Eco Shopper','Alice Johnson','789 Eco Ave','EcoTown','ET789','EcoCountry'),(2,'Green Buyer','Bob Brown','321 Green St','EcoVille','EV321','EcoLand'),(3,'Eco Warrior','Clara Oswald','456 Nature Path','EcoCity','EC456','EcoLand'),(4,'Green Gardener','Rose Tyler','789 Plant Rd','GreenVille','GV789','Greenland'),(5,'Sustainable Shopper','Martha Jones','123 Sustainability St','EcoTown','ET123','EcoCountry'),(6,'Eco-Friendly Family','Donna Noble','234 Greenhouse Ln','EcoVille','EV234','EcoLand'),(7,'Nature Lover','Amy Pond','345 Earthway','GreenTown','GT345','Greenland'),(8,'Planet Protector','Rory Williams','567 Eco Blvd','EcoCity','EC567','EcoLand'),(9,'Green Lifestyle','River Song','678 Clean Ave','GreenVille','GV678','Greenland'),(10,'Eco Conscious','Bill Potts','890 Organic Way','EcoTown','ET890','EcoCountry');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetails`
--

DROP TABLE IF EXISTS `OrderDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDetails` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `OrderDetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  CONSTRAINT `OrderDetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetails`
--

LOCK TABLES `OrderDetails` WRITE;
/*!40000 ALTER TABLE `OrderDetails` DISABLE KEYS */;
INSERT INTO `OrderDetails` VALUES (1,1,1,2,2.99),(2,1,3,1,15.99),(3,2,2,1,10.50),(4,2,3,4,15.99),(5,3,1,2,2.99),(6,3,2,1,10.50),(7,4,1,3,2.99),(8,4,3,2,15.99),(9,5,2,3,10.50),(10,5,3,1,15.99),(11,6,1,5,2.99),(12,6,2,2,10.50),(13,7,3,3,15.99),(14,2,4,4,6.99),(15,12,1,5,10.99);
/*!40000 ALTER TABLE `OrderDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShipDate` date DEFAULT NULL,
  `ShipAddress` varchar(255) DEFAULT NULL,
  `ShipCity` varchar(100) DEFAULT NULL,
  `ShipPostalCode` varchar(20) DEFAULT NULL,
  `ShipCountry` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,'2023-11-01','2023-11-05','789 Eco Ave','EcoTown','ET789','EcoCountry'),(2,2,'2023-11-03','2023-11-08','321 Green St','EcoVille','EV321','EcoLand'),(3,3,'2023-11-06','2023-11-11','456 Nature Path','EcoCity','EC456','EcoLand'),(4,4,'2023-11-07','2023-11-12','789 Plant Rd','GreenVille','GV789','Greenland'),(5,5,'2023-11-08','2023-11-13','123 Sustainability St','EcoTown','ET123','EcoCountry'),(6,6,'2023-11-09','2023-11-14','234 Greenhouse Ln','EcoVille','EV234','EcoLand'),(7,7,'2023-11-10','2023-11-15','345 Earthway','GreenTown','GT345','Greenland'),(8,8,'2023-11-11','2023-11-16','567 Eco Blvd','EcoCity','EC567','EcoLand'),(9,9,'2023-11-12','2023-11-17','678 Clean Ave','GreenVille','GV678','Greenland'),(10,10,'2023-11-13','2023-11-18','890 Organic Way','EcoTown','ET890','EcoCountry'),(11,3,'2023-11-05','2023-11-10','1010 Green Park Rd','GreenField','GF1010','EcoNation'),(12,1,'2023-12-01','2023-12-05','123 Test Ave','TestCity','TC123','TestCountry');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) NOT NULL,
  `SupplierID` int DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `UnitsInStock` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Suppliers` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'Bamboo Toothbrush',1,'Personal Care',2.99,95),(2,'Reusable Water Bottle',1,'Outdoor',10.50,195),(3,'Organic Cotton T-shirt',2,'Clothing',15.99,145),(4,'Organic Hand Soap',4,'Personal Care',6.99,45),(5,'Recycled Paper Notebooks',5,'Stationery',3.50,95),(6,'Eco-friendly Laundry Detergent',6,'Home Care',12.99,25),(7,'Solar Garden Lights',7,'Outdoor',22.50,0),(8,'Reusable Silicone Bags',8,'Kitchen',9.99,75),(9,'Biodegradable Plant Pots',9,'Gardening',4.99,65),(10,'Sustainable Wooden Sunglasses',10,'Accessories',29.99,55),(11,'Solar Powered Lantern',3,'Outdoor',20.99,0);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suppliers` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(255) NOT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers`
--

LOCK TABLES `Suppliers` WRITE;
/*!40000 ALTER TABLE `Suppliers` DISABLE KEYS */;
INSERT INTO `Suppliers` VALUES (1,'EcoFriendly Ltd','John Doe','123 Green Road','EcoCity','EC123','Ecoland','123-456-7890'),(2,'NatureGoods Inc','Jane Smith','456 Natural Way','GreenVille','GV456','Greenland','987-654-3210'),(3,'Pure Planet Co.','Mia Turner','321 Clean St','PureCity','PC321','EcoLand','321-987-6543'),(4,'Earthly Matters','Jack Frost','654 Environment Rd','EcoVille','EV654','EcoCountry','654-321-9876'),(5,'Green Innovations','Lily Evans','987 Eco Blvd','GreenTown','GT987','Greenland','987-321-6543'),(6,'EcoTech Solutions','Harry Potter','159 Nature Ln','EcoCity','EC159','Ecoland','159-753-4862'),(7,'Natures Best','Ron Weasley','753 Organic Ave','GreenVille','GV753','Greenland','753-159-4862'),(8,'EcoLiving Essentials','Hermione Granger','486 Greenway','EcoTown','ET486','EcoCountry','486-753-1592'),(9,'PlanetCare Products','Neville Longbottom','369 Earthway','EcoPlace','EP369','EcoNation','369-258-1473'),(10,'Sustainable Goods Ltd.','Luna Lovegood','258 Greenfield Rd','SustainCity','SC258','EcoWorld','258-147-3698');
/*!40000 ALTER TABLE `Suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-15 19:53:33


create
    definer = root@`%` procedure AddNewOrder(IN customerID int, IN orderDate date, IN shipDate date,
                                             IN shipAddress varchar(255), IN shipCity varchar(100),
                                             IN shipPostalCode varchar(20), IN shipCountry varchar(100),
                                             IN productID int, IN quantity int, IN unitPrice decimal(10, 2))
BEGIN
    -- Inserting into Orders table
    INSERT INTO Orders (CustomerID, OrderDate, ShipDate, ShipAddress, ShipCity, ShipPostalCode, ShipCountry)
    VALUES (customerID, orderDate, shipDate, shipAddress, shipCity, shipPostalCode, shipCountry);

    -- Getting the last inserted OrderID
    SET @lastOrderID = LAST_INSERT_ID();

    -- Inserting into OrderDetails table
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
    VALUES (@lastOrderID, productID, quantity, unitPrice);
END;

create
    definer = root@`%` procedure UpdateStockQuantity(IN productID int, IN orderedQuantity int)
BEGIN
    -- Update the UnitsInStock for the given ProductID
    UPDATE Products
    SET UnitsInStock = UnitsInStock - orderedQuantity
    WHERE ProductID = productID;
END;