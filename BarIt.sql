USE bar_it;

CREATE TABLE insumo(
id_insumo bigint primary key not null auto_increment,
nombre varchar(50),
marca varchar(50),
precio decimal(10,2),
onzas decimal(10,2)
);

CREATE TABLE metodo(
id_metodo bigint primary key not null auto_increment,
nombre varchar(50)
);

CREATE TABLE fruta(
id_fruta bigint primary key not null auto_increment,
nombre varchar(50)
);

CREATE TABLE receta(
id_receta bigint primary key not null auto_increment,
nombre varchar(50),
id_metodo bigint,
constraint foreign key (id_metodo) references metodo(id_metodo)
);

CREATE TABLE insumo_receta(
id_insumo_receta bigint primary key not null auto_increment,
onzas_insumo decimal(10,2),
id_insumo bigint,
id_receta bigint,
constraint foreign key (id_insumo) references insumo(id_insumo),
constraint foreign key (id_receta) references receta(id_receta)
);

CREATE TABLE decoracion(
id_decoracion bigint primary key not null auto_increment,
nombre varchar(50),
unidades_fruta int,
id_fruta bigint,
constraint foreign key (id_fruta) references fruta(id_fruta)
);

CREATE TABLE decoracion_receta(
id_decoracion_receta bigint primary key not null auto_increment,
id_decoracion bigint,
id_receta bigint,
constraint foreign key (id_decoracion) references decoracion(id_decoracion),
constraint foreign key (id_receta) references receta(id_receta)
);