/* create database */
Create DATABASE AirBNB;
create DATABASE AirBNB_test;
/* create table user */
CREATE TABLE usuario (id_user SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60) unique, password VARCHAR(60), host BOOLEAN, telefono VARCHAR(60));
/* Insert */
INSERT INTO usuario (name,email,password,host,telefono) VALUES ('cristopher','cris@test.com','1234',true,'22798537');


/***/
create table types_space(
	id_categories SERIAL primary key,
	description varchar(100)
);

create table space (
	id_space SERIAL primary key,
	name varchar(80) not null,
	description varchar(500) not null,
	pricexnight money not null,
	location varchar(80) not null,
	id_categories integer references types_space(id_categories),
	id_user integer references usuario(id_user)
	);

create table request(
	id_request serial primary key,
	status integer not null default 1
);

create table reservas(
	id_reserva SERIAL primary key,
	date_inicio date not null,
	date_final date not null,
	price_total money not null,
	id_request integer references request(id_request),
	id_user integer references usuario(id_user)
);

create table space_reserva(
	id_space_reserva serial primary key,
	id_space integer references space(id_space),
	id_reserva integer references reservas(id_reserva)
);
