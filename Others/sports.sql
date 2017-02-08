CREATE SCHEMA sports;
SHOW SCHEMAS;
USE sports;

#Determine the players in different sports
CREATE TABLE players (
  `id`     INT         NOT NULL AUTO_INCREMENT,
  `name`   VARCHAR(50) NOT NULL,
  `height` FLOAT       NOT NULL,
  `weight` FLOAT       NOT NULL,
  `sports` VARCHAR(30) NOT NULL
  PRIMARY KEY (id)
);

SHOW TABLES;
DESCRIBE players;

#This determines the one of the two types practice
#practice Taekwondo
CREATE TABLE Taekwondo (
  `type`          VARCHAR(30) NOT NULL DEFAULT 'Poomse' COMMENT 'The default is poomse',
  `belt`          VARCHAR(30) NOT NULL,
  `fightingLevel` INT         NULL
);
SHOW TABLES;
DESCRIBE Taekwondo;
drop table Taekwondo;

CREATE TEMPORARY TABLE IF NOT EXISTS CopyOfTaekwondo LIKE Taekwondo;
DROP TABLE Taekwondo;

show tables;
DESCRIBE Taekwondo;
