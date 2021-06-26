-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: web_project_g11
-- ------------------------------------------------------
-- Server version	5.7.34-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client_products`
--

DROP TABLE IF EXISTS `client_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_products_clients_id_fk` (`clientId`),
  KEY `client_products_products_id_fk` (`productId`),
  CONSTRAINT `client_products_clients_id_fk` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`),
  CONSTRAINT `client_products_products_id_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_products`
--

LOCK TABLES `client_products` WRITE;
/*!40000 ALTER TABLE `client_products` DISABLE KEYS */;
INSERT INTO `client_products` VALUES (1,1,1,2),(6,12,2,2),(12,13,9,4),(13,13,18,2);
/*!40000 ALTER TABLE `client_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fullName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_email_uindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'john@gmail.com','123456','2008-01-02','0509550506','2021-06-09 22:27:08','ג\'ון לנון'),(2,'rivka@gmail.com','123456','2000-01-02','0509550234','2021-06-09 22:33:31','ריבקה בוזגלו'),(9,'dfdfdfdf@gmail.com','123456','2000-01-02','0509550239','2021-06-09 22:55:44','Mdoek Feok'),(10,'sdfv@gmail.com','123456','2000-01-02','0509550230','2021-06-09 22:56:45','Koer mak'),(12,'dfg@gmail.cosdfwe','123456','2000-01-02','0509551111','2021-06-10 15:41:45','שושנה'),(13,'may@gmail.com','123456','2021-06-10','0549550506','2021-06-11 13:59:13','מאי רימוק');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `specialRequests` text,
  `totalCost` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `street` varchar(40) NOT NULL,
  `houseNumber` int(3) NOT NULL,
  `clientId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_clients_id_fk` (`clientId`),
  CONSTRAINT `orders_clients_id_fk` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-06-10 17:03:46','להשאיר ליד הדלת',146,'אשדוד','החרצית',8,12),(2,'2021-06-10 17:05:39','להשאיר ליד הדלת',146,'אשדוד','החרצית',8,12),(3,'2021-06-10 17:08:18','להשאיר ליד הדלת',146,'אשדוד','החרצית',8,12),(4,'2021-06-12 10:45:24','לצלצל לפני ',427,'תל אביב','הבצלאל',9,13);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` text,
  `category` enum('single','box','glutenFree') DEFAULT 'single',
  `isVegan` tinyint(1) DEFAULT '0',
  `price` int(5) DEFAULT '0',
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'עוגיית שוקולד צ\'יפס','עוגיית שוקולד צ\'יפס טעימה וחמימה המכילה אחוזי שוקולד איכותי גבוהים','single',0,25,'https://handletheheat.com/wp-content/uploads/2018/02/BAKERY-STYLE-CHOCOLATE-CHIP-COOKIES-9.jpg'),(2,'עוגיית פאדג\' שוקולד','עוגיית שוקולד לוהטת ונימוחה בפה','single',1,23,'https://live.staticflickr.com/65535/48993897996_6d6199c799_o.jpg'),(3,'עוגיית M&M','עוגיית וניל חמה עם פצפוצי שוקולדים של M&M','single',0,27,'https://www.blessthismessplease.com/wp-content/uploads/2019/06/giant-MM-chocolate-chip-cookies-7-of-7.jpg'),(4,'עוגיית Red Valvet','עוגיית Red Valvet אדומה ורומנטית מלאה בפצפוצי שוקולד לבן ונוזלי','single',0,30,'https://i.pinimg.com/originals/d8/18/00/d81800a7bb1c390fdd0c49f15789d695.jpg'),(5,'עוגיית מרשמלו-צ\'יפס','עוגיית שוקולד צ\'יפס ממולאת במיני-מרשמלו לוהטים וטעימים','single',0,30,'https://www.simplyrecipes.com/thmb/OT5L_HDYGp_lL5IDdFGoG2zqkqY=/2000x1333/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2017__09__2017-09-14-SmoresCookies-2-48017db55f6f4df1aa66daca5cdd0b8f.jpg'),(6,'עוגיית מקרון','עוגיית מקרון שקדים בטעם הפתעה','single',1,22,'http://ukcdn.ar-cdn.com/recipes/originals/bdd9a576-a858-47a1-b836-99fa3cb61813.jpg'),(7,'מארז עוגיות שוקולד צ\'יפס','מארז גדול של 10 עוגיות שוקולד צ\'יפס פריכות וטעימות','box',0,125,'https://www.product-io-japan.com/image/cache/catalog/Chocolate%20chip%20cookies-800x800.jpg'),(8,'מארז שוקולד-גרנולה-צ\'יפס','מארז המכיל עוגיות שוקולד צ\'יפס, עוגיות גרנולה ועוגיות שוקולד פאדג\'','box',0,175,'https://previews.123rf.com/images/fahrwasser/fahrwasser2003/fahrwasser200300039/141562836-box-of-assorted-cookies-freshly-baked-and-packed-to-go-and-a-glass-of-milk.jpg'),(9,'מארז עוגיות פאדג\'','מארז המכיל 10 עוגיות שוקולד צ\'יפס נימוחות וטריות','box',1,140,'https://cdn.shopify.com/s/files/1/0120/7445/1040/products/DarkChocolateCookiesBoxof6_1729x.png?v=1608145070'),(10,'מארז מיוחדות','מארז הכולל 10 עוגיות מיוחדות, כל אחת בעלת טעם ייחודי ותוספת שונה','box',0,200,'https://cdn.shopify.com/s/files/1/0267/2751/4191/products/BWQnrWka5F_1024x.jpg?v=1591368895'),(11,'מארז מקרונים','מארז של 10 מקרונים בטעמים שונים ומגוונים','box',1,130,'https://images0.westend61.de/0001336936pw/box-of-colorful-macaroon-cookies-JUNF01741.jpg'),(12,'מארז עוגיות שקקדים','מארז של עוגיות שקדים פריכות וקראנצ\'יות','box',1,100,'https://previews.123rf.com/images/alpaksoy/alpaksoy1804/alpaksoy180400667/99791854-almond-cookies-in-package-acibadem-kurabiyesi-bakery-in-plastic-box-.jpg'),(13,'עוגיית טחינה','עוגיית טחינה עם שקדים, קראנצ\'ית מבחוץ ורכה מבפנים','glutenFree',1,18,'https://prettysimplesweet.com/wp-content/uploads/2016/02/TahiniCookies_02.jpg'),(14,'עוגיית אלפחורס גדולה','עוגיית אלפחורס גדולה, רכה ומלאה בריבת חלב','glutenFree',0,20,'https://prettysimplesweet.com/wp-content/uploads/2015/05/Alfajores-Dulce-de-Leche-Cookies1.jpg'),(15,'עוגיית גרנולה','עוגיית גרנולה מלאה בשקדים, צימוקים וקינמון','glutenFree',1,22,'https://i0.wp.com/whatcharlottebaked.com/wp-content/uploads/2018/04/P1080091-2.jpg'),(16,'עוגיית תמרים-שוקולד','עוגיית תמרים ושוקולד, נימוחה ורכה','glutenFree',1,15,'https://i.guim.co.uk/img/media/c1c97952286f834a76c673cee44cf49affe69818/0_245_3543_2126/master/3543.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=3675c1b043ba37739137c636c492c3b7'),(17,'עוגיית חמאת בוטנים','עוגיית חמאת בוטנים רכה ונימוחה','glutenFree',1,18,'https://thenovicechefblog.com/wp-content/uploads/2014/07/The-Best-Chewy-Peanut-Butter-Cookies-3-sm-1-720x540.jpg'),(18,'שוקולד צ\'יפס ללא גלוטן','עוגיית שוקולד צ\'יפס ענקית, חמה ונימוחה, ללא גלוטן','glutenFree',0,27,'https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/x17/17298-chewy-chocolate-chip-cookies-gluten-free-760x580.jpg?ext=.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_orders`
--

DROP TABLE IF EXISTS `products_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_orders` (
  `productId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `amount` int(3) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `products_orders_orders_id_fk` (`orderId`),
  KEY `products_orders_products_id_fk` (`productId`),
  CONSTRAINT `products_orders_orders_id_fk` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `products_orders_products_id_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orders`
--

LOCK TABLES `products_orders` WRITE;
/*!40000 ALTER TABLE `products_orders` DISABLE KEYS */;
INSERT INTO `products_orders` VALUES (1,2,5,1),(2,2,2,2),(1,3,5,3),(2,3,2,4),(8,4,1,5),(3,4,1,6),(16,4,15,7);
/*!40000 ALTER TABLE `products_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-12 21:51:47
