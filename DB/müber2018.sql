CREATE DATABASE mubers_db;

USE mubers_db;

CREATE TABLE locations
(
    id int NOT NULL AUTO_INCREMENT,
    longitude DECIMAL(10,5) NOT NULL,
    latitude DECIMAL(10,5) NOT NULL,
    PRIMARY KEY (id)
);

insert into locations (longitude, latitude) values (-81.6944, 41.4993);
insert into locations (longitude, latitude) values (-81.5190, 41.0814);
insert into locations (longitude, latitude) values (-81.4412, 41.3898);