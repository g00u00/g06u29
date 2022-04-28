use g06u29;
DROP TEMPORARY TABLE IF EXISTS tbl_name;
CREATE TEMPORARY TABLE IF NOT EXISTS tbl_name (
my_name CHAR(20)  DEFAULT '123' COMMENT 'Имя', 
my_age INT UNSIGNED DEFAULT '100' COMMENT 'Возраст', 
INDEX index_my_name(my_name)
);

DESCRIBE `tbl_name`;

INSERT INTO tbl_name 
VALUES(
'Иван', 2
);
SELECT * FROM tbl_name;

