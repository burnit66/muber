DROP DATABASE mubers_db;

CREATE DATABASE mubers_db;

USE mubers_db;

CREATE TABLE locations
(
    id int NOT NULL AUTO_INCREMENT,
    lonp DECIMAL(10,5) NOT NULL,
    latp DECIMAL(10,5) NOT NULL,
   lond DECIMAL(10,5) NOT NULL,
    latd DECIMAL(10,5) NOT NULL,
   pickup VARCHAR(255),
   dropoff VARCHAR(255),
    PRIMARY KEY (id)
);

USE mubers_db;

insert into locations (lonp, latp, lond, latd, pickup, dropoff) values (111, 222, 333, 444, "street 1", "street 2");

USE mubers_db;
SELECT * FROM locations;
