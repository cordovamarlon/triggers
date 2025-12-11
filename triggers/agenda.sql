\c postgres postgres
drop database if exists automatiza;
create database automatiza encoding utf8;
\c automatiza;
CREATE TABLE IF NOT EXISTS agenda (
idagenda serial PRIMARY KEY,
nombre varchar(25) not null,
apellidos varchar(50) not null,
movil char(14),
email varchar(30)
);

insert into agenda (nombre,apellidos,movil,email) values 
('Manolo','Perales Arenas','610325679','manper@yahoo.es'),
('Manolo','Hueso Robles','654783212','huesomajo@gmail.com'),
('Emilio','Iniesta Garcia','621465921','einival@yahoo.es'),
('Gerard','Garcia Valero','610983676','gerardpr@hotmail.com'),
('Justino','Gallego Garcia','645202221','justinayto@gmail.com'),
('Paco','Mata Linares','699564735','pamatmat@yahoo.es'),
('Andres','Gazquez Romero','611419675','gazmarmol@gmail.com');

CREATE TABLE IF NOT EXISTS modificaciones_agenda ( 
idmodifica serial PRIMARY KEY, 
codigoagenda integer not null, 
atributo_modificado varchar(10) not null, 
valor_antiguo_atributo varchar(50), 
valor_nuevo_atributo varchar(50), 
fecha_modificacion timestamp not null 
);
