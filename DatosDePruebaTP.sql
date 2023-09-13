
-- **********************************  Datos de prueba ***********************************
USE Recetario_Influencer_Aquino_Fittipaldi_Sosa_Vilte;

INSERT INTO Comida (nombre, id_tipo_comida1) values ('Torta helada almendrada', 5); -- solo postre

INSERT INTO Comida (nombre, id_tipo_comida1, id_tipo_comida2) values ('Bife de chorizo con papas fritas', 2, 4), -- almuerzo o cena
																	 ('Milanesa a caballo', 2, 4), 
                                                                     ('Albondigas veganas con salsa de champiñones', 2, 4), 
                                                                     ('Barritas sin gluten', 1, 3), -- desayuno o merienda
                                                                     ('Waffles con dulce de leche', 1, 3);
			
INSERT INTO Comida (nombre, id_tipo_comida1, id_tipo_comida2, id_tipo_comida3) values ('Trufas de chocolate veganas', 1, 3, 5); -- desayuno, merienda o postre


INSERT INTO Comensal (nombre, edad) values ('Fernando', 21), 
											('Julieta', 7) , 
                                            ('Yanina', 22), 
                                            ('Fabricio', 28);
                                            
INSERT INTO Comensal_come_comida (id_comida, codigo_comensal, cantidad) values ( 1, 1, 2),  
																				(1, 2, 1),
                                                                                (3, 2, 1), 
                                                                                (4, 3, 3), 
                                                                                (7, 4, 3),
                                                                                (3, 4, 1);



INSERT INTO Tipo_comida (descripcion) values ('Desayuno'), 
											('Almuerzo'),
											('Merienda'),
                                            ('Cena'), 
                                            ('Postre');

select * from comida;

INSERT INTO menu (fecha_desde, fecha_hasta, id_frecuencia) values 
('2022-09-25', '2022-10-25', 3), -- MENSUAL
('2022-10-01', '2022-10-15', 2), -- QUINCENAL
('2022-10-16','2022-11-16',  3), 
('2022-10-15', '2022-10-22', 1), 
('2022-11-17', '2022-11-24', 1), -- SEMANAL 
('2022-11-01', '2022-11-15', 2),
('2022-11-22', '2022-11-29', 1),
('2022-12-01', '2022-12-15', 2) ;

Update menu set fuePreparado = true where id= 1;
Update menu set fuePreparado = true where id= 2;
Update menu set fuePreparado = true where id= 3;

INSERT INTO receta_tiene_ingrediente (id_receta, id_ingrediente, cantidad) values 
(1, 3, 2 ), (1, 12,2), (2, 6,2);

INSERT INTO menu_contiene_comida (id_menu, id_comida ) values   (1, 4), -- menu 1 contiene comida 4 ALBONDIGAS VEGANAS CON SALSA
																(1, 5), -- menu 1 contiene comida 5 barritas sin gluten
																(2, 3), -- menu 2 contiene comida 3 milanesa a caballo
                                                                (2, 1), -- menu 2 contiene comida 1 torta helada
                                                                (2, 2), -- menu 2 contiene comida 2 bife de chorizo
                                                                (3, 6), -- menu 3 contiene comida 6 waffle 
                                                                (3, 1), -- menu 3 contiene comida 1 torta helada
                                                                (4, 1) , (4, 3), (4, 2), 
                                                                (5, 2), (5, 1), (5,3),
                                                                (6, 1), (6, 2),
                                                                (7, 1), (7, 3),
                                                                (8, 1), (8, 3);

update menu_contiene_comida set cantidad = 3  where menu_contiene_comida.id=1  or menu_contiene_comida.id=2 or  menu_contiene_comida.id=3; 
update menu_contiene_comida set cantidad = 5  where menu_contiene_comida.id=4  or menu_contiene_comida.id=5 or  menu_contiene_comida.id=6; 
update menu_contiene_comida set cantidad = 7  where menu_contiene_comida.id=7  or menu_contiene_comida.id=8 or  menu_contiene_comida.id=9; 

