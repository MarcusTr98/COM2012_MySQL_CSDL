-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quanly_banhang_l7
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitiet_hoadon`
--

DROP TABLE IF EXISTS `chitiet_hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiet_hoadon` (
  `maHD_chiTiet` int NOT NULL,
  `ma_HoaDon` int DEFAULT NULL,
  `ma_SP` int DEFAULT NULL,
  `soLuongMua` int DEFAULT NULL,
  PRIMARY KEY (`maHD_chiTiet`),
  KEY `ma_HoaDon` (`ma_HoaDon`),
  KEY `ma_SP` (`ma_SP`),
  CONSTRAINT `chitiet_hoadon_ibfk_1` FOREIGN KEY (`ma_HoaDon`) REFERENCES `hoadon` (`maHoaDon`),
  CONSTRAINT `chitiet_hoadon_ibfk_2` FOREIGN KEY (`ma_SP`) REFERENCES `sanpham` (`maSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiet_hoadon`
--

LOCK TABLES `chitiet_hoadon` WRITE;
/*!40000 ALTER TABLE `chitiet_hoadon` DISABLE KEYS */;
INSERT INTO `chitiet_hoadon` VALUES (1,120954,3,40),(2,120954,1,20),(3,120955,2,100),(4,120956,4,6),(6,120956,1,10),(7,120957,2,50);
/*!40000 ALTER TABLE `chitiet_hoadon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-20 22:55:35
