# INITALISER LA DB

mysql -u root -p
(-> entrer le password root / enter)
(CREATE DATABASE plant_db;)

USE plant_db;

source ./api-schema.sql;

\q