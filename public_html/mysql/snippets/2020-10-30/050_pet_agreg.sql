SELECT  COUNT(*)  FROM    `g06u29_pet`;

SELECT  g00u00_owner as owner_of  FROM  g00u00.g00u00_pet ORDER BY owner_of;
SELECT  CONCAT(g00u00_owner) as owner_of  FROM  g00u00.g00u00_pet ORDER BY owner_of;
SELECT  DISTINCT CONCAT(g00u00_owner) as owner_of  FROM  g00u00.g00u00_pet GROUP BY  owner_of  ASC ;
SELECT  DISTINCT CONCAT(g00u00_owner)  as owner_of,  COUNT(g00u00_owner) as counf_of   FROM  g00u00.g00u00_pet GROUP BY  owner_of  ASC  HAVING  owner_of IS NOT NULL   ORDER BY owner_of ASC;


SELECT   GROUP_CONCAT(`g06u29_name`)  FROM    `g06u29_pet`
WHERE `g06u29_age` BETWEEN 25 AND 28 ;

SELECT  `g06u29_species`, COUNT(*), AVG(`g06u29_age`)  FROM    `g06u29_pet`
group by  `g06u29_species`;

SELECT `g06u29_species`, MIN(`g06u29_age`), AVG(`g06u29_age`),  MAX(`g06u29_age`) FROM    `g06u29_pet`
group by  `g06u29_species`
ORDER BY MIN(`g06u29_age`) ASC;
