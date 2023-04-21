###Ejercicios de Mysql

1-Crear una base de datos llamada almacen

2-Crear tres tablas con los siguientes nombres:
-tb_unidades_medidas: 

(con campo codigo_um que sea de tipo INT,tenga valor no nulo, que sea incremental y que sea la llave primaria)

(campo description tipo VARCHAR de tamaño 20 y por defecto nulo)

(estado de tipo BIT y por defecto nulo)

-tb_categoria
(con campo codigo_ca que sea de tipo INT,tenga valor no nulo, que sea incremental y que sea la llave priamria)
(campo description_ca tipo VARCHAR de tamaño 30 )
(estado de tipo BIT y por defecto nulo)

-tb_articulos
(con campo codigo_ar que sea de tipo INT,tenga valor no nulo, que sea incremental y que sea la llave priamria)
(campo description_ar tipo VARCHAR de tamaño 1000 )
(marca_ar tipo varchar tamaño (50))
(codigo_um int)
(codigo_ca int)
(estado de tipo BIT y por defecto nulo)

3- Insertar los siguientes datos a cada una de las tablas:
tb_unidades_medidas(
    Litros,1
    Metros,0
    Centímetros,0
    kilometros,1
    pulgadas,1
    kilogramos,1
    )
tb_categoria(
    eletroctrodoméstico, 1
    accesorios,0
    belleza,1
    juguetes,0
    autos,1
)
tb_articulos(
    lavarropa,sanyo,6,1,1
    televisor,samgung,6,1,1
    cubierta,pirelli,3,5,0
    robot,honda,2,4,1
    cinturón, nike, 3,2,0
    smartphone,samgung,5,2,1
)

4-Muestra todos las categorías existentes

5-Muestra todos los nombres de los artículos existentes en la base de datos

6-¿Cuántos artículos de marca samsung existe en la base de datos?

7-¿Qué unidades de medidas tienen estado 1?
