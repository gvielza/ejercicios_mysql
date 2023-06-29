SELECT * FROM sakila.customer;

use sakila;
##1. Actores que tienen de primer nombre ‘Scarlett’.
SELECT * 
FROM actor 
WHERE upper(first_name) = 'SCARLETT';

##Actores que contengan una ‘O’ en su nombre y en una ‘A’ en su apellido.
SELECT * 
FROM actor 
WHERE upper(first_name) LIKE '%O%'
AND upper(last_name) LIKE '%A%';

##Mostrar los titulos y descripción de peliculas que contienen la palabra "dog" en su descripción.
SELECT title, description
FROM film
WHERE description LIKE '%dog%';

#Ciudades del country ‘Spain’.
SELECT * 
FROM city 
WHERE country_id = (SELECT country_id FROM country WHERE upper(country) = 'SPAIN');

SELECT *
FROM city
INNER JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Spain';


##Mostrar el 'firstname' y 'lastname' de los clientes activos (active).
SELECT c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE r.return_date IS NULL;


##Contar el número de clientes activos por paises
SELECT country, COUNT(DISTINCT customer.customer_id) AS active_customers
FROM address
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
JOIN customer ON address.address_id = customer.address_id
JOIN rental ON customer.customer_id = rental.customer_id
WHERE rental.return_date IS NULL
GROUP BY country
ORDER BY active_customers DESC;

##Mostrar los paises dónde hay al menos 10 clientes activos, ordenados del número más grande al más pequeño.
SELECT country.country, COUNT(DISTINCT customer.customer_id) AS active_customers
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
JOIN rental ON customer.customer_id = rental.customer_id
WHERE rental.return_date IS NULL
GROUP BY country.country
HAVING COUNT(DISTINCT customer.customer_id) >= 10
ORDER BY active_customers DESC;

##Mostrar los titulos y descripción de peliculas que más fueron arrendadas, ordenadas de del número más grande al más pequeño.

SELECT film.title, film.description, COUNT(rental.rental_id) AS num_rentals
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id
ORDER BY num_rentals DESC;

##Mostrar el volumen de negocio (ver tabla Payment) asociado a cada pelicula entre dos fechas, ordenado del volumen de negocio más grande al más pequeño.

SELECT f.title, SUM(p.amount) AS revenue
FROM film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
INNER JOIN payment AS p ON r.rental_id = p.rental_id
WHERE r.rental_date BETWEEN '2005-05-01' AND '2005-06-01'
GROUP BY f.title
ORDER BY revenue DESC;

##Ejercicios de INNER JOIN, LEFT JOIN, RIGHT JOIN y FULL JOIN  
Cláusula LEFT JOIN
A diferencia de un INNER JOIN, donde se busca una intersección respetada por ambas tablas, con LEFT JOIN damos prioridad a la tabla de la izquierda, y buscamos en la tabla derecha.

Si no existe ninguna coincidencia para alguna de las filas de la tabla de la izquierda, de igual forma todos los resultados de la primera tabla se muestran.

SELECT
  E.Nombre as 'Empleado',
  D.Nombre as 'Departamento'
FROM Empleados E
LEFT JOIN Departamentos D
ON E.DepartamentoId = D.Id

full join

SELECT E.Nombre as 'Empleado',
  D.Nombre as 'Departamento'
  FROM Empleados E
  LEFT JOIN Departamentos D
  ON E.DepartamentoId = D.Id
UNION
SELECT E.Nombre as 'Empleado',
  D.Nombre as 'Departamento'
  FROM Empleados E
  RIGHT JOIN Departamentos D
  ON E.DepartamentoId = D.Id;

  # Funciones almacenadas

  CREATE DATABASE base_ejemplo;

  CREATE TABLE productos (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    coste FLOAT NOT NULL DEFAULT 0.0,
    precio FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY(id)
);

DELIMITER $$
CREATE FUNCTION calcularBeneficio(coste FLOAT, precio FLOAT) RETURNS DECIMAL(9,2)
BEGIN
    DECLARE beneficio DECIMAL(9,2);
    SET beneficio = precio - coste;
    RETURN beneficio;
END$$
DELIMITER

SELECT *, calcularBeneficio(coste, precio) AS beneficio FROM productos;







