-- *************************************** Consultas *******************************************
USE Recetario_Influencer_Aquino_Fittipaldi_Sosa_Vilte;

-- i. ¿Cuáles son mis listas de compras activas? 
select lc.codigo
from lista_compras lc where exists (select 1 
									from lista_compras_incluye_ingrediente lcii 
                                    where lc.codigo = lcii.codigo_lista_compras 
                                    and lcii.comprado_o_no=false);
                                    
-- ii. El historial de los menúes que fui armando.
Select m.id, m.fecha_desde, m.fecha_hasta 
From menu m 
where m.fuePreparado = true 
order by m.fecha_desde, m.fecha_hasta; 

-- iii. Mis recetas favoritas, es decir, las que más elijo.    
select r.id, r.tiempo, r.comentario, r.datos
from receta r
where r.id = (select recetaFavorita.idRecetaFavorita
                from (select max(cantidadMaxima.total), cantidadMaxima.idReceta as idRecetaFavorita
                        from  (select count(ccr.id_receta) as total, ccr.id_receta as idReceta
                                from comida_es_conjunto_receta ccr join comida c on c.id=ccr.id_comida
                                join menu_contiene_comida mcc on mcc.id_comida= c.id
                                join menu m on m.id=mcc.id_menu
                                group by ccr.id_receta, m.fuePreparado
                                having  m.fuePreparado=true) as cantidadMaxima) as recetaFavorita);
	
-- iv. Reporte de ingredientes por tipo de comida del último mes.
Select i.nombre, tc.descripcion
From ingrediente i
join receta_tiene_ingrediente rti on rti.id_Ingrediente = i.id
join comida_es_conjunto_receta comrec on comrec.id_receta = rti.id_receta
join comida c on c.id=comrec.id_comida
join tipo_comida tc on tc.id = c.id_tipo_comida1
where exists (select 1
                from menu_contiene_comida mcc join menu m on m.id=mcc.id_menu
                where mcc.id_comida = c.id
                and m.fecha_desde between '2022-11-01' and '2022-12-01'
)
group by tc.id, tc.descripcion, i.nombre;


-- v. Reporte de costo por menú del mes en curso, con la posibilidad de ingresar el factor inflacionario
-- para poder conocer el presupuesto para el mes que viene.
select m.id, avg((i.precio*rti.cantidad)*ccr.cantidad) * (1 + valor_inflacionario )  as costo 
from menu m join menu_contiene_comida mcc on mcc.id_menu = m.id
join comida com on com.id = mcc.id_comida
join comida_es_conjunto_receta ccr on ccr.id_comida = com.id
join receta r on r.id = ccr.id_receta
join receta_tiene_ingrediente rti on rti.id_receta = r.id
join ingrediente i on i.id = rti.id_ingrediente
where exists ( select 1 from menu m join menu_contiene_comida mcc on mcc.id_comida = m.id 
					where m.id = mcc.id_comida and month(m.fecha_desde)=month(curdate()) and year(m.fecha_desde) = year(curdate()))
                    or exists  ( select 1 from menu m join menu_contiene_comida mcc on mcc.id_comida = m.id 
					where m.id = mcc.id_comida and month(m.fecha_hasta)=month(curdate()) and year(m.fecha_hasta) = year(curdate()))
group by m.id;


-- vi. Conocer mis marcas favoritas, es decir, las que más compro.
select m.descripcion as MarcaFavorita
from marca m
where m.id in (select marcaFavorita.idMarcaFavorita
                from (select max(cantidadMaxima.total), cantidadMaxima.idMarca as idMarcaFavorita
						from  (select count(lcii.id_Ingrediente) as total, i.id_marca as idMarca
								from lista_compras_incluye_ingrediente lcii join ingrediente i on i.id=lcii.id_Ingrediente
								group by i.id_marca, lcii.comprado_o_no
								having  lcii.comprado_o_no=true) as cantidadMaxima) 	as marcaFavorita);

-- vii. ¿En qué lapso del año (mes, semana, período de tiempo) preparé todas las recetas de algún influencer?
select i.nombre as nombreReceta, datediff(max(m.fecha_hasta), min(m.fecha_desde)) as LapsoEnDias
from receta r join publicacion p on p.id = r.id_publicacion
join influencer i on i.id= p.id_influencer
join comida_es_conjunto_receta ccr on ccr.id_receta = r.id
join comida c on c.id = ccr.id_comida
join menu_contiene_comida mcc on mcc.id_comida = c.id
join menu m on m.id = mcc.id_menu
where not exists (select 1
					from comida_es_conjunto_receta ccr2 where ccr2.preparada = false
                    and ccr2.id=ccr.id_receta);
 
 
-- viii. ¿Cuáles son las recetas más utilizadas en los menúes del último año?
select r.id as numReceta, r.comentario
from receta r
join comida_es_conjunto_receta ccr on ccr.id_receta = r.id
join comida c on c.id= ccr.id_comida
join menu_contiene_comida mcc on mcc.id_comida= c.id
join menu m on m.id=mcc.id_menu
and r.id in (select cantidadRecetaFavorita.idReceta
                    from (select max(cantidadMaxima.total),cantidadMaxima.idReceta
                                    from (select count(ccr.id_receta) as total, ccr.id_receta as idReceta
                                            from comida_es_conjunto_receta ccr
                                            where year(m.fecha_desde) = '2022'
                                            group by ccr.id_receta) as cantidadMaxima) as cantidadRecetaFavorita)
group by r.id, r.comentario;

-- ix. ¿Cuántas comidas por semana preparo en promedio?
select cantidadComidas.total/cantidad_de_semanas.total as CantidadComidasPromedio
from (select count(mcc.id_comida) as total
        from menu_contiene_comida mcc) as cantidadComidas,
        (select datediff(curdate(),min(m.fecha_desde))/7 as total
		from menu m)  as cantidad_de_semanas;

-- x. ¿Cuál es el costo por comensal en promedio, en un mes?
select c.id as idComensal, avg((i.precio*rti.cantidad)*ccr.cantidad) as costoPorComensal
from comensal c join comensal_come_comida ccc on ccc.codigo_comensal = c.id
join comida com on com.id = ccc.id_comida
join comida_es_conjunto_receta ccr on ccr.id_comida = com.id
join receta r on r.id = ccr.id_receta
join receta_tiene_ingrediente rti on rti.id_receta = r.id
join ingrediente i on i.id = rti.id_ingrediente
where exists ( select 1 
				from menu m join menu_contiene_comida mcc on mcc.id_menu = m.id 
				where m.fecha_desde between date_sub(curdate(), interval 30 day) 
                and curdate() 
                and com.id = mcc.id_comida )
	or exists  ( select 1 
				from menu m join menu_contiene_comida mcc on mcc.id_menu = m.id 
				where m.fecha_hasta between date_sub(curdate(), interval 30 day) 
                and curdate() 
                and com.id = mcc.id_comida )
group by c.id;