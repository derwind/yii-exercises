SET FOREIGN_KEY_CHECKS=0;

--
-- Table structure for table 'book'
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `notes` text,
  `signed` tinyint(1) DEFAULT NULL,
  `grade_id` int(10) unsigned DEFAULT NULL,
  `bagged` tinyint(1) DEFAULT NULL,
  `publisher_id` int(10) unsigned DEFAULT NULL,
  `issue_number` varchar(10) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `grade_id` (`grade_id`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `book_ibfk_3` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
INSERT INTO `book` VALUES (1,'Batman',2,'2012-05-08',50.00,3.00,'',0,1,1,NULL,NULL),(2,'The Amazing Spider Man',1,'2012-02-13',10.00,3.00,'This book is awesome. ',1,1,1,NULL,NULL),(3,'X-Men',3,'0000-00-00',5.00,1.00,'Awesome',1,6,0,1,NULL),(4,'Sandman',1,'2012-05-17',8.00,3.00,'',0,2,0,1,NULL),(5,'Green Lantern',3,'2012-05-01',3.00,3.00,'',0,1,0,NULL,NULL),(6,'Witchblade',3,'2000-03-01',15.00,2.00,'',0,1,1,1,NULL),(7,'300',2,'2002-10-01',15.00,3.00,'',0,6,0,1,NULL),(8,'Wolverine',3,'1982-05-01',67.00,1.00,'',1,1,1,1,NULL),(9,'Stardust',1,'0000-00-00',0.00,0.00,'',0,1,0,NULL,NULL),(12,'Hellboy',1,'2012-05-24',10000.00,10000.00,'best evarh',1,1,1,NULL,'3'),(13,'Hellboy',1,'2012-05-01',10000.00,10000.00,'super',1,1,1,1,'4'),(14,'Test Book',1,'2012-06-15',3.00,7.00,'so great',0,1,0,1,'3');
UNLOCK TABLES;

--
-- Table structure for table `bookauthor`
--

DROP TABLE IF EXISTS `bookauthor`;
CREATE TABLE `bookauthor` (
  `book_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `bookauthor_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookauthor_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookauthor`
--

LOCK TABLES `bookauthor` WRITE;
INSERT INTO `bookauthor` VALUES (10,1),(12,5),(13,6),(12,31),(1,216);
UNLOCK TABLES;

--
-- Table structure for table `bookillustrator`
--

DROP TABLE IF EXISTS `bookillustrator`;
CREATE TABLE `bookillustrator` (
  `book_id` int(10) unsigned NOT NULL,
  `illustrator_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`book_id`,`illustrator_id`),
  KEY `illustrator_id` (`illustrator_id`),
  CONSTRAINT `bookillustrator_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookillustrator_ibfk_2` FOREIGN KEY (`illustrator_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookillustrator`
--

LOCK TABLES `bookillustrator` WRITE;
INSERT INTO `bookillustrator` VALUES (10,2),(10,3);
UNLOCK TABLES;

--
-- Table structure for table `booktag`
--

DROP TABLE IF EXISTS `booktag`;
CREATE TABLE `booktag` (
  `book_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`book_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `booktag_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  CONSTRAINT `booktag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booktag`
--

LOCK TABLES `booktag` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
INSERT INTO `grade` VALUES (1,'mint'),(2,'near mint'),(3,'very fine'),(4,'fine'),(5,'very good'),(6,'good'),(7,'fair'),(8,'poor');
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(64) NOT NULL,
  `lname` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
INSERT INTO `person` VALUES (1,'Comic','Fan'),(2,'Illus','Trato'),(3,'Manga','Maniac'),(5,'Mike','Comic'),(6,'Comic','Writer'),(31,'Lauren','Person'),(216,'Bob','Miller'),(226,'Joe','Jones'),(227,'John','Smith'),(237,'Best','Friend'),(238,'Another','Friend'),(240,'Test','WishGiver');
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
INSERT INTO `publisher` VALUES (1,'Pub Co');
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
INSERT INTO `type` VALUES (1,'trade'),(2,'graphic novel'),(3,'issue');
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `pwd_hash` varchar(64) NOT NULL,
  `person_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `userperson_ibfk_2` (`person_id`),
  CONSTRAINT `userperson_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'admin','$1$3hLcBLJq$nly6jlBLe5UB8iAKm46is.',1),(52,'borrower','$1$3hLcBLJq$nly6jlBLe5UB8iAKm46is.',237),(53,'afriend','$1$3hLcBLJq$nly6jlBLe5UB8iAKm46is.',238),(54,'twg','$1$3hLcBLJq$nly6jlBLe5UB8iAKm46is.',240);
UNLOCK TABLES;

--
-- Table structure for table `wish`
--

DROP TABLE IF EXISTS `wish`;
CREATE TABLE `wish` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `issue_number` varchar(10) DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `publisher_id` int(10) unsigned DEFAULT NULL,
  `store_link` varchar(255) DEFAULT NULL,
  `notes` text,
  `got_it` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `got_it` (`got_it`),
  CONSTRAINT `wish_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `wish_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  CONSTRAINT `wish_ibfk_3` FOREIGN KEY (`got_it`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wish`
--

LOCK TABLES `wish` WRITE;
INSERT INTO `wish` VALUES (1,'Moebius\' Airtight Garage Vol.1','1',1,'0000-00-00',NULL,'http://www.amazon.com/Moebius-Airtight-Garage-Vol-1-No/dp/B00178YGFE/ref=sr_1_3?s=books&ie=UTF8&qid=1339476850&sr=1-3','',NULL),(2,'The Squiddy Avenger','1',1,'2012-06-21',1,'www.amazon.com','',53),(3,'another great title','',1,'2012-06-21',NULL,'','',52);
UNLOCK TABLES;

--
-- Table structure for table `wishauthor`
--

DROP TABLE IF EXISTS `wishauthor`;
CREATE TABLE `wishauthor` (
  `wish_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`wish_id`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `wishauthor_ibfk_1` FOREIGN KEY (`wish_id`) REFERENCES `wish` (`id`),
  CONSTRAINT `wishauthor_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishauthor`
--

LOCK TABLES `wishauthor` WRITE;
INSERT INTO `wishauthor` VALUES (2,226),(1,227);
UNLOCK TABLES;

--
-- Table structure for table `wishillustrator`
--

DROP TABLE IF EXISTS `wishillustrator`;
CREATE TABLE `wishillustrator` (
  `wish_id` int(10) unsigned NOT NULL,
  `illustrator_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`wish_id`,`illustrator_id`),
  KEY `illustrator_id` (`illustrator_id`),
  CONSTRAINT `wishillustrator_ibfk_1` FOREIGN KEY (`wish_id`) REFERENCES `wish` (`id`),
  CONSTRAINT `wishillustrator_ibfk_2` FOREIGN KEY (`illustrator_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishillustrator`
--

LOCK TABLES `wishillustrator` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `wishpublisher`
--

DROP TABLE IF EXISTS `wishpublisher`;
CREATE TABLE `wishpublisher` (
  `wish_id` int(10) unsigned NOT NULL,
  `publisher_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`wish_id`,`publisher_id`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `wishpublisher_ibfk_1` FOREIGN KEY (`wish_id`) REFERENCES `wish` (`id`),
  CONSTRAINT `wishpublisher_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishpublisher`
--

LOCK TABLES `wishpublisher` WRITE;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=1;
