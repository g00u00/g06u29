#\. /var/www/marshirov/data/nn2000.info/public_html/db/mysql/g01u00_example_00.sql

USE g01u00;

DROP TABLE IF EXISTS g01u00_pet;
CREATE TABLE IF NOT EXISTS g01u00_pet 
(g01u00_name VARCHAR(20), 
g01u00_owner VARCHAR(20), 
g01u00_species VARCHAR(20), 
g01u00_sex  SET('m','f'), 
g01u00_birth DATE, 
g01u00_death DATE) 
DEFAULT CHARACTER SET = utf8, 
DEFAULT COLLATE = utf8_general_ci; 
SHOW TABLES;
DESCRIBE g01u00_pet;

# Простейшая вставка данных в таблицу
INSERT INTO g01u00_pet VALUES ('Puffball','Diane','hamster','f','1999-03-30',NULL);
SELECT * FROM g01u00_pet;

DELETE FROM g01u00_pet;
SELECT * FROM g01u00_pet;


#создать структуру новой таблицы на основе уже существующей таблицы двумя способами
CREATE TABLE IF NOT EXISTS g01u00_pet_01 
SELECT g01u00_name, g01u00_birth
FROM g01u00_pet;
DESCRIBE g01u00_pet_01;

CREATE TABLE IF NOT EXISTS g01u00_pet_02 
LIKE g01u00_pet;
DESCRIBE g01u00_pet_02;






#Модифицирование структуры таблицы
select 'Изменяем структуру таблицы';
ALTER TABLE `g01u00_pet` ADD `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST ;
ALTER TABLE `g01u00_pet` ADD `inserted_date_time`  TIMESTAMP AFTER g01u00_death ;




INSERT INTO g01u00_pet (g01u00_name) VALUES ('новое имя');
SELECT * FROM g01u00_pet;
DESCRIBE g01u00_pet;


select 'Новая таблица';
DROP TABLE IF EXISTS g01u00_pet;
CREATE TABLE IF NOT EXISTS g01u00_pet 
(id INT AUTO_INCREMENT,
g01u00_name VARCHAR(20), 
g01u00_owner VARCHAR(20), 
g01u00_species VARCHAR(20), 
g01u00_sex  SET('m','f'), 
g01u00_birth DATE, 
g01u00_death DATE,
PRIMARY KEY (id)
) 
DEFAULT CHARACTER SET = utf8, 
DEFAULT COLLATE = utf8_general_ci; 
DESCRIBE g01u00_pet;


INSERT INTO `g01u00_pet` VALUES
(NULL, 'Fluffy', 'Harold', 'cat', 'f', '1993-02-04', NULL),
(NULL, 'Claws', 'Gwen', 'cat', 'm', '1994-03-17', NULL),
(NULL, 'Buffy', 'Harold', 'dog', 'f', '1989-05-13', NULL),
(NULL, 'Fang', 'Benny', 'dog', 'm', '1990-08-27', NULL),
(NULL, 'Bowser', 'Diane', 'dog', 'm', '1979-08-31', '1995-07-29'),
(NULL, 'Chirpy', 'Gwen', 'bird', 'f', '1998-09-11', NULL),
(NULL, 'Whistler', 'Gwen', 'bird', NULL, '1997-12-09', NULL),
(NULL, 'Slim', 'Benny', 'snake', 'm', '1996-04-29', NULL),
(NULL, 'Chirpy', 'Gwen', 'bird', 'f', '1998-09-11', NULL),
(NULL, 'Whistler', 'Gwen', 'bird', NULL, '1997-12-09', NULL),
(NULL, 'Slim', 'Benny', 'snake', 'm', '1996-04-29', NULL);

SELECT * FROM g01u00_pet;

INSERT INTO `g01u00`.`g01u00_pet` (`id`, `g01u00_name`, `g01u00_owner`, `g01u00_species`, `g01u00_sex`, `g01u00_birth`, `g01u00_death`) VALUES (NULL, 'Мария', 'Александр', 'кот', 'ж', '2015-01-14', '2015-01-10');

SELECT * FROM g01u00_pet;

SELECT * FROM g01u00_pet
where g01u00_owner = 'Benny'
;

UPDATE  g01u00_pet
    SET g01u00_owner='Иванов'
    WHERE g01u00_owner = 'Benny';

SELECT * FROM g01u00_pet


/*


UPDATE [LOW_PRIORITY] [IGNORE] table_references
    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...
    [WHERE where_condition]

*/
