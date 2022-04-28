
INSERT INTO `g06u29_pet` (`g06u29_name`, `g06u29_owner`, `g06u29_species`, `g06u29_sex`, `g06u29_birth`, `g06u29_death`) VALUES
('Fluffy', 'Harold', 'cat', 'f', '1993-02-04', NULL),
('Claws', 'Gwen', 'cat', 'm', '1994-03-17', NULL),
('Buffy', 'Harold', 'dog', 'f', '1989-05-13', NULL),
('Fang', 'Benny', 'dog', 'm', '1990-08-27', NULL),
('Bowser', 'Diane', 'dog', 'm', '1979-08-31', '1995-07-29'),
('Chirpy', 'Gwen', 'bird', 'f', '1998-09-11', NULL),
('Whistler', 'Gwen', 'bird', NULL, '1997-12-09', NULL),
('Slim', 'Benny', 'snake', 'm', '1996-04-29', NULL),
('Chirpy', 'Gwen', 'bird', 'f', '1998-09-11', NULL),
('Whistler', 'Gwen', 'bird', NULL, '1997-12-09', NULL),
('Slim', 'Benny', 'snake', 'm', '1996-04-29', NULL);
SELECT * FROM `g06u29_pet`;


INSERT INTO `g06u29_pet` ( `g06u29_owner`) VALUES ('Benny');
DELETE FROM `g06u29_pet` where `g06u29_birth` is NULL;
SELECT * FROM `g06u29_pet`;

SELECT *
FROM `g06u29`.`g06u29_pet`;


SELECT  *, TIMESTAMPDIFF(YEAR, g06u29_birth, g06u29_death)  FROM  `g06u29`.`g06u29_pet`
WHERE `g06u29_death` IS NOT NULL;

SELECT  *, TIMESTAMPDIFF(YEAR, g06u29_birth, now())  FROM  `g06u29`.`g06u29_pet`
WHERE `g06u29_death` IS NULL;

ALTER TABLE `g06u29`.`g06u29_pet` 
ADD COLUMN `g06u29_age` INT NULL DEFAULT NULL AFTER `g06u29_death`;
DESC `g06u29`.`g06u29_pet` ;

UPDATE `g06u29`.`g06u29_pet` 
	SET `g06u29_age` = TIMESTAMPDIFF(YEAR, g06u29_birth, g06u29_death)
    WHERE `g06u29_death` IS NOT NULL;
    
UPDATE `g06u29`.`g06u29_pet` 
	SET `g06u29_age` = TIMESTAMPDIFF(YEAR, g06u29_birth, now())
    WHERE `g06u29_death` IS NULL;    
 
SELECT *
FROM `g06u29`.`g06u29_pet`;

