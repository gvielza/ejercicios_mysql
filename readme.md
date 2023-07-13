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

**********************************
*/
-Crea una  base de datos llamada pruebas como se muestra a continuación

CREATE DATABASE IF NOT EXISTS pruebas;
USE pruebas;

-Luego crea la siguiente tabla :

CREATE TABLE tblUsuarios (
   idx INT PRIMARY KEY AUTO_INCREMENT,
   usuario VARCHAR(20),
   nombre VARCHAR(20),
   sexo VARCHAR(1),
   nivel TINYINT,
   email VARCHAR(50),
   telefono VARCHAR(20),
   marca VARCHAR(20),
   compañia VARCHAR(20),
   saldo FLOAT,
   activo BOOLEAN
);
-Luego inserta los siguientes usuarios
INSERT INTO tblUsuarios 
VALUES 
('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','SAMSUNG','IUSACELL','100','1'),
('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG','TELCEL','0','1'),
('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','NOKIA','MOVISTAR','150','1'),
('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','SAMSUNG','TELCEL','50','1'),
('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','NOKIA','IUSACELL','50','0'),
('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','SONY','UNEFON','100','1'),
('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACKBERRY','AXEL','0','1'),
('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG','IUSACELL','50','1'),
('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG','UNEFON','100','1'),
('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','SAMSUNG','TELCEL','500','1'),
('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','SONY','UNEFON','100','0'),
('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOTOROLA','IUSACELL','150','1'),
('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACKBERRY','AT&T','50','0'),
('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOTOROLA','NEXTEL','150','1'),
('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACKBERRY','IUSACELL','0','1'),
('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','SAMSUNG','AXEL','0','0'),
('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOTOROLA','MOVISTAR','500','1'),
('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','SONY','IUSACELL','200','1'),
('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACKBERRY','UNEFON','100','1'),
('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','SONY','UNEFON','150','1'),
('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOTOROLA','AT&T','500','1');
/*

Ejercicios:

1-Listar los nombres de los usuarios

2-Calcular el saldo máximo de los usuarios de sexo “Mujer”

3-Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY

4-Contar los usuarios sin saldo o inactivos

5-Listar el login de los usuarios con nivel 1, 2 o 3

6-Listar los números de teléfono con saldo menor o igual a 300

7-Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL

8-Contar el número de usuarios por compañía telefónica

9-Contar el número de usuarios por nivel

10-Listar el login de los usuarios con nivel 2

11-Mostrar el email de los usuarios que usan gmail

12-Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA


## Ejercicio sobre sakila

1-Actores que tienen de primer nombre ‘Scarlett’

2-Actores que contengan una ‘O’ en su nombre y en una ‘A’ en su apellido

3-Mostrar los titulos y descripción de peliculas que contienen la palabra "dog" en su descripción.

4-Ciudades del country ‘Spain’

******************************************
## Angie(Ejercicio 1 y 2)
1-Mostrar los nombres de los clientes con sus respectivos telefonos

2-Mostrar el titulo , descripción y lenguaje de las peliculas

3-Mostrar las ciudades con sus respectivos codigos postales

4-Mostrar las direcciones , email y telefono de todos los clientes.

5-Mostrar todos nombres de las ciudades y paises usando UNION

6-Devolver una lista con las películas y sus respectivos lenguajes

7-Mostrar todos los clientes y sus fechas de renta

8-Mostrar todas las ciudades que son de Argentina

*******************************************
5-Mostrar el 'firstname' y 'lastname' de los clientes activos (active).

6-Contar el número de clientes activos por paises

7-Mostrar los paises dónde hay al menos 10 clientes activos, ordenados del número más grande al más pequeño.

8-Mostrar los titulos y descripción de peliculas que más fueron arrendadas, ordenadas de del número más grande al más pequeño.

9-Mostrar las peliculas que nunca fueron arrendadas entre dos fechas.

10-Mostrar el volumen de negocio (ver tabla Payment) asociado a cada pelicula entre dos fechas, ordenado del volumen de negocio más grande al más pequeño.

## Ejercicios de INNER JOIN, LEFT JOIN, RIGHT JOIN y FULL JOIN  

CREATE DATABASE TestJoin;


USE TestJoin;


CREATE TABLE Departamentos
(
    Id int,
    Nombre varchar(20)
);

CREATE TABLE Empleados
(
    Nombre varchar(20),
    DepartamentoId int
);

INSERT INTO Departamentos VALUES(31, 'Sales');
INSERT INTO Departamentos VALUES(33, 'Engineering');
INSERT INTO Departamentos VALUES(34, 'Clerical');
INSERT INTO Departamentos VALUES(35, 'Marketing');

INSERT INTO Empleados VALUES('Rafferty', 31);
INSERT INTO Empleados VALUES('Jones', 33);
INSERT INTO Empleados VALUES('Heisenberg', 33);
INSERT INTO Empleados VALUES('Robinson', 34);
INSERT INTO Empleados VALUES('Smith', 34);
INSERT INTO Empleados VALUES('Williams', NULL);

1-Mostrar el nombre de los empleados y los departamentos a los que pertecene

## Ejercicios con classicmodels , mysqlsampledatabase.sql

1-Mostrar los productos, la línea a la que pertenece y la descripción de su línea

2-Mostrar los empleados, con su email que trabajen en Boston

3-Mostrar los clientes que reportaron comentarios y sus comentarios.

4-Mostrra los productos que fueron enviados
--------------------

5-¿Cuánto ha pagado el cliente 282 hasta ahora?

6-Países con más de 10 clientes

7-Cuente estas órdenes; ¿Cuántos hay?
-----------------

## Funciones almacenadas

1-Crear base de datos base_ejemplo
 
2-Crear una tabla productos, con id autoincremental que no sea nulo como llave primaria, nombre varchar de 20 , un coste y precio flotante con valor por defecto de 0.0, todas las columnas deben tener datos.

3-Inserdat datos
INSERT INTO productos (nombre, coste, precio) VALUES ('Producto A', 4, 8), ('Producto B', 1, 1.5),('Producto C', 50, 80);

4- Crear una función calcularBeneficio, Esta función aceptará dos parámetros, que como no podría ser de otro modo son el precio de compra (coste) y el de venta (precio) de un producto. El resultado de al función simplemente será la resta del precio de venta y el de compra, dando como resultado el beneficio obtenido con su venta.

5- Usa la función almacenada sobre los valores de la tabla productos

6-Borrar la función 

## Base de datos world

1- Instalar la base de datos world en tu gestor de base de datos

2- Verificar las cantidad de tablas en la base de datos

3-Obtén el número total de ciudades en la tabla "city" de la base de datos "world".

4-Obtén el valor medio de habitantes de todas las ciudades de la tabla "city" de la base de datos "World".

5-Todos los países que contengan la palabra 'island'.

6-Todas las ciudades con sus respectivos idiomas

7-MOstrar las ciudades ,con sus país región e idioma que hablan 

8-Crear nuevo campo llamado "prueba" a la tabla "countrylanguage" 

9-Obtener el número total de ciudades por cada país

10-obtener el número de idiomas distintos hablados en cada continente, junto con el nombre del continente

----------------------------------------------------------------

11-Función de Agregación: Calcula el promedio de la esperanza de vida en todos los países.

12-Función de Agregación con Filtro: Calcula el número total de países en cada continente

13- Función de Fecha : Cuantos años de indendencia tiene cada país independiente

14-Crear una función que devuelva el número promedio de ciudades por país (no)

15-Crea una función que devuelva el porcentaje de población urbana para un país