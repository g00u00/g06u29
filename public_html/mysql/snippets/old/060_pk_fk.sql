ALTER TABLE `g06u29_pet` 
ADD COLUMN `id_pet` INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (`id_pet`);
 DESC  `g06u29_pet` ;
 SELECT * FROM   `g06u29_pet` ;
 
 ALTER TABLE `g06u29`.`g06u29_pet` 
DROP COLUMN `id`,
DROP PRIMARY KEY;
 
 -- ---------------------------------------------
 
https://dev.mysql.com/doc/refman/5.6/en/create-table-foreign-keys.html
 
 CREATE TABLE parent (
    id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE child (
    id INT,
    parent_id INT,
    INDEX par_ind (parent_id),
    FOREIGN KEY (parent_id)
        REFERENCES parent(id)
        ON DELETE CASCADE
) ENGINE=INNODB;
-- --------------------------------------------------
 CREATE TABLE g06u29_main (
    id INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    species_manager varchar(50) NOT NULL DEFAULT '' 
    );
 DESC `g06u29_main`;

 INSERT INTO `g06u29_main` (`species_manager`) VALUES 
 ('Иванов'),('Петров'),('Сидоров');
SELECT * FROM `g06u29_main`;
 

ALTER TABLE `g06u29_pet` 
ADD COLUMN `g06u29_fk_main` INT NULL AFTER `id`;
SELECT * FROM `g06u29_main`;

ALTER g06u29_petg06u29_petR TABLE `g06u29_pet` 
ADD  FOREIGN KEY (`g06u29_fk_main`)
  REFERENCES `g06u29`.`g06u29_main` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  DESC `g06u29_pet`;
  
SELECT * FROM g06u29_pet;
UPDATE `g06u29`.`g06u29_pet` SET `g06u29_fk_main` = '1' WHERE (`g06u29_species` = 'cat');
UPDATE `g06u29`.`g06u29_pet` SET `g06u29_fk_main` = '2' WHERE (`g06u29_species` = 'dog');
UPDATE `g06u29`.`g06u29_pet` SET `g06u29_fk_main` = '21' WHERE (`g06u29_species` = 'dog');
UPDATE `g06u29`.`g06u29_pet` SET `g06u29_fk_main` = NULL; 
SELECT * FROM g06u29_pet;

-- ERR  - database - reverse engineering

SELECT   /*count(p.g06u29_name), */ m.id,  p.g06u29_fk_main, p.id_pet,   m.species_manager,  p.g06u29_species, p.g06u29_name
-- SELECT  DISTINCT    p.id, p.g06u29_species, p.g06u29_name
FROM  g06u29_main as m    JOIN g06u29_pet as  p  -- INNER,  CROSS --  LEFT, RIGHT
ON m.id = p.g06u29_fk_main
-- ON p.g06u29_fk_main IS NULL  
-- WHERE  p.g06u29_name = 'FLuffy'
-- GROUP BY g06u29_species
;

-- 
DROP TABLE IF EXISTS `06u29_staff`;
 CREATE TABLE `06u29_staff` (
    id_staff INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    g06u29_fk_main INT  DEFAULT NULL ,
    second_name varchar(50) DEFAULT NULL ,
    first_name varchar(50) DEFAULT NULL
    );

  
ALTER TABLE `g06u29`.`06u29_staff` 
ADD   FOREIGN KEY (`g06u29_fk_main`)
  REFERENCES `g06u29`.`g06u29_main` (`id`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION;
  
  
INSERT INTO `06u29_staff` VALUES 
 (NULL, 1, 'Иванов', 'Иван'),
( NULL, 1, 'Петров', 'Петр'),
( NULL, 2, 'Сидоров', 'Николай');

SELECT * FROM 06u29_staff;

SELECT   /*count(p.g06u29_name), */ m.id, m.species_manager,    s.id_staff, s.g06u29_fk_main,  s.second_name,   p.id_pet,   p.g06u29_fk_main,  p.g06u29_species, p.g06u29_name
FROM  `g06u29_main` as m    
JOIN `g06u29_pet` as  p 	ON m.id = p.g06u29_fk_main
	-- ON p.g06u29_fk_main IS NULL
left JOIN `06u29_staff` as  s  ON m.id = s.g06u29_fk_main
;

SELECT   /*count(p.g06u29_name), *m.id, m.species_manager,    s.id_staff, s.g06u29_fk_main,  s.second_name,   p.id_pet,   p.g06u29_fk_main, */p.g06u29_species/*,p.g06u29_name*/
FROM  `g06u29_main` as m    
JOIN `g06u29_pet` as  p 	ON p.g06u29_fk_main IS NULL
	-- ON p.g06u29_fk_main IS NULL
JOIN `06u29_staff` as  s  ON m.id = s.g06u29_fk_main
GROUP BY p.g06u29_species
;

 

 
 