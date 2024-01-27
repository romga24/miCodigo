CREATE DATABASE IF NOT EXISTS compra;

USE compra;

/**********TABLA GRUPO*************/
CREATE TABLE grupo(
    grupo VARCHAR(15) NOT NULL,
    PRIMARY KEY (grupo)
);

/**********TABLA PRODUCTOS*************/
CREATE TABLE productos(
    producto VARCHAR(20) NOT NULL,
    grupo VARCHAR(15) NOT NULL,
    stock INT NOT NULL,
    precio DECIMAL(5,2) NOT NULL,
    minimo INT NOT NULL,
    pvp DECIMAL(5,2) NOT NULL,
    iva INT NOT NULL,
    PRIMARY KEY (producto),
    FOREIGN KEY fk_grupo (grupo) REFERENCES grupo(grupo) 
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

/**********TABLA CLIENTES*************/
CREATE TABLE cliente(
    DNI VARCHAR(9) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (DNI)
);

/**********TABLA VENTAS*************/
CREATE TABLE ventas(    
    id_venta INT AUTO_INCREMENT NOT NULL,
    fecha_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    DNI_venta VARCHAR(9) NOT NULL,
    PRIMARY KEY (id_venta),
    FOREIGN KEY fk_dni(DNI_venta) REFERENCES cliente (DNI)
    ON UPDATE CASCADE ON DELETE RESTRICT 
);

/**********TABLA LINEA DE VENTAS*************/
CREATE TABLE lineas_venta(    
    id_venta INT NOT NULL,
    numero_linea INT NOT NULL,
    producto VARCHAR (25) NOT NULL,
    cantidad FLOAT NOT NULL,
    pvp_unitario FLOAT NOT NULL,
    pvp_parcial FLOAT NOT NULL,
    PRIMARY KEY (id_venta, numero_linea),
    FOREIGN KEY fk_venta_01 (id_venta) REFERENCES ventas(id_venta)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY fk_producto_01 (producto) REFERENCES productos (producto)
    ON UPDATE CASCADE ON DELETE RESTRICT    
);

/***************TABLA AVISOS_REPOSICION***************/
CREATE TABLE avisos_reposicion (
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    producto VARCHAR(25) NOT NULL,
    minimo FLOAT NOT NULL,
    stockActual FLOAT NOT NULL,
    PRIMARY KEY (fecha, hora, producto),
    FOREIGN KEY fk_producto03 (producto) REFERENCES productos(producto)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
);

/********DATOS DE LA TABLA GRUPO*************/
INSERT INTO grupo VALUES ('Fruta');
INSERT INTO grupo VALUES ('Hortalizas');
INSERT INTO grupo VALUES ('FRUTOS SECOS');
INSERT INTO grupo VALUES ('VERDURAS');
INSERT INTO grupo VALUES ('Legumbres');
INSERT INTO grupo VALUES ('Lácteos');
INSERT INTO grupo VALUES ('Cereales');
INSERT INTO grupo VALUES ('Carnes');
INSERT INTO grupo VALUES ('Pescados');
INSERT INTO grupo VALUES ('Huevos');
INSERT INTO grupo VALUES ('Aceites');
INSERT INTO grupo VALUES ('Bebidas');
INSERT INTO grupo VALUES ('Condimentos');
INSERT INTO grupo VALUES ('Postres');
INSERT INTO grupo VALUES ('Snacks');
INSERT INTO grupo VALUES ('Procesados');
INSERT INTO grupo VALUES ('Carnes');
INSERT INTO grupo VALUES ('Bebidas');
INSERT INTO grupo VALUES ('Panadería');
INSERT INTO grupo VALUES ('Dulces');
INSERT INTO grupo VALUES ('Congelados');
INSERT INTO grupo VALUES ('Cuidado Personal');
INSERT INTO grupo VALUES ('Higiene y Hogar');
INSERT INTO grupo VALUES ('Droguería');

/**********DATOS DE LA TABLA PRODUCTO*************/
INSERT INTO productos VALUES('piña', 'Fruta', 100, 3.20, 4, 30, 23);
INSERT INTO productos VALUES('pistachos', 'FRUTOS SECOS', 100, 2.20, 4, 30, 54);
INSERT INTO productos VALUES('manzana', 'Fruta', 200, 30, 50, 30, 35);
INSERT INTO productos VALUES('leche', 'VERDURAS', 100, 3.20, 4, 30, 23);
INSERT INTO productos VALUES('pera', 'Fruta', 100, 3.20, 4, 30, 23);
INSERT INTO productos VALUES('lentejas', 'Legumbres', 100, 3.20, 4, 30, 23);
INSERT INTO productos VALUES('sandía', 'Fruta', 50, 5.00, 10, 30, 21);
INSERT INTO productos VALUES('zanahorias', 'Hortalizas', 80, 1.50, 20, 30, 10);
INSERT INTO productos VALUES('almendras', 'FRUTOS SECOS', 120, 3.50, 30, 30, 15);
INSERT INTO productos VALUES('brócoli', 'VERDURAS', 60, 2.00, 15, 30, 10);
INSERT INTO productos VALUES('garbanzos', 'Legumbres', 90, 2.50, 25, 30, 12);
INSERT INTO productos VALUES('yogur', 'Lácteos', 70, 1.80, 10, 30, 10);
INSERT INTO productos VALUES('Manzanas', 'Frutas', 50, 1.5, 10, 2.0, 10);
INSERT INTO productos VALUES('Plátanos', 'Frutas', 40, 1.2, 8, 1.8, 10);
INSERT INTO productos VALUES('Tomates', 'Hortalizas', 30, 1.0, 5, 1.5, 10);
INSERT INTO productos VALUES('Leche Entera', 'Lácteos', 20, 2.0, 5, 2.5, 10);
INSERT INTO productos VALUES('Filete de Ternera', 'Carnes', 15, 8.0, 2, 10.0, 10);
INSERT INTO productos VALUES('Agua Mineral', 'Bebidas', 50, 0.8, 10, 1.2, 10);
INSERT INTO productos VALUES('Pan Integral', 'Panadería', 25, 1.2, 5, 1.8, 10);
INSERT INTO productos VALUES('Galletas Chocolate', 'Dulces', 35, 2.5, 7, 3.0, 10);
INSERT INTO productos VALUES('Pizza Margarita', 'Congelados', 10, 4.0, 2, 5.0, 10);
INSERT INTO productos VALUES('Detergente', 'Higiene y Hogar', 20, 2.0, 5, 2.5, 10);
INSERT INTO productos VALUES('Naranjas', 'Frutas', 80, 1.0, 15, 1.5, 10);
INSERT INTO productos VALUES('Papel Higiénico', 'Droguería', 50, 2.5, 10, 3.0, 10);
INSERT INTO productos VALUES('baguette', 'Panadería', 35, 2.0, 8, 2.5, 10);
INSERT INTO productos VALUES('pan de avena', 'Panadería', 25, 2.5, 5, 3.0, 8);
INSERT INTO productos VALUES('rosquillas', 'Panadería', 40, 1.5, 12, 2.0, 15);
INSERT INTO productos VALUES('pan de centeno', 'Panadería', 30, 2.2, 10, 2.8, 12);
INSERT INTO productos VALUES('donas', 'Panadería', 20, 1.8, 8, 2.2, 10);
INSERT INTO productos VALUES('croissants rellenos', 'Panadería', 18, 2.0, 5, 2.5, 8);
INSERT INTO productos VALUES('panecillos', 'Panadería', 45, 1.5, 15, 2.0, 18);
INSERT INTO productos VALUES('trenza de hojaldre', 'Panadería', 22, 3.5, 6, 4.0, 8);
INSERT INTO productos VALUES('pan de nueces', 'Panadería', 20, 2.8, 5, 3.2, 10);
INSERT INTO productos VALUES('ensaimadas', 'Panadería', 12, 4.0, 3, 4.5, 5);
INSERT INTO productos VALUES('pretzels', 'Snacks', 35, 1.8, 10, 2.2, 15);
INSERT INTO productos VALUES('nachos con queso', 'Snacks', 25, 2.0, 8, 2.5, 12);
INSERT INTO productos VALUES('palomitas de maíz', 'Snacks', 40, 1.2, 18, 1.8, 25);
INSERT INTO productos VALUES('frutos secos', 'Snacks', 30, 2.5, 12, 3.0, 15);
INSERT INTO productos VALUES('galletas saladas', 'Snacks', 28, 2.2, 10, 2.8, 12);
INSERT INTO productos VALUES('chips de tortilla', 'Snacks', 45, 1.8, 15, 2.2, 20);
INSERT INTO productos VALUES('granola con frutas', 'Snacks', 20, 3.0, 8, 3.5, 10);
INSERT INTO productos VALUES('barritas de cereal', 'Snacks', 18, 2.5, 6, 3.0, 8);
INSERT INTO productos VALUES('snack mix', 'Snacks', 22, 2.0, 10, 2.5, 15);
INSERT INTO productos VALUES('crackers de queso', 'Snacks', 30, 2.2, 12, 2.8, 15);
INSERT INTO productos VALUES('chocolates surtidos', 'Snacks', 25, 2.8, 8, 3.2, 12);

/*******************DATOS DE LA TABLA CLIENTES***********************/
INSERT INTO cliente VALUES ('12345A', 'Eleuterio', 'Oridginal Todo', 'Del Plomo, 5, 28008 Madrid', 'tfn111111', 'eleu@gmail.com');
INSERT INTO cliente VALUES ('67890B', 'Dolores', 'De Espalda', 'Jacinto Verdaguer, 21, 28030 Madrid', 'tfn 22222', 'dolor@yahoo.com');
INSERT INTO cliente VALUES ('19283C', 'Gilberto' ,'Gil Aliaga', 'Avenida de Jávea 35, 08001 Barcelona', 'tfn 3333' , 'gg@gmail.es');
INSERT INTO cliente VALUES ('48364D', 'Gilberto' ,'Gil Aliaga', 'Avenida de Jávea 35, 08001 Barcelona', 'tfn 3333' , 'gg@gmail.es');
INSERT INTO cliente VALUES ('56789E', 'Fernanda', 'López', 'Calle Mayor, 15, 28010 Madrid', 'tfn555555', 'fernanda@gmail.com');
INSERT INTO cliente VALUES ('98765F', 'Roberto', 'Gómez', 'Avenida Valencia, 42, 46001 Valencia', 'tfn666666', 'roberto@yahoo.com');
INSERT INTO cliente VALUES ('23456G', 'Isabel', 'Ramírez', 'Gran Vía, 120, 08002 Barcelona', 'tfn777777', 'isabel@gmail.es');
INSERT INTO cliente VALUES ('87654H', 'Javier', 'Martínez', 'Calle Sevilla, 18, 41001 Sevilla', 'tfn888888', 'javier@gmail.es');
INSERT INTO cliente VALUES ('123456789', 'Juan', 'Pérez', 'Calle Principal, 123', '123-456-7890', 'juan@gmail.com');
INSERT INTO cliente VALUES ('987654321', 'María', 'López', 'Avenida Secundaria, 456', '987-654-3210', 'maria@gmail.com');
INSERT INTO cliente VALUES ('567890123', 'Carlos', 'González', 'Plaza Central, 789', '567-890-1230', 'carlos@gmail.com');
INSERT INTO cliente VALUES ('345678901', 'Ana', 'Martínez', 'Avenida Norte, 234', '345-678-9010', 'ana@gmail.com');
INSERT INTO cliente VALUES ('789012345', 'Miguel', 'Fernández', 'Calle Sur, 567', '789-012-3450', 'miguel@gmail.com');
INSERT INTO cliente VALUES ('555555555', 'Laura', 'Gómez', 'Calle Nueva, 567', '555-555-5555', 'laura@gmail.com');
INSERT INTO cliente VALUES ('111111111', 'Pablo', 'Martín', 'Avenida Principal, 789', '111-111-1111', 'pablo@gmail.com');
INSERT INTO cliente VALUES ('34567D', 'Laura', 'Martínez', 'Calle Nueva, 456', '567-123-4567', 'laura@gmail.com');
INSERT INTO cliente VALUES ('89012E', 'Javier', 'Fernández', 'Avenida Principal, 789', '890-567-1234', 'javier@gmail.com');
INSERT INTO cliente  VALUES ('45678F', 'Sara', 'Gómez', 'Plaza Central, 234', '456-789-0123', 'sara@gmail.com');
INSERT INTO cliente  VALUES ('12345G', 'Luis', 'Díaz', 'Calle Secundaria, 567', '123-456-7890', 'luis@gmail.com');
INSERT INTO cliente  VALUES ('67890H', 'Ana', 'Rodríguez', 'Avenida Nueva, 123', '678-901-2345', 'ana@gmail.com');
INSERT INTO cliente  VALUES ('56789I', 'Diego', 'Sánchez', 'Calle Principal, 234', '567-890-1234', 'diego@gmail.com');
INSERT INTO cliente  VALUES ('98765J', 'Marta', 'Hernández', 'Avenida Secundaria, 567', '987-654-3210', 'marta@gmail.com');
INSERT INTO cliente  VALUES ('23456K', 'Pedro', 'Gutiérrez', 'Plaza Central, 123', '234-567-8901', 'pedro@gmail.com');
INSERT INTO cliente  VALUES ('87654L', 'Elena', 'Ruiz', 'Calle Nueva, 456', '876-543-2109', 'elena@gmail.com');
INSERT INTO cliente  VALUES ('34567M', 'Hugo', 'Molina', 'Avenida Principal, 789', '345-678-9012', 'hugo@gmail.com');
INSERT INTO cliente  VALUES ('89012N', 'Isabel', 'Gil', 'Plaza Central, 234', '890-123-4567', 'isabel@gmail.com');
INSERT INTO cliente  VALUES ('45678O', 'Víctor', 'Ortega', 'Calle Secundaria, 567', '456-789-0123', 'victor@gmail.com');
INSERT INTO cliente  VALUES ('12345P', 'Clara', 'Reyes', 'Avenida Nueva, 123', '123-456-7890', 'clara@gmail.com');
INSERT INTO cliente  VALUES ('67890Q', 'Gabriel', 'Alonso', 'Calle Principal, 234', '678-901-2345', 'gabriel@gmail.com');
INSERT INTO cliente  VALUES ('12345R', 'Alejandro', 'Santos', 'Calle Nueva, 567', '123-456-7890', 'alejandro@gmail.com');
INSERT INTO cliente  VALUES ('67890S', 'Natalia', 'Jiménez', 'Avenida Principal, 234', '678-901-2345', 'natalia@gmail.com');
INSERT INTO cliente  VALUES ('34567T', 'Raúl', 'Ramírez', 'Plaza Central, 789', '345-678-9012', 'raul@gmail.com');
INSERT INTO cliente  VALUES ('45678V', 'Pablo', 'Cruz', 'Avenida Nueva, 456', '456-789-0123', 'pablo@gmail.com');
INSERT INTO cliente  VALUES ('12345W', 'Carmen', 'Vega', 'Calle Principal, 567', '123-456-7890', 'carmen@gmail.com');
INSERT INTO cliente  VALUES ('67890X', 'Martín', 'Flores', 'Avenida Secundaria, 234', '678-901-2345', 'martin@gmail.com');
INSERT INTO cliente  VALUES ('34567Y', 'Eva', 'Mendoza', 'Plaza Central, 789', '345-678-9012', 'eva@gmail.com');
INSERT INTO cliente  VALUES ('89012Z', 'Fernando', 'Castañeda', 'Calle Nueva, 123', '890-123-4567', 'fernando@gmail.com');
INSERT INTO cliente  VALUES ('45678AA', 'Cecilia', 'Soto', 'Avenida Principal, 234', '456-789-0123', 'cecilia@gmail.com');

/***********DATOS DE LA TABLA VENTAS********************/
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-10-12 15:10:00', '12345A');
INSERT INTO ventas(DNI_venta) VALUES ('19283C');
INSERT INTO ventas(DNI_venta) VALUES ('48364D');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES  ('2023-12-11 10:30:00', '12345A');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES  ('2023-12-11 12:45:00', '56789E');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-11 15:20:00', '98765F');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-11 18:10:00', '19283C');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-12 09:15:00', '87654H');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES  ('2023-12-12 11:30:00', '67890B');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-11 18:10:00', '19283C');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-11-20 12:30:00', '67890B');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-11-25 14:45:00', '12345A');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-11-28 10:15:00', '67890B');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-11-30 16:20:00', '19283C');
INSERT INTO ventas (DNI_venta) VALUES ('2023-10-30 18:20:00', '19283C','48364D');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-15 09:30:00', '123456789');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-16 10:45:00', '987654321');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-04 12:15:00', '567890123');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-13 14:30:00', '345678901');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-12 16:00:00', '789012345');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-18 08:30:00', '555555555');
INSERT INTO ventas(fecha_hora, DNI_venta) VALUES ('2023-12-19 11:15:00', '111111111');
INSERT INTO ventas(fecha, hora, DNI_venta) VALUES ('2023-05-10', '12:12:12', '67890B');
INSERT INTO ventas VALUES (16, '2023-12-20 14:30:00', '12345P');
INSERT INTO ventas VALUES (17, '2023-12-21 16:45:00', '12345R');
INSERT INTO ventas VALUES (18, '2023-12-22 11:20:00', '12345W');
INSERT INTO ventas VALUES (19, '2023-12-23 09:10:00', '19283C');
INSERT INTO ventas VALUES (20, '2023-12-24 13:15:00', '23456G');
INSERT INTO ventas VALUES (21, '2023-12-25 18:30:00', '23456K');
INSERT INTO ventas VALUES (22, '2023-12-26 10:00:00', '345678901');
INSERT INTO ventas VALUES (23, '2023-12-27 15:45:00', '34567D');
INSERT INTO ventas VALUES (24, '2023-12-28 12:20:00', '34567M');
INSERT INTO ventas VALUES (25, '2023-12-29 09:05:00', '34567T');
INSERT INTO ventas VALUES (26, '2023-12-30 14:15:00', '34567Y');
INSERT INTO ventas VALUES (27, '2023-12-31 17:30:00', '45678AA');
INSERT INTO ventas VALUES (28, '2024-01-01 11:10:00', '45678F');
INSERT INTO ventas VALUES (29, '2024-01-02 14:25:00', '45678O');
INSERT INTO ventas VALUES (30, '2024-01-03 09:40:00', '45678V');


