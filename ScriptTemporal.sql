-- CREACION DE LA BASE DE DATOS
CREATE DATABASE seminariodos201602723;
-- USO DE LA BASE DE DATOS
USE seminariodos201602723;

-- CREACION DE LA TABLA TEMPORAL
CREATE TABLE Temporal(
	Fecha VARCHAR(300),
	CodigoCliente VARCHAR(300),
	NombreCliente VARCHAR(300),
	TipoCliente VARCHAR(300),
	DireccionCliente VARCHAR(300),
	NumeroCliente VARCHAR(300),
	CodVendedor VARCHAR(300),
	NombreVendedor VARCHAR(300),
	Vacacionista VARCHAR(300),
	CodProducto VARCHAR(300),
	NombreProducto VARCHAR(300),
	MarcaProducto VARCHAR(300),
	Categoria VARCHAR(300),
	SodSuSursal VARCHAR(300),
	NombreSucursal VARCHAR(300),
	DireccionSucursal VARCHAR(300),
	Region VARCHAR(300),
	Departamento VARCHAR(300),
	Unidades VARCHAR(300),
	PrecioUnitario VARCHAR(300),
	CodProveedor VARCHAR(300),
	NombreProveedor VARCHAR(300),
	DireccionProveedor VARCHAR(300),
	NumeroProveedor VARCHAR(300),
	WebProveedor VARCHAR(300)
);


/*
-- CREACION DE LA TABLA ALUMNO
CREATE TABLE Alumno(
	idAlumno INT IDENTITY(1,1) PRIMARY KEY,
	carne INT,
	nombre VARCHAR(200),
	llevaLab VARCHAR(200),
	posibleNota INT
); 
*/