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

    )