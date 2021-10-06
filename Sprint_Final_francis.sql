/*Creamos tabla proveedores*/
CREATE TABLE IF NOT EXISTS `TeloVendo`.`proveedores` (
  `idproveedor` INT(11) NOT NULL AUTO_INCREMENT,
  `RepresentanteLegal` VARCHAR(45) NOT NULL,
  `NombreCorporativo` VARCHAR(45) NOT NULL,
  `TelefonoPrincipal` DOUBLE NOT NULL,
  `TelefonoSecundario` DOUBLE NULL DEFAULT NULL,
  `Encargado` VARCHAR(45) NULL DEFAULT NULL,
  `Correo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

/*Creamos tabla Clientes*/
CREATE TABLE IF NOT EXISTS `TeloVendo`.`clientes` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `NombreCliente` VARCHAR(45) NOT NULL,
  `ApellidoCliente` VARCHAR(45) NOT NULL,
  `DireccionCliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

/*Creamos tabla Productos*/
CREATE TABLE IF NOT EXISTS `TeloVendo`.`productos` (
  `idproducto` INT(11) NOT NULL AUTO_INCREMENT,
  `CodProducto` VARCHAR(45) NOT NULL,
  `DescProducto` VARCHAR(45) NOT NULL,
  `StockProducto` DECIMAL NOT NULL,
  `PrecioProducto` DECIMAL NOT NULL,
  `CategoriaProducto` VARCHAR(45) NOT NULL,
  `IdProveedor` INT(11) NULL DEFAULT NULL,
  `ColorProducto` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  INDEX `IdProveedor_idx` (`IdProveedor` ASC) VISIBLE,
  CONSTRAINT `IdProveedor`
    FOREIGN KEY (`IdProveedor`)
    REFERENCES `TeloVendo`.`proveedores` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


/*Creamos tabla Ventas*/
CREATE TABLE IF NOT EXISTS `TeloVendo`.`ventas` (
  `idventas` INT(11) NOT NULL AUTO_INCREMENT,
  `idcliente` INT(11) NULL DEFAULT NULL,
  `idproducto` INT(11) NULL DEFAULT NULL,
  `cantidad` DECIMAL NULL DEFAULT NULL,
  `precio` DECIMAL NULL DEFAULT NULL,
  `total` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`idventas`),
  INDEX `idCliente_idx` (`idcliente` ASC) VISIBLE,
  INDEX `idProducto_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `TeloVendo`.`clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idproducto`)
    REFERENCES `TeloVendo`.`productos` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

/*Ingresamos  datos proveedores*/
INSERT INTO `TeloVendo`.`proveedores` (`RepresentanteLegal`, `NombreCorporativo`, `TelefonoPrincipal`, `TelefonoSecundario`, `Encargado`, `Correo`) VALUES ('Juan Perez', 'Cerveza Austral', '98745458', '78644689', 'Luis Rodriguez', 'luis.rodriguez@gmail.com');
INSERT INTO `TeloVendo`.`proveedores` (`RepresentanteLegal`, `NombreCorporativo`, `TelefonoPrincipal`, `TelefonoSecundario`, `Encargado`, `Correo`) VALUES ('Maria Fernandez', 'Kusman', '78564657', '09877768', 'Pedro Martinez', 'pedro.martinez@gmail.com');
INSERT INTO `TeloVendo`.`proveedores` (`RepresentanteLegal`, `NombreCorporativo`, `TelefonoPrincipal`, `TelefonoSecundario`, `Encargado`, `Correo`) VALUES ('Fernando Valenzuela', 'CCU', '67554356', '8766774', 'Fernando Valenzuela', 'fernando.valenzuela@gmail.com');
INSERT INTO `TeloVendo`.`proveedores` (`RepresentanteLegal`, `NombreCorporativo`, `TelefonoPrincipal`, `TelefonoSecundario`, `Encargado`, `Correo`) VALUES ('Luisana Martinez', 'Cacique', '88687678', '87678686', 'Luisana Martinez', 'luisana.martinez@gmail.com');
INSERT INTO `TeloVendo`.`proveedores` (`RepresentanteLegal`, `NombreCorporativo`, `TelefonoPrincipal`, `TelefonoSecundario`, `Encargado`, `Correo`) VALUES ('Esteban Torres', 'Viña Concha y Toro', '87676576', '76786876', 'Esteban Torres', 'esteban.torres@gmail.com');


/*Ingresamos  datos clientes*/
INSERT INTO `TeloVendo`.`clientes` (`NombreCliente`, `ApellidoCliente`, `DireccionCliente`) VALUES ('Esteban', 'Torres', 'Av. Ricardo Lyon 3530');
INSERT INTO `TeloVendo`.`clientes` (`NombreCliente`, `ApellidoCliente`, `DireccionCliente`) VALUES ('Francis', 'Martinez', 'Av. Jose Domingo Cañas 2019');
INSERT INTO `TeloVendo`.`clientes` (`NombreCliente`, `ApellidoCliente`, `DireccionCliente`) VALUES ('Michael', 'Carrera', 'Av. Santo Domingo');
INSERT INTO `TeloVendo`.`clientes` (`NombreCliente`, `ApellidoCliente`, `DireccionCliente`) VALUES ('Claudio', 'Carrasco', 'Pedro de Valdivia 555');
INSERT INTO `TeloVendo`.`clientes` (`NombreCliente`, `ApellidoCliente`, `DireccionCliente`) VALUES ('Pablo', 'Gonzalez', 'La Florida');

/*Ingresamos  datos ventas*/
INSERT INTO `TeloVendo`.`ventas` (`idcliente`, `idproducto`, `cantidad`, `precio`, `total`) VALUES ('1', '1', '5', '1500', '7500');
INSERT INTO `TeloVendo`.`ventas` (`idcliente`, `idproducto`, `cantidad`, `precio`, `total`) VALUES ('3', '4', '10', '3500', '35000');
INSERT INTO `TeloVendo`.`ventas` (`idcliente`, `idproducto`, `cantidad`, `precio`, `total`) VALUES ('5', '8', '50', '2500', '125000');
INSERT INTO `TeloVendo`.`ventas` (`idcliente`, `idproducto`, `cantidad`, `precio`, `total`) VALUES ('4', '7', '25', '27500', '687500');
INSERT INTO `TeloVendo`.`ventas` (`idcliente`, `idproducto`, `cantidad`, `precio`, `total`) VALUES ('2', '6', '10', '20000', '200000');


select * from TeloVendo.proveedores;

INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000001', 'cervenza', '5', '25000', 'cerveza', '1', 'negro');
INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000002', 'vino gato negro', '6', '6000', 'vino', '4', 'azul');
INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000003', 'cervenza', '5', '25000', 'cerveza', '1', 'azul');
INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000004', 'vino gato negro', '6', '6000', 'vino', '4', 'azul');
INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000005', 'cervenza', '5', '25000', 'cerveza', '1', 'negro');
INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000006', 'vino gato negro', '6', '6000', 'vino', '4', 'azul');
INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000007', 'cervenza', '5', '25000', 'cerveza', '1', 'negro');
INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000008', 'vino gato negro', '6', '6000', 'vino', '4', 'azul');
INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000009', 'cervenza', '5', '25000', 'cerveza', '1', 'negro');
INSERT INTO `TeloVendo`.`productos` (`CodProducto`, `DescProducto`, `StockProducto`, `PrecioProducto`, `CategoriaProducto`, `IdProveedor`, `ColorProducto`) VALUES ('000010', 'vino gato negro', '6', '6000', 'vino', '4', 'azul');

/*Se actualiza una categoria*/
UPDATE `TeloVendo`.`productos` SET `CategoriaProducto` = 'vino' WHERE (`idproducto` = '9');

select * from TeloVendo.productos;
/*Cuál es la categoría de productos que más se repite*/
select CategoriaProducto from TeloVendo.productos;

select CategoriaProducto, count(*) from TeloVendo.productos
group by CategoriaProducto;

/*Cuáles son los productos con mayor stock*/
select DescProducto,StockProducto from TeloVendo.productos
where StockProducto >= (select max(StockProducto) from TeloVendo.productos);

/*Qué color de producto es más común en nuestra tienda. */
/**/
/**/
