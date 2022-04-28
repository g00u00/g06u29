SELECT  COUNT(*)  FROM    `g06u29_pet`;

SELECT   GROUP_CONCAT(`g06u29_name`)  FROM    `g06u29_pet`
WHERE `g06u29_age` BETWEEN 25 AND 28 ;

SELECT  `g06u29_species`, COUNT(*), AVG(`g06u29_age`)  FROM    `g06u29_pet`
group by  `g06u29_species`;

SELECT `g06u29_species`, MIN(`g06u29_age`), AVG(`g06u29_age`),  MAX(`g06u29_age`) FROM    `g06u29_pet`
group by  `g06u29_species`
ORDER BY MIN(`g06u29_age`) ASC;
