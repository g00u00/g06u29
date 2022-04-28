DELETE FROM `g06u29_pet`
WHERE `g06u29_name` LIKE  'Buffy';
SELECT  `g06u29_name`  FROM  `g06u29`.`g06u29_pet`;

DELETE FROM `g06u29_pet` 
ORDER  BY `g06u29_name` ASC 
LIMIT 10;
SELECT  `g06u29_name`  FROM  `g06u29`.`g06u29_pet`;

DELETE FROM `g06u29_pet` 
ORDER  BY `g06u29_name` ASC 
LIMIT 100;
SELECT  *  FROM  `g06u29`.`g06u29_pet`;