update menu_contiene_comida set id_comida= 1 where id=1;
update menu_contiene_comida set id_comida= 1 where id=2;
update menu_contiene_comida set id_comida= 2 where id=3;
update menu_contiene_comida set id_comida= 1 where id=4;
update menu_contiene_comida set id_comida= 1 where id=5;

update menu_contiene_comida set id_menu= 1 where id=1;
update menu_contiene_comida set id_menu= 1 where id=2;
update menu_contiene_comida set id_menu= 2 where id=3;
update menu_contiene_comida set id_menu= 2 where id=4;
update menu_contiene_comida set id_menu= 2 where id=5;

update comida_es_conjunto_receta set preparada = true where id=1;
update comida_es_conjunto_receta set preparada = true where id=2;

update receta set id_publicacion = 1 where id=1;
update receta set id_publicacion = 1 where id=2;
update receta set id_publicacion = 1 where id=1;

INSERT INTO despensa (descripcion) 	values ('Heladera'), ('Despensa en cocina');

INSERT INTO frecuencia (descripcion) values ('Semanal'), ('Quincenal'), ('Mensual');

INSERT INTO ia(url, nombre, algoritmo_principal) values ('www.inteligencia-a.com', 'ia', 'Algoritmo-1');

INSERT INTO influencer (cuenta, nombre, ranking) values ('@recetasrapidas', 'recetas rapidas', 1  ), ('@soyvegano', 'vegani', 2);

INSERT INTO Red_social (nombre) values ('Instagram'), ('TikTok'), ('YouTube');

INSERT INTO Influencer_pertenece_red_social (id_influencer, id_red_social) values (1, 1), (2,2), (1,3);

INSERT INTO publicacion (descripcion, id_influencer, codigo_ia, contador_likes, id_tipo_fuente ) values 
('Seguime para mas recetas', 1, 1, 20, 2 ), 
('La mejor receta', 2, 1, 400, 1);
update publicacion set id_influencer = 1 where id=2;



INSERT INTO Tipo_fuente (nombre) values ('Video'), ('Reel'), ('Foto');

INSERT INTO receta (tiempo, porcion, id_nivel, id_preparacion, id_tipo_coccion, id_tipo_receta ) values ('00:45:00', 1, 1, 1, 6, 3), -- TORTA HELADA
																										('1:30:00', 2, 2, 2, 2, 2); -- BIFE CHORIZO
INSERT INTO receta (tiempo, porcion, comentario, id_nivel, id_preparacion, id_tipo_coccion, id_tipo_receta, id_publicacion) values 
																						('01:00:00', 4, 'Mila a caballo', 1,  1, 7, 3, 1),
																						('01:20:00', 3, 'Albondigas Veganas', 3, 2, 1, 1, 1),
																						('01:00:00', 5, 'Barritas sin gluten', 2, 2, 6, 2, 2),
																						('00:40:00', 6, 'Waffles con dulce', 1, 1, 6, 3, 1),
																						('00:45:00', 3, 'Trufas veganas', 2, 2, 6, 1, 2);

INSERT INTO Tipo_coccion (descripcion) values ('HORNO'), ('MICROONDAS'), ('BAÑO MARIA'), ('PARRILLA'), ('AL WOK'), ('SIN COCCION'), ('FRITO');

INSERT INTO Tipo_De_receta (descripcion) values ('VEGANA'), ('SIN TACC'), ('OMNIVORA');

INSERT INTO Nivel (descripcion) values ('FACIL'), ('INTERMEDIO'), ('AVANZADO');

INSERT INTO Preparacion (video) values ('www.urlvideo.com' ), ('www.video-video.com');

INSERT INTO Paso (accion ) values ('batir los huevos'), ('cortar en juliana 2 cebollas'), ('cortar en bastones'), ('poner el horno a 60 grados'), ('agregar sal'), ('sazonar con pimienta');

INSERT INTO Pais (id, nombre) values (1, 'ARGENTINA') , (2, 'BRASIL'), (3, 'ITALIA');

INSERT INTO Ingrediente_tiene_nutriente (cantidad, id_nutriente, id_ingrediente) values (2,1,1), ( 2, 3, 2);