/***********DATOS DE LA TABLA LINEA_VENTAS********************/
INSERT INTO lineas_venta VALUES (1, 1, 'pistachos', 0.55, 1.96, (0.55*1.96));
INSERT INTO lineas_venta VALUES (5, 1, 'piña', 0.66, 1.36, (0.66*1.36));
INSERT INTO lineas_venta VALUES (8, 1, 'manzana', 0.35, 0.96, (0.35*0.96));
INSERT INTO lineas_venta VALUES (12, 1, 'pera', 0.25, 0.96, (0.25*0.96));
INSERT INTO lineas_venta VALUES (13, 1, 'lentejas', 0.75, 0.76, (0.75*0.76));
INSERT INTO lineas_venta VALUES (12, 1, 'pera', 0.25, 0.96, (0.25*0.96));
INSERT INTO lineas_venta VALUES (2, 1, 'Plátanos', 8, 1.8, 14.4);
INSERT INTO lineas_venta VALUES (3, 1, 'Tomates', 5, 1.5, 7.5);
INSERT INTO lineas_venta VALUES (4, 1, 'Leche Entera', 2, 2.5, 5.0);
INSERT INTO lineas_venta VALUES (5, 1, 'Filete de Ternera', 2, 10.0, 20.0);
INSERT INTO lineas_venta VALUES (2, 2, 'Galletas Chocolate', 3, 3.0, 9.0);
INSERT INTO lineas_venta VALUES (3, 2, 'Pizza Margarita', 1, 5.0, 5.0);
INSERT INTO lineas_venta VALUES (5, 2, 'Detergente', 3, 2.5, 7.5);
INSERT INTO lineas_venta VALUES (15, 1, 'Naranjas', 12, 1.5, 18.0);
INSERT INTO lineas_venta VALUES (15, 2, 'Galletas Chocolate', 2, 3.0, 6.0);
INSERT INTO lineas_venta VALUES (14, 'Kiwi', 10, 10, 11);

/***********DATOS DE LA TABLA AVISOS_REPOSICION********************/
INSERT INTO avisos_reposicion (fecha, hora, producto, minimo, stockActual) VALUES ('2023-12-01', '08:00:00', 'Manzanas', 10.0, 5.0);
INSERT INTO avisos_reposicion (fecha, hora, producto, minimo, stockActual) VALUES ('2023-12-02', '10:30:00', 'Leche Entera', 15.0, 12.0);
INSERT INTO avisos_reposicion (fecha, hora, producto, minimo, stockActual) VALUES ('2023-12-03', '14:45:00', 'Filete de Ternera', 5.0, 3.0);
INSERT INTO avisos_reposicion (fecha, hora, producto, minimo, stockActual) VALUES ('2023-12-04', '16:20:00', 'Galletas Chocolate', 8.0, 6.0);
INSERT INTO avisos_reposicion (fecha, hora, producto, minimo, stockActual) VALUES ('2023-12-05', '18:30:00', 'Pizza Margarita', 2.0, 1.0);
INSERT INTO avisos_reposicion (fecha, hora, producto, minimo, stockActual) VALUES ('2023-12-10', '09:00:00', 'Naranjas', 10.0, 8.0);
INSERT INTO avisos_reposicion (fecha, hora, producto, minimo, stockActual) VALUES ('2023-12-15', '14:30:00', 'Papel Higiénico', 8.0, 5.0);

/********************CONSULTAS******************/
SELECT * FROM cliente C ORDER BY C.DNI;


SELECT id_venta, ROUND(SUM(pvp_parcial), 2) AS total
FROM lineas_venta
GROUP BY id_venta
ORDER BY id_venta;

SELECT id_venta, COUNT(numero_linea) AS lineas FROM lineas_venta;

SELECT id_venta 
FROM lineas_venta 
WHERE fecha_hora > '2023-01-01' AND fecha_hora < '2023-12-31';

-- (Otras consultas se ajustan de manera similar)

/*Selecciona el producto que más se haya vendido, por encima de la media de los productos vendidos*/
SELECT
    LV.id_venta
FROM
	lineas_venta LV,
    ventas V
WHERE 
    (V.id_venta = LV.id_venta) AND (LV.cantidad > (SELECT AVG(LV2.cantidad) AS media_cant FROM ventas V2, lineas_venta LV2 WHERE (LV2.id_venta = V2.id_venta)))
ORDER BY 
    LV.cantidad DESC;

/*SCRIPT 30/11/2023*/

/*Procedimientos y métodos de SQL*/
DELIMITER ||
DROP PROCEDURE IF EXISTS P_DatosClienteMasCompra;
CREATE PROCEDURE P_DatosClienteMasCompra(productoBuscado VARCHAR(25), cuantos INT) 
BEGIN
	SELECT C.*,
		   SUM(LV.cantidad) AS total
	FROM cliente C,
         ventas V,
		 lineas_venta LV
    WHERE
         (C.DNI = V.DNI_venta)   AND
         (V.id_venta = LV.id_venta) AND
		 (LV.producto = productoBuscado)
    GROUP BY V.DNI_venta
	ORDER BY total DESC
    LIMIT cuantos;
END ||
DELIMITER ;

/*Llamada al procedimiento*/
CALL P_DatosClienteMasCompra('Kiwi', 2);

/*Nombre y Apellidos más id_compra, fecha y hora*/
/*DATOS EN: CLIENTES, VENTAS */
SELECT C.nombre, C.apellidos, V.id_venta, V.fecha_hora
FROM cliente C,
	 ventas V
WHERE (C.DNI = V.DNI_venta) AND /*UNIÓN ENTRE TABLAS*/
	 /*Otras condiciones impuestas por el enunciado*/
     (V.fecha_hora BETWEEN '2023-10-01' AND '2023-11-30')
ORDER BY C.apellidos, C.nombre;

DELIMITER ||
CREATE PROCEDURE P_DatosVentaENtreDosFechasKiwi(inicioFecha DATE, finFecha DATE) 
BEGIN 
	SELECT C.nombre, C.apellidos, V.id_venta, V.fecha_hora
	FROM cliente C,
		ventas V
	WHERE (C.DNI = V.DNI_venta) AND /*UNIÓN ENTRE TABLAS*/
		  /*Otras condiciones impuestas por el enunciado*/
			(V.fecha_hora BETWEEN inicioFecha AND finFecha)
	ORDER BY C.apellidos, C.nombre;
END ||
DELIMITER ;

CALL P_DatosVentaENtreDosFechasKiwi('2023-10-11', '2023-11-15');

/*FECHAS Y HORAS EN LA QUE HA COMPRADO UN CLIENTE Y AL PROCEDIMIENTO SE LE PASA EL DNI QUE QUERAMOS*/
DROP  PROCEDURE IF EXISTS P_fechaCompraCliente;
DELIMITER ||
CREATE PROCEDURE P_fechaCompraCliente(dniCliente VARCHAR(9))
BEGIN 
	SELECT C.nombre, C.apellidos, V.id_venta, V.fecha_hora
	FROM cliente C, ventas V
	WHERE (C.DNI = V.DNI_venta) AND C.DNI = dniCliente
	ORDER BY V.fecha_hora;
END ||
DELIMITER ;


CALL P_fechaCompraCliente('19283C');

/*Averiguar los productos que no se han vendido*/
SELECT C.nombre, C.apellidos, LV.id_venta, V.fecha_hora
FROM cliente C,
	 ventas V,
     linea_venta LV
WHERE (C.DNI = V.DNI_venta) AND (V.fecha_hora BETWEEN inicioFecha AND finFecha)
ORDER BY C.apellidos, C.nombre;

/*Clase 13/12/2023*/
/***************************************************************************/
DROP PROCEDURE IF EXISTS P_DatosClientesNoCompran;
CREATE PROCEDURE P_DatosClientesNoCompran(fecha_desde DATE, fecha_hasta DATE)
DELIMITER || 
BEGIN
	SELECT C.nombre, C.apellidos
	FROM clientes C,
	WHERE (C.DNI NOT IN(
            SELECT DISTINCT V.DNI_venta AS DNI
            FROM ventas V
			WHERE (V.fecha BETWEEN fecha_desde AND fecha_hasta)
            )
      )
	ORDER BY apellidos, nombre;
END;
CALL P_DatosClientesNoCompran('2023-10-01', '2023-10-31');
/***************************************************************************/

SELECT * FROM productos ORDER BY grupo DESC;

/*********************LÓGICA DE NEGOCIO***************************/
/*Primero controlamos que haya stock suficiente*/


/*Si hay stock, se resta del stock actual la cantidad ventida y se inserta la nueva línea de venta*/
/*Esto inserta valores incorrectos en la base de datos*/

/*Creacion de funciones*/
DELIMITER ||
DROP FUNCTION IF EXISTS fVender;
CREATE FUNCTION fVender(unProducto VARCHAR(25), idVenta INT, numLinea INT, cantVendida FLOAT, precioVenta FLOAT) RETURNS INT
BEGIN
    DECLARE varStockAct FLOAT;
    DECLARE varResult INT;
    
    -- Inicialización
    SET varResult = -1; -- Por defecto, asumimos un error
    
    -- Obtenemos el stock actual del producto
    SELECT stock INTO varStockAct
    FROM productos 
    WHERE producto = unProducto;
    
    -- Verificamos si hay suficiente stock para la venta
    IF cantVendida <= varStockAct THEN
        -- Actualizamos el stock
        UPDATE productos
        SET stock = stock - cantVendida
        WHERE producto = unProducto;
        
        -- Insertamos la venta
        INSERT INTO lineas_venta VALUES (idVenta, numLinea, unProducto, cantVendida, precioVenta, cantVendida * precioVenta);
        
        -- Éxito
        SET varResult = 1;
    END IF;
    
    RETURN varResult;
END ||

DELIMITER $$
DROP FUNCTION IF EXISTS F_getMinimo;
CREATE FUNCTION F_getMinimo(unProducto VARCHAR(20)) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE precioMin INT;

    SELECT minimo INTO precioMin
    FROM productos
    WHERE producto = unProducto;

    RETURN precioMin;
END$$
DELIMITER ;

-- Llamada a la función F_getMinimo para obtener el valor mínimo del producto 'Manzanas'
SELECT F_getMinimo('Manzanas') AS valor_minimo;

DELIMITER //
/*******Crear la función F_INSERTAR_AVISO******/
DELIMITER $$
CREATE FUNCTION F_INSERTAR_AVISO(unProducto VARCHAR(25), minimo FLOAT, elStockActual FLOAT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE aviso_id INT;
    IF (elStockActual < minimo) THEN
        -- Insertar aviso en la tabla
        INSERT INTO avisos_reposicion (producto, minimo, stockActual) VALUES (unProducto, minimo, elStockActual);
        -- Obtener el ID del aviso insertado
        SET aviso_id = LAST_INSERT_ID();
    ELSE
        SET aviso_id = 0; -- O el valor por defecto que desees cuando no se inserta aviso
    END IF;

    RETURN aviso_id;
END $$


SELECT F_INSERTAR_AVISO('Piña', 4, 3);

SELECT id FROM lineas_venta;

/*Funcion que devuelve el precio total de una categoria*/
DELIMITER $$
DROP FUNCTION IF EXISTS f_precioTotalCategoria;
CREATE FUNCTION f_precioTotalCategoria(varGrupo VARCHAR(15)) RETURNS FLOAT
DETERMINISTIC
BEGIN
   DECLARE precioTotal FLOAT;
   
   SELECT SUM(precio) INTO precioTotal
   FROM productos
   WHERE grupo = varGrupo;
   
   RETURN precioTotal;

END $$

SELECT f_precioTotalCategoria('FRUTOS SECOS');

/*Funcion que devuelve si un producto esta disponible en stock*/
DELIMITER $$
CREATE FUNCTION stockDisponible(varProducto VARCHAR(20)) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stockDisponible INT;
    
    SELECT stock INTO stockDisponible
    FROM productos
    WHERE producto = varProducto;
    
    RETURN stockDisponible;
END $$
    
DELIMITER $$
DROP FUNCTION IF EXISTS stockDisponibleAviso;
CREATE FUNCTION stockDisponibleAviso(varProducto VARCHAR(20)) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
    DECLARE valorStr VARCHAR(20);
    
    IF(SELECT stockDisponible(varProducto) > 0) THEN
      SET valorStr = 'Disponible';
    ELSEIF(SELECT stockDisponible(varProducto) = 0) THEN 
	  SET valorStr = 'ACABADO';
    END IF;
    
    RETURN valorStr;
END  $$

SELECT stockDisponibleAviso('Melocoton') AS disponibilidad;

INSERT INTO productos VALUES ('Melocoton', 'Fruta', 0, 1.4, 5, 2.4, 12);

/*Funcion calcular Descuento*/
DELIMITER $$
DROP FUNCTION IF EXISTS F_ActualizarStock;
CREATE FUNCTION F_ActualizarStock(varProducto VARCHAR(20), cantidad INT) RETURNS VARCHAR(20) 
DETERMINISTIC
BEGIN 
    DECLARE avisoStr VARCHAR(20);
    CALL P_actualizarStock(varProducto, cantidad);
    SET avisoStr = stockDisponibleAviso(varProducto);
    RETURN avisoStr;
END $$

SELECT F_ActualizarStock('Melocoton', 50) AS Disponibilidad;

/*Procedimiento que me actualiza la cantidad de un producto en la tabla productos*/
DELIMITER $$
DROP PROCEDURE IF EXISTS P_actualizarStock;
CREATE PROCEDURE P_actualizarStock(varProducto VARCHAR(20), cantidad INT) 
BEGIN
  UPDATE productos
  SET stock = stock + cantidad
  WHERE producto = varProducto;
END $$
/********************************************************************************/

/*Cantidad total vendida de cada producto por cada día de la semana (en español),
ordenando el resultado por día de la semana, cantidad de mayor a menor y producto en caso de 
igual cantidad*/

SELECT 
    SUM(LV.cantidad) AS cantidad_total, 
    DAYNAME(V.fecha_hora) AS dia_semana, 
    V.id_venta
FROM 
    lineas_venta LV, 
    ventas V,
    productos P
WHERE 
    (V.id_venta = LV.id_venta) AND (P.producto = LV.producto)
GROUP BY 
    DAYNAME(V.fecha_hora),
    V.id_venta
ORDER BY 
    DAYOFWEEK(V.fecha_hora) ASC,
    cantidad_total DESC;

/**********************************************************************************/
/*Nombre y el grupo de los productos que tienen un stock inferior al mínimo establecido*/
SELECT G.grupo, P.producto
FROM 
    grupo G,
    productos P
WHERE 
    (G.grupo = P.grupo) AND (P.stock < P.minimo);
/**********************************************************************************/

/*Me da el nombre y la direccion de los que compraron el último mes*/
SELECT C.nombre, C.direccion
FROM 
    cliente C,
    ventas V
WHERE 
    (C.DNI = V.DNI_venta) AND (fecha_hora BETWEEN '2023-12-26' AND '2023-11-26');
ORDER BY
   C.nombre ASC;
   

