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

## 4. Propuesta de valor

Después de haber reestructurado la base de datos y establecido las relaciones entre las tablas, se han identificado algunas acciones que se deben realizar para mejorar el funcionamiento del sistema. Estas son:

1. Eliminar las filas de la tabla "rental" cuyo "inventory_id" no corresponde a ninguno de los registros en la tabla "inventory".
2. Reestructurar la tabla "inventory" para incluir información detallada sobre la película, la cantidad de stock disponible y su ubicación.
3. Eliminar la tabla "language" y agregar su información como columna en la tabla "film".
4. Crear una nueva tabla para almacenar información de los clientes.
5. Eliminar la tabla "category" e incorporar su información como columna en la tabla "film".

## 4. Base de datos final

Después de la reestructuración de la base de datos y la creación de relaciones entre tablas, se obtiene el siguiente resultado:

![diagrama](pics\diagrama_eer.png)



## 5. Consultas

1. TRES PELICULAS DE LAS QUE MÁS INVENTARIO HAY

![query1](pics\query1.png)

2. 3 PELICULAs MÁS ALQUILADAS

![query2](pics\query2.png)

3. PELICULAS MÁS CARAS 



4. STOCK DE ESAS PELICULAS