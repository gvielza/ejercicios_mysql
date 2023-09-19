
#Eliminar la base de datos
drop database pedidos;
#1-Crear la Base de datos denominada PEDIDOS.
create database pedidos;
#usar la BD
use pedidos;
/*Crear las tablas del modelo de datos obtenido a partir del diagrama de Entidad
Relación.
Tener en cuenta las siguientes consideraciones:
a. Definir las restricciones correspondientes establecidas para cada atributo.
(Ejemplo: Valor nulo, restricciones de dominio)
b. Crear las claves primarias (PK) correspondientes.
c. Crear las claves foráneas (FK) correspondientes.
*/
CREATE TABLE Clientes (
    idcliente INT PRIMARY KEY,
    Apellido VARCHAR(255) NOT NULL,
    Nombres VARCHAR(255) NOT NULL,
    Dirección VARCHAR(255),
    mail VARCHAR(255) UNIQUE
);
CREATE TABLE Proveedores (
    idproveedor INT PRIMARY KEY,
    NombreProveedor VARCHAR(255) NOT NULL,
    Dirección VARCHAR(255),
    mail VARCHAR(255) UNIQUE
);
CREATE TABLE Vendedor (
    idvendedor INT PRIMARY KEY,
    Apellido VARCHAR(255) NOT NULL,
    Nombres VARCHAR(255) NOT NULL,
    mail VARCHAR(255) UNIQUE,
    comision DECIMAL(10, 2)
);
CREATE TABLE Productos (
    idproducto INT PRIMARY KEY,
    Descripcion VARCHAR(255) NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    StockMax INT NOT NULL,
    StockMin INT NOT NULL,
    idproveedor INT,
    origen VARCHAR(255),
    FOREIGN KEY (idproveedor) REFERENCES Proveedores(idproveedor)
);
CREATE TABLE Pedidos (
    NumeroPedido INT PRIMARY KEY,
    idcliente INT,
    idvendedor INT,
    fecha DATE,
    Estado VARCHAR(255),
    FOREIGN KEY (idcliente) REFERENCES Clientes(idcliente),
    FOREIGN KEY (idvendedor) REFERENCES Vendedor(idvendedor)
);
CREATE TABLE DetallePedidos (
    NumeroPedido INT,
    renglon INT,
    idproducto INT,
    cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    PRIMARY KEY (NumeroPedido, renglon),
    FOREIGN KEY (NumeroPedido) REFERENCES Pedidos(NumeroPedido),
    FOREIGN KEY (idproducto) REFERENCES Productos(idproducto)
);
/*Poblar la base de datos creada ingresando un conjunto de datos.
Se sugiere:
Ingresar 5 Clientes.
Ingresar 3 Proveedores.
Ingresar 3 Vendedores.
Ingresar al menos 10 productos (distribuidos entre los 3 proveedores creados)
Ingresar 10 pedidos en total con diferente cantidad renglones (Se sugiere crear
pedidos con 1, 2 o 3 renglones máximo).
*/
-- Cliente 1
INSERT INTO Clientes (idcliente, Apellido, Nombres, Dirección, mail)
VALUES (1, 'Apellido1', 'Nombre1', 'Dirección1', 'cliente1@mail.com');

-- Cliente 2
INSERT INTO Clientes (idcliente, Apellido, Nombres, Dirección, mail)
VALUES (2, 'Apellido2', 'Nombre2', 'Dirección2', 'cliente2@mail.com');

-- Cliente 3
INSERT INTO Clientes (idcliente, Apellido, Nombres, Dirección, mail)
VALUES (3, 'Apellido3', 'Nombre3', 'Dirección3', 'cliente3@mail.com');

-- Cliente 4
INSERT INTO Clientes (idcliente, Apellido, Nombres, Dirección, mail)
VALUES (4, 'Apellido4', 'Nombre4', 'Dirección4', 'cliente4@mail.com');

-- Cliente 5
INSERT INTO Clientes (idcliente, Apellido, Nombres, Dirección, mail)
VALUES (5, 'Apellido5', 'Nombre5', 'Dirección5', 'cliente5@mail.com');

-- Proveedor 1
INSERT INTO Proveedores (idproveedor, NombreProveedor, Dirección, mail)
VALUES (1, 'Proveedor1', 'DirecciónProv1', 'proveedor1@mail.com');

-- Proveedor 2
INSERT INTO Proveedores (idproveedor, NombreProveedor, Dirección, mail)
VALUES (2, 'Proveedor2', 'DirecciónProv2', 'proveedor2@mail.com');

-- Proveedor 3
INSERT INTO Proveedores (idproveedor, NombreProveedor, Dirección, mail)
VALUES (3, 'Proveedor3', 'DirecciónProv3', 'proveedor3@mail.com');

-- Vendedor 1
INSERT INTO Vendedor (idvendedor, Apellido, Nombres, mail, comision)
VALUES (1, 'Vendedor1', 'VendedorNombre1', 'vendedor1@mail.com', 0.1);

-- Vendedor 2
INSERT INTO Vendedor (idvendedor, Apellido, Nombres, mail, comision)
VALUES (2, 'Vendedor2', 'VendedorNombre2', 'vendedor2@mail.com', 0.15);

-- Vendedor 3
INSERT INTO Vendedor (idvendedor, Apellido, Nombres, mail, comision)
VALUES (3, 'Vendedor3', 'VendedorNombre3', 'vendedor3@mail.com', 0.2);

INSERT INTO Productos (idproducto, Descripcion, PrecioUnitario, Stock, StockMax, StockMin, idproveedor, origen)
VALUES
    (1, 'Producto 1', 10.99, 100, 200, 50, 1, 'Origen 1'),
    (2, 'Producto 2', 15.99, 80, 150, 40, 1, 'Origen 2'),
    (3, 'Producto 3', 12.49, 120, 180, 60, 2, 'Origen 1'),
    (4, 'Producto 4', 8.99, 200, 300, 80, 2, 'Origen 2'),
    (5, 'Producto 5', 19.99, 50, 100, 30, 3, 'Origen 3'),
    (6, 'Producto 6', 14.99, 60, 120, 40, 3, 'Origen 3'),
    (7, 'Producto 7', 9.99, 150, 250, 70, 1, 'Origen 1'),
    (8, 'Producto 8', 17.49, 90, 160, 50, 2, 'Origen 2'),
    (9, 'Producto 9', 11.99, 110, 200, 60, 3, 'Origen 3'),
    (10, 'Producto 10', 13.99, 70, 130, 40, 3, 'Origen 3');
-- Pedido 1
INSERT INTO Pedidos (NumeroPedido, idcliente, idvendedor, fecha, Estado)
VALUES (1, 1, 1, '2023-09-19', 'En proceso');

-- Detalle del Pedido 1 (3 renglones)
INSERT INTO DetallePedidos (NumeroPedido, renglon, idproducto, cantidad, PrecioUnitario, Total)
VALUES
    (1, 1, 1, 5, 10.99, 54.95),
    (1, 2, 2, 3, 15.99, 47.97),
    (1, 3, 3, 2, 12.49, 24.98);

-- Pedido 2
INSERT INTO Pedidos (NumeroPedido, idcliente, idvendedor, fecha, Estado)
VALUES (2, 2, 2, '2023-09-20', 'Entregado');

-- Detalle del Pedido 2 (2 renglones)
INSERT INTO DetallePedidos (NumeroPedido, renglon, idproducto, cantidad, PrecioUnitario, Total)
VALUES
    (2, 1, 4, 4, 8.99, 35.96),
    (2, 2, 5, 6, 19.99, 119.94);

-- Puedes continuar insertando más pedidos con diferentes cantidades de renglones de manera similar.
/*Crear las siguientes vistas en la Base de datos:
● Detalle de Clientes que realizaron pedidos entre fechas (Apellido, Nombres,
idcliente, correo electrónico).
● Detalle de Vendedores con la cantidad de pedidos realizados (Apellido,
Nombres, idcliente, correo electrónico, CantidadPedidos).
Detalle de pedidos con un total mayor a un determinado valor umbral
(NumeroPedido, Fecha, TotalPedido).
● Lista de productos vendidos entre fechas. (Descripción, CantidadTotal)
CantidadTotal se calcula sumando todas las cantidades vendidas del
producto.
● ¿Cuál es el cliente que realizó más movimientos?
● Detalle de Clientes registrados que nunca realizaron un pedido.
(Apellido, Nombres, mail).
● Detalle de CLientes que realizaron menos de dos pedidos. (Apellido,
Nombres, mail).
● Cantidad Total vendida por Origen de producto
*/

