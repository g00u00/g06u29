USE g06u29;
DROP  TABLE  IF EXISTS child;
DROP  TABLE  IF EXISTS parent;

CREATE TABLE parent (
    id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE child (
    id INT  DEFAULT 50,
    parent_id INT ,
    FOREIGN KEY (parent_id)
        REFERENCES parent (id)
        ON DELETE   CASCADE
)  ENGINE=INNODB;

DESC  parent;
DESC child;

INSERT INTO  parent(id) VALUES (10), (20);
SELECT id FROM parent;
INSERT INTO  child (id, parent_id) VALUE (102, 10), (103, 10),  (201, 20) ;
SELECT id, parent_id FROM child;
SELECT id, parent_id FROM child  WHERE  parent_id=10 ;
DELETE  FROM parent  WHERE  id=10;
SELECT id FROM parent;
SELECT id, parent_id FROM child;
