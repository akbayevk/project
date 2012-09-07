-- MySQL dump 10.13  Distrib 5.5.23, for osx10.6 (i386)
--
-- Host: localhost    Database: gmaps_development
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` varchar(255) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_admin_notes_on_resource_type_and_resource_id` (`resource_type`,`resource_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@example.com','$2a$10$nM9zl/erfydJ2PV53CBVBuHpy8LHXUf5VP0RvulfLEsmQdXxArfU2',NULL,NULL,NULL,14,'2012-09-06 11:49:45','2012-08-29 14:07:28','127.0.0.1','127.0.0.1','2012-07-02 23:31:05','2012-09-06 11:49:45'),(2,'academicsabroad@gmail.com','$2a$10$A16N2ZGyxfUSwDMuTev7yOmXFx5Ov/NrVL0orCSoZuSdAruBfUpTC','5PacK8eynXv6wqKez7sU','2012-09-06 16:46:10',NULL,1,'2012-09-06 16:52:09','2012-09-06 16:52:09','127.0.0.1','127.0.0.1','2012-09-03 17:33:10','2012-09-06 16:52:09');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `event_detail_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,NULL,'http://joshua.smcvt.edu/linearalgebra/',17,'2012-09-07 07:36:23','2012-09-07 07:36:23'),(2,NULL,'http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1000204',22,'2012-09-07 07:45:57','2012-09-07 07:45:57'),(3,NULL,'http://conversations.nokia.com/2012/09/06/an-apology-is-due/',23,'2012-09-07 08:00:06','2012-09-07 08:00:06'),(4,NULL,'http://www.cs.man.ac.uk/~toby/papers/cyberpsychology2006.pdf',24,'2012-09-07 08:07:03','2012-09-07 08:07:03');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `gmaps` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (34,'Berlin conference','Hotel Berlin, Borgfelder Straße, Hamburg, Germany',9.99368,53.5511,1,'2012-09-06 16:06:25','2012-09-06 16:06:25',4),(47,'Defrosting the Digital Library','dublin, ireland',-6.26008,53.3494,1,'2012-09-07 07:40:22','2012-09-07 07:40:22',3),(48,'Nokia development','san jose, usa',-121.895,37.3394,1,'2012-09-07 07:55:13','2012-09-07 08:10:51',5),(49,'Immersive Virtual Reality','75006 Paris, France',2.33542,48.8489,1,'2012-09-07 08:02:30','2012-09-07 08:02:30',3);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_details`
--

DROP TABLE IF EXISTS `event_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `character_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_details`
--

