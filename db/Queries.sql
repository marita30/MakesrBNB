/* create database */
Create DATABASE AirBNB;
create DATABASE AirBNB_test;
/* create table user */
CREATE TABLE usuario (id_user SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60) unique, password VARCHAR(60), host BOOLEAN, telefono VARCHAR(60));
/* Insert */
INSERT INTO usuario (name,email,password,host,telefono) VALUES ('cristopher','cris@test.com','1234',true,'22798537');
