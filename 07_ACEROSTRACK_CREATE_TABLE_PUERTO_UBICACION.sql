------------------------------------------
-- TABLA SICRESAPT_RUTA_PUERTO_CABECERA --
------------------------------------------
CREATE TABLE "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA" (	
    "RPCAN_ID_RUTA_PUERTO" NUMBER NOT NULL ENABLE, 
    "RPCAN_ID_CABECERA" NUMBER(38,0), 
    "RPCAN_ID_OPERATIVO" NUMBER(38,0), 
    "RPCAV_ID_DISPOSITIVO" VARCHAR2(100 CHAR), 
    "RPCAV_PLACA" VARCHAR2(6 CHAR), 
    "RPCAD_FECHA_INICIO" DATE, 
    "RPCAD_FECHA_FIN" DATE, 
    "RPCAV_COMENTARIO" VARCHAR2(2000 CHAR), 
    "RPCAN_ESTADO" NUMBER, 
    "RPCAD_FECHA_CREACION" DATE, 
    "RPCAV_USUARIO_CREACION" VARCHAR2(50 CHAR), 
    "RPCAD_FECHA_MODIFICACION" DATE, 
    "RPCAV_USUARIO_MODIFICACION" VARCHAR2(50 CHAR), 
    CONSTRAINT "SICRESAPTNPK_RPCA_01" PRIMARY KEY ("RPCAN_ID_RUTA_PUERTO")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "INDEXTS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "DATATS"  NO INMEMORY;

COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAN_ID_RUTA_PUERTO" IS 'PK de la tabla cabera del Operativo en puerto ';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAN_ID_CABECERA" IS 'OPLAN_ID_CABECERA corresponde a la cabecera del operativo';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAN_ID_OPERATIVO" IS 'OPLAN_ID_OPERATIVO corresponde al ID del detalle del oeprativo, con el turno seleccionado';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAV_ID_DISPOSITIVO" IS 'obtener por capacitor - devide-id ';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAD_FECHA_INICIO" IS 'fecha hora inicio';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAD_FECHA_FIN" IS 'fecha hora fin';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAN_ESTADO" IS 'Estado';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAD_FECHA_CREACION" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAV_USUARIO_CREACION" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAD_FECHA_MODIFICACION" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA"."RPCAV_USUARIO_MODIFICACION" IS 'Auditoria';

GRANT SELECT ON "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA" TO "CONSULTA";

-----------------------------------------
-- TABLA SICRESAPT_RUTA_PUERTO_DETALLE --
-----------------------------------------
CREATE TABLE "SICRESAP"."SICRESAPT_RUTA_PUERTO_DETALLE" (
    "RPDEN_ID_RUTA_DETALLE" NUMBER NOT NULL ENABLE, 
    "RPDEN_ID_RUTA_PUERTO" NUMBER NOT NULL ENABLE, 
    "RPDEV_ZONA" VARCHAR2(10 CHAR), 
    "RPDEV_LATITUD" VARCHAR2(25 CHAR), 
    "RPDEV_LONGITUD" VARCHAR2(25 CHAR), 
    "RPDEN_ESTADO" NUMBER, 
    "RPDED_FECHA_CREACION" DATE, 
    "RPDEV_USUARIO_CREACION" VARCHAR2(100 CHAR), 
    "RPDED_FECHA_MODIFICACION" DATE, 
    "RPDEV_USUARIO_MODIFICACION" VARCHAR2(100 CHAR), 
    CONSTRAINT "SICRESAPTNPK_RPDE_01" PRIMARY KEY ("RPDEN_ID_RUTA_DETALLE")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "INDEXTS"  ENABLE, 
    CONSTRAINT "SICRESAP_RPDENFK_01" FOREIGN KEY ("RPDEN_ID_RUTA_PUERTO")
    REFERENCES "SICRESAP"."SICRESAPT_RUTA_PUERTO_CABECERA" ("RPCAN_ID_RUTA_PUERTO") ENABLE
)
SEGMENT CREATION IMMEDIATE 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "DATATS" NO INMEMORY ;

COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_DETALLE"."RPDEN_ID_RUTA_DETALLE" IS 'pk autogenerado';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_DETALLE"."RPDEN_ID_RUTA_PUERTO" IS 'FK tabla cabecera';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_DETALLE"."RPDEN_ESTADO" IS '1 default ';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_DETALLE"."RPDED_FECHA_CREACION" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_DETALLE"."RPDEV_USUARIO_CREACION" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_DETALLE"."RPDED_FECHA_MODIFICACION" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_PUERTO_DETALLE"."RPDEV_USUARIO_MODIFICACION" IS 'Auditoria';

GRANT SELECT ON "SICRESAP"."SICRESAPT_RUTA_PUERTO_DETALLE" TO "CONSULTA";

--------------------------------------
-- TABLA SICRESAPT_RUTA_UBICACIONES --
--------------------------------------
CREATE TABLE "SICRESAP"."SICRESAPT_RUTA_UBICACIONES" (
    "RUUBN_ID_RUTA_UBICACION" NUMBER NOT NULL ENABLE, 
    "RUUBV_TIPO_OPERACION" VARCHAR2(1 CHAR), 
    "RUUBV_ORIGEN_LATITUD" VARCHAR2(20 CHAR), 
    "RUUBV_ORIGEN_LONGITUD" VARCHAR2(20 CHAR), 
    "RUUBV_DESTINO_LATITUD" VARCHAR2(20 CHAR), 
    "RUUBV_DESTINO_LONGITUD" VARCHAR2(20 CHAR), 
    "RUUBN_ESTADO" NUMBER, 
    "RUUBD_FECHA_CREACION" DATE, 
    "RUUBV_USUARIO_CREACION" VARCHAR2(50 CHAR), 
    "RUUBD_FECHA_MODIFICACION" DATE, 
    "RUUBV_USUARIO_MODIFICACION" VARCHAR2(50 CHAR), 
    CONSTRAINT "SICRESAPNPK_RUUB_01" PRIMARY KEY ("RUUBN_ID_RUTA_UBICACION")
    USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
    STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
    PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
    BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    TABLESPACE "INDEXTS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "DATATS"   NO INMEMORY ;

COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_UBICACIONES"."RUUBV_TIPO_OPERACION" IS 'Tipo de Operativo de la tabla SICRESAPT_OPERATIVO_FECHAS. I = IMPORTACION E = EXPORTACION';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_UBICACIONES"."RUUBN_ESTADO" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_UBICACIONES"."RUUBD_FECHA_CREACION" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_UBICACIONES"."RUUBV_USUARIO_CREACION" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_UBICACIONES"."RUUBD_FECHA_MODIFICACION" IS 'Auditoria';
COMMENT ON COLUMN "SICRESAP"."SICRESAPT_RUTA_UBICACIONES"."RUUBV_USUARIO_MODIFICACION" IS 'Auditoria';

GRANT SELECT ON "SICRESAP"."SICRESAPT_RUTA_UBICACIONES" TO "CONSULTA";