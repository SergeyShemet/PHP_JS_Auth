-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: php_js_login_page
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `session_uuids` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Администратор','admin@domain.com','admin','$2y$10$TWyIe1vwMdFT7kScptYig.gpil1/UMTekfqjazAoH/J/AUrbjG.xK','1984-06-06','','https://images.unsplash.com/photo-1588534331122-77ac46322dd2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzN8fGFkbWlufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'),(2,'Carlotta Dietrich','braun.meggie@example.com','user1','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=688&q=80'),(3,'Miss Grace Marquardt','grant.dewitt@example.com','user2','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1975-03-04','','https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(4,'Mr. Bobbie Emard DDS','timmothy.yundt@example.net','user3','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1574100004472-e536d3b6bacc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(5,'Derek Hegmann','ziemann.ashtyn@example.com','user4','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1975-03-04','','https://images.unsplash.com/photo-1498758536662-35b82cd15e29?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=688&q=80'),(6,'Dr. Elza Kessler III','archibald22@example.net','user5','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1975-03-04','','https://images.unsplash.com/photo-1573497620166-aef748c8c792?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(7,'Schuyler Cole DVM','cordie31@example.org','user6','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://plus.unsplash.com/premium_photo-1663011704585-2188c0ebc2aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),(8,'Prof. Malvina Hyatt Sr.','abby.howell@example.org','user7','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1524758870432-af57e54afa26?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(9,'Prof. Vito Wilderman','hermiston.daron@example.net','user8','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://plus.unsplash.com/premium_photo-1670872717061-fc5fab920ba6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),(10,'Kenneth Turcotte','ukling@example.org','user9','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1560250056-07ba64664864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1451&q=80'),(11,'Prof. Anastacio Kautzer MD','steuber.keagan@example.net','user10','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1975-03-04','','https://images.unsplash.com/photo-1507207611509-ec012433ff52?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(12,'Dr. Armani Kassulke','clyde39@example.net','user11','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1543269664-56d93c1b41a6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),(13,'Tod Stanton','simonis.christiana@example.com','user12','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1975-03-04','','https://plus.unsplash.com/premium_photo-1664301548366-f5402468cef2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(14,'Deondre McGlynn V','uturner@example.org','user13','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1975-03-04','','https://images.unsplash.com/photo-1507206130118-b5907f817163?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(15,'Angeline Jones PhD','waltenwerth@example.org','user14','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1484863137850-59afcfe05386?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80'),(16,'Ms. Twila Zulauf','zoila.kozey@example.net','user15','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1975-03-04','','https://images.unsplash.com/photo-1573164713988-8665fc963095?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1469&q=80'),(17,'Davon Klocko','triston51@example.org','user16','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(18,'Maye Kemmer','fritsch.jocelyn@example.org','user17','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1533749871411-5e21e14bcc7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80'),(19,'Colt Steuber','tillman.bruen@example.org','user18','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(20,'Coleman Reynolds MD','jocelyn49@example.net','user19','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1995-03-04','','https://images.unsplash.com/photo-1507914464562-6ff4ac29692f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),(21,'Citlalli Hayes MD','qreichel@example.org','user20','$2a$12$ZHxqC9NArrvXc.Jmbvbb.O9xu/m5hWQEFtrdZyUOiu/KKn6AR0EOu','1975-03-04','','https://images.unsplash.com/photo-1543269665-7821011040ee?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26 21:10:18
