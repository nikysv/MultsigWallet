-- Crear la base de datos
create database bdmw;
use bdmw;

-- Crear la tabla Rol con una clave primaria en el campo id
create table Rol(
    id int not null primary key auto_increment,
    Rol varchar(100) not null
);




-- Crear la tabla Propuesta con una clave foránea hacia Participacion
create table Propuesta(
    id int not null PRIMARY KEY AUTO_INCREMENT,
    Estado int not null,
    Descripcion varchar(300) not null,
    Fecha date not null,
    FechaFin date not null,
    Votacion int not null,
    Cant_Firma int not null);

-- Crear la tabla Propuesta con una clave foránea hacia Transaccion 
create table Transaccion(
    id int not null PRIMARY KEY AUTO_INCREMENT,
    Estado int not null,
    Descripcion varchar(300) not null,
    Fecha date not null,
    FechaFin date not null,
    Rentabilidad int not null,
    Monto int not null,
    Votacion int not null,
    Cant_Firma int not null
);

 
create table wallet(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    monto_total DECIMAL(18, 2) DEFAULT 0,
    quorum INT NOT NULL,
	id_Propuesta int not null,
    id_Transaccion int not null,
	foreign key(id_Propuesta) references Propuesta(id),
    foreign key(id_Transaccion) references Transaccion(id)
);

create table usuario(
    id int not null primary key auto_increment,
    Nombre varchar(50) not null,
    id_rol int not null,
    id_Wallet int,
    estado bit not null DEFAULT 1,
    foreign key(id_rol) references Rol(id),
	foreign key(id_Wallet) references Wallet(id)
);


CREATE TABLE AprobacionesT (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    transaccion_id INT NOT NULL,
    usuario_id INT NOT NULL,
    fecha_aprobacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    aprobacion BOOLEAN NOT NULL, -- TRUE si aprueba, FALSE si rechaza
    FOREIGN KEY (transaccion_id) REFERENCES Transaccion(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id));
   

CREATE TABLE AprobacionesP (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Propuesta_id INT NOT NULL,
    usuario_id INT NOT NULL,
    fecha_aprobacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    aprobacion BOOLEAN NOT NULL, -- TRUE si aprueba, FALSE si rechaza
    FOREIGN KEY (Propuesta_id) REFERENCES Propuesta(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
    );
-- Crear la tabla usuario con claves foráneas hacia Rol y Participacion

create table user (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username INT NOT NULL,
    password VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE
);
