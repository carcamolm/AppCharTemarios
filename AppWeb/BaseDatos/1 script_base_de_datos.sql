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


     ------PROCEDIMIENTOS ALMACENADOS-------------

------PROCEDIMIENTO GUARDAR REGISTROS

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

--EJECUTAR PROCEDIMIENTOS ALMACENADOS PARA GUARDAR UN REGISTRO

EXECUTE SP_INSERTAR_USUARIO '12','PEPITO','324343','pepito@gmail.com','Medellin'

-------------------------------

---PROCEDIMIENTO ACTUALIZAR REGISTROS DE USUARIOS

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

-----EJECUTAR PROCEDIMIENTO ALMACENADO ACTUALIZAR REGISTRO

EXECUTE SP_ACTUALIZAR_USUARIO '12','PEPITO PEREZ','324343','pepitoP@gmail.com','Medellin'


-----------------------------------------
-- CONSULTAR UN USUARIOM UN REGISTRO

SELECT IdU,nombres,telefono,correo,ciudad,fechaIngreso  FROM  USUARIO WHERE IdU='12'



---PROCEDIMIENTO CONSULTAR UN REGISTRO

CREATE PROCEDURE SP_CONSULTAR_USUARIO
     @IdU varchar(15)
AS
BEGIN
    SELECT IdU,nombres,telefono,correo,ciudad,fechaIngreso  FROM  USUARIO WHERE IdU=@IdU
  
END



------ EJECUTAR PROCEDIMIENTO ALMACENADO CONSULTAR UN REGISTRO

EXECUTE SP_CONSULTAR_USUARIO '12'




------PROCEDIMIENTO ALMACENADO LISTAR TODOS LOS USUARIOS

CREATE PROCEDURE SP_LISTAR_USUARIO
 
AS
BEGIN
    SELECT IdU,nombres,telefono,correo,ciudad,fechaIngreso  FROM  USUARIO 
  
END



------EJECUTAR PROCEDIMIENTO ALMACENADO LISTAR TODOS LOS REGISTROS

EXECUTE SP_LISTAR_USUARIO


-----PROCEDIMIENTO ALMACENADO ELIMINAR UN USUARIO POR ID


CREATE PROCEDURE SP_ELIMINAR_USUARIO
     @IdU varchar(15)
AS
BEGIN
    DELETE FROM USUARIO WHERE IdU=@IdU
END


-----EJECUTAR PROCEDIMIENTO ALMACENADO ELIMINAR UN USUARIO
EXECUTE SP_ELIMINAR_USUARIO '12'






