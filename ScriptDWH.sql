-- CREACION DE LA BASE DE DATOS
CREATE DATABASE seminariodos201602723;
-- USO DE LA BASE DE DATOS
USE seminariodos201602723;

-- CREACION DE CLIENTE
CREATE TABLE Cliente(
	llaveSCliente INT IDENTITY(1,1) PRIMARY KEY,
	codCliente VARCHAR(6),
	nombreCliente VARCHAR(100),
	tipoCliente VARCHAR(20),
	direccionCliente VARCHAR(200),
	numeroCliente INT
);

-- CREACION DE VENDEDOR
CREATE TABLE Vendedor(
	llaveSVendedor INT IDENTITY(1,1) PRIMARY KEY,
	codVendedor VARCHAR(6),
	nombreVendedor VARCHAR(100),
	vacacionista INT
);

-- CREACION DE PROVEEDOR
CREATE TABLE Proveedor(
	llaveSProveedor INT IDENTITY(1,1) PRIMARY KEY,
	codProveedor VARCHAR(6),
	nombreProveedor VARCHAR(200),
	direccionProveedor VARCHAR(200),
	numeroProveedor INT,
	webProveedor VARCHAR(1)
);

-- CREACION DE TIEMPO
CREATE TABLE Tiempo(
	llaveSTiempo INT IDENTITY(1,1) PRIMARY KEY,
	anio INT,
	nombreMes VARCHAR(15),
	mes INT,
	dia INT
);

-- CREACION DE PRODUCTO
CREATE TABLE Producto(
	llaveSProducto INT IDENTITY(1,1) PRIMARY KEY,
	codProducto VARCHAR(8),
	nombreProducto VARCHAR(200),
	marcaProducto VARCHAR(50),
	categoria VARCHAR(50)
);

-- CREACION DE REGION
CREATE TABLE Region(
	llaveSRegion INT IDENTITY(1,1) PRIMARY KEY,
	nombreRegion VARCHAR(50),
	departamento VARCHAR(50)
);

-- CREACION DE Sucursal
CREATE TABLE Sucursal(
	llaveSSucursal INT IDENTITY(1,1) PRIMARY KEY,
	codSucursal VARCHAR(6),
	nombreSucursal VARCHAR(50),
	direccionSucursal VARCHAR(200)
);

-- CREACION DE HECHOVENTAS
CREATE TABLE HechoVentas(
	Cliente_llaveSCliente  INT NOT NULL,
	Vendedor_llaveSVendedor  INT NOT NULL,
	Producto_llaveSProducto  INT NOT NULL,
	Sucursal_llaveSSucursal INT NOT NULL,
	Region_llaveSRegion  INT NOT NULL,
	Tiempo_llaveSTiempo  INT NOT NULL,
	unidad INT,
	precioUnitario NUMERIC(10,2),

	CONSTRAINT pk_hecho_venta PRIMARY KEY(Cliente_llaveSCliente, Vendedor_llaveSVendedor, Producto_llaveSProducto,
										  Sucursal_llaveSSucursal, Region_llaveSRegion, Tiempo_llaveSTiempo),

	CONSTRAINT fk_cliente FOREIGN KEY(Cliente_llaveSCliente)
	REFERENCES Cliente(llaveSCliente),
	CONSTRAINT fk_vendedor FOREIGN KEY(Vendedor_llaveSVendedor)
	REFERENCES Vendedor(llaveSVendedor),
	CONSTRAINT fk_producto FOREIGN KEY(Producto_llaveSProducto)
	REFERENCES Producto(llaveSProducto),

	CONSTRAINT fk_sucursal FOREIGN KEY(Sucursal_llaveSSucursal)
	REFERENCES Sucursal(llaveSSucursal),
	CONSTRAINT fk_region FOREIGN KEY(Region_llaveSRegion)
	REFERENCES Region(llaveSRegion),
	CONSTRAINT fk_tiempo FOREIGN KEY(Tiempo_llaveSTiempo)
	REFERENCES Tiempo(llaveSTiempo)
);

-- CREACION DE HECHOCOMPRA
CREATE TABLE HechoCompra(
	Proveedor_llaveSProveedor INT NOT NULL,
	Producto_llaveSProducto  INT NOT NULL,
	Sucursal_llaveSSucursal INT NOT NULL,
	Region_llaveSRegion  INT NOT NULL,
	Tiempo_llaveSTiempo  INT NOT NULL,
	unidad INT,
	costoU NUMERIC(10,2),

	CONSTRAINT pk_hecho_compra PRIMARY KEY(Proveedor_llaveSProveedor, Producto_llaveSProducto,
										  Sucursal_llaveSSucursal, Region_llaveSRegion, Tiempo_llaveSTiempo),

	CONSTRAINT fk_proveedor FOREIGN KEY(Proveedor_llaveSProveedor)
	REFERENCES Proveedor(llaveSProveedor),
	CONSTRAINT fk_producto2 FOREIGN KEY(Producto_llaveSProducto)
	REFERENCES Producto(llaveSProducto),

	CONSTRAINT fk_sucursal2 FOREIGN KEY(Sucursal_llaveSSucursal)
	REFERENCES Sucursal(llaveSSucursal),
	CONSTRAINT fk_region2 FOREIGN KEY(Region_llaveSRegion)
	REFERENCES Region(llaveSRegion),
	CONSTRAINT fk_tiempo2 FOREIGN KEY(Tiempo_llaveSTiempo)
	REFERENCES Tiempo(llaveSTiempo)
);


GO 
CREATE TRIGGER InsertarNombreMes 
ON Tiempo AFTER INSERT
AS
BEGIN
	DECLARE @mesInsertado INT;
	DECLARE @nombreMes VARCHAR(15);
	-- SELECT @mesInsertado = mes FROM inserted;
	SET @mesInsertado = (SELECT mes FROM inserted);
	-- PRINT @mesInsertado

	SELECT @nombreMes = CASE @mesInsertado
		WHEN 1 THEN  'Enero'
		WHEN 2 THEN  'Febrero'
		WHEN 3 THEN 'Marzo'
		WHEN 4 THEN  'Abril'
		WHEN 5 THEN 'Mayo'
		WHEN 6 THEN 'Junio'
		WHEN 7 THEN 'Julio'
		WHEN 8 THEN 'Agosto'
		WHEN 9 THEN 'Septiembre'
		WHEN 10 THEN 'Octubre'
		WHEN 11 THEN 'Noviembre'
		WHEN 12 THEN 'Diciembre'
		ELSE ''
	END;

	-- PRINT IDENT_CURRENT('Tiempo');
	-- PRINT @nombreMes;

	BEGIN
		UPDATE Tiempo
		SET nombreMes = @nombreMes
		WHERE llaveSTiempo = IDENT_CURRENT('Tiempo');
	END;
END;


DELETE FROM Temporal;

DELETE FROM HechoCompra;
DELETE FROM HechoVentas;
DELETE FROM Sucursal;
DELETE FROM Region;
DELETE FROM Producto;
DELETE FROM Tiempo;
DELETE FROM Proveedor;
DELETE FROM Vendedor;
DELETE FROM Cliente;

