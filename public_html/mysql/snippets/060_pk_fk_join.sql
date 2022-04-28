ALTER TABLE
    `g06u29_pet`
ADD
    COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST,
ADD
    PRIMARY KEY (`id_pet`);

DESC `g06u29_pet`;

SELECT
    *
FROM
    `g06u29_pet`;

ALTER TABLE
    `g06u29`.`g06u29_pet` DROP COLUMN `id`,
    DROP PRIMARY KEY;

/* Пример синтаксиса по созданию род. и доч. табл. с внешним ключом на родительскую https://dev.mysql.com/doc/refman/5.6/en/create-table-foreign-keys.html
 CREATE TABLE parent (id INT NOT NULL, PRIMARY KEY (id)) ENGINE = INNODB;
 
 CREATE TABLE child ( id INT, parent_id INT, INDEX par_ind (parent_id), FOREIGN KEY (parent_id) REFERENCES parent(id)
 ON DELETE CASCADE ) ENGINE = INNODB; */

/**/
/* Создаем и наполняем главную (родительскую ) таблицу */
CREATE TABLE g06u29_main (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- можно любое другое поле с уникальными значения и возможность сопоставлять с внешними ключами 
    species_manager varchar(50) NOT NULL DEFAULT ''
);

DESC `g06u29_main`;

INSERT INTO
    `g06u29_main` (`species_manager`)
VALUES
    ('cat_manager'),
    ('dog_manager'),
    ('top_manager');

SELECT
    *
FROM
    `g06u29_main`;

/*Модифицируем зависимую (дочернюю) 
 */
ALTER TABLE
    `g06u29_pet`
ADD
    COLUMN `g06u29_fk_main` INT NULL
AFTER
    `id`;

DESC g06u29.g06u29_pet;

ALTER TABLE
    `g06u29`.`g06u29_pet`
ADD
    CONSTRAINT `g06u29_fk_main` FOREIGN KEY (`g06u29_fk_main`) REFERENCES `g06u29`.`g06u29_main` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

/*
 ALTER TABLE
 `g06u29`.`g06u29_pet` DROP FOREIGN KEY `g06u29_fk_main`;
 */
DESC `g06u29_pet`;

SELECT
    *
FROM
    g06u29_pet;

/**/
UPDATE
    `g06u29`.`g06u29_pet`
SET
    `g06u29_fk_main` = '1'
WHERE
    (`g06u29_species` = 'cat');

UPDATE
    `g06u29`.`g06u29_pet`
SET
    `g06u29_fk_main` = '2'
WHERE
    (`g06u29_species` = 'dog');

/*
 UPDATE
 `g06u29`.`g06u29_pet`
 SET
 `g06u29_fk_main` = NULL;
 **/
SELECT
    *
FROM
    g06u29_pet;

/* staff
 */
DROP TABLE IF EXISTS `06u29_staff`;

CREATE TABLE `06u29_staff` (
    id_staff INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    g06u29_fk_main INT DEFAULT NULL,
    second_name varchar(50) DEFAULT NULL,
    first_name varchar(50) DEFAULT NULL
);

ALTER TABLE
    `g06u29`.`06u29_staff`
ADD
    CONSTRAINT `g06u29_fk_main` FOREIGN KEY (`g06u29_fk_main`) REFERENCES `g06u29`.`g06u29_main` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

/*
 ALTER TABLE `g06u29`.`06u29_staff` 
 DROP FOREIGN KEY `g06u29_fk_main`;
 */
INSERT INTO
    `06u29_staff`
VALUES
    (NULL, 1, 'Иванов', 'Иван'),
    (NULL, 1, 'Петров', 'Петр'),
    (NULL, 2, 'Сидоров', 'Николай');

INSERT INTO
    `06u29_staff`
VALUES
    (NULL, 5, 'Воробъев', 'Семен');

SELECT
    *
FROM
    06u29_staff;

/*******************************
 ERR - database - reverse engineering -- ------------ 
 */
/**/
/*COUNT(p.g06u29_name) 
 */





SELECT
    m.id,
    m.species_manager,
    p.id,
    p.g06u29_fk_main,
    p.g06u29_name,
    p.g06u29_species
FROM
    g06u29_main AS m 
    /*INNER  OUTER LEFT  OUTER RIGHT */
    JOIN g06u29_pet AS p ON m.id = p.g06u29_fk_main -- ON p.g06u29_fk_main IS NULL
    /*WHERE p.g06u29_name = 'FLuffy'*/
    /*WHERE p.g06u29_species = 'dog'*/
    /*WHERE p.g06u29_species = 'bird'*/
    /*WHERE p.g06u29_fk_main is NULL*/
;


SELECT
    -- COUNT(p.g06u29_name),
    m.id,
    m.species_manager,
    p.id,
    p.g06u29_fk_main,
    p.g06u29_name,
    p.g06u29_species,
    s.id_staff,
    s.g06u29_fk_main,
    s.second_name
FROM
    `g06u29_main` AS m
    /*INNER  OUTER LEFT  OUTER RIGHT */
    LEFT JOIN `g06u29_pet` AS p ON m.id = p.g06u29_fk_main
    /*INNER  OUTER LEFT  OUTER RIGHT */
    LEFT JOIN `06u29_staff` AS s ON m.id = s.g06u29_fk_main
	-- WHERE p.g06u29_fk_main is NOT NULL
    -- GROUP BY    m.id
      ;