INSERT INTO Marca (descripcion) values ('HELLMANS'), 
('DANICA'),
 ('LOS HERMANOS'),
 ('LIDER'),
 ('LA SERENISIMA'), 
 ('ARCOR'), 
 ('KNORR');

INSERT INTO Comida_es_conjunto_receta (id_comida, id_receta, cantidad) values (1, 1 , 2), (2, 2, 3);

INSERT INTO Ingrediente (id_pais_origen, nombre, precio, nombre_comercial, cantidad_despensa, id_marca, id_despensa, id_Ingrediente) values 
                        (1, 'mayonesa',		500.0,	'mayonesa ligth',			2,				1,			1,				2), -- ID INGREDIENTE HACE REFERENCIA AL INGREDIENTE SUSTITUTO
                        (1, 'mayonesa', 	400.1,	'mayonesa saborizada',  	5, 				2,			1,				1),
						(1, 'Leche', 		300.0, 'Leche Con Lactosa Premium',	2, 				5, 			1, 				5),
						(1, 'Leche sin lactosa', 280.1, 'Leche Sin lactosa', 	0, 				2, 			1, 				5),
						(1, 'Leche en polvo', 	400.05, 'En Polvo Serenisima', 	0,				5,			2,				3);
                            
INSERT INTO Ingrediente (id_pais_origen, nombre, precio, cantidad_despensa, id_marca, id_despensa) values 
						(1, 'Bife de chorizo', 1400.5, 	 		3, 				3,		    1), 
						(2, 'papas blancas',  	400.0,   		1,				3,			2),
						(2, 'huevo' , 			550.5,   		4,		   		4,			1), 
						(2,'carne picada',   	550.5,    		1,				3,			1),
						(1, 'cebolla',       	350.1,  		1, 				4,			1),
						(3, 'cebolla de verdeo',400.0, 			2, 				7, 			1),
						(1, 'harina 000', 		200.5,			0,				3,			2),
						(2, 'salsa chocolate',	300.0,			1,				6,			1);

INSERT INTO Receta_es_opcion_menu (id_menu, id_receta, cantidad) values (2, 1 , 2), (2, 2, 1), (1, 3, 3), (1, 4, 1), (2, 4, 1);

INSERT INTO Preparacion_Interviene_Paso_Ingrediente(id_preparacion, numero_paso, id_ingrediente, cantidad_ingredientes) values (1,1, 1, 1);

INSERT INTO lista_compras (id_menu, cantidad, fecha) values (1, 1, '2022-09-25'), (1,3, '2022-09-25'), 
															(2,4, '2022-10-01'), 
/* la fecha es la misma que la fecha_desde del menu */      (3,2, '2022-10-16'),
                                                            (4,1, '2022-10-15'), 
                                                            (5,4, '2022-11-17'), 
                                                            (6,2, '2022-11-01'),
                                                            (7,4, '2022-11-22'),
                                                            (8,8, '2022-12-01');
                                                            
INSERT INTO Lista_compras_incluye_Ingrediente(id_ingrediente,codigo_lista_compras,comprado_o_no) values (2, 2, false),
																										(3, 3, false), 
                                                                                                        (3, 4, true), 
                                                                                                        (2, 1, true), 
                                                                                                        (4, 5, true), 
                                                                                                        (4, 4, false), 
                                                                                                        (6, 5, false), 
                                                                                                        (7, 8, false), 
                                                                                                        (1, 2, false),  
                                                                                                        (2, 2, false), 
                                                                                                        (3, 3, false), 
                                                                                                        (4, 3, false), 
                                                                                                        (1, 2, false), 
                                                                                                        (5, 4, false), 
                                                                                                        (4, 7, true),
                                                                                                        (5, 6, true), 
                                                                                                        (7, 7, true), 
                                                                                                        (2, 1, true);
Insert into Lista_compras_incluye_ingrediente(id_ingrediente, codigo_lista_compras)values (2,1);

update Lista_compras_incluye_Ingrediente set comprado_o_no= true where id=1;
update Lista_compras_incluye_Ingrediente set comprado_o_no= true where id=2;
update Lista_compras_incluye_Ingrediente set comprado_o_no= true where id=3;