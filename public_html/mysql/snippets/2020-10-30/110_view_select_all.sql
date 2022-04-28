USE `g06u29`;
DROP  VIEW  IF EXISTS `view_select_all`; 
CREATE  OR REPLACE VIEW `view_select_all` 
AS
SELECT * FROM `g06u29`.`g06u29_pet`;

SHOW TABLES;
SHOW CREATE TABLE  view_select_all;