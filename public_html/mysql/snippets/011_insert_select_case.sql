set  @x =11.045678;
SELECT @x, BIN(@x), OCT(@x), HEX(@x);
SELECT IF(1, 'true', 'false');



DROP TABLE IF EXISTS `mysql_test`;

CREATE TABLE IF NOT EXISTS `mysql_test` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `varchar_1` VARCHAR(520) NOT NULL DEFAULT '' COMMENT 'Строка',
    `int_1` INT(10) NOT NULL DEFAULT 0  COMMENT 'Число',
    PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARSET=UTF8 COLLATE = UTF8_GENERAL_CI;

INSERT INTO  `mysql_test` VALUES (NULL, 'Строка 1', 123);
INSERT INTO  `mysql_test` (`int_1`, `varchar_1`) VALUES (DEFAULT, 'Строка 2');


SELECT
    'abc' INTO @value;


INSERT INTO
    `mysql_test`
SELECT
    NULL,
    CASE
        WHEN 1 < 2 THEN @value
        ELSE 100
    END,
    1;
    
SELECT * FROM   `mysql_test`;
/*
SHOW FULL  COLUMNS FROM mysql_test;

SELECT `column_name`, `column_type`, `column_default`, `column_comment`
FROM `information_schema`.`COLUMNS` 
WHERE `table_name` = 'mysql_test' 
-- AND `table_schema` = 'g06u29'
;
*/
