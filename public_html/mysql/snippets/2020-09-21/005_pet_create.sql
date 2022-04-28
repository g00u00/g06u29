USE `g06u29`;
CREATE TABLE `g06u29_pet` (
  `g06u29_name` varchar(20) NOT NULL DEFAULT '',
  `g06u29_owner` enum('Harold','Gwen','Benny','Diane') DEFAULT NULL,
  `g06u29_species` varchar(20) DEFAULT NULL,
  `g06u29_sex` char(1) DEFAULT NULL,
  `g06u29_color` char(1) DEFAULT NULL,
  `g06u29_cost` decimal(10,2) DEFAULT '1000000.00',
  `g06u29_birth` date DEFAULT NULL,
  `g06u29_death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DESC `g06u29_pet`;
