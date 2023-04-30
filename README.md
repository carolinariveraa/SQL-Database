# SQL-Database

## 1. Descripción del problema
Un cliente quiere abrir de nuevo blockbuster y para ello parte de la base de datos antigua cuya ultima actualización fue en 2006. 
El objetivo consiste en limpiar esas tablas de la base de datos para exportarla a SQL y optimizar su funcionamiento así como hacerla operativa a través de las relaciones entre tablas.

Se parte de las siguientes tablas
- Film
- Actors
- Category
- Inventory
- Language
- Old_HDD
- Rental

## 2. Entregables

En la carpeta notebook se encuentra el archivo main.ipynb que contiene los pasos seguidos para la limpieza y reestructuración de la base de datos además de la inserción en SQL.
El archivo creation_db.sql es la creación de la base de datos y querys.sql son las consultas.

En la carpeta pics se encuentra el resultado de las querys lanzadas y el diagrama ER de las relaciones entre las tablas.

## 3. Metodologia

Se comienza con una exploración inicial de las tablas y se llegan a las siguiente conclusiones
- El release date de las peliculas es siempre el mismo (2006) es por esto que esta columna no es relevante
- Se eliminan columnas que no proporcionan información de interés como last_update
- En la tabla inventory solamente hay 223 peliculas de las 1000 que aarecen en la tabla films
- En la tabla rental la columna de inventory_id contiene más valores de los que hay en inventory

## 4. Cambios

Toma de decisiones:
1. eliminar las filas de rental cuyo inventory_id no corresponde a ninguno de la tabla inventory
2. reestructurar inventory para que aparezca la pelicula, la cantidad en stock y su localización
3. eliminar tabla language y ponerlo como columna en tabla film
4. crear tabla para el customer con datos de los clientes 
5. eliminar tabla category y meterlo como columna en film

## 4. Base de datos final



## 5. Consultas