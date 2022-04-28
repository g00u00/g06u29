-- CREATE DATABASE `g06u29`;
USE `g06u29`;
DROP TABLE IF EXISTS `g06u29_pet`;
CREATE TABLE IF NOT EXISTS `g06u29_pet` (
    `g06u29_name` VARCHAR(20) NOT NULL DEFAULT '',
    `g06u29_owner`   ENUM('Harold', 'Gwen', 'Benny', 'Diane'),
    `g06u29_species` VARCHAR(20) DEFAULT NULL,
    `g06u29_sex` CHAR(1) DEFAULT NULL,
    `g06u29_birth` DATE DEFAULT NULL,
    `g06u29_death` DATE DEFAULT NULL
);
DESCRIBE `g06u29_pet`;