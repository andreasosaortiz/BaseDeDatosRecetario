CREATE SCHEMA IF NOT EXISTS Recetario_Influencer_Aquino_Fittipaldi_Sosa_Vilte;
USE Recetario_Influencer_Aquino_Fittipaldi_Sosa_Vilte;

CREATE TABLE ia(
	codigo int primary key auto_increment, 
	url varchar(60), 
	nombre varchar(40), 
	algoritmo_principal varchar(40) not null
);

CREATE TABLE Comensal (
	id int primary key auto_increment,
    nombre varchar(40) not null,
	edad tinyint unsigned -- Solo positivos hasta 255 años
);

CREATE TABLE Tipo_comida(
	id int primary key auto_increment, 
	descripcion varchar(40) not null unique
);

CREATE TABLE despensa( 
	id int primary key auto_increment, 
	descripcion varchar(40)
);

CREATE TABLE frecuencia( 
	id int primary key auto_increment, 
	descripcion varchar(40) 
);

CREATE TABLE influencer (
	id int primary key auto_increment,
	cuenta varchar(40) not null, 
	nombre varchar(40), 
	ranking int
);

CREATE TABLE Pais (
	id int primary key ,
	nombre varchar(40) not null
);

CREATE TABLE Marca (
	id int primary key  auto_increment,
	descripcion varchar(40) 
);

CREATE TABLE Red_social (
	id int primary key auto_increment,
	nombre varchar(40) not null
);

CREATE TABLE Tipo_Coccion (
	id int primary key auto_increment,
	descripcion varchar(40) 
);

CREATE TABLE Tipo_De_Receta (
	id int primary key auto_increment,
	descripcion varchar(40) 
);

CREATE TABLE Nivel (
	id int primary key auto_increment,
	descripcion varchar (40)
);

CREATE TABLE Preparacion (
	id int primary key auto_increment ,
	video varchar(70),
    video_archivo blob
);

CREATE TABLE Paso (
	numero int primary key auto_increment,
	accion varchar(40) not null
);

CREATE TABLE Tipo_Fuente (
	id int primary key auto_increment, 
	nombre varchar(40) 
);

CREATE TABLE lista_compras(
	codigo int primary key auto_increment, 
	id_menu int not null references menu(id) ,
	cantidad int
);
Alter table lista_compras add column fecha date not null; 

CREATE TABLE menu(
	id int primary key auto_increment,
	fecha_desde date not null ,
	fecha_hasta date not null,
	id_frecuencia int references frecuencia(id)
);
Alter table menu add column fuePreparado boolean default false;
alter table menu add column valor_inflacionario int default 0;
alter table menu change valor_inflacionario valor_inflacionario decimal(10,2) default 0.0;


CREATE TABLE Comida (
	id int primary key auto_increment,
    nombre varchar(200) unique,
	id_tipo_comida1 int not null references tipo_comida(id),
    id_tipo_comida2 int references tipo_comida(id),
    id_tipo_comida3 int references tipo_comida(id)
    -- hay tres referencias a tipo de comida, porque puede ser desayuno o merienda.. almuerzo-cena, al mismo tiempo
);
                                                                                
CREATE TABLE publicacion (
	id int primary key auto_increment, 
	descipcion varchar(40), 
	contador_likes int ,
	id_influencer int not null references influencer(id), 
	codigo_ia int not null references ia(codigo), 
	id_Tipo_Fuente int not null references Fuente(id)
);
Alter table publicacion change descipcion descripcion varchar(40) null;

CREATE TABLE receta(
	id int primary key auto_increment, 
	tiempo time , 
	porcion int, 
	comentario varchar(100), 
	datos varchar(40), 
	preparada boolean, 
	favorito boolean, 
	id_nivel int not null references nivel(id),
	id_preparacion int not null references preparacion(id), 
	id_tipo_coccion int not null references tipo_coccion(id), 
	id_tipo_receta int not null references tipo_receta(id), 
	id_fuente int references receta(id)
);

alter table receta change id_fuente id_publicacion int;
alter table receta drop column preparada; 
alter table receta drop column favorito;

CREATE TABLE Ingrediente (
	id int primary key auto_increment,
	id_pais_origen int references Pais(id),
	nombre varchar(40),
	precio double not null,
	foto varchar(70),
	nombre_comercial varchar(100),
	cantidad_despensa int default 0,
	id_marca int references Marca(id),
	id_despensa int references Despensa(id),
	id_Ingrediente int references Ingrediente(id)
);


-- Relaciones
CREATE TABLE Ingrediente_tiene_Nutriente (
	id int primary key auto_increment,
	cantidad int,
	id_nutriente int not null references Nutriente(id),
	id_ingrediente int not null references Ingrediente(id)
);

CREATE TABLE Comida_es_conjunto_receta (
	id int primary key auto_increment,
	id_comida int references Comida(id),
	id_receta int references Receta(id),
	cantidad int
);
alter table Comida_es_conjunto_receta add column preparada boolean default false;

CREATE TABLE Comensal_come_comida( 
	id int primary key auto_increment,
	id_comida int not null references comida(id),
	codigo_comensal int not null references comensal(id),
	cantidad int not null
);

CREATE TABLE Receta_Es_Opcion_Menu(
	id int primary key auto_increment,
	id_Menu int not null references Menu_id,
	id_Receta int references Receta_id,
	cantidad int not null
);

CREATE TABLE Receta_Tiene_Ingrediente(
	id int primary key auto_increment,
	id_receta int references receta_id,
	id_Ingrediente int references ingrediente_id,
	cantidad int not null
);

CREATE TABLE menu_contiene_comida(
	id int primary key auto_increment,
	id_menu int references menu(id),
	id_comida int references comida(id)
);
Alter table menu_contiene_comida add column cantidad int null; -- la cantidad de comidas que contiene dicho menu


CREATE TABLE Preparacion_Interviene_Paso_Ingrediente(
	id_preparacion int not null references  preparacion_id,
	numero_paso int not null references  paso_numero ,  
	id_ingrediente int not null references ingrediente_id,
	cantidad_ingredientes int not null,
	constraint  pkTernaria primary key(id_preparacion, numero_paso, id_ingrediente)
);

CREATE TABLE Influencer_pertenece_red_social (
	id int primary key auto_increment,
	id_influencer int not null references Influencer(id) ,
	id_red_social int not null references Red_social (id)
);

CREATE TABLE Lista_compras_incluye_Ingrediente(
	id int auto_increment primary key,
	id_ingrediente int references ingrediente_id,
	codigo_lista_compras int references lista_compras_codigo,
	comprado_o_no boolean default false
);