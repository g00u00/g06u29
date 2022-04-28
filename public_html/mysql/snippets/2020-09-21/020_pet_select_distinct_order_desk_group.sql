SELECT DISTINCT
    *
    -- name, CONCAT(LEFT(owner, 2), name) AS `псеводним`
 FROM   `pet`
-- String Comparison Functions and Operators
 /*`name` LIKE '_luff_'  маска поиска но это не регул.выражен. */
 -- WHERE `owner` = 'Harold'
-- WHERE `owner` = 'Harold' and `name` LIKE '_luf__' 
-- WHERE `owner` = 'Harold' and `name` LIKE '%l%'   
-- WHERE `name` IN ('FLuffy','Claws') 
-- WHERE `name` IN  (SELECT 'FLuffy','Claws') 
-- GROUP BY `species` DESC
ORDER BY `name`  DESC
-- ORDER BY rand()
;


SELECT *, count(`sex`) FROM g00u00.pet
GROUP BY `sex`;
SELECT  /*`sex`,count(`sex`),*/ sum(`cost`)  INTO @sum_cost 
FROM g00u00.pet
/*INTO OUTFILE  '/var/lib/mysql-files/mysql.txt'*/ 
GROUP BY `sex`
HAVING sum(`cost`)  >= 220
LIMIT 1,2
;
SELECT @sum_cost;
-- /var/lib/mysql-files