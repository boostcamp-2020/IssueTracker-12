-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 101.101.217.148    Database: IssueTracker
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.16.04.1

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
-- Table structure for table `Assignee`
--

DROP TABLE IF EXISTS `Assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignee` (
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`user_id`),
  KEY `fk_Issue_has_User_User1_idx` (`user_id`),
  KEY `fk_Issue_has_User_Issue1_idx` (`issue_id`),
  CONSTRAINT `fk _Assignee_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignee_Issue` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignee`
--

LOCK TABLES `Assignee` WRITE;
/*!40000 ALTER TABLE `Assignee` DISABLE KEYS */;
INSERT INTO `Assignee` VALUES (4,1),(7,2),(122,5),(4,6),(6,34),(122,34),(7,37),(4,38);
/*!40000 ALTER TABLE `Assignee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `writer_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `write_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_issue_content` tinyint(4) NOT NULL COMMENT '        column',
  `issue_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`,`issue_id`),
  KEY `fk_Comment_Issue_idx` (`issue_id`),
  KEY `fk_Comment_User_idx` (`writer_id`),
  CONSTRAINT `fk_Comment_Issue` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_User` FOREIGN KEY (`writer_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (53,38,'댓글을 츄가해주세요 tnwjd','2020-11-13 01:21:30',0,5),(54,37,'Haha','2020-11-13 01:06:39',0,6),(55,37,'?? Hahha','2020-11-13 01:21:51',1,112),(56,38,'dkdkdkdkdk','2020-11-13 01:08:02',0,7),(57,38,'추추추추가 higu','2020-11-13 01:40:34',0,8),(58,38,'코코코코코지마','2020-11-13 01:10:10',1,113),(59,38,'테스트 테테테스트','2020-11-13 01:19:09',0,13),(60,37,'Test','2020-11-13 01:40:41',0,8),(61,37,'New issue','2020-11-13 01:41:19',1,114),(62,5,'오 \n오','2020-11-13 04:07:28',1,115),(63,34,'오타..... **테스트**','2020-11-13 04:42:18',1,122),(64,37,'안녕하세요','2020-11-13 05:00:10',0,5),(65,37,'**댓글추가 가능합니다!!**','2020-11-13 05:01:07',0,122),(66,37,'댓글 추가가능합ㄴ다','2020-11-13 05:02:30',0,4),(67,37,'이슈 닫기도 가능합니다!','2020-11-13 05:03:29',0,4),(68,37,'**ㅌㅎㅎ아아아**\n##제목\n우아','2020-11-15 07:34:13',1,123),(69,37,'댓글추가','2020-11-15 07:34:35',0,123);
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Issue`
--

DROP TABLE IF EXISTS `Issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Issue` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `writer_id` varchar(45) NOT NULL,
  `write_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(45) NOT NULL,
  `is_open` tinyint(4) NOT NULL DEFAULT '1',
  `milestone_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `fk_Issue_Milestone` (`milestone_id`),
  CONSTRAINT `fk_Issue_Milestone` FOREIGN KEY (`milestone_id`) REFERENCES `Milestone` (`milestone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issue`
--

LOCK TABLES `Issue` WRITE;
/*!40000 ALTER TABLE `Issue` DISABLE KEYS */;
INSERT INTO `Issue` VALUES (4,'1','2020-11-15 07:35:09','update issue title',1,49),(5,'1','2020-11-12 15:10:38','new year issue_수정',0,33),(6,'1','2020-11-13 01:06:50','new year issue bye',1,33),(7,'1','2020-11-12 14:23:05','test',1,34),(8,'1','2020-11-13 01:09:16','test this 얍얍',0,34),(9,'1','2020-11-10 15:09:44','test this',0,34),(13,'1','2020-11-03 05:21:54','new new',1,33),(14,'1','2020-11-03 05:21:54','asdf',1,33),(16,'1','2020-11-11 14:30:10','ff',0,33),(17,'1','2020-11-13 01:41:00','new new',0,33),(28,'1','2020-11-13 01:41:00','new nefffw',0,33),(34,'1','2020-11-13 04:44:59','new nefffw',0,NULL),(35,'1','2020-11-03 05:21:54','new nefffw',1,NULL),(41,'1','2020-11-03 05:21:54','new nefffw',1,33),(42,'1','2020-11-03 05:21:54','new nefffw',1,33),(102,'5','2020-11-12 15:49:23','test',1,NULL),(103,'5','2020-11-12 15:50:11','!!!!!!!',1,NULL),(104,'5','2020-11-12 15:51:51','??????',1,NULL),(105,'5','2020-11-12 15:56:11','title',1,NULL),(106,'5','2020-11-12 15:59:28','qweqweqweqwe',1,NULL),(107,'5','2020-11-12 15:59:55','qwe',1,NULL),(108,'37','2020-11-12 16:21:24','Final New Issue',1,33),(109,'5','2020-11-12 16:02:03','qazz',1,NULL),(110,'5','2020-11-12 16:03:18','>>>>>>',1,NULL),(111,'5','2020-11-15 07:34:50','swon test',0,NULL),(112,'37','2020-11-15 07:34:50','Comment Issue',0,NULL),(113,'38','2020-11-13 01:10:10','새로운 이슈를 찾아보자',1,NULL),(114,'37','2020-11-13 01:41:18','iPhoneTest',1,NULL),(115,'5','2020-11-12 16:07:27','mobile test',1,NULL),(116,'5','2020-11-13 04:12:31','',0,NULL),(117,'5','2020-11-13 04:13:11','',1,50),(118,'5','2020-11-13 04:37:35','new issue',1,47),(119,'5','2020-11-13 04:37:35','title issue !!',1,48),(120,'5','2020-11-13 04:15:45','view-comlete',0,47),(121,'5','2020-11-13 04:38:17','뉴이슈입니다',1,50),(122,'34','2020-11-13 04:42:18','모두 수고많았습ㄴ다.',1,34),(123,'37','2020-11-15 07:34:43','하이',0,NULL);
/*!40000 ALTER TABLE `Issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Issue_Label`
--

DROP TABLE IF EXISTS `Issue_Label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Issue_Label` (
  `label_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  PRIMARY KEY (`label_id`,`issue_id`),
  KEY `fk_Label_has_Issue_Issue1_idx` (`issue_id`),
  KEY `fk_Label_has_Issue_Label1_idx` (`label_id`),
  CONSTRAINT `fk_Issue_Label_Issue` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Issue_Label_Label` FOREIGN KEY (`label_id`) REFERENCES `Label` (`label_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issue_Label`
--

LOCK TABLES `Issue_Label` WRITE;
/*!40000 ALTER TABLE `Issue_Label` DISABLE KEYS */;
INSERT INTO `Issue_Label` VALUES (107,4),(108,6),(107,7),(108,7),(109,7),(110,7),(112,7),(108,117),(108,118),(107,119),(109,119),(108,120),(108,121),(109,121),(107,122),(108,122),(112,122);
/*!40000 ALTER TABLE `Issue_Label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Label`
--

DROP TABLE IF EXISTS `Label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `color` varchar(10) NOT NULL,
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Label`
--

LOCK TABLES `Label` WRITE;
/*!40000 ALTER TABLE `Label` DISABLE KEYS */;
INSERT INTO `Label` VALUES (107,'lastDay','','#44634a'),(108,'test','','#bd4c13'),(109,'label !!!','test','#f77771'),(110,'뉴라벨','설명','#7151e2'),(112,'ios','ios','#a9d700');
/*!40000 ALTER TABLE `Label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Milestone`
--

DROP TABLE IF EXISTS `Milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Milestone` (
  `milestone_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `due_date` date NOT NULL,
  `content` text,
  PRIMARY KEY (`milestone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Milestone`
--

LOCK TABLES `Milestone` WRITE;
/*!40000 ALTER TABLE `Milestone` DISABLE KEYS */;
INSERT INTO `Milestone` VALUES (33,'new_year_milestone','2020-12-31','happy new year'),(34,'iOS-complete','1995-11-11','iOS complete'),(47,'view-complete','2020-11-13','iOS view complete'),(48,'long long milestone title','2020-12-13','dkdkdk'),(49,'project','1999-12-12','new project'),(50,'testMilestone','2077-12-12','싸이버펑크');
/*!40000 ALTER TABLE `Milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `social` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'githubtest','github'),(2,'appletest','apple'),(5,'JungSWon','github'),(6,'j03y14','github'),(34,'001572','apple'),(37,'devilzCough','github'),(38,'rnfxl92','github'),(39,'SeunghyoKu','github');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-19 23:49:39
