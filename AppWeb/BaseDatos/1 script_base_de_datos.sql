--CREAR LA BASE DE DATOS
CREATE DATABASE DB_API_EJEMPLO;
-- USAR LA BASE DE DATOS
USE DB_API_EJEMPLO;

-- CREAR UNA TABLA
CREATE TABLE USUARIO
(
    IdU varchar(15) primary key,
	nombres varchar(80),
	telefono varchar(60),
	correo varchar(40),
	ciudad varchar(60),
	fechaIngreso  datetime default getdate()
)

-- INSERTAR REGISTROS
   INSERT INTO USUARIO (IdU,nombres,telefono,correo,ciudad)
   VALUES ('10','juan','324343','juan@gmail.com','Armenia')
   INSERT INTO USUARIO (IdU,nombres,telefono,correo,ciudad)
   VALUES ('11','CARLOS','324343','jcarn@gmail.com','Medellin')
-- CONSULTAR REGISTROS
SELECT IdU,nombres,telefono,correo,ciudad,fechaIngreso  FROM  USUARIO
-- ACTUALIZAR
  UPDATE USUARIO SET nombres='JUAN PABLO',telefono='555555' WHERE IdU='10'


--PROCEDIMIENTOS ALMACENADOS
------
CREATE PROCEDURE SP_INSERTAR_USUARIO
     @IdU varchar(15),
	 @nombres varchar(80),
	 @telefono varchar(60),
	 @correo varchar(40),
	 @ciudad varchar(60)

AS
BEGIN
   INSERT INTO USUARIO (IdU,nombres,telefono,correo,ciudad)
   VALUES ( @IdU,@nombres, @telefono, @correo, @ciudad) 
END
--------------------------
--EJECUTAR PROCEDIMIENTOS ALMACENADOS
EXECUTE SP_INSERTAR_USUARIO '12','PEPITO','324343','pepito@gmail.com','Medellin'

-----
--ACTUALIZAR REGISTROS DE USUARIOS

CREATE PROCEDURE SP_ACTUALIZAR_USUARIO
     @IdU varchar(15),
	 @nombres varchar(80),
	 @telefono varchar(60),
	 @correo varchar(40),
	 @ciudad varchar(60)

AS
BEGIN
 UPDATE USUARIO SET nombres=@nombres,telefono=@telefono,correo=@correo,ciudad=@ciudad WHERE IdU=@IdU
   
END
-----------------------------------

EXECUTE SP_ACTUALIZAR_USUARIO '12','PEPITO PEREZ','324343','pepitoP@gmail.com','Medellin'


-- CONSULTAR UN USUARIO





SELECT IdU,nombres,telefono,correo,ciudad,fechaIngreso  FROM  USUARIO WHERE IdU='12'


CREATE PROCEDURE SP_CONSULTAR_USUARIO
     @IdU varchar(15)
AS
BEGIN
    SELECT IdU,nombres,telefono,correo,ciudad,fechaIngreso  FROM  USUARIO WHERE IdU=@IdU
  
END

------
EXECUTE SP_CONSULTAR_USUARIO '12'

------LISTAR TODOS LOS USUARIOS

CREATE PROCEDURE SP_LISTAR_USUARIO
 
AS
BEGIN
    SELECT IdU,nombres,telefono,correo,ciudad,fechaIngreso  FROM  USUARIO 
  
END

------
EXECUTE SP_LISTAR_USUARIO

---- ELIMINAR UN USUARIO
CREATE PROCEDURE SP_ELIMINAR_USUARIO
     @IdU varchar(15)
AS
BEGIN
    DELETE FROM USUARIO WHERE IdU=@IdU
END
---------------
EXECUTE SP_ELIMINAR_USUARIO '12'





declare @variable int
set @variable=5
print  @variable
select @variable as total

IF @variable>=10
   PRINT 'MAYOR A 10'
ELSE
   PRINT 'MENOR A 10'

------





