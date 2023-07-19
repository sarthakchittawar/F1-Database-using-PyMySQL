
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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dna` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dna`;
DROP TABLE IF EXISTS `CIRCUIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CIRCUIT` (
  `Sponsor` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Championship` varchar(255) NOT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Track Length` float DEFAULT NULL,
  `No. of Corners` int DEFAULT NULL,
  PRIMARY KEY (`Sponsor`,`Name`,`Championship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `CIRCUIT` WRITE;
/*!40000 ALTER TABLE `CIRCUIT` DISABLE KEYS */;
INSERT INTO `CIRCUIT` VALUES ('Aramco','Circuit of the Americas','Formula 1','United States',5.513,20),('CRYPTO.COM','Miami International Autodrome','Formula 1','United States',5.412,19),('Gainbridge','Indianapolis Motor Speedway','IndyCar Series','United States',4.023,4),('Gulf Air','Bahrain International Circuit','Formula 1','Bahrain',5.412,15),('Heineken','Albert Park Circuit','Formula 1','Australia',5.278,14),('Heineken','Autodromo Jose Carlos Pace','Formula 1','Brazil',4.309,15),('Heineken','Circuit Zandvoort','Formula 1','Netherlands',4.259,14),('Heineken','Phillip Island Circuit','MotoGP','Australia',4.445,12),('Lenovo','Circuit Paul Ricard','Formula 1','France',5.842,15),('Lenovo','Silverstone Circuit','Formula 1','England',5.891,18),('Lenovo','Silverstone Circuit','MotoGP','England',5.891,18),('Michelin','Autodromo Termas de Rio Hondo','MotoGP','Argentina',4.805,14),('Pertamina','Mandalika International Circuit','MotoGP','Indonesia',4.313,17),('Rolex','Circuit de Spa-Francorchamps','Formula 1','Belgium',7.004,19),('Rolex','Red Bull Ring','Formula 1','Austria',4.318,10),('Rolex','Red Bull Ring','MotoGP','Austria',4.318,10),('Tag Heuer','Circuit De Monaco','Formula 1','Monaco',3.337,19);
/*!40000 ALTER TABLE `CIRCUIT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `CONSTRUCTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONSTRUCTOR` (
  `Name` varchar(255) NOT NULL,
  `Engine Manufacturer` varchar(255) NOT NULL,
  `Vehicle` varchar(255) DEFAULT NULL,
  `Championship` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`,`Engine Manufacturer`),
  KEY `Championship` (`Championship`),
  CONSTRAINT `CONSTRUCTOR_ibfk_1` FOREIGN KEY (`Championship`) REFERENCES `VEHICLE` (`Championship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `CONSTRUCTOR` WRITE;
/*!40000 ALTER TABLE `CONSTRUCTOR` DISABLE KEYS */;
INSERT INTO `CONSTRUCTOR` VALUES ('Alfa Romeo Racing Orlen','Ferrari','Car','Formula 1'),('Alphatauri','Honda','Car','Formula 1'),('Alpine F1','Renault','Car','Formula 1'),('Aston Martin Aramco F1 Team','Mercedes','Car','Formula 1'),('Ducati Team','Ducati','Bike','MotoGP'),('Haas F1 Team','Ferrari','Car','Formula 1'),('McLaren F1 Team','Mercedes','Car','Formula 1'),('Mercedes AMG Petronas F1 Team','Mercedes','Car','Formula 1'),('Mooney VR46 Racing','VR46','Bike','MotoGP'),('Prima Pramac Racing','Generac','Bike','MotoGP'),('Red Bull Racing','Honda','Car','Formula 1'),('Repsol Honda Team','Honda','Bike','MotoGP'),('Scuderia Ferrari','Ferrari','Car','Formula 1'),('Williams Racing','Mercedes','Car','Formula 1'),('Yamaha MotoGP','Yamaha','Bike','MotoGP');
/*!40000 ALTER TABLE `CONSTRUCTOR` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `CONSTRUCTORS' CHAMPIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONSTRUCTORS' CHAMPIONSHIP` (
  `Constructor Name` varchar(255) DEFAULT NULL,
  `Position` int NOT NULL,
  `Championship` varchar(255) NOT NULL,
  `Points` int DEFAULT NULL,
  `Year` int NOT NULL,
  PRIMARY KEY (`Position`,`Championship`,`Year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `CONSTRUCTORS' CHAMPIONSHIP` WRITE;
/*!40000 ALTER TABLE `CONSTRUCTORS' CHAMPIONSHIP` DISABLE KEYS */;
INSERT INTO `CONSTRUCTORS' CHAMPIONSHIP` VALUES ('Red Bull Racing',1,'Formula 1',759,2022),('Ducati Team',1,'MotoGP',448,2022),('Scuderia Ferrari',2,'Formula 1',554,2022),('Yamaha MotoGP',2,'MotoGP',356,2022),('Mercedes AMG Petronas F1 Team',3,'Formula 1',515,2022),('Alpine F1',4,'Formula 1',173,2022),('Mooney VR46 Racing',4,'MotoGP',231,2022),('McLaren F1 Team',5,'Formula 1',159,2022),('Alfa Romeo Racing Orlen',6,'Formula 1',55,2022),('Prima Parmac Racing',6,'MotoGP',221,2022),('Aston Martin Aramco F1 Team',7,'Formula 1',55,2022),('Repsol Honda Team',7,'MotoGP',220,2022),('Haas F1 Team',8,'Formula 1',37,2022),('Alphatauri',9,'Formula 1',35,2022),('Williams Racing',10,'Formula 1',8,2022);
/*!40000 ALTER TABLE `CONSTRUCTORS' CHAMPIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `CONSTRUCTORS' HALL OF FAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONSTRUCTORS' HALL OF FAME` (
  `Constructor Name` varchar(255) DEFAULT NULL,
  `Points` int NOT NULL,
  `Year` int NOT NULL,
  `Championship` varchar(255) NOT NULL,
  PRIMARY KEY (`Points`,`Year`,`Championship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `CONSTRUCTORS' HALL OF FAME` WRITE;
/*!40000 ALTER TABLE `CONSTRUCTORS' HALL OF FAME` DISABLE KEYS */;
INSERT INTO `CONSTRUCTORS' HALL OF FAME` VALUES ('Scuderia Ferrari',158,2003,'Formula 1'),('Scuderia Ferrari',170,2000,'Formula 1'),('Scuderia Ferrari',172,2008,'Formula 1'),('Brawn GP',172,2009,'Formula 1'),('Scuderia Ferrari',179,2001,'Formula 1'),('Renault',191,2005,'Formula 1'),('Scuderia Ferrari',204,2007,'Formula 1'),('Renault',206,2006,'Formula 1'),('Scuderia Ferrari',221,2002,'Formula 1'),('Repsol Honda Team',254,2001,'MotoGP'),('Scuderia Ferrari',262,2004,'Formula 1'),('Ducati Team',278,2007,'MotoGP'),('Repsol Honda Team',281,2006,'MotoGP'),('Yamaha MotoGP',292,2005,'MotoGP'),('Yamaha MotoGP',300,2004,'MotoGP'),('Yamaha MotoGP',304,2000,'MotoGP'),('Repsol Honda Team',309,2003,'MotoGP'),('Repsol Honda Team',328,2011,'MotoGP'),('Repsol Honda Team',336,2019,'MotoGP'),('Yamaha MotoGP',340,2009,'MotoGP'),('Repsol Honda Team',354,2002,'MotoGP'),('Repsol Honda Team',359,2014,'MotoGP'),('Repsol Honda Team',399,2012,'MotoGP'),('Repsol Honda Team',399,2016,'MotoGP'),('Yamaha MotoGP',400,2010,'MotoGP'),('Yamaha MotoGP',409,2015,'MotoGP'),('Ducati Team',436,2020,'MotoGP'),('Ducati Team',450,2021,'MotoGP'),('Red Bull Racing',460,2012,'Formula 1'),('Repsol Honda Team',490,2013,'MotoGP'),('Yamaha MotoGP',492,2008,'MotoGP'),('Red Bull Racing',498,2010,'Formula 1'),('Repsol Honda Team',505,2018,'MotoGP'),('Repsol Honda Team',550,2017,'MotoGP'),('Mercedes AMG Petronas F1 Team',573,2020,'Formula 1'),('Red Bull Racing',596,2013,'Formula 1'),('Mercedes AMG Petronas F1 Team',614,2021,'Formula 1'),('Red Bull Racing',650,2011,'Formula 1'),('Mercedes AMG Petronas F1 Team',655,2018,'Formula 1'),('Mercedes AMG Petronas F1 Team',668,2017,'Formula 1'),('Mercedes AMG Petronas F1 Team',701,2014,'Formula 1'),('Mercedes AMG Petronas F1 Team',703,2015,'Formula 1'),('Mercedes AMG Petronas F1 Team',739,2019,'Formula 1'),('Mercedes AMG Petronas F1 Team',765,2016,'Formula 1');
/*!40000 ALTER TABLE `CONSTRUCTORS' HALL OF FAME` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `DRIVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRIVER` (
  `Driver Number` int NOT NULL,
  `First Name` varchar(255) DEFAULT NULL,
  `Last Name` varchar(255) DEFAULT NULL,
  `Constructor` varchar(255) NOT NULL,
  `Championship` varchar(255) NOT NULL,
  PRIMARY KEY (`Driver Number`,`Constructor`,`Championship`),
  KEY `Championship` (`Championship`),
  CONSTRAINT `DRIVER_ibfk_1` FOREIGN KEY (`Championship`) REFERENCES `VEHICLE` (`Championship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `DRIVER` WRITE;
/*!40000 ALTER TABLE `DRIVER` DISABLE KEYS */;
INSERT INTO `DRIVER` VALUES (1,'Max','Verstappen','Red Bull Racing','Formula 1'),(3,'Daniel','Ricciardo','McLaren F1 Team','Formula 1'),(4,'Lando','Norris','McLaren F1 Team','Formula 1'),(5,'Sebastian','Vettel','Aston Martin Aramco F1 Team','Formula 1'),(5,'Johann','Zarco','Prima Pramac Racing','MotoGP'),(6,'Nicholas','Latifi','Williams Racing','Formula 1'),(10,'Pierre','Gasly','Alphatauri','Formula 1'),(10,'Luca','Marini','Mooney VR46 Racing','MotoGP'),(11,'Sergio','Perez','Red Bull Racing','Formula 1'),(12,'Maverick','Vinales','Aprilia Racing','MotoGP'),(14,'Fernando','Alonso','Alpine F1','Formula 1'),(16,'Charles','Leclerc','Scuderia Ferrari','Formula 1'),(18,'Lance','Stroll','Aston Martin Aramco F1 Team','Formula 1'),(20,'Kevin','Magnussen','Haas F1 Team','Formula 1'),(20,'Fabio','Quartoraro','Yamaha MotoGP','MotoGP'),(22,'Yuki','Tsunoda','Alphatauri','Formula 1'),(23,'Alexander','Albon','Williams Racing','Formula 1'),(24,'Zhou','Guanyu','Alfa Romeo Racing Orlen','Formula 1'),(27,'Nico','Hulkenberg','Aston Martin Aramco F1 Team','Formula 1'),(31,'Esteban','Ocon','Alpine F1','Formula 1'),(36,'Joan','Mir','Repsol Honda Team','MotoGP'),(41,'Aleix','Espargaro','Aprilia Racing Team','MotoGP'),(44,'Lewis','Hamilton','Mercedes AMG Petronas F1 Team','Formula 1'),(45,'Nyck','De Vries','Williams Racing','Formula 1'),(47,'Mick','Schumacher','Haas F1 Team','Formula 1'),(53,'Francesco','Bagnaia','Ducati Team','MotoGP'),(55,'Carlos','Sainz','Scuderia Ferrari','Formula 1'),(63,'George','Russell','Mercedes AMG Petronas F1 Team','Formula 1'),(77,'Valtteri','Bottas','Alfa Romeo Racing Orlen','Formula 1'),(93,'Mark','Marquez','Repsol Honda Team','MotoGP');
/*!40000 ALTER TABLE `DRIVER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `DRIVERS' CHAMPIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRIVERS' CHAMPIONSHIP` (
  `Driver Number` int NOT NULL,
  `First Name` varchar(255) NOT NULL,
  `Last Name` varchar(255) NOT NULL,
  `Position` int DEFAULT NULL,
  `Championship` varchar(255) DEFAULT NULL,
  `Points` int DEFAULT NULL,
  `Year` int DEFAULT NULL,
  PRIMARY KEY (`Driver Number`,`First Name`,`Last Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `DRIVERS' CHAMPIONSHIP` WRITE;
/*!40000 ALTER TABLE `DRIVERS' CHAMPIONSHIP` DISABLE KEYS */;
INSERT INTO `DRIVERS' CHAMPIONSHIP` VALUES (1,'Max','Verstappen',1,'Formula 1',454,2022),(3,'Daniel','Ricciardo',11,'Formula 1',37,2022),(4,'Lando','Norris',7,'Formula 1',122,2022),(5,'Johann','Zarco',8,'MotoGP',166,2022),(5,'Sebastian','Vettel',12,'Formula 1',37,2022),(6,'Nicholas','Latifi',20,'Formula 1',2,2022),(10,'Luca','Marini',12,'MotoGP',120,2022),(10,'Pierre','Gasly',14,'Formula 1',23,2022),(11,'Sergio','Perez',3,'Formula 1',305,2022),(12,'Maverick','Vinales',11,'MotoGP',122,2022),(14,'Fernando','Alonso',9,'Formula 1',81,2022),(16,'Charles','Leclerc',2,'Formula 1',308,2022),(18,'Lance','Stroll',15,'Formula 1',18,2022),(20,'Fabio','Quartoraro',2,'MotoGP',248,2022),(20,'Kevin','Magnussen',13,'Formula 1',25,2022),(22,'Yuki','Tsunoda',17,'Formula 1',12,2022),(23,'Alexander','Albon',19,'Formula 1',4,2022),(24,'Guanyu','Zhou',18,'Formula 1',6,2022),(31,'Esteban','Ocon',8,'Formula 1',92,2022),(31,'Nico','Hulkenberg',22,'Formula 1',0,2022),(36,'Joan','Mir',15,'MotoGP',87,2022),(41,'Aleix','Espargaro',4,'MotoGP',212,2022),(44,'Lewis','Hamilton',6,'Formula 1',240,2022),(45,'Nyck','De Vries',21,'Formula 1',2,2022),(47,'Mick','Schumacher',16,'Formula 1',12,2022),(53,'Francesco','Bagnaia',1,'MotoGP',265,2022),(55,'Carlos','Sainz',5,'Formula 1',246,2022),(63,'George','Russell',4,'Formula 1',275,2022),(77,'Valtteri','Bottas',10,'Formula 1',49,2022),(93,'Marc','Marquez',13,'MotoGP',113,2022);
/*!40000 ALTER TABLE `DRIVERS' CHAMPIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `DRIVERS' HALL OF FAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRIVERS' HALL OF FAME` (
  `First Name` varchar(255) DEFAULT NULL,
  `Last Name` varchar(255) DEFAULT NULL,
  `Points` int NOT NULL,
  `Year` int NOT NULL,
  `Championship` varchar(255) NOT NULL,
  KEY `Championship` (`Championship`),
  KEY `First Name` (`First Name`),
  CONSTRAINT `DRIVERS' HALL OF FAME_ibfk_1` FOREIGN KEY (`Championship`) REFERENCES `DRIVER` (`Championship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `DRIVERS' HALL OF FAME` WRITE;
/*!40000 ALTER TABLE `DRIVERS' HALL OF FAME` DISABLE KEYS */;
INSERT INTO `DRIVERS' HALL OF FAME` VALUES ('Max','Verstappen',396,2021,'Formula 1'),('Lewis','Hamilton',347,2020,'Formula 1'),('Lewis','Hamilton',413,2019,'Formula 1'),('Lewis','Hamilton',408,2018,'Formula 1'),('Lewis','Hamilton',363,2017,'Formula 1'),('Nico','Rosberg',385,2016,'Formula 1'),('Lewis','Hamilton',381,2015,'Formula 1'),('Lewis','Hamilton',384,2014,'Formula 1'),('Sebastian','Vettel',397,2013,'Formula 1'),('Sebastian','Vettel',281,2012,'Formula 1'),('Sebastian','Vettel',392,2011,'Formula 1'),('Sebastian','Vettel',256,2010,'Formula 1'),('Jenson','Button',95,2009,'Formula 1'),('Lewis','Hamilton',98,2008,'Formula 1'),('Kimi','Raikkonen',110,2007,'Formula 1'),('Fernando','Alonso',134,2006,'Formula 1'),('Fernando','Alonso',133,2005,'Formula 1'),('Michael','Schumacher',148,2004,'Formula 1'),('Michael','Schumacher',93,2003,'Formula 1'),('Michael','Schumacher',144,2002,'Formula 1'),('Michael','Schumacher',123,2001,'Formula 1'),('Michael','Schumacher',108,2000,'Formula 1'),('Fabio','Quartoraro',278,2021,'MotoGP'),('Joan','Mir',171,2020,'MotoGP'),('Marc','Marquez',420,2019,'MotoGP'),('Marc','Marquez',321,2018,'MotoGP'),('Marc','Marquez',298,2017,'MotoGP'),('Marc','Marquez',298,2016,'MotoGP'),('Jorge','Lorenzo',330,2015,'MotoGP'),('Marc','Marquez',362,2014,'MotoGP'),('Marc','Marquez',334,2013,'MotoGP'),('Jorge','Lorenzo',350,2012,'MotoGP'),('Casey','Stoner',350,2011,'MotoGP'),('Jorge','Lorenzo',383,2010,'MotoGP'),('Valentino','Rossi',306,2009,'MotoGP'),('Valentino','Rossi',373,2008,'MotoGP'),('Casey','Stoner',367,2007,'MotoGP'),('Nicky','Hayden',252,2006,'MotoGP'),('Valentino','Rossi',367,2005,'MotoGP'),('Valentino','Rossi',304,2004,'MotoGP'),('Valentino','Rossi',357,2003,'MotoGP'),('Valentino','Rossi',355,2002,'MotoGP'),('Valentino','Rossi',325,2001,'MotoGP'),('Kenny','Roberts Jr.',258,2000,'MotoGP');
/*!40000 ALTER TABLE `DRIVERS' HALL OF FAME` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `RACE2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RACE2` (
  `Race Number` int NOT NULL,
  `Championship` varchar(255) NOT NULL,
  `Day` int DEFAULT NULL,
  `Month` varchar(255) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  PRIMARY KEY (`Race Number`,`Championship`),
  KEY `Championship` (`Championship`),
  CONSTRAINT `RACE2_ibfk_1` FOREIGN KEY (`Championship`) REFERENCES `DRIVER` (`Championship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `RACE2` WRITE;
/*!40000 ALTER TABLE `RACE2` DISABLE KEYS */;
INSERT INTO `RACE2` VALUES (1,'Formula 1',12,'March',2022),(2,'MotoGP',20,'March',2022),(3,'Formula 1',10,'April',2022),(3,'MotoGP',3,'April',2022),(5,'Formula 1',8,'May',2022),(7,'Formula 1',29,'May',2022),(10,'Formula 1',3,'July',2022),(11,'Formula 1',10,'July',2022),(12,'Formula 1',24,'July',2022),(12,'MotoGP',7,'August',2022),(13,'MotoGP',21,'August',2022),(14,'Formula 1',28,'August',2022),(15,'Formula 1',4,'September',2022),(18,'MotoGP',16,'October',2022),(19,'Formula 1',23,'October',2022),(21,'Formula 1',13,'November',2022);
/*!40000 ALTER TABLE `RACE2` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `RACE3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RACE3` (
  `Championship` varchar(255) NOT NULL,
  `Sponsor` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `No. of Laps` varchar(255) DEFAULT NULL,
  `Year` int NOT NULL,
  `Race Number` int NOT NULL,
  PRIMARY KEY (`Championship`,`Sponsor`,`Name`,`Year`),
  CONSTRAINT `RACE3_ibfk_1` FOREIGN KEY (`Championship`) REFERENCES `DRIVER` (`Championship`),
  CONSTRAINT `RACE3_ibfk_2` FOREIGN KEY (`Championship`) REFERENCES `RACE2` (`Championship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `RACE3` WRITE;
/*!40000 ALTER TABLE `RACE3` DISABLE KEYS */;
INSERT INTO `RACE3` VALUES ('Formula 1','Aramco','Circuit of the Americas','56',2022,19),('Formula 1','CRYPTO.COM','Miami International Autodrome','57',2022,5),('Formula 1','Gulf Air','Bahrain International Circuit','57',2022,1),('Formula 1','Heineken','Albert Park Circuit','58',2022,3),('Formula 1','Heineken','Autodromo Jose Carlos Pace','71',2022,21),('Formula 1','Heineken','Circuit Zandvoort','72',2022,15),('Formula 1','Lenovo','Circuit Paul Ricard','53',2022,12),('Formula 1','Lenovo','Silverstone Circuit','52',2022,10),('Formula 1','Rolex','Circuit de Spa-Francorchamps','44',2022,14),('Formula 1','Rolex','Red Bull Ring','71',2022,11),('Formula 1','Tag Heuer','Circuit De Monaco','78',2022,7),('MotoGP','Heineken','Phillip Island Circuit','27',2022,18),('MotoGP','Lenovo','Silverstone Circuit','20',2022,12),('MotoGP','Michelin','Autodromo Termas de Rio Hondo','25',2022,3),('MotoGP','Pertamina','Mandalika International Circuit','20',2022,2),('MotoGP','Rolex','Red Bull Ring','28',2022,13);
/*!40000 ALTER TABLE `RACE3` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `RACE4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RACE4` (
  `Race Number` int NOT NULL,
  `Championship` varchar(255) NOT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  PRIMARY KEY (`Race Number`,`Championship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `RACE4` WRITE;
/*!40000 ALTER TABLE `RACE4` DISABLE KEYS */;
INSERT INTO `RACE4` VALUES (1,'Formula 1','Bahrain',2022),(2,'MotoGP','Indonesia',2022),(3,'Formula 1','Australia',2022),(3,'MotoGP','Argentina',2022),(5,'Formula 1','United States',2022),(7,'Formula 1','Monaco',2022),(10,'Formula 1','England',2022),(11,'Formula 1','Austria',2022),(12,'Formula 1','France',2022),(12,'MotoGP','England',2022),(13,'MotoGP','Austria',2022),(14,'Formula 1','Belgium',2022),(15,'Formula 1','Netherlands',2022),(18,'MotoGP','Australia',2022),(19,'Formula 1','United States',2022),(21,'Formula 1','Brazil',2022);
/*!40000 ALTER TABLE `RACE4` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `RESULTS2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESULTS2` (
  `First Name` varchar(50) NOT NULL,
  `Last Name` varchar(50) NOT NULL,
  `Constructor` varchar(50) DEFAULT NULL,
  `Championship` varchar(50) NOT NULL,
  `Race` varchar(50) NOT NULL,
  `Position` int NOT NULL,
  PRIMARY KEY (`First Name`,`Last Name`,`Championship`,`Race`,`Position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `RESULTS2` WRITE;
/*!40000 ALTER TABLE `RESULTS2` DISABLE KEYS */;
INSERT INTO `RESULTS2` VALUES ('Aleix','Espargaro','Aprilia Racing','MotoGP','Autodromo Termas de Rio Hondo',1),('Alex','Rins','Aprilia Racing','MotoGP','Autodromo Termas de Rio Hondo',3),('Alex','Rins','Aprilia Racing','MotoGP','Phillip Island Circuit',1),('Carlos','Sainz','Scuderia Ferrari','Formula 1','Autodromo Jose Carlos Pace',3),('Carlos','Sainz','Scuderia Ferrari','Formula 1','Bahrain International Circuit',2),('Carlos','Sainz','Scuderia Ferrari','Formula 1','Circuit De Monaco',4),('Carlos','Sainz','Scuderia Ferrari','Formula 1','Circuit de Spa-Francorchamps',3),('Carlos','Sainz','Scuderia Ferrari','Formula 1','Circuit Paul Ricard',5),('Carlos','Sainz','Scuderia Ferrari','Formula 1','Miami International Autodrome',3),('Carlos','Sainz','Scuderia Ferrari','Formula 1','Silverstone Circuit',1),('Charles','Leclerc','Scuderia Ferrari','Formula 1','Albert Park Circuit',1),('Charles','Leclerc','Scuderia Ferrari','Formula 1','Autodromo Jose Carlos Pace',4),('Charles','Leclerc','Scuderia Ferrari','Formula 1','Bahrain International Circuit',1),('Charles','Leclerc','Scuderia Ferrari','Formula 1','Circuit De Monaco',2),('Charles','Leclerc','Scuderia Ferrari','Formula 1','Circuit of the Americas',3),('Charles','Leclerc','Scuderia Ferrari','Formula 1','Circuit Zandvoort',3),('Charles','Leclerc','Scuderia Ferrari','Formula 1','Miami International Autodrome',2),('Charles','Leclerc','Scuderia Ferrari','Formula 1','Red Bull Ring',1),('Charles','Leclerc','Scuderia Ferrari','Formula 1','Silverstone Circuit',4),('Esteban','Ocon','Alpine F1 Team','Formula 1','Silverstone Circuit',5),('Fabio','Quartoraro','Yamaha MotoGP','MotoGP','Mandalika International Circuit',1),('Fabio','Quartoraro','Yamaha MotoGP','MotoGP','Red Bull Ring',2),('Fernando','Alonso','Alpine F1 Team','Formula 1','Autodromo Jose Carlos Pace',5),('Fernando','Alonso','Alpine F1 Team','Formula 1','Bahrain International Circuit',5),('Fernando','Alonso','Alpine F1 Team','Formula 1','Circuit de Spa-Francorchamps',5),('Fernando','Alonso','Alpine F1 Team','Formula 1','Silverstone Circuit',5),('Francesco','Bagnaia','Ducati Team','MotoGP','Phillip Island Circuit',3),('Francesco','Bagnaia','Ducati Team','MotoGP','Red Bull Ring',1),('Francesco','Bagnaia','Ducati Team','MotoGP','Silverstone Circuit',1),('George','Russell','Mercedes AMG Petronas F1 Team','Formula 1','Albert Park Circuit',3),('George','Russell','Mercedes AMG Petronas F1 Team','Formula 1','Autodromo Jose Carlos Pace',1),('George','Russell','Mercedes AMG Petronas F1 Team','Formula 1','Circuit De Monaco',5),('George','Russell','Mercedes AMG Petronas F1 Team','Formula 1','Circuit de Spa-Francorchamps',4),('George','Russell','Mercedes AMG Petronas F1 Team','Formula 1','Circuit of the Americas',5),('George','Russell','Mercedes AMG Petronas F1 Team','Formula 1','Circuit Paul Ricard',3),('George','Russell','Mercedes AMG Petronas F1 Team','Formula 1','Circuit Zandvoort',2),('George','Russell','Mercedes AMG Petronas F1 Team','Formula 1','Miami International Autodrome',5),('George','Russell','Mercedes AMG Petronas F1 Team','Formula 1','Red Bull Ring',4),('Jack','Miller','Ducati Team','MotoGP','Autodromo Termas de Rio Hondo',2),('Jack','Miller','Ducati Team','MotoGP','Mandalika International Circuit',2),('Jack','Miller','Ducati Team','MotoGP','Red Bull Ring',3),('Jack','Miller','Ducati Team','MotoGP','Silverstone Circuit',3),('Johann','Zarco','Ducati Team','MotoGP','Mandalika International Circuit',3),('Lando','Norris','McLaren F1 Team','Formula 1','Albert Park Circuit',5),('Lando','Norris','McLaren F1 Team','Formula 1','Bahrain International Circuit',4),('Lewis','Hamilton','Mercedes AMG Petronas F1 Team','Formula 1','Albert Park Circuit',4),('Lewis','Hamilton','Mercedes AMG Petronas F1 Team','Formula 1','Autodromo Jose Carlos Pace',2),('Lewis','Hamilton','Mercedes AMG Petronas F1 Team','Formula 1','Bahrain International Circuit',3),('Lewis','Hamilton','Mercedes AMG Petronas F1 Team','Formula 1','Circuit of the Americas',2),('Lewis','Hamilton','Mercedes AMG Petronas F1 Team','Formula 1','Circuit Paul Ricard',2),('Lewis','Hamilton','Mercedes AMG Petronas F1 Team','Formula 1','Circuit Zandvoort',4),('Lewis','Hamilton','Mercedes AMG Petronas F1 Team','Formula 1','Red Bull Ring',3),('Lewis','Hamilton','Mercedes AMG Petronas F1 Team','Formula 1','Silverstone Circuit',3),('Marc','Marquez','Repsol Honda Team','MotoGP','Phillip Island Circuit',2),('Maverick','Vinales','Aprilia Racing','MotoGP','Silverstone Circuit',2),('Max','Verstappen','Red Bull Racing','Formula 1','Circuit De Monaco',3),('Max','Verstappen','Red Bull Racing','Formula 1','Circuit de Spa-Francorchamps',1),('Max','Verstappen','Red Bull Racing','Formula 1','Circuit of the Americas',1),('Max','Verstappen','Red Bull Racing','Formula 1','Circuit Paul Ricard',1),('Max','Verstappen','Red Bull Racing','Formula 1','Circuit Zandvoort',1),('Max','Verstappen','Red Bull Racing','Formula 1','Miami International Autodrome',1),('Max','Verstappen','Red Bull Racing','Formula 1','Red Bull Ring',2),('Sergio','Perez','Red Bull Racing','Formula 1','Albert Park Circuit',2),('Sergio','Perez','Red Bull Racing','Formula 1','Circuit De Monaco',1),('Sergio','Perez','Red Bull Racing','Formula 1','Circuit de Spa-Francorchamps',2),('Sergio','Perez','Red Bull Racing','Formula 1','Circuit of the Americas',4),('Sergio','Perez','Red Bull Racing','Formula 1','Circuit Paul Ricard',4),('Sergio','Perez','Red Bull Racing','Formula 1','Circuit Zandvoort',5),('Sergio','Perez','Red Bull Racing','Formula 1','Miami International Autodrome',4),('Sergio','Perez','Red Bull Racing','Formula 1','Silverstone Circuit',2);
/*!40000 ALTER TABLE `RESULTS2` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `RESULTS3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESULTS3` (
  `First Name` varchar(50) NOT NULL,
  `Last Name` varchar(50) NOT NULL,
  `Championship` varchar(50) NOT NULL,
  `Race` varchar(50) NOT NULL,
  `Position` int NOT NULL,
  `Points` int DEFAULT NULL,
  PRIMARY KEY (`First Name`,`Last Name`,`Championship`,`Race`,`Position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `RESULTS3` WRITE;
/*!40000 ALTER TABLE `RESULTS3` DISABLE KEYS */;
INSERT INTO `RESULTS3` VALUES ('Aleix','Espargaro','MotoGP','Autodromo Termas de Rio Hondo',1,25),('Alex','Rins','MotoGP','Autodromo Termas de Rio Hondo',3,15),('Alex','Rins','MotoGP','Phillip Island Circuit',1,25),('Carlos','Sainz','Formula 1','Autodromo Jose Carlos Pace',3,15),('Carlos','Sainz','Formula 1','Bahrain International Circuit',2,18),('Carlos','Sainz','Formula 1','Circuit De Monaco',2,18),('Carlos','Sainz','Formula 1','Circuit de Spa-Francorchamps',3,15),('Carlos','Sainz','Formula 1','Circuit Paul Ricard',5,10),('Carlos','Sainz','Formula 1','Miami International Autodrome',3,15),('Carlos','Sainz','Formula 1','Silverstone Circuit',1,25),('Charles','Leclerc','Formula 1','Albert Park Circuit',1,25),('Charles','Leclerc','Formula 1','Autodromo Jose Carlos Pace',4,12),('Charles','Leclerc','Formula 1','Bahrain International Circuit',1,25),('Charles','Leclerc','Formula 1','Circuit De Monaco',4,12),('Charles','Leclerc','Formula 1','Circuit of the Americas',3,15),('Charles','Leclerc','Formula 1','Circuit Zandvoort',3,15),('Charles','Leclerc','Formula 1','Miami International Autodrome',2,18),('Charles','Leclerc','Formula 1','Red Bull Ring',1,25),('Charles','Leclerc','Formula 1','Silverstone Circuit',4,12),('Esteban','Ocon','Formula 1','Red Bull Ring',5,10),('Fabio','Quartoraro','MotoGP','Mandalika International Circuit',1,25),('Fabio','Quartoraro','MotoGP','Red Bull Ring',2,20),('Fernando','Alonso','Formula 1','Autodromo Jose Carlos Pace',5,10),('Fernando','Alonso','Formula 1','Bahrain International Circuit',5,10),('Fernando','Alonso','Formula 1','Circuit de Spa-Francorchamps',5,10),('Fernando','Alonso','Formula 1','Silverstone Circuit',5,10),('Francesco','Bagnaia','MotoGP','Phillip Island Circuit',3,15),('Francesco','Bagnaia','MotoGP','Red Bull Ring',1,25),('Francesco','Bagnaia','MotoGP','Silverstone Circuit',1,25),('George','Russell','Formula 1','Albert Park Circuit',3,12),('George','Russell','Formula 1','Autodromo Jose Carlos Pace',1,25),('George','Russell','Formula 1','Circuit De Monaco',5,10),('George','Russell','Formula 1','Circuit de Spa-Francorchamps',4,12),('George','Russell','Formula 1','Circuit of the Americas',5,10),('George','Russell','Formula 1','Circuit Paul Ricard',3,15),('George','Russell','Formula 1','Circuit Zandvoort',2,18),('George','Russell','Formula 1','Miami International Autodrome',5,10),('George','Russell','Formula 1','Red Bull Ring',4,12),('Jack','Miller','MotoGP','Red Bull Ring',3,15),('Jack','Miller','MotoGP','Silverstone Circuit',3,15),('Johann','Zarco','MotoGP','Mandalika International Circuit',3,15),('Jorge','Martin','MotoGP','Autodromo Termas de Rio Hondo',2,20),('Lando','Norris','Formula 1','Albert Park Circuit',5,10),('Lando','Norris','Formula 1','Bahrain International Circuit',4,12),('Lewis','Hamilton','Formula 1','Albert Park Circuit',4,10),('Lewis','Hamilton','Formula 1','Autodromo Jose Carlos Pace',2,18),('Lewis','Hamilton','Formula 1','Bahrain International Circuit',3,15),('Lewis','Hamilton','Formula 1','Circuit of the Americas',2,18),('Lewis','Hamilton','Formula 1','Circuit Paul Ricard',2,18),('Lewis','Hamilton','Formula 1','Circuit Zandvoort',4,12),('Lewis','Hamilton','Formula 1','Red Bull Ring',3,15),('Lewis','Hamilton','Formula 1','Silverstone Circuit',3,15),('Marc','Marquez','MotoGP','Phillip Island Circuit',2,20),('Maverick','Vinales','MotoGP','Silverstone Circuit',2,20),('Max','Verstappen','Formula 1','Circuit De Monaco',3,15),('Max','Verstappen','Formula 1','Circuit de Spa-Francorchamps',1,25),('Max','Verstappen','Formula 1','Circuit of the Americas',1,25),('Max','Verstappen','Formula 1','Circuit Paul Ricard',1,25),('Max','Verstappen','Formula 1','Circuit Zandvoort',1,25),('Max','Verstappen','Formula 1','Miami International Autodrome',1,25),('Max','Verstappen','Formula 1','Red Bull Ring',2,18),('Sergio','Perez','Formula 1','Albert Park Circuit',2,18),('Sergio','Perez','Formula 1','Circuit De Monaco',1,25),('Sergio','Perez','Formula 1','Circuit de Spa-Francorchamps',2,18),('Sergio','Perez','Formula 1','Circuit of the Americas',4,12),('Sergio','Perez','Formula 1','Circuit Paul Ricard',4,12),('Sergio','Perez','Formula 1','Circuit Zandvoort',5,10),('Sergio','Perez','Formula 1','Miami International Autodrome',4,12),('Sergio','Perez','Formula 1','Silverstone Circuit',2,18);
/*!40000 ALTER TABLE `RESULTS3` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `VEHICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VEHICLE` (
  `Championship` varchar(255) NOT NULL,
  `Vehicle Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Championship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `VEHICLE` WRITE;
/*!40000 ALTER TABLE `VEHICLE` DISABLE KEYS */;
INSERT INTO `VEHICLE` VALUES ('Formula 1','Car'),('IndyCar Series','Car'),('MotoGP','Bike');
/*!40000 ALTER TABLE `VEHICLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

