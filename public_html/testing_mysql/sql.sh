#!/bin/bash
mysql -u"g06u29" -p"mysql16" -e "
use g06u29;
SELECT now();
DROP TEMPORARY TABLE IF EXISTS tbl_name;
CREATE TEMPORARY TABLE IF NOT EXISTS tbl_name (
my_name CHAR(20)  , 
my_age INT UNSIGNED , 
INDEX index_my_name(my_name)
);
DESCRIBE tbl_name;


INSERT INTO tbl_name 
VALUES(
'Иван', 2
);
SELECT * FROM tbl_name;
"
