-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA TEMPORAL
SELECT * FROM Temporal;
SELECT COUNT(*) FROM Temporal;

-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA CLIENTE
SELECT * FROM Cliente;
SELECT COUNT(*) FROM Cliente;

-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA VENDEDOR
SELECT * FROM Vendedor;
SELECT COUNT(*) FROM Vendedor;

-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA PRODUCTO
SELECT * FROM Producto;
SELECT COUNT(*) FROM Producto;

-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA SUCURSAL
SELECT * FROM Sucursal;
SELECT COUNT(*) FROM Sucursal;

-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA SUCURSAL
SELECT * FROM Region;
SELECT COUNT(*) FROM Region;

-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA TIEMPO
SELECT * FROM Tiempo;
SELECT COUNT(*) FROM Tiempo;

-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA PROVEEDOR
SELECT * FROM Proveedor;
SELECT COUNT(*) FROM Proveedor;

-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA HECHOVENTA
SELECT * FROM HechoVentas;
SELECT COUNT(*) FROM HechoVentas;

-- MOSTRANDO LOS DATOS Y CANTIDAD DE LA TABLA HECHOCOMPRA
SELECT * FROM HechoCompra;
SELECT COUNT(*) FROM HechoCompra;


SELECT te.cantTemporal, cl.cantCliente, ve.cantVendedor, pro.cantProducto,
        su.cantSucursal, re.cantRegion, ti.cantTiempo, pr.cantProveedor,
        hv.cantHechoVentas, hc.cantHechoCompra
FROM (SELECT COUNT(*) cantTemporal FROM Temporal) AS te,
(SELECT COUNT(*) cantCliente FROM Cliente) AS cl,
(SELECT COUNT(*) cantVendedor FROM Vendedor) AS ve,
(SELECT COUNT(*) cantProducto FROM Producto) AS pro,
(SELECT COUNT(*) cantSucursal FROM Sucursal) AS su,
(SELECT COUNT(*) cantRegion FROM Region) AS re,
(SELECT COUNT(*) cantTiempo FROM Tiempo) AS ti,
(SELECT COUNT(*) cantProveedor FROM Proveedor) AS pr,
(SELECT COUNT(*) cantHechoVentas FROM HechoVentas) AS hv,
(SELECT COUNT(*) cantHechoCompra FROM HechoCompra) AS hc
;
