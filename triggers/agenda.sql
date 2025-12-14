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

/*create table if not exists usuarios (
id_usuario serial primary key,
nombre varchar(25) not null,
email varchar(30) not null,
fecha_modificacion timestamp
);

create table if not exists modificaciones_usuarios(
id_auditoria serial primary key,
id_usuario int not null,
operacion varchar(30),
fecha_operacion timestamp
);

create table if not exists usuarios_eliminados(
id_eliminados serial primary key,
id_usuario_eliminado int not null,
nombre_eliminado varchar(25),
email_eliminado varchar(30),
fecha_modificacion timestamp
);*/

create table if not exists productos(
id_producto serial primary key,
nombre_producto varchar(50),
stock int
);
create table if not exists facturas(
id_factura serial primary key,
cliente varchar(60),
monto_total numeric,
descuento numeric default 0
);

CREATE TABLE usuarios (
 id_usuario SERIAL PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL
);
CREATE TABLE sesiones (
 id_sesion SERIAL PRIMARY KEY,
 id_usuario INT NOT NULL,
 fecha_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 activa BOOLEAN DEFAULT TRUE,
 FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);
