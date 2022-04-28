SELECT
    now(),
    YEAR (NOW()),
    DATE(NOW()),
    TIME(NOW()),
    SECOND (NOW());

ALTER TABLE
    `g06u29`.`g06u29_pet`
ADD
    COLUMN `g06u29_age` INT NULL DEFAULT NULL
AFTER
    `g06u29_death`;

DESC `g06u29`.`g06u29_pet`;

SELECT
    *,
    TIMESTAMPDIFF(YEAR, g06u29_birth, g06u29_death)
FROM
    `g06u29`.`g06u29_pet`
WHERE
    `g06u29_death` IS NOT NULL;

SELECT
    *,
    TIMESTAMPDIFF(YEAR, g06u29_birth, now())
FROM
    `g06u29`.`g06u29_pet`
WHERE
    `g06u29_death` IS NULL;

UPDATE
    `g06u29`.`g06u29_pet`
SET
    `g06u29_age` = TIMESTAMPDIFF(YEAR, g06u29_birth, g06u29_death)
WHERE
    `g06u29_death` IS NOT NULL;

UPDATE
    `g06u29`.`g06u29_pet`
SET
    `g06u29_age` = TIMESTAMPDIFF(YEAR, g06u29_birth, now())
WHERE
    `g06u29_death` IS NULL;

SELECT
    *
FROM
    `g06u29`.`g06u29_pet`;

UPDATE
    g06u29_pet
set
    g06u29_cost = 100000 * rand();

SELECT
    *
FROM
    g06u29_pet;

CREATE TABLE test (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    data VARCHAR(64) DEFAULT NULL,
    ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DESC test;

REPLACE INTO test
VALUES
    (2, 'Old', '2014-08-20 18:49:00');

SELECT
    *
FROM
    test;