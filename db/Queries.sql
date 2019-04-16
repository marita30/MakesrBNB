/* create database */
Create DATABASE AirBNB;
create DATABASE AirBNB_test;

create TABLE users (
  id_user SERIAL PRIMARY KEY,
  name varchar(180) NOT NULL,
  email varchar(120) NOT NULL,
  password varchar(300) NOT NULL,
  host boolean NOT NULL DEFAULT FALSE,
  cellphone integer
);
