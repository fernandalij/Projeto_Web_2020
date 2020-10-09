CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `dateUpdated` date DEFAULT NULL,
  `typeTask` varchar(100) DEFAULT NULL,
  `assignedTo` varchar(100) DEFAULT NULL,
  `dateConclusion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