CREATE VIEW Vista_Clientes_Pedidos_Entre_Fechas AS
SELECT
    C.Apellido,
    C.Nombres,
    C.idcliente,
    C.mail AS "Correo electrónico"
FROM
    Clientes C
JOIN
    Pedidos P ON C.idcliente = P.idcliente
WHERE
    P.fecha BETWEEN '2023-01-01' AND '2023-12-31'; -- Aquí debes especificar las fechas deseadas

CREATE VIEW Vista_Vendedores_CantidadPedidos AS
SELECT
    V.Apellido,
    V.Nombres,
    V.idvendedor AS "idcliente",
    V.mail AS "Correo electrónico",
    COUNT(P.NumeroPedido) AS "CantidadPedidos"
FROM
    Vendedor V
LEFT JOIN
    Pedidos P ON V.idvendedor = P.idvendedor
GROUP BY
    V.Apellido,
    V.Nombres,
    V.idvendedor,
    V.mail;
   
    SELECT * FROM vista_clientes_pedidos_entre_fechas;
	SELECT * FROM vista_vendedores_cantidadpedidos;

CREATE VIEW Vista_Pedidos_Mayor_Valor AS
SELECT P.NumeroPedido, P.fecha, SUM(DP.cantidad * DP.PrecioUnitario) AS TotalPedido
FROM Pedidos P
JOIN DetallePedidos DP ON P.NumeroPedido = DP.NumeroPedido
GROUP BY P.NumeroPedido, P.fecha
HAVING TotalPedido > 2; -- Reemplaza "valor_umbral" con el valor deseado

CREATE VIEW Vista_Productos_Vendidos_Entre_Fechas AS
SELECT P.Descripcion, SUM(DP.cantidad) AS CantidadTotal
FROM Productos P
JOIN DetallePedidos DP ON P.idproducto = DP.idproducto
JOIN Pedidos Pe ON DP.NumeroPedido = Pe.NumeroPedido
WHERE Pe.fecha BETWEEN '2023-01-01' AND '2023-12-31'-- Reemplaza las fechas según tus necesidades
GROUp BY P.Descripcion; 

-- Crear la vista primero
CREATE VIEW Vista_Movimientos_Clientes AS
SELECT C.idcliente, C.Apellido, C.Nombres, COUNT(P.NumeroPedido) AS Movimientos
FROM Clientes C
LEFT JOIN Pedidos P ON C.idcliente = P.idcliente
GROUP BY C.idcliente, C.Apellido, C.Nombres;

-- Consulta para encontrar al cliente con más movimientos
SELECT idcliente, Apellido, Nombres, Movimientos
FROM Vista_Movimientos_Clientes
ORDER BY Movimientos DESC
LIMIT 1;

CREATE VIEW Vista_Clientes_Sin_Pedidos AS
SELECT C.Apellido, C.Nombres, C.mail
FROM Clientes C
LEFT JOIN Pedidos P ON C.idcliente = P.idcliente
WHERE P.idcliente IS NULL;

CREATE VIEW Vista_Clientes_Menos_Dos_Pedidos AS
SELECT C.Apellido, C.Nombres, C.mail
FROM Clientes C
LEFT JOIN (
    SELECT idcliente, COUNT(*) AS CantidadPedidos
    FROM Pedidos
    GROUP BY idcliente
) AS Subconsulta ON C.idcliente = Subconsulta.idcliente
WHERE CantidadPedidos < 2;

CREATE VIEW Vista_Clientes_Menos_Dos_Pedidos AS
SELECT C.Apellido, C.Nombres, C.mail
FROM Clientes C
LEFT JOIN (
    SELECT idcliente, COUNT(*) AS CantidadPedidos
    FROM Pedidos
    GROUP BY idcliente
) AS Subconsulta ON C.idcliente = Subconsulta.idcliente
WHERE CantidadPedidos < 2;

CREATE VIEW Vista_Cantidad_Total_Vendida_Por_Origen AS
SELECT origen, SUM(DP.cantidad) AS CantidadTotal
FROM Productos P
JOIN DetallePedidos DP ON P.idproducto = DP.idproducto
GROUP BY origen;