LOCK TABLES `event_details` WRITE;
/*!40000 ALTER TABLE `event_details` DISABLE KEYS */;
INSERT INTO `event_details` VALUES (17,'Numerical linear algebra','Numerical Linear Algebra is a flourishing research area, with worldwide activity including theoretical work, development of algorithms (for both serial and parallel computers) and software development. Our work is in all these areas, with current efforts focusing on generalized and quadratic eigenvalue problems and associated pseudospectra, analysis and computation of matrix functions, and analysis of the accuracy and numerical stability of algorithms.','2012-09-06 16:11:06','2012-09-07 07:31:49','2012-09-01','2012-09-04',34),(22,'Bibliographic Tools for the Next Generation Web','We illustrate the current process of using these libraries with a typical workflow, and highlight problems with managing data and metadata using URIs. We then examine a range of new applications such as Zotero, Mendeley, Mekentosj Papers, MyNCBI, CiteULike, Connotea, and HubMed that exploit the Web to make these digital libraries more personal, sociable, integrated, and accessible places. We conclude with how these applications may begin to help achieve a digital defrost, and discuss some of the issues that will help or hinder this in terms of making libraries on the Web warmer places in the future, becoming resources that are considerably more useful to both humans and machines.','2012-09-07 07:41:25','2012-09-07 07:41:25','2012-09-04','2012-09-07',47),(23,'Nokia new products','NOKIA has unveiled what it hopes will be a rival to Apple’s upcoming iPhone 5 - the Lumia 920. So what can we expect?\r\n\r\nThe 920 is the Nokia flagship for Windows 8 phone OS and comes with a Qualcomm Snapdragon S4 dual-core processor for no-lag, smooth operation.\r\n\r\nThe handset is slick and glossy but with a super-tough case that comes in a selection of contemporary new colours including red, yellow and grey.\r\n\r\nIts 4.5” WXGA LCD screen with PureMotion HD+ is clear and flicker-free and an updated version of Nokia’s ClearBlack technology improves viewing in bright sunlight.','2012-09-07 08:00:06','2012-09-07 08:00:06','2012-09-03','2012-09-07',48),(24,'Rehabilitative Technology for Phantom Limb Experience','This work builds upon prior research using mir- ror box therapy to induce vivid sensations of movement originating from the muscles and joints of amputees’ phantom limbs. The present project transposes movements of amputees’ anatomical limbs into movements of a virtual limb presented in the phenomenal space of their phantom limb. ','2012-09-07 08:03:13','2012-09-07 08:08:15','2012-08-27','2012-09-01',49);
/*!40000 ALTER TABLE `event_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `character_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (3,'Berlin conference','2012-09-01 00:00:00','2012-09-04 00:00:00','2012-09-07 07:36:23','2012-09-07 07:36:23',34),(4,'Bibliographic Tools for the Next Generation Web','2012-09-04 00:00:00','2012-09-07 00:00:00','2012-09-07 07:41:25','2012-09-07 07:41:25',47),(5,'Nokia new products','2012-09-03 00:00:00','2012-09-07 00:00:00','2012-09-07 08:00:06','2012-09-07 08:00:06',48),(6,'Rehabilitative Technology for Phantom Limb Experience','2012-08-27 00:00:00','2012-09-01 00:00:00','2012-09-07 08:03:13','2012-09-07 08:08:15',49);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `event_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1,'<a href=\"http://www.flickr.com/photos/ewancross/3022651569/\" title=\"Linear Algebra by Ewan Cross, on Flickr\"><img src=\"http://farm4.staticflickr.com/3003/3022651569_10f38da5a6.jpg\" width=\"500\" height=\"485\" alt=\"Linear Algebra\"></a>','2012-09-07 07:36:23','2012-09-07 07:36:23',17),(2,'<a href=\"http://www.flickr.com/photos/91369701@N00/295234725/\" title=\"Linera Algebra I by tobias.munich, on Flickr\"><img src=\"http://farm1.staticflickr.com/120/295234725_17588573cc.jpg\" width=\"500\" height=\"333\" alt=\"Linera Algebra I\"></a>','2012-09-07 07:36:23','2012-09-07 07:36:23',17),(3,'<a href=\"http://www.flickr.com/photos/imaginecup/4774350445/\" title=\"Winners Announcements – Next Generation Web Award, Opera House July 8th 2010 by ImagineCup, on Flickr\"><img src=\"http://farm5.staticflickr.com/4097/4774350445_7504475a2a.jpg\" width=\"500\"','2012-09-07 07:43:44','2012-09-07 07:43:44',22),(4,'<a href=\"http://www.flickr.com/photos/28978275@N06/3251263768/\" title=\"DSC00288 by Yoshitaka Tokusho, on Flickr\"><img src=\"http://farm4.staticflickr.com/3507/3251263768_b7c8fd64f0.jpg\" width=\"500\" height=\"375\" alt=\"DSC00288\"></a>','2012-09-07 07:43:44','2012-09-07 07:43:44',22),(5,'<a href=\"http://www.flickr.com/photos/adunne/2961288834/\" title=\"Dion Hinchcliffe in the &quot;Building Successful Next Generation Web 2.0 Applications&quot; workshop by Alex Dunne, on Flickr\"><img src=\"http://farm4.staticflickr.com/3144/2961288834_2cb93f','2012-09-07 07:43:44','2012-09-07 07:43:44',22),(6,'<a href=\"http://www.flickr.com/photos/nokia-fan/7202127900/\" title=\"nokia-lumia-800 by nokiafan, on Flickr\"><img src=\"http://farm8.staticflickr.com/7091/7202127900_014ce18b3d.jpg\" width=\"500\" height=\"333\" alt=\"nokia-lumia-800\"></a>','2012-09-07 08:00:06','2012-09-07 08:00:06',23),(7,'<a href=\"http://www.flickr.com/photos/21654950@N06/6400830863/\" title=\"Nokia lumia 800 banner flag by Brainimpact, on Flickr\"><img src=\"http://farm7.staticflickr.com/6101/6400830863_2d67e38e3b.jpg\" width=\"375\" height=\"500\" alt=\"Nokia lumia 800 banner flag','2012-09-07 08:00:06','2012-09-07 08:00:06',23),(8,'<a href=\"http://www.flickr.com/photos/whodat7/401021566/\" title=\"virtual reality by whodat7, on Flickr\"><img src=\"http://farm1.staticflickr.com/159/401021566_30e17c9426.jpg\" width=\"375\" height=\"500\" alt=\"virtual reality\"></a>','2012-09-07 08:07:03','2012-09-07 08:07:03',24),(9,'<a href=\"http://www.flickr.com/photos/samuel-huron/2408078384/\" title=\"Pierre Henon in virtual Reality by Samuel Huron, on Flickr\"><img src=\"http://farm3.staticflickr.com/2306/2408078384_e68e020bbd.jpg\" width=\"333\" height=\"500\" alt=\"Pierre Henon in virtua','2012-09-07 08:07:03','2012-09-07 08:07:03',24);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2012-07-29 17:13:19','2012-07-29 17:13:19'),(2,'user','2012-07-29 17:13:53','2012-07-29 17:13:53');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120417125635'),('20120419094145'),('20120523222452'),('20120620200402'),('20120621160116'),('20120621165409'),('20120625170613'),('20120626134700'),('20120626134734'),('20120702124915'),('20120702130109'),('20120702131350'),('20120702131422'),('20120702134833'),('20120702152351'),('20120702152527'),('20120702163057'),('20120702205010'),('20120702205053'),('20120702205125'),('20120702205152'),('20120702232737'),('20120703002745'),('20120703002746'),('20120703002747'),('20120703002748'),('20120703002749'),('20120703002750'),('20120703002751'),('20120703002752'),('20120703002753'),('20120703002754'),('20120703002755'),('20120703002756'),('20120703005900'),('20120706163006'),('20120706163918'),('20120706164324'),('20120706164540'),('20120706205919'),('20120706210320'),('20120712094649'),('20120712101521'),('20120712101629'),('20120712101820'),('20120729165541'),('20120729165745'),('20120729172722'),('20120806000426'),('20120806000527');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `screen_name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tweet_created_date` date DEFAULT NULL,
  `event_detail_id` int(11) DEFAULT NULL,
  `tweet_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (1,'UoMStaffNet','Calling all managers - last few places left for managing in the round  http://t.co/kIryEjGT','2012-09-07 07:32:01','2012-09-07 07:32:01','2012-09-06',17,'243632544086626304'),(2,'UoMStaffNet','@HCRInstitute Clare Short to give HCRI Inaugural Annual Lecture http://t.co/U6KBkGrd','2012-09-07 07:32:01','2012-09-07 07:32:01','2012-09-05',17,'243328544334290945'),(3,'UoMStaffNet','Manchester’s #Cycling superstar Sarah Storey celebrates her 3rd gold in  women\'s Individual C 5 Time Trial http://t.co/MQuPOIWa #paralympics','2012-09-07 07:32:01','2012-09-07 07:32:01','2012-09-05',17,'243325729578819585'),(4,'UoMStaffNet','@UoMITS Problem with log-in page to staff portal http://t.co/VZ3PnBDN','2012-09-07 07:32:01','2012-09-07 07:32:01','2012-09-05',17,'243324779799650304'),(5,'UoMStaffNet','Study part-time for IELTS or Cambridge ESOL exams  http://t.co/qert1K4U','2012-09-07 07:32:01','2012-09-07 07:32:01','2012-09-05',17,'243298345987239936'),(6,'UoMStaffNet','Join the staff association and enjoy trips to theatre #umsa  http://t.co/bzl3Wudv','2012-09-07 07:32:01','2012-09-07 07:32:01','2012-09-05',17,'243297888589975552'),(7,'UoMStaffNet','Wedding open day #chancellorshotel and chance to win luxury overnight stay!  http://t.co/SVT5mqvn','2012-09-07 07:32:01','2012-09-07 07:32:01','2012-09-05',17,'243297527653363712'),(8,'UoMStaffNet','Free eye tests for UoM staff  http://t.co/PkJMrICL','2012-09-07 07:32:01','2012-09-07 07:32:01','2012-09-05',17,'243296967881535488'),(9,'UoMStaffNet','@OfficialTfGM Consultation on 12 September, Oxford Rd corridor bus routes and streets affected #BusPriority','2012-09-07 07:32:01','2012-09-07 07:32:01','2012-09-05',17,'243296621427838978'),(10,'srp','@gbilder on the plus side it means you can catch the shipping forecast on #radio4.','2012-09-07 07:46:02','2012-09-07 07:46:02','2012-09-07',22,'243927050698764288'),(101,'philipmcdermott','An Eichler home, no less!','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-07',23,'243949186473676800'),(102,'philipmcdermott','Currently chilling out in a crazy San Jose house with my cousin and some amazing cats. #holiday','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-07',23,'243948692246233088'),(103,'philipmcdermott','About the same intensity as it was to see first hand...  @ West Cliff Drive http://t.co/WS4IUGbr','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-07',23,'243948198710878208'),(104,'philipmcdermott','@parislemon @mulligan I upgraded tweetbot alpha to beta and got that logging in issue :(','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-07',23,'243945297263349760'),(105,'philipmcdermott','We were just driving past… http://t.co/j5hyW8mZ','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-07',23,'243876574909329408'),(106,'philipmcdermott','Right, San Jose here we come! Umm…','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-06',23,'243849173567422464'),(107,'philipmcdermott','@daringfireball  my guess is they’ll drop whatever can’t run iOS 6 - they’ll never want to offer &gt; 1 version of iOS at once.','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-06',23,'243845747081105408'),(108,'philipmcdermott','The one thing Apple’s competitors have learned since the Surface announcement is to only announce new hardware with a price and a date.','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-06',23,'243732467251548161'),(109,'philipmcdermott','@HaroldM88 TOO LATE!!! #clickedOnPenis','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-06',23,'243727921380990976'),(110,'philipmcdermott','@jimh seriously though: iPhone has s/w anti shake to smooth video. Thought Lumia one was s/w too, but if it is in h/w that’s obv different.','2012-09-07 08:00:09','2012-09-07 08:00:09','2012-09-06',23,'243727580027572225'),(111,'philipmcdermott','@jimh do you mean the camera is mounted on a spring system in a car and driven along next to you? :P','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-06',23,'243727191077163009'),(112,'philipmcdermott','Clinton\'s speech: it\'ll make you have a little bit of hope for American politics again http://t.co/Wt7DUW7n','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-06',23,'243565239839371264'),(113,'philipmcdermott','I’m honestly not being a troll, or sarcastic, or funny. But: is the image stabilisation on the new Lumia like what the iPhone 4S has?','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-06',23,'243515471452831746'),(114,'philipmcdermott','Apology, or another advertorial? RT @edbott: An apology is due - Conversations by Nokia http://t.co/HteYTd11','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-06',23,'243514458264195072'),(115,'philipmcdermott','Someone has to say it… #penis  RT @alice__: Introducing the Banana Slug...  @ Henry Cowell State Park http://t.co/arwAzpVY','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-05',23,'243480593109762049'),(116,'philipmcdermott','God’s speed! MT @DrNancyMalik: Simon Singh,Martin Robbins, Senseabtsci pushing homeopathy out from UK http://t.co/shfF6Ba3','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-05',23,'243368076853276672'),(117,'philipmcdermott','@mjrobbins “is only engaging in a silly game of semantics in order to convince the average Guardian reader, who is inherently uninformed” :)','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-05',23,'243367637751578625'),(118,'philipmcdermott','@jonronson awesome!','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-05',23,'243166344583995392'),(119,'philipmcdermott','Inconspicuous. http://t.co/N1rDE5hf','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-05',23,'243163544307240961'),(120,'philipmcdermott','@RedDread I was a click away from getting a 7 - don’t quite need between phone and kindle. I do sometimes forget my iPhone can make calls…','2012-09-07 08:00:10','2012-09-07 08:00:10','2012-09-05',23,'243161907043913728'),(136,'srp','Having a bit of a run on geeky hotel room numbers it seems http://t.co/pbxJ4AFC','2012-09-07 08:03:44','2012-09-07 08:03:44','2012-09-01',24,'241977211043840000'),(165,'srp','Couldn\'t find my hotel room #geek http://t.co/TEOSa02h','2012-09-07 08:08:18','2012-09-07 08:08:18','2012-08-29',24,'240905312092188672'),(166,'srp','@philipmcdermott I really don\'t want to think about it.','2012-09-07 08:08:18','2012-09-07 08:08:18','2012-08-28',24,'240558493428490241'),(167,'srp','@philipmcdermott I believe it\'s so much better made with strong cheese #noitreallyisnt #notagoodmemory','2012-09-07 08:08:18','2012-09-07 08:08:18','2012-08-28',24,'240545187078742016');
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'steve','6cff1f647efc4cb398106007a3221b68640e973d27a7d28e800a8e0542fa057e','703214121074000.6104273772830185','2012-07-01 21:17:49','2012-07-29 17:23:45','srp',2),(4,'uom','76ad091c1bb7a5a874ad790428c2113bfeb5823d0e05c06990e0bae658df101d','702791536431600.46537359549919555','2012-09-06 16:04:45','2012-09-06 16:04:45','UoMStaffNet',1),(5,'Philip','b7771bfe66efb48f429076c634ab4be598d48cc6cc0b1bf4c15a37f7276c5b2c','703310124511200.3758651609634609','2012-09-07 07:53:41','2012-09-07 07:53:41','philipmcdermott',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `event_detail_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,NULL,'<iframe width=\"420\" height=\"315\" src=\"http://www.youtube.com/embed/ZK3O402wf1c\" frameborder=\"0\" allowfullscreen></iframe>',17,'2012-09-07 07:36:23','2012-09-07 07:36:23'),(2,NULL,'<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/tyf3-1Xe_lU\" frameborder=\"0\" allowfullscreen></iframe>',22,'2012-09-07 07:45:57','2012-09-07 07:45:57'),(3,NULL,'<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/6HSbhyaH0vw\" frameborder=\"0\" allowfullscreen></iframe>',23,'2012-09-07 08:00:06','2012-09-07 08:00:06'),(4,NULL,'<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/7vcGqha6xJ0\" frameborder=\"0\" allowfullscreen></iframe>',24,'2012-09-07 08:07:03','2012-09-07 08:07:03');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-07  9:26:25
