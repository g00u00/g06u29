DROP TABLE IF EXISTS `pet2`;
CREATE TABLE IF NOT EXISTS `pet2` 
(
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ;
DESCRIBE `pet`;
