--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
--
-- Name: unicesar; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON DATABASE unicesar IS 'Base de datos para el proyecto del unicesar';

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;

--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;

--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


SET search_path = public, pg_catalog;
--
-- Name: concat(text, text); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION concat(text, text) RETURNS text
    LANGUAGE sql
    AS $_$select case when $1 = '' then $2 else ($1 || ', ' || $2) end$_$;


ALTER FUNCTION public.concat(text, text) OWNER TO admin;

SET default_tablespace = '';

SET default_with_oids = false;
--
-- Name: usuario; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE usuario (
    usua_codi numeric(10,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_login character varying(50) NOT NULL,
    usua_fech_crea date,
    usua_pasw character varying(35) NOT NULL,
    usua_esta character varying(10) NOT NULL,
    usua_nomb character varying(45),
    perm_radi character(1) DEFAULT 0,
    usua_admin character(1) DEFAULT 0,
    usua_nuevo character(1) DEFAULT 0,
    usua_doc character varying(14) DEFAULT 0,
    codi_nivel numeric(2,0) DEFAULT 1,
    usua_sesion character varying(30),
    usua_fech_sesion date,
    usua_ext numeric(4,0),
    usua_nacim date,
    usua_email character varying(50),
    usua_at character varying(50),
    usua_piso numeric(2,0),
    perm_radi_sal numeric DEFAULT 0,
    usua_admin_archivo numeric(1,0) DEFAULT 0,
    usua_masiva numeric(1,0) DEFAULT 0,
    usua_perm_dev numeric(1,0) DEFAULT 0,
    usua_perm_numera_res character varying(1),
    usua_doc_suip character varying(15),
    usua_perm_numeradoc numeric(1,0),
    sgd_panu_codi numeric(4,0),
    usua_prad_tp1 numeric(1,0) DEFAULT 0,
    usua_prad_tp2 numeric(1,0) DEFAULT 0,
    usua_perm_envios numeric(1,0) DEFAULT 0,
    usua_perm_modifica numeric(1,0) DEFAULT 0,
    usua_perm_impresion numeric(1,0) DEFAULT 0,
    sgd_aper_codigo numeric(2,0),
    usu_telefono1 character varying(14),
    usua_encuesta character varying(1),
    sgd_perm_estadistica numeric(2,0),
    usua_perm_sancionados numeric(1,0),
    usua_admin_sistema numeric(1,0),
    usua_perm_trd numeric(1,0),
    usua_perm_firma numeric(1,0),
    usua_perm_prestamo numeric(1,0),
    usuario_publico numeric(1,0),
    usuario_reasignar numeric(1,0),
    usua_perm_notifica numeric(1,0),
    usua_perm_expediente numeric,
    usua_login_externo character varying(15),
    id_pais numeric(4,0) DEFAULT 170,
    id_cont numeric(2,0) DEFAULT 1,
    usua_auth_ldap numeric(1,0) DEFAULT 0,
    perm_archi character(1) DEFAULT 1,
    perm_vobo character(1) DEFAULT 1,
    perm_borrar_anexo numeric(1,0),
    perm_tipif_anexo numeric(1,0),
    usua_perm_adminflujos numeric(1,0) DEFAULT 0 NOT NULL,
    usua_exp_trd numeric(2,0) DEFAULT 0,
    usua_perm_rademail smallint,
    usua_perm_accesi numeric(1,0) DEFAULT 0,
    usua_perm_agrcontacto numeric(1,0) DEFAULT 0,
    usua_prad_tp4 smallint
);


ALTER TABLE public.usuario OWNER TO admin;
--
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE usuario IS 'USUARIO';

--
-- Name: COLUMN usuario.usua_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_codi IS 'CODIGO DE USUARIO';

--
-- Name: COLUMN usuario.depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.depe_codi IS 'DEPE_CODI';

--
-- Name: COLUMN usuario.usua_login; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_login IS 'LOGIN USUARIO';

--
-- Name: COLUMN usuario.usua_fech_crea; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_fech_crea IS 'FECHA DE CREACION DEL USUARIO';

--
-- Name: COLUMN usuario.usua_pasw; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_pasw IS 'USUA_PASW';

--
-- Name: COLUMN usuario.usua_esta; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_esta IS 'ESTADO DEL USUARIO - Activo o No (1/0)';

--
-- Name: COLUMN usuario.usua_nomb; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_nomb IS 'NOMBRE DEL USUARIO';

--
-- Name: COLUMN usuario.perm_radi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.perm_radi IS 'Permiso para digitalizacion de documentos: 1 permiso asignado';

--
-- Name: COLUMN usuario.usua_admin; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_admin IS 'Prestamo de documentos fisicos: 0 sin permiso -  1 permiso asignado ';

--
-- Name: COLUMN usuario.usua_nuevo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_nuevo IS 'Usuario Nuevo ? Si esta en ''0'' resetea la contrase?a';

--
-- Name: COLUMN usuario.usua_doc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_doc IS 'No. de Documento de Identificacion. ';

--
-- Name: COLUMN usuario.codi_nivel; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.codi_nivel IS 'Nivel del Usuario';

--
-- Name: COLUMN usuario.usua_sesion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_sesion IS 'Sesion Actual del usuario o Ultima fecha que entro.';

--
-- Name: COLUMN usuario.usua_fech_sesion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_fech_sesion IS 'Fecha de Actual de la session o Ultima Fecha.';

--
-- Name: COLUMN usuario.usua_ext; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_ext IS 'Numero de extension del usuario';

--
-- Name: COLUMN usuario.usua_nacim; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_nacim IS 'Fecha Nacimiento';

--
-- Name: COLUMN usuario.usua_email; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_email IS 'Mail';

--
-- Name: COLUMN usuario.usua_at; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_at IS 'Nombre del Equipo';

--
-- Name: COLUMN usuario.usua_piso; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_piso IS 'Piso en el que se encuentra laborando';

--
-- Name: COLUMN usuario.usua_admin_archivo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_admin_archivo IS 'Administrador de Archivo (Expedientes): 0 sin permiso - 1 permiso asignado ';

--
-- Name: COLUMN usuario.usua_masiva; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_masiva IS 'Permiso de radicacion masiva de documentos';

--
-- Name: COLUMN usuario.usua_perm_dev; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_perm_dev IS 'Devoluciones de correo (Dev_correo): 0 sin permiso - 1 permiso asignado';

--
-- Name: COLUMN usuario.sgd_panu_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.sgd_panu_codi IS 'Permisos de anulacion de radicados: 1 - Permiso de solicitud de anulado 2- Permiso de anulacion y generacion de actas 3- Permiso 1 y 2';

--
-- Name: COLUMN usuario.usua_prad_tp1; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_prad_tp1 IS 'Si esta en ''1'' El usuario Tiene Permisos de radicacicion Tipo 1.  En nuestro caso de salida';

--
-- Name: COLUMN usuario.usua_prad_tp2; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_prad_tp2 IS 'Si esta en ''2'' El usuario Tiene Permisos de radicacicion Tipo 2.  En nuestro caso de Entrada';

--
-- Name: COLUMN usuario.usua_perm_envios; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_perm_envios IS 'Envios de correo (correspondencia): 0 sin permiso - 1 permiso asignado';

--
-- Name: COLUMN usuario.usua_perm_modifica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_perm_modifica IS 'Permiso de modificar Radicados';

--
-- Name: COLUMN usuario.usua_perm_impresion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_perm_impresion IS 'Carpeta de impresion: 0 sin permiso - 1 permiso asignado';

--
-- Name: COLUMN usuario.sgd_perm_estadistica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.sgd_perm_estadistica IS 'Si tiene ''1'' tiene permisos como jefe para ver las estadisticas de la dependencia.';

--
-- Name: COLUMN usuario.usua_admin_sistema; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_admin_sistema IS 'Administrador del sistema : 0 sin permiso - 1 permiso asignado';

--
-- Name: COLUMN usuario.usua_perm_trd; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_perm_trd IS 'Usuario Administracion de tablas de retencion documental : 0 sin permiso - 1 permiso asignado';

--
-- Name: COLUMN usuario.usua_perm_prestamo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_perm_prestamo IS 'Indica si un usuario tiene o no permiso de acceso al modulo de prestamo. Segun su valor:

Tiene permiso

(0) No tiene permiso';

--
-- Name: COLUMN usuario.perm_borrar_anexo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.perm_borrar_anexo IS 'Indica si un usuario tiene (1) o no (0) permiso para tipificar anexos .tif';

--
-- Name: COLUMN usuario.perm_tipif_anexo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.perm_tipif_anexo IS 'Indica si un usuario tiene (1)  o no (0) permiso para tipificar anexos .tif';

--
-- Name: COLUMN usuario.usua_perm_rademail; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_perm_rademail IS 'Permiso de radicacion de email';

--
-- Name: COLUMN usuario.usua_perm_accesi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_perm_accesi IS 'Permiso para  compatbilidad uso de lector de pantalla';

--
-- Name: COLUMN usuario.usua_perm_agrcontacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN usuario.usua_perm_agrcontacto IS 'permiso para agregar contactos formualrio rad';

--
-- Name: V_USUARIO; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW "V_USUARIO" AS
    SELECT usuario.usua_codi, usuario.usua_nomb, usuario.usua_login, usuario.depe_codi FROM usuario;


ALTER TABLE public."V_USUARIO" OWNER TO admin;

--
-- Name: perfiles; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE perfiles (
    codi_perfil numeric(10,0) NOT NULL,
    nomb_perfil character varying(45) NOT NULL,
    usua_esta character varying(10) NOT NULL,
    perm_radi character(1) DEFAULT 0,
    usua_admin character(1) DEFAULT 0,
    usua_nuevo character(1) DEFAULT 0,
    codi_nivel numeric(2,0) DEFAULT 1,
    perm_radi_sal numeric DEFAULT 0,
    usua_admin_archivo numeric(1,0) DEFAULT 0,
    usua_masiva numeric(1,0) DEFAULT 0,
    usua_perm_dev numeric(1,0) DEFAULT 0,
    usua_perm_numera_res character varying(1),
    usua_perm_numeradoc numeric(1,0),
    sgd_panu_codi numeric(4,0),
    usua_prad_tp1 numeric(1,0) DEFAULT 0,
    usua_prad_tp2 numeric(1,0) DEFAULT 0,
    usua_prad_tp4 numeric(1,0) DEFAULT 0,
    usua_perm_envios numeric(1,0) DEFAULT 0,
    usua_perm_modifica numeric(1,0) DEFAULT 0,
    usua_perm_impresion numeric(1,0) DEFAULT 0,
    sgd_aper_codigo numeric(2,0),
    sgd_perm_estadistica numeric(2,0),
    usua_admin_sistema numeric(1,0),
    usua_perm_trd numeric(1,0),
    usua_perm_firma numeric(1,0),
    usua_perm_prestamo numeric(1,0),
    usuario_publico numeric(1,0),
    usuario_reasignar numeric(1,0),
    usua_perm_notifica numeric(1,0),
    usua_perm_expediente numeric,
    usua_auth_ldap numeric(1,0) DEFAULT 0,
    perm_archi character(1) DEFAULT 1,
    perm_vobo character(1) DEFAULT 1,
    perm_borrar_anexo numeric(1,0),
    perm_tipif_anexo numeric(1,0),
    usua_perm_adminflujos numeric(1,0) DEFAULT 0 NOT NULL,
    usua_exp_trd numeric(2,0) DEFAULT 0,
    usua_perm_rademail smallint,
    usua_perm_accesi numeric(1,0) DEFAULT 0,
    usua_perm_agrcontacto numeric(1,0) DEFAULT 0
);


ALTER TABLE public.perfiles OWNER TO admin;

--
-- Name: TABLE perfiles; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE perfiles IS 'PERFILES';


--
-- Name: COLUMN perfiles.codi_perfil; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.codi_perfil IS 'CODIGO DEL PERFIL';


--
-- Name: COLUMN perfiles.usua_esta; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_esta IS 'ESTADO DEL USUARIO - Activo o No (1/0)';


--
-- Name: COLUMN perfiles.perm_radi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.perm_radi IS 'Permiso para digitalizacion de documentos: 1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_admin; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_admin IS 'Prestamo de documentos fisicos: 0 sin permiso -  1 permiso asignado ';


--
-- Name: COLUMN perfiles.usua_nuevo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_nuevo IS 'Usuario Nuevo ? Si esta en ''0'' resetea la contrase?a';


--
-- Name: COLUMN perfiles.codi_nivel; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.codi_nivel IS 'Nivel del Usuario';


--
-- Name: COLUMN perfiles.usua_admin_archivo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_admin_archivo IS 'Administrador de Archivo (Expedientes): 0 sin permiso - 1 permiso asignado ';


--
-- Name: COLUMN perfiles.usua_masiva; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_masiva IS 'Permiso de radicacion masiva de documentos';


--
-- Name: COLUMN perfiles.usua_perm_dev; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_perm_dev IS 'Devoluciones de correo (Dev_correo): 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.sgd_panu_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.sgd_panu_codi IS 'Permisos de anulacion de radicados: 1 - Permiso de solicitud de anulado 2- Permiso de anulacion y generacion de actas 3- Permiso 1 y 2';


--
-- Name: COLUMN perfiles.usua_prad_tp1; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_prad_tp1 IS 'Si esta en ''1'' El usuario Tiene Permisos de radicacicion Tipo 1.  En nuestro caso de salida';


--
-- Name: COLUMN perfiles.usua_prad_tp2; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_prad_tp2 IS 'Si esta en ''2'' El usuario Tiene Permisos de radicacicion Tipo 2.  En nuestro caso de Entrada';


--
-- Name: COLUMN perfiles.usua_perm_envios; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_perm_envios IS 'Envios de correo (correspondencia): 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_perm_modifica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_perm_modifica IS 'Permiso de modificar Radicados';


--
-- Name: COLUMN perfiles.usua_perm_impresion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_perm_impresion IS 'Carpeta de impresion: 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.sgd_perm_estadistica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.sgd_perm_estadistica IS 'Si tiene ''1'' tiene permisos como jefe para ver las estadisticas de la dependencia.';


--
-- Name: COLUMN perfiles.usua_admin_sistema; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_admin_sistema IS 'Administrador del sistema : 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_perm_trd; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_perm_trd IS 'Usuario Administracion de tablas de retencion documental : 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_perm_prestamo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_perm_prestamo IS 'Indica si un usuario tiene o no permiso de acceso al modulo de prestamo. Segun su valor:

Tiene permiso

(0) No tiene permiso';


--
-- Name: COLUMN perfiles.perm_borrar_anexo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.perm_borrar_anexo IS 'Indica si un usuario tiene (1) o no (0) permiso para tipificar anexos .tif';


--
-- Name: COLUMN perfiles.perm_tipif_anexo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.perm_tipif_anexo IS 'Indica si un usuario tiene (1)  o no (0) permiso para tipificar anexos .tif';


--
-- Name: COLUMN perfiles.usua_perm_rademail; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_perm_rademail IS 'Permiso de radicacion de email';


--
-- Name: COLUMN perfiles.usua_perm_accesi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_perm_accesi IS 'Permiso para  compatbilidad uso de lector de pantalla';


--
-- Name: COLUMN perfiles.usua_perm_agrcontacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN perfiles.usua_perm_agrcontacto IS 'permiso para agregar contactos formualrio rad';

--
-- Name: anexos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE anexos (
    anex_radi_nume character varying(15) NOT NULL,
    anex_codigo character varying(20) NOT NULL,
    anex_tipo numeric(4,0) NOT NULL,
    anex_tamano numeric,
    anex_solo_lect character varying(1) NOT NULL,
    anex_creador character varying(50) NOT NULL,
    anex_desc character varying(512),
    anex_numero numeric(5,0) NOT NULL,
    anex_nomb_archivo character varying(50) NOT NULL,
    anex_borrado character varying(1) NOT NULL,
    anex_origen numeric(1,0) DEFAULT 0,
    anex_ubic character varying(15),
    anex_salida numeric(1,0) DEFAULT 0,
    radi_nume_salida character varying(15),
    anex_radi_fech timestamp with time zone,
    anex_estado numeric(1,0) DEFAULT 0,
    usua_doc character varying(14),
    sgd_rem_destino numeric(1,0) DEFAULT 0,
    anex_fech_envio timestamp with time zone,
    sgd_dir_tipo numeric(4,0),
    anex_fech_impres timestamp with time zone,
    anex_depe_creador character varying(5),
    sgd_doc_secuencia numeric(15,0),
    sgd_doc_padre character varying(20),
    sgd_arg_codigo numeric(2,0),
    sgd_tpr_codigo numeric(4,0),
    sgd_deve_codigo numeric(2,0),
    sgd_deve_fech date,
    sgd_fech_impres timestamp without time zone,
    anex_fech_anex timestamp with time zone,
    anex_depe_codi character varying(5),
    sgd_pnufe_codi numeric(4,0),
    sgd_dnufe_codi numeric(4,0),
    anex_usudoc_creador character varying(15),
    sgd_fech_doc date,
    sgd_apli_codi numeric(4,0),
    sgd_trad_codigo numeric(2,0),
    sgd_dir_direccion character varying(150),
    sgd_exp_numero character varying(18),
    numero_doc character varying(15),
    sgd_srd_codigo character varying(3),
    sgd_sbrd_codigo character varying(4),
    anex_num_hoja numeric,
    texto_archivo_anex text,
    anex_idarch_version numeric(3,0),
    anex_num_version numeric(2,0)
);


ALTER TABLE public.anexos OWNER TO admin;
--
-- Name: COLUMN anexos.numero_doc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN anexos.numero_doc IS 'Numero de documento';

--
-- Name: COLUMN anexos.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN anexos.sgd_srd_codigo IS 'Serie';

--
-- Name: COLUMN anexos.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN anexos.sgd_sbrd_codigo IS 'Subserie';

--
-- Name: COLUMN anexos.anex_idarch_version; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN anexos.anex_idarch_version IS 'Id del archivo de versión';

--
-- Name: COLUMN anexos.anex_num_version; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN anexos.anex_num_version IS 'Numero de versión del anexo';

--
-- Name: anexos_historico; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE anexos_historico (
    anex_hist_anex_codi character varying(20) NOT NULL,
    anex_hist_num_ver numeric(4,0) NOT NULL,
    anex_hist_tipo_mod character varying(2) NOT NULL,
    anex_hist_usua character varying(15) NOT NULL,
    anex_hist_fecha date NOT NULL,
    usua_doc character varying(14)
);


ALTER TABLE public.anexos_historico OWNER TO admin;
--
-- Name: anexos_tipo; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE anexos_tipo (
    anex_tipo_codi numeric(4,0) NOT NULL,
    anex_tipo_ext character varying(10) NOT NULL,
    anex_tipo_desc character varying(50)
);


ALTER TABLE public.anexos_tipo OWNER TO admin;
--
-- Name: aux_01; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE aux_01 (
    r numeric
);


ALTER TABLE public.aux_01 OWNER TO admin;
--
-- Name: bodega_empresas; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE bodega_empresas (
    nombre_de_la_empresa character varying(300),
    nuir character varying(13),
    nit_de_la_empresa character varying(80),
    sigla_de_la_empresa character varying(80),
    direccion character varying(4000),
    codigo_del_departamento character varying(4000),
    codigo_del_municipio character varying(4000),
    telefono_1 character varying(4000),
    telefono_2 character varying(4000),
    email character varying(4000),
    nombre_rep_legal character varying(4000),
    cargo_rep_legal character varying(4000),
    identificador_empresa numeric(5,0) NOT NULL,
    are_esp_secue numeric(8,0) NOT NULL,
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    activa numeric(1,0) DEFAULT 1,
    flag_rups character varying(10),
    codigo_suscriptor character varying(50)
);


ALTER TABLE public.bodega_empresas OWNER TO admin;
--
-- Name: COLUMN bodega_empresas.codigo_suscriptor; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN bodega_empresas.codigo_suscriptor IS 'Codigo del suscriptor';

--
-- Name: borrar_carpeta_personalizada; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE borrar_carpeta_personalizada (
    carp_per_codi numeric(2,0) NOT NULL,
    carp_per_usu character varying(15) NOT NULL,
    carp_per_desc character varying(80) NOT NULL
);


ALTER TABLE public.borrar_carpeta_personalizada OWNER TO admin;
--
-- Name: borrar_empresa_esp; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE borrar_empresa_esp (
    eesp_codi numeric(7,0) NOT NULL,
    eesp_nomb character varying(150) NOT NULL,
    essp_nit character varying(13),
    essp_sigla character varying(30),
    depe_codi character varying(5),
    muni_codi numeric(4,0),
    eesp_dire character varying(50),
    eesp_rep_leg character varying(75)
);


ALTER TABLE public.borrar_empresa_esp OWNER TO admin;
--
-- Name: TABLE borrar_empresa_esp; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE borrar_empresa_esp IS 'EMPRESA_ESP';

--
-- Name: COLUMN borrar_empresa_esp.eesp_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN borrar_empresa_esp.eesp_codi IS 'CODGO DE EMPRESA DE SERVICIOS PUBLICOS';

--
-- Name: COLUMN borrar_empresa_esp.eesp_nomb; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN borrar_empresa_esp.eesp_nomb IS 'NOMBRE DE EMPRESA';

--
-- Name: COLUMN borrar_empresa_esp.essp_nit; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN borrar_empresa_esp.essp_nit IS 'ESSP_NIT';

--
-- Name: COLUMN borrar_empresa_esp.essp_sigla; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN borrar_empresa_esp.essp_sigla IS 'ESSP_SIGLA';

--
-- Name: COLUMN borrar_empresa_esp.depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN borrar_empresa_esp.depe_codi IS 'DEPE_CODI';

--
-- Name: COLUMN borrar_empresa_esp.muni_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN borrar_empresa_esp.muni_codi IS 'MUNI_CODI';

--
-- Name: carpeta; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE carpeta (
    carp_codi numeric(2,0) NOT NULL,
    carp_desc character varying(80) NOT NULL
);


ALTER TABLE public.carpeta OWNER TO admin;
--
-- Name: TABLE carpeta; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE carpeta IS 'CARPETA';

--
-- Name: COLUMN carpeta.carp_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN carpeta.carp_codi IS 'CARP_CODI';

--
-- Name: COLUMN carpeta.carp_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN carpeta.carp_desc IS 'CARP_DESC';

--
-- Name: carpeta_per; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE carpeta_per (
    usua_codi numeric(3,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    nomb_carp character varying(50),
    desc_carp character varying(50),
    codi_carp numeric(3,0) DEFAULT 99
);


ALTER TABLE public.carpeta_per OWNER TO admin;
--
-- Name: centro_poblado; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE centro_poblado (
    cpob_codi numeric(4,0) NOT NULL,
    muni_codi numeric(4,0) NOT NULL,
    dpto_codi numeric(2,0) NOT NULL,
    cpob_nomb character varying(100) NOT NULL,
    cpob_nomb_anterior character varying(100)
);


ALTER TABLE public.centro_poblado OWNER TO admin;
--
-- Name: TABLE centro_poblado; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE centro_poblado IS 'CENTRO_POBLADO';

--
-- Name: COLUMN centro_poblado.cpob_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN centro_poblado.cpob_codi IS 'CPOB_CODI';

--
-- Name: COLUMN centro_poblado.muni_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN centro_poblado.muni_codi IS 'MUNI_CODI';

--
-- Name: COLUMN centro_poblado.dpto_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN centro_poblado.dpto_codi IS 'DPTO_CODI';

--
-- Name: COLUMN centro_poblado.cpob_nomb; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN centro_poblado.cpob_nomb IS 'CPOB_NOMB';

--
-- Name: departamento; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE departamento (
    dpto_codi numeric(3,0) NOT NULL,
    dpto_nomb character varying(70) NOT NULL,
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170
);


ALTER TABLE public.departamento OWNER TO admin;
--
-- Name: TABLE departamento; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE departamento IS 'DEPARTAMENTO';

--
-- Name: COLUMN departamento.dpto_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN departamento.dpto_codi IS 'DPTO_CODI';

--
-- Name: COLUMN departamento.dpto_nomb; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN departamento.dpto_nomb IS 'DPTO_NOMB';

--
-- Name: dependencia; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE dependencia (
    depe_codi character varying(5) NOT NULL,
    depe_nomb character varying(70) NOT NULL,
    dpto_codi numeric(2,0),
    depe_codi_padre character varying(5),
    muni_codi numeric(4,0),
    depe_codi_territorial character varying(5),
    dep_sigla character varying(100),
    dep_central numeric(1,0),
    dep_direccion character varying(100),
    depe_num_interna numeric(4,0),
    depe_num_resolucion numeric(4,0),
    depe_rad_tp1 character varying(5),
    depe_rad_tp2 character varying(5),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    depe_estado numeric(1,0) DEFAULT 0,
    depe_segu numeric(1,0),
    depe_rad_tp4 character varying(5)
);


ALTER TABLE public.dependencia OWNER TO admin;
--
-- Name: TABLE dependencia; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE dependencia IS 'DEPENDENCIA';

--
-- Name: COLUMN dependencia.depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN dependencia.depe_codi IS 'CODIGO DE DEPENDENCIA';

--
-- Name: COLUMN dependencia.depe_nomb; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN dependencia.depe_nomb IS 'NOMBRE DE DEPENDENCIA';

--
-- Name: COLUMN dependencia.dep_sigla; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN dependencia.dep_sigla IS 'SIGLA DE LA DEPENDENCIA';

--
-- Name: COLUMN dependencia.dep_central; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN dependencia.dep_central IS 'INDICA SI SE TRATA DE UNA DEPENDENCIA DEL NIVEL CENTRAL';

--
-- Name: COLUMN dependencia.depe_segu; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN dependencia.depe_segu IS 'Guarda valor que identifica que la dependencia tenga seguridad o no en la consulta de radicados ';

--
-- Name: dependencia_visibilidad; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE dependencia_visibilidad (
    codigo_visibilidad numeric(18,0) NOT NULL,
    dependencia_visible character varying(5) NOT NULL,
    dependencia_observa character varying(5) NOT NULL
);


ALTER TABLE public.dependencia_visibilidad OWNER TO admin;
--
-- Name: dependencias; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE dependencias
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999
    CACHE 1;


ALTER TABLE public.dependencias OWNER TO admin;
--
-- Name: dup_eliminar; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE dup_eliminar (
    sgd_oem_codigo numeric(8,0) NOT NULL,
    tdid_codi numeric(2,0),
    sgd_oem_oempresa character varying(150),
    sgd_oem_rep_legal character varying(150),
    sgd_oem_nit character varying(14),
    sgd_oem_sigla character varying(50),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_oem_direccion character varying(100),
    sgd_oem_telefono character varying(50)
);


ALTER TABLE public.dup_eliminar OWNER TO admin;
--
-- Name: emp_cod_actualizar; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE emp_cod_actualizar (
    emp_cod_ant character varying(10),
    emp_cod_nue character varying(10)
);


ALTER TABLE public.emp_cod_actualizar OWNER TO admin;
--
-- Name: empresas_temporal; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE empresas_temporal (
    nombre_de_la_empresa character varying(160),
    nuir character varying(13),
    nit_de_la_empresa character varying(80),
    sigla_de_la_empresa character varying(80),
    direccion character varying(4000),
    codigo_del_departamento character varying(4000),
    codigo_del_municipio character varying(4000),
    telefono_1 character varying(4000),
    telefono_2 character varying(4000),
    email character varying(4000),
    nombre_rep_legal character varying(4000),
    cargo_rep_legal character varying(4000),
    identificador_empresa numeric(5,0),
    are_esp_secue numeric(8,0) NOT NULL
);


ALTER TABLE public.empresas_temporal OWNER TO admin;
--
-- Name: entidades_asociativa; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE entidades_asociativa (
    nit character varying(12),
    codentidad numeric(10,0)
);


ALTER TABLE public.entidades_asociativa OWNER TO admin;
--
-- Name: estado; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE estado (
    esta_codi numeric(2,0) NOT NULL,
    esta_desc character varying(100) NOT NULL
);


ALTER TABLE public.estado OWNER TO admin;
--
-- Name: TABLE estado; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE estado IS 'ESTADO';

--
-- Name: COLUMN estado.esta_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN estado.esta_codi IS 'ESTA_CODI';

--
-- Name: COLUMN estado.esta_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN estado.esta_desc IS 'ESTA_DESC';

--
-- Name: fun_funcionario; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE fun_funcionario (
    usua_doc character varying(14),
    usua_fech_crea date NOT NULL,
    usua_esta character varying(10) NOT NULL,
    usua_nomb character varying(45),
    usua_ext numeric(4,0),
    usua_nacim date,
    usua_email character varying(50),
    usua_at character varying(15),
    usua_piso numeric(2,0),
    cedula_ok character(1) DEFAULT 'n'::bpchar,
    cedula_suip character varying(15),
    nombre_suip character varying(45),
    observa character(20)
);


ALTER TABLE public.fun_funcionario OWNER TO admin;
--
-- Name: hist_eventos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE hist_eventos (
    depe_codi character varying(5) NOT NULL,
    hist_fech timestamp with time zone NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    hist_obse character varying(10000) NOT NULL,
    usua_codi_dest numeric(10,0),
    usua_doc character varying(14),
    usua_doc_old character varying(15),
    sgd_ttr_codigo numeric(3,0),
    hist_usua_autor character varying(14),
    hist_doc_dest character varying(14),
    depe_codi_dest character varying(5)
);


ALTER TABLE public.hist_eventos OWNER TO admin;
--
-- Name: TABLE hist_eventos; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE hist_eventos IS 'HIST_EVENTOS';

--
-- Name: COLUMN hist_eventos.depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN hist_eventos.depe_codi IS 'DEPE_CODI';

--
-- Name: COLUMN hist_eventos.hist_fech; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN hist_eventos.hist_fech IS 'HIST_FECH';

--
-- Name: COLUMN hist_eventos.usua_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN hist_eventos.usua_codi IS 'USUA_CODI';

--
-- Name: COLUMN hist_eventos.radi_nume_radi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN hist_eventos.radi_nume_radi IS 'Numero de Radicado';

--
-- Name: COLUMN hist_eventos.hist_obse; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN hist_eventos.hist_obse IS 'HIST_OBSE';

--
-- Name: COLUMN hist_eventos.usua_codi_dest; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN hist_eventos.usua_codi_dest IS 'Codigo del usuario destino.';

--
-- Name: COLUMN hist_eventos.sgd_ttr_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN hist_eventos.sgd_ttr_codigo IS 'Tipo de Evento';

--
-- Name: COLUMN hist_eventos.hist_doc_dest; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN hist_eventos.hist_doc_dest IS 'Documento del usuario destino No. implentado';

--
-- Name: COLUMN hist_eventos.depe_codi_dest; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN hist_eventos.depe_codi_dest IS 'Codigo de la dependencia del usuario destino';

--
-- Name: informados; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE informados (
    radi_nume_radi character varying(15) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    info_desc character varying(600),
    info_fech date NOT NULL,
    info_leido numeric(1,0) DEFAULT 0,
    usua_codi_info numeric(3,0),
    info_codi numeric(10,0),
    usua_doc character varying(14),
    info_resp character varying(10)
);


ALTER TABLE public.informados OWNER TO admin;
--
-- Name: COLUMN informados.usua_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN informados.usua_codi IS 'Codigo de usuario';

--
-- Name: COLUMN informados.info_resp; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN informados.info_resp IS 'Indica si el informado necesita respuesta.';

--
-- Name: medio_recepcion; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE medio_recepcion (
    mrec_codi numeric(2,0) NOT NULL,
    mrec_desc character varying(100) NOT NULL
);


ALTER TABLE public.medio_recepcion OWNER TO admin;
--
-- Name: TABLE medio_recepcion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE medio_recepcion IS 'MEDIO_RECEPCION';

--
-- Name: COLUMN medio_recepcion.mrec_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN medio_recepcion.mrec_codi IS 'CODIGO DE MEDIO DE RECEPCION';

--
-- Name: COLUMN medio_recepcion.mrec_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN medio_recepcion.mrec_desc IS 'DESCRIPCION DEL MEDIO';

--
-- Name: municipio; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE municipio (
    muni_codi numeric(4,0) NOT NULL,
    dpto_codi numeric(3,0) NOT NULL,
    muni_nomb character varying(100) NOT NULL,
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    homologa_muni character varying(10),
    homologa_idmuni character varying(15),
    activa numeric(1,0) DEFAULT 1
);


ALTER TABLE public.municipio OWNER TO admin;
--
-- Name: TABLE municipio; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE municipio IS 'MUNICIPIO';

--
-- Name: COLUMN municipio.muni_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipio.muni_codi IS 'MUNI_CODI';

--
-- Name: COLUMN municipio.dpto_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipio.dpto_codi IS 'DPTO_CODI';

--
-- Name: COLUMN municipio.muni_nomb; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN municipio.muni_nomb IS 'MUNI_NOMB';

--
-- Name: num_resol_dtc; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE num_resol_dtc
    START WITH 24
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.num_resol_dtc OWNER TO admin;
--
-- Name: num_resol_dtn; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE num_resol_dtn
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dtn OWNER TO admin;
--
-- Name: num_resol_dtoc; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE num_resol_dtoc
    START WITH 21
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dtoc OWNER TO admin;
--
-- Name: num_resol_dtor; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE num_resol_dtor
    START WITH 61
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dtor OWNER TO admin;
--
-- Name: num_resol_dts; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE num_resol_dts
    START WITH 61
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dts OWNER TO admin;
--
-- Name: num_resol_gral; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE num_resol_gral
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 20;


ALTER TABLE public.num_resol_gral OWNER TO admin;
--
-- Name: par_serv_servicios; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE par_serv_servicios (
    par_serv_secue numeric(8,0) NOT NULL,
    par_serv_codigo character varying(5),
    par_serv_nombre character varying(100),
    par_serv_estado character varying(1)
);


ALTER TABLE public.par_serv_servicios OWNER TO admin;
--
-- Name: pl_generado_plg; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE pl_generado_plg (
    depe_codi character varying(5),
    radi_nume_radi character varying(15),
    plt_codi numeric(4,0),
    plg_codi numeric(4,0),
    plg_comentarios character varying(150),
    plg_analiza numeric(10,0),
    plg_firma numeric(10,0),
    plg_autoriza numeric(10,0),
    plg_imprime numeric(10,0),
    plg_envia numeric(10,0),
    plg_archivo_tmp character varying(150),
    plg_archivo_final character varying(150),
    plg_nombre character varying(30),
    plg_crea numeric(10,0) DEFAULT 0,
    plg_autoriza_fech date,
    plg_imprime_fech date,
    plg_envia_fech date,
    plg_crea_fech date,
    plg_creador character varying(20),
    pl_codi numeric(4,0),
    usua_doc character varying(14),
    sgd_rem_destino numeric(1,0) DEFAULT 0,
    radi_nume_sal character varying(15) DEFAULT 0
);


ALTER TABLE public.pl_generado_plg OWNER TO admin;
--
-- Name: pl_tipo_plt; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE pl_tipo_plt (
    plt_codi numeric(4,0) NOT NULL,
    plt_desc character varying(35)
);


ALTER TABLE public.pl_tipo_plt OWNER TO admin;
--
-- Name: plan_table; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE plan_table (
    statement_id character varying(30),
    "timestamp" date,
    remarks character varying(80),
    operation character varying(30),
    options character varying(30),
    object_node character varying(128),
    object_owner character varying(30),
    object_name character varying(30),
    object_instance integer,
    object_type character varying(30),
    optimizer character varying(255),
    search_columns numeric,
    id integer,
    parent_id integer,
    "position" integer,
    cost integer,
    cardinality integer,
    s integer,
    other_tag character varying(255),
    partition_start character varying(255),
    partition_stop character varying(255),
    partition_id integer,
    other character varying(255),
    distribution character varying(30)
);


ALTER TABLE public.plan_table OWNER TO admin;
--
-- Name: plantilla_pl; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE plantilla_pl (
    pl_codi numeric(4,0) NOT NULL,
    depe_codi character varying(5),
    pl_nomb character varying(35),
    pl_archivo character varying(35),
    pl_desc character varying(150),
    pl_fech date,
    usua_codi numeric(10,0),
    pl_uso numeric(1,0) DEFAULT 0
);


ALTER TABLE public.plantilla_pl OWNER TO admin;
--
-- Name: plsql_profiler_data; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE plsql_profiler_data (
    runid numeric,
    unit_numeric numeric,
    line numeric NOT NULL,
    total_occur numeric,
    total_time numeric,
    min_time numeric,
    max_time numeric,
    spare1 numeric,
    spare2 numeric,
    spare3 numeric,
    spare4 numeric
);


ALTER TABLE public.plsql_profiler_data OWNER TO admin;
--
-- Name: plsql_profiler_runnumeric; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE plsql_profiler_runnumeric
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.plsql_profiler_runnumeric OWNER TO admin;
--
-- Name: plsql_profiler_runs; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE plsql_profiler_runs (
    runid numeric,
    related_run numeric,
    run_owner character varying(32),
    run_date date,
    run_comment character varying(2047),
    run_total_time numeric,
    run_system_info character varying(2047),
    run_comment1 character varying(2047),
    spare1 character varying(256)
);


ALTER TABLE public.plsql_profiler_runs OWNER TO admin;
--
-- Name: plsql_profiler_units; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE plsql_profiler_units (
    runid numeric,
    unit_numeric numeric,
    unit_type character varying(32),
    unit_owner character varying(32),
    unit_name character varying(32),
    unit_timestamp date,
    total_time numeric DEFAULT 0 NOT NULL,
    spare1 numeric,
    spare2 numeric
);


ALTER TABLE public.plsql_profiler_units OWNER TO admin;
--
-- Name: pres_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE pres_seq
    START WITH 30392
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.pres_seq OWNER TO admin;
--
-- Name: prestamo; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE prestamo (
    pres_id numeric(10,0) NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    usua_login_actu character varying(50) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_login_pres character varying(50),
    pres_desc character varying(200),
    pres_fech_pres timestamp without time zone,
    pres_fech_devo timestamp without time zone,
    pres_fech_pedi timestamp without time zone NOT NULL,
    pres_estado numeric(2,0),
    pres_requerimiento numeric(2,0),
    pres_depe_arch character varying(5),
    pres_fech_venc timestamp without time zone,
    dev_desc character varying(500),
    pres_fech_canc timestamp without time zone,
    usua_login_canc character varying(50),
    usua_login_rx character varying(50)
);


ALTER TABLE public.prestamo OWNER TO admin;
--
-- Name: COLUMN prestamo.dev_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN prestamo.dev_desc IS 'Observaciones realizadas por el usuario que recibe la devolucion acerca de la cantidad, el estado, tipo o sucesos acontecidos con los documentos y anexos fisicos';

--
-- Name: COLUMN prestamo.pres_fech_canc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN prestamo.pres_fech_canc IS 'Fecha de cancelacion de la solicitud';

--
-- Name: COLUMN prestamo.usua_login_canc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN prestamo.usua_login_canc IS 'Login del usuario que cancela la solicitud';

--
-- Name: COLUMN prestamo.usua_login_rx; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN prestamo.usua_login_rx IS 'Login del usuario que recibe el documento al momento de entregar.';

--
-- Name: radicado; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE radicado (
    radi_nume_radi character varying(15) NOT NULL,
    radi_fech_radi timestamp with time zone NOT NULL,
    tdoc_codi numeric(4,0) NOT NULL,
    trte_codi numeric(2,0),
    mrec_codi numeric(2,0),
    eesp_codi numeric(10,0),
    eotra_codi numeric(10,0),
    radi_tipo_empr character varying(2),
    radi_fech_ofic date,
    tdid_codi numeric(2,0),
    radi_nume_iden character varying(15),
    radi_nomb character varying(90),
    radi_prim_apel character varying(50),
    radi_segu_apel character varying(50),
    radi_pais character varying(70),
    muni_codi numeric(5,0),
    cpob_codi numeric(4,0),
    carp_codi numeric(3,0),
    esta_codi numeric(2,0),
    dpto_codi numeric(2,0),
    cen_muni_codi numeric(4,0),
    cen_dpto_codi numeric(2,0),
    radi_dire_corr character varying(100),
    radi_tele_cont character varying(15),
    radi_nume_hoja numeric(4,0),
    radi_desc_anex character varying(500),
    radi_nume_deri character varying(15),
    radi_path character varying(100),
    radi_usua_actu numeric(10,0),
    radi_depe_actu character varying(5),
    radi_fech_asig timestamp with time zone,
    radi_arch1 character varying(10),
    radi_arch2 character varying(10),
    radi_arch3 character varying(10),
    radi_arch4 character varying(10),
    ra_asun character varying(350),
    radi_usu_ante character varying(45),
    radi_depe_radi character varying(5),
    radi_rem character varying(60),
    radi_usua_radi numeric(10,0),
    codi_nivel numeric(2,0) DEFAULT 1,
    flag_nivel integer DEFAULT 1,
    carp_per numeric(1,0) DEFAULT 0,
    radi_leido numeric(1,0) DEFAULT 0,
    radi_cuentai character varying(20),
    radi_tipo_deri numeric(2,0) DEFAULT 0,
    listo character varying(2),
    sgd_tma_codigo numeric(4,0),
    sgd_mtd_codigo numeric(4,0),
    par_serv_secue numeric(8,0),
    sgd_fld_codigo numeric(3,0) DEFAULT 0,
    radi_agend numeric(1,0),
    radi_fech_agend timestamp with time zone,
    radi_fech_doc date,
    sgd_doc_secuencia numeric(15,0),
    sgd_pnufe_codi numeric(4,0),
    sgd_eanu_codigo numeric(1,0),
    sgd_not_codi numeric(3,0),
    radi_fech_notif timestamp with time zone,
    sgd_tdec_codigo numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_ttr_codigo integer DEFAULT 0,
    usua_doc_ante character varying(14),
    radi_fech_antetx timestamp with time zone,
    sgd_trad_codigo numeric(2,0),
    fech_vcmto timestamp with time zone,
    tdoc_vcmto numeric(4,0),
    sgd_termino_real numeric(4,0),
    id_cont numeric(2,0) DEFAULT 1,
    sgd_spub_codigo numeric(2,0) DEFAULT 0,
    id_pais numeric(4,0),
    medio_m character varying(5),
    radi_nrr numeric(2,0),
    numero_rm character varying(15),
    numero_tran character varying(15),
    texto_archivo text
);


ALTER TABLE public.radicado OWNER TO admin;
--
-- Name: COLUMN radicado.radi_nume_radi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_nume_radi IS 'Numero de Radicado';

--
-- Name: COLUMN radicado.radi_fech_radi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_fech_radi IS 'FECHA DE RADICACION';

--
-- Name: COLUMN radicado.tdoc_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.tdoc_codi IS 'Tipo de Documento, (ej. Res, derecho pet, tutela, etc .. . . . .)';

--
-- Name: COLUMN radicado.trte_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.trte_codi IS 'TRTE_CODI';

--
-- Name: COLUMN radicado.mrec_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.mrec_codi IS 'MREC_CODI';

--
-- Name: COLUMN radicado.eesp_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.eesp_codi IS 'EESP_CODI';

--
-- Name: COLUMN radicado.eotra_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.eotra_codi IS 'EOTRA_CODI';

--
-- Name: COLUMN radicado.radi_tipo_empr; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_tipo_empr IS 'TIPO DE EMPRESA (OTRA O ESP)';

--
-- Name: COLUMN radicado.radi_fech_ofic; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_fech_ofic IS 'FECHA DE OFICIO';

--
-- Name: COLUMN radicado.tdid_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.tdid_codi IS 'TDID_CODI';

--
-- Name: COLUMN radicado.radi_nume_iden; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_nume_iden IS 'NUMERO DE IDENTIFICACION';

--
-- Name: COLUMN radicado.radi_nomb; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_nomb IS 'NOMBRE';

--
-- Name: COLUMN radicado.radi_prim_apel; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_prim_apel IS '1 APELLIDO';

--
-- Name: COLUMN radicado.radi_segu_apel; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_segu_apel IS '2 APELLIDO';

--
-- Name: COLUMN radicado.radi_pais; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_pais IS 'PAIS (DEFAULT COLOMBIA)';

--
-- Name: COLUMN radicado.muni_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.muni_codi IS 'MUNI_CODI';

--
-- Name: COLUMN radicado.cpob_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.cpob_codi IS 'CPOB_CODI';

--
-- Name: COLUMN radicado.carp_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.carp_codi IS 'CARP_CODI';

--
-- Name: COLUMN radicado.esta_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.esta_codi IS 'ESTA_CODI';

--
-- Name: COLUMN radicado.dpto_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.dpto_codi IS 'DPTO_CODI';

--
-- Name: COLUMN radicado.cen_muni_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.cen_muni_codi IS 'CEN_MUNI_CODI';

--
-- Name: COLUMN radicado.cen_dpto_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.cen_dpto_codi IS 'CEN_DPTO_CODI';

--
-- Name: COLUMN radicado.radi_dire_corr; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_dire_corr IS 'DIRECCION CORRESPONDENCIA';

--
-- Name: COLUMN radicado.radi_tele_cont; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_tele_cont IS 'TELEFONO CONTACTO';

--
-- Name: COLUMN radicado.radi_nume_hoja; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_nume_hoja IS 'NUMERO DE HOJAS';

--
-- Name: COLUMN radicado.radi_desc_anex; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_desc_anex IS 'DESCRIPCION DE ANEXOS';

--
-- Name: COLUMN radicado.radi_nume_deri; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_nume_deri IS 'NUMERO DERIVADO';

--
-- Name: COLUMN radicado.radi_path; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_path IS 'RADI_PATH';

--
-- Name: COLUMN radicado.radi_usua_actu; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_usua_actu IS 'USUARIO ACTUAL';

--
-- Name: COLUMN radicado.radi_depe_actu; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_depe_actu IS 'DEPENDENCIA ACTUAL (USUARIO)';

--
-- Name: COLUMN radicado.radi_fech_asig; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_fech_asig IS 'FECHA DE ASIGNACION DEL USUARIO';

--
-- Name: COLUMN radicado.radi_arch1; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_arch1 IS 'CAMPO PARA ARCHIVO FISICO';

--
-- Name: COLUMN radicado.radi_arch2; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_arch2 IS 'CAMPO PARA ARCHIVO FISICO';

--
-- Name: COLUMN radicado.radi_arch3; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_arch3 IS 'CAMPO PARA ARCHIVO FISICO';

--
-- Name: COLUMN radicado.radi_arch4; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_arch4 IS 'CAMPO PARA ARCHIVO FISICO';

--
-- Name: COLUMN radicado.usua_doc_ante; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.usua_doc_ante IS 'Codigo TTR. transaccion.';

--
-- Name: COLUMN radicado.radi_fech_antetx; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.radi_fech_antetx IS 'Documento del usuario que realizo la anterior tx';

--
-- Name: COLUMN radicado.sgd_trad_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.sgd_trad_codigo IS 'Fecha de la Ultima transaccion.';

--
-- Name: COLUMN radicado.numero_rm; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.numero_rm IS 'numero de registro';

--
-- Name: COLUMN radicado.numero_tran; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN radicado.numero_tran IS 'Numero de transaccion';

--
-- Name: retencion_doc_tmp; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE retencion_doc_tmp (
    cod_serie numeric(4,0),
    serie character varying(100),
    tipologia_doc character varying(200),
    cod_subserie character varying(10),
    subserie character varying(100),
    tipologia_sub character varying(200),
    dependencia character varying(5),
    nom_depe character varying(200),
    archivo_gestion numeric(3,0),
    archivo_central numeric(3,0),
    disposicion character varying(100),
    soporte character varying(20),
    procedimiento character varying(500),
    tipo_doc numeric(4,0),
    error character varying(200)
);


ALTER TABLE public.retencion_doc_tmp OWNER TO admin;
--
-- Name: sec_bodega_empresas; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_bodega_empresas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_bodega_empresas OWNER TO admin;
--
-- Name: sec_central; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_central
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_central OWNER TO admin;
--
-- Name: sec_ciu_ciudadano; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_ciu_ciudadano
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_ciu_ciudadano OWNER TO admin;
--
-- Name: sec_def_contactos; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_def_contactos
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_def_contactos OWNER TO admin;
--
-- Name: sec_dir_direcciones; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_dir_direcciones
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_dir_direcciones OWNER TO admin;
--
-- Name: sec_edificio; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_edificio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_edificio OWNER TO admin;
--
-- Name: sec_fondo; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_fondo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sec_fondo OWNER TO admin;
--
-- Name: sec_inv; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_inv
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_inv OWNER TO admin;
--
-- Name: sec_oem_empresas; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_oem_empresas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_oem_empresas OWNER TO admin;
--
-- Name: sec_oem_oempresas; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_oem_oempresas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_oem_oempresas OWNER TO admin;
--
-- Name: sec_planilla; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_planilla
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_planilla OWNER TO admin;
--
-- Name: sec_planilla_envio; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_planilla_envio
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_planilla_envio OWNER TO admin;
--
-- Name: sec_planilla_tx; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_planilla_tx
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_planilla_tx OWNER TO admin;
--
-- Name: sec_prestamo; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_prestamo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_prestamo OWNER TO admin;
--
-- Name: sec_sgd_hfld_histflujodoc; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sec_sgd_hfld_histflujodoc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_sgd_hfld_histflujodoc OWNER TO admin;
--
-- Name: secr_tp1_; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE secr_tp1_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp1_ OWNER TO admin;
--
-- Name: secr_tp1_0998; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE secr_tp1_0998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp1_0998 OWNER TO admin;
--
-- Name: secr_tp2_; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE secr_tp2_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp2_ OWNER TO admin;
--
-- Name: secr_tp2_0998; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE secr_tp2_0998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp2_0998 OWNER TO admin;
--
-- Name: secr_tp4_; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE secr_tp4_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp4_ OWNER TO admin;
--
-- Name: secr_tp4_0998; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE secr_tp4_0998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.secr_tp4_0998 OWNER TO admin;
--
-- Name: series; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE series (
    depe_codi character varying(5) NOT NULL,
    seri_nume numeric(7,0) NOT NULL,
    seri_tipo numeric(2,0),
    seri_ano numeric(4,0),
    dpto_codi numeric(2,0) NOT NULL,
    bloq character varying(20)
);


ALTER TABLE public.series OWNER TO admin;
--
-- Name: TABLE series; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE series IS 'SERIES';

--
-- Name: COLUMN series.depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN series.depe_codi IS 'CODIGO SERIE DEPENDENCIA';

--
-- Name: COLUMN series.seri_nume; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN series.seri_nume IS 'NUMERO DE SERIE PARA DEPENDENCIA';

--
-- Name: sgd_acm_acusemsg; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_acm_acusemsg (
    sgd_msg_codi numeric(15,0) NOT NULL,
    usua_doc character varying(14),
    sgd_msg_leido numeric(3,0)
);


ALTER TABLE public.sgd_acm_acusemsg OWNER TO admin;
--
-- Name: sgd_actadd_actualiadicional; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_actadd_actualiadicional (
    sgd_actadd_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_instorf_codi numeric(4,0),
    sgd_actadd_query character varying(500),
    sgd_actadd_desc character varying(150)
);


ALTER TABLE public.sgd_actadd_actualiadicional OWNER TO admin;
--
-- Name: sgd_agen_agendados; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_agen_agendados (
    sgd_agen_fech date,
    sgd_agen_observacion character varying(4000),
    radi_nume_radi character varying(15) NOT NULL,
    usua_doc character varying(18) NOT NULL,
    depe_codi character varying(5),
    sgd_agen_codigo numeric,
    sgd_agen_fechplazo date,
    sgd_agen_activo numeric
);


ALTER TABLE public.sgd_agen_agendados OWNER TO admin;
--
-- Name: sgd_anar_anexarg; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_anar_anexarg (
    sgd_anar_codi numeric(4,0) NOT NULL,
    anex_codigo character varying(20),
    sgd_argd_codi numeric(4,0),
    sgd_anar_argcod numeric(4,0)
);


ALTER TABLE public.sgd_anar_anexarg OWNER TO admin;
--
-- Name: TABLE sgd_anar_anexarg; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_anar_anexarg IS 'Indica los argumentos o criterios a incluir dentro de un tipo de documento generado';

--
-- Name: COLUMN sgd_anar_anexarg.sgd_anar_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_anar_anexarg.sgd_anar_codi IS 'id del registro';

--
-- Name: COLUMN sgd_anar_anexarg.anex_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_anar_anexarg.anex_codigo IS 'codigo del anexo';

--
-- Name: COLUMN sgd_anar_anexarg.sgd_argd_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_anar_anexarg.sgd_argd_codi IS 'codigo del argumento empleado';

--
-- Name: COLUMN sgd_anar_anexarg.sgd_anar_argcod; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_anar_anexarg.sgd_anar_argcod IS 'valor del campo llave, de tabla que contiene el argumento referenciado';

--
-- Name: sgd_anar_secue; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sgd_anar_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.sgd_anar_secue OWNER TO admin;
--
-- Name: sgd_anu_anulados; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_anu_anulados (
    sgd_anu_id numeric(4,0),
    sgd_anu_desc character varying(250),
    radi_nume_radi character varying(15),
    sgd_eanu_codi numeric(4,0),
    sgd_anu_sol_fech date,
    sgd_anu_fech date,
    depe_codi character varying(5),
    usua_doc character varying(14),
    usua_codi numeric(4,0),
    depe_codi_anu character varying(5),
    usua_doc_anu character varying(14),
    usua_codi_anu numeric(4,0),
    usua_anu_acta numeric(8,0),
    sgd_anu_path_acta character varying(200),
    sgd_trad_codigo numeric(2,0)
);


ALTER TABLE public.sgd_anu_anulados OWNER TO admin;
--
-- Name: sgd_aper_adminperfiles; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_aper_adminperfiles (
    sgd_aper_codigo numeric(2,0),
    sgd_aper_descripcion character varying(20)
);


ALTER TABLE public.sgd_aper_adminperfiles OWNER TO admin;
--
-- Name: sgd_aplfad_plicfunadi; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_aplfad_plicfunadi (
    sgd_aplfad_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_aplfad_menu character varying(150) NOT NULL,
    sgd_aplfad_lk1 character varying(150) NOT NULL,
    sgd_aplfad_desc character varying(150) NOT NULL
);


ALTER TABLE public.sgd_aplfad_plicfunadi OWNER TO admin;
--
-- Name: sgd_apli_aplintegra; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_apli_aplintegra (
    sgd_apli_codi numeric(4,0),
    sgd_apli_descrip character varying(150),
    sgd_apli_lk1desc character varying(150),
    sgd_apli_lk1 character varying(150),
    sgd_apli_lk2desc character varying(150),
    sgd_apli_lk2 character varying(150),
    sgd_apli_lk3desc character varying(150),
    sgd_apli_lk3 character varying(150),
    sgd_apli_lk4desc character varying(150),
    sgd_apli_lk4 character varying(150)
);


ALTER TABLE public.sgd_apli_aplintegra OWNER TO admin;
--
-- Name: sgd_aplmen_aplimens; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_aplmen_aplimens (
    sgd_aplmen_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_aplmen_ref character varying(20),
    sgd_aplmen_haciaorfeo numeric(4,0),
    sgd_aplmen_desdeorfeo numeric(4,0)
);


ALTER TABLE public.sgd_aplmen_aplimens OWNER TO admin;
--
-- Name: sgd_aplus_plicusua; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_aplus_plicusua (
    sgd_aplus_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    usua_doc character varying(14),
    sgd_trad_codigo numeric(2,0),
    sgd_aplus_prioridad numeric(1,0)
);


ALTER TABLE public.sgd_aplus_plicusua OWNER TO admin;
--
-- Name: sgd_arch_depe; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_arch_depe (
    sgd_arch_depe character varying(5),
    sgd_arch_edificio numeric(6,0),
    sgd_arch_item numeric(6,0),
    sgd_arch_id numeric NOT NULL
);


ALTER TABLE public.sgd_arch_depe OWNER TO admin;
--
-- Name: sgd_archivo_central; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_archivo_central (
    sgd_archivo_id numeric NOT NULL,
    sgd_archivo_tipo numeric,
    sgd_archivo_orden character varying(15),
    sgd_archivo_fechai timestamp with time zone,
    sgd_archivo_demandado character varying(1500),
    sgd_archivo_demandante character varying(200),
    sgd_archivo_cc_demandante numeric,
    sgd_archivo_depe character varying(5),
    sgd_archivo_zona character varying(4),
    sgd_archivo_carro numeric,
    sgd_archivo_cara character varying(4),
    sgd_archivo_estante numeric,
    sgd_archivo_entrepano numeric,
    sgd_archivo_caja numeric,
    sgd_archivo_unidocu character varying(40),
    sgd_archivo_anexo character varying(4000),
    sgd_archivo_inder numeric DEFAULT 0,
    sgd_archivo_path character varying(4000),
    sgd_archivo_year numeric(4,0),
    sgd_archivo_rad character varying(15) NOT NULL,
    sgd_archivo_srd numeric,
    sgd_archivo_sbrd numeric,
    sgd_archivo_folios numeric,
    sgd_archivo_mata numeric DEFAULT 0,
    sgd_archivo_fechaf timestamp with time zone,
    sgd_archivo_prestamo numeric(1,0),
    sgd_archivo_funprest character(100),
    sgd_archivo_fechprest timestamp with time zone,
    sgd_archivo_fechprestf timestamp with time zone,
    depe_codi character varying(5),
    sgd_archivo_usua character varying(15),
    sgd_archivo_fech timestamp with time zone
);


ALTER TABLE public.sgd_archivo_central OWNER TO admin;
--
-- Name: sgd_archivo_fondo; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_archivo_fondo (
    sgd_archivo_id numeric NOT NULL,
    sgd_archivo_tipo numeric,
    sgd_archivo_orden character varying(15),
    sgd_archivo_fechai timestamp with time zone,
    sgd_archivo_demandado character varying(1500),
    sgd_archivo_demandante character varying(200),
    sgd_archivo_cc_demandante numeric,
    sgd_archivo_depe character varying(5),
    sgd_archivo_zona character varying(4),
    sgd_archivo_carro numeric,
    sgd_archivo_cara character varying(4),
    sgd_archivo_estante numeric,
    sgd_archivo_entrepano numeric,
    sgd_archivo_caja numeric,
    sgd_archivo_unidocu character varying(40),
    sgd_archivo_anexo character varying(4000),
    sgd_archivo_inder numeric DEFAULT 0,
    sgd_archivo_path character varying(4000),
    sgd_archivo_year numeric(4,0),
    sgd_archivo_rad character varying(15) NOT NULL,
    sgd_archivo_srd numeric,
    sgd_archivo_folios numeric,
    sgd_archivo_mata numeric DEFAULT 0,
    sgd_archivo_fechaf timestamp with time zone,
    sgd_archivo_prestamo numeric(1,0),
    sgd_archivo_funprest character(100),
    sgd_archivo_fechprest timestamp with time zone,
    sgd_archivo_fechprestf timestamp with time zone,
    depe_codi character varying(5),
    sgd_archivo_usua character varying(15),
    sgd_archivo_fech timestamp with time zone
);


ALTER TABLE public.sgd_archivo_fondo OWNER TO admin;
--
-- Name: sgd_archivo_hist; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_archivo_hist (
    depe_codi character varying(5) NOT NULL,
    hist_fech timestamp with time zone NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    sgd_archivo_rad character varying(14),
    hist_obse character varying(600) NOT NULL,
    usua_doc character varying(14),
    sgd_ttr_codigo numeric(3,0),
    hist_id numeric
);


ALTER TABLE public.sgd_archivo_hist OWNER TO admin;
--
-- Name: sgd_arg_pliego; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_arg_pliego (
    sgd_arg_codigo numeric(2,0) NOT NULL,
    sgd_arg_desc character varying(150) NOT NULL
);


ALTER TABLE public.sgd_arg_pliego OWNER TO admin;
--
-- Name: sgd_argd_argdoc; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_argd_argdoc (
    sgd_argd_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    sgd_argd_tabla character varying(100),
    sgd_argd_tcodi character varying(100),
    sgd_argd_tdes character varying(100),
    sgd_argd_llist character varying(150),
    sgd_argd_campo character varying(100)
);


ALTER TABLE public.sgd_argd_argdoc OWNER TO admin;
--
-- Name: TABLE sgd_argd_argdoc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_argd_argdoc IS 'Define los argumentos que ha de incluir un tipo de documento';

--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_codi IS 'Id del registro';

--
-- Name: COLUMN sgd_argd_argdoc.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_pnufe_codi IS 'Codigo del proceso';

--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_tabla; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_tabla IS 'Nombre de la tabla tabla a la que hace refencia el argumento';

--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_tcodi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_tcodi IS 'Nombre del campo llave de la tabla referenciada';

--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_tdes; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_tdes IS 'Nombre del campo descripcion de la tabla referenciada';

--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_llist; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_llist IS 'Texto del label descriptor  que ha  de aparecen de forma dinamica en la pagina web';

--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_campo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_argd_argdoc.sgd_argd_campo IS 'Etiqueta que ha de incluirse en el documento para referenciar este campo';

--
-- Name: sgd_argup_argudoctop; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_argup_argudoctop (
    sgd_argup_codi numeric(4,0) NOT NULL,
    sgd_argup_desc character varying(50),
    sgd_tpr_codigo numeric(4,0)
);


ALTER TABLE public.sgd_argup_argudoctop OWNER TO admin;
--
-- Name: TABLE sgd_argup_argudoctop; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_argup_argudoctop IS 'Almacena los argumentos para contestar pliegos de cargos';

--
-- Name: COLUMN sgd_argup_argudoctop.sgd_argup_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_argup_argudoctop.sgd_argup_codi IS 'Id del registro';

--
-- Name: COLUMN sgd_argup_argudoctop.sgd_argup_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_argup_argudoctop.sgd_argup_desc IS 'Descripcion';

--
-- Name: sgd_auditoria; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_auditoria (
    fecha character varying(10),
    usua_doc character varying(12),
    ip character varying(15),
    tipo character varying(5),
    tabla character varying(50),
    isql character(5000)
);


ALTER TABLE public.sgd_auditoria OWNER TO admin;
--
-- Name: TABLE sgd_auditoria; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_auditoria IS 'Tabla para radicacion via web';

--
-- Name: sgd_camexp_campoexpediente; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_camexp_campoexpediente (
    sgd_camexp_codigo numeric(4,0) NOT NULL,
    sgd_camexp_campo character varying(30) NOT NULL,
    sgd_parexp_codigo numeric(4,0) NOT NULL,
    sgd_camexp_fk numeric DEFAULT 0,
    sgd_camexp_tablafk character varying(30),
    sgd_camexp_campofk character varying(30),
    sgd_camexp_campovalor character varying(30),
    sgd_camexp_orden numeric(1,0)
);


ALTER TABLE public.sgd_camexp_campoexpediente OWNER TO admin;
--
-- Name: sgd_carp_descripcion; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_carp_descripcion (
    sgd_carp_depecodi character varying(5) NOT NULL,
    sgd_carp_tiporad numeric(2,0) NOT NULL,
    sgd_carp_descr character varying(40)
);


ALTER TABLE public.sgd_carp_descripcion OWNER TO admin;
--
-- Name: sgd_cau_causal; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_cau_causal (
    sgd_cau_codigo numeric(4,0) NOT NULL,
    sgd_cau_descrip character varying(150)
);


ALTER TABLE public.sgd_cau_causal OWNER TO admin;
--
-- Name: sgd_caux_causales; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_caux_causales (
    sgd_caux_codigo numeric(10,0) NOT NULL,
    radi_nume_radi character varying(15),
    sgd_dcau_codigo numeric(4,0),
    sgd_ddca_codigo numeric(4,0),
    sgd_caux_fecha date,
    usua_doc character varying(14)
);


ALTER TABLE public.sgd_caux_causales OWNER TO admin;
--
-- Name: sgd_ciu_ciudadano; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_ciu_ciudadano (
    tdid_codi numeric(2,0),
    sgd_ciu_codigo numeric(8,0),
    sgd_ciu_nombre character varying(150),
    sgd_ciu_direccion character varying(150),
    sgd_ciu_apell1 character varying(50),
    sgd_ciu_apell2 character varying(50),
    sgd_ciu_telefono character varying(50),
    sgd_ciu_email character varying(50),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_ciu_cedula character varying(13),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170
);


ALTER TABLE public.sgd_ciu_ciudadano OWNER TO admin;
--
-- Name: sgd_ciu_secue; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sgd_ciu_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_ciu_secue OWNER TO admin;
--
-- Name: sgd_clta_clstarif; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_clta_clstarif (
    sgd_fenv_codigo numeric(5,0),
    sgd_clta_codser numeric(5,0),
    sgd_tar_codigo numeric(5,0),
    sgd_clta_descrip character varying(100),
    sgd_clta_pesdes numeric(15,0),
    sgd_clta_peshast numeric(15,0)
);


ALTER TABLE public.sgd_clta_clstarif OWNER TO admin;
--
-- Name: sgd_cob_campobliga; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_cob_campobliga (
    sgd_cob_codi numeric(4,0) NOT NULL,
    sgd_cob_desc character varying(150),
    sgd_cob_label character varying(50),
    sgd_tidm_codi numeric(4,0)
);


ALTER TABLE public.sgd_cob_campobliga OWNER TO admin;
--
-- Name: TABLE sgd_cob_campobliga; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_cob_campobliga IS 'Indica los campos obligatorios que hacen parte de un tipo de documento de correspondencia masiva';

--
-- Name: COLUMN sgd_cob_campobliga.sgd_cob_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_cob_campobliga.sgd_cob_codi IS 'ID del registro';

--
-- Name: COLUMN sgd_cob_campobliga.sgd_cob_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_cob_campobliga.sgd_cob_desc IS 'Descripcion';

--
-- Name: COLUMN sgd_cob_campobliga.sgd_cob_label; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_cob_campobliga.sgd_cob_label IS 'Rotulo del campo a incluir dentro del documento';

--
-- Name: COLUMN sgd_cob_campobliga.sgd_tidm_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_cob_campobliga.sgd_tidm_codi IS 'Codigo del documento';

--
-- Name: sgd_dcau_causal; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_dcau_causal (
    sgd_dcau_codigo numeric(4,0) NOT NULL,
    sgd_cau_codigo numeric(4,0),
    sgd_dcau_descrip character varying(150)
);


ALTER TABLE public.sgd_dcau_causal OWNER TO admin;
--
-- Name: sgd_ddca_ddsgrgdo; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_ddca_ddsgrgdo (
    sgd_ddca_codigo numeric(4,0) NOT NULL,
    sgd_dcau_codigo numeric(4,0),
    par_serv_secue numeric(8,0),
    sgd_ddca_descrip character varying(150)
);


ALTER TABLE public.sgd_ddca_ddsgrgdo OWNER TO admin;
--
-- Name: sgd_def_contactos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_def_contactos (
    ctt_id numeric(15,0) NOT NULL,
    ctt_nombre character varying(60) NOT NULL,
    ctt_cargo character varying(60) NOT NULL,
    ctt_telefono character varying(25),
    ctt_id_tipo numeric(4,0) NOT NULL,
    ctt_id_empresa numeric(15,0) NOT NULL
);


ALTER TABLE public.sgd_def_contactos OWNER TO admin;
--
-- Name: sgd_def_continentes; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_def_continentes (
    id_cont numeric(2,0),
    nombre_cont character varying(20) NOT NULL
);


ALTER TABLE public.sgd_def_continentes OWNER TO admin;
--
-- Name: sgd_def_paises; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_def_paises (
    id_pais numeric(4,0),
    id_cont numeric(2,0) DEFAULT 1 NOT NULL,
    nombre_pais character varying(30) NOT NULL
);


ALTER TABLE public.sgd_def_paises OWNER TO admin;
--
-- Name: sgd_deve_dev_envio; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_deve_dev_envio (
    sgd_deve_codigo numeric(2,0) NOT NULL,
    sgd_deve_desc character varying(150) NOT NULL
);


ALTER TABLE public.sgd_deve_dev_envio OWNER TO admin;
--
-- Name: sgd_dir_drecciones; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_dir_drecciones (
    sgd_dir_codigo numeric(10,0) NOT NULL,
    sgd_dir_tipo numeric(4,0) NOT NULL,
    sgd_oem_codigo numeric(8,0),
    sgd_ciu_codigo numeric(8,0),
    radi_nume_radi character varying(15),
    sgd_esp_codi numeric(5,0),
    muni_codi numeric(4,0),
    dpto_codi numeric(3,0),
    sgd_dir_direccion character varying(150),
    sgd_dir_telefono character varying(50),
    sgd_dir_mail character varying(50),
    sgd_sec_codigo numeric(13,0),
    sgd_temporal_nombre character varying(150),
    anex_codigo numeric(20,0),
    sgd_anex_codigo character varying(20),
    sgd_dir_nombre character varying(150),
    sgd_doc_fun character varying(14),
    sgd_dir_nomremdes character varying(1000),
    sgd_trd_codigo numeric(1,0),
    sgd_dir_tdoc numeric(1,0),
    sgd_dir_doc character varying(14),
    id_pais numeric(4,0) DEFAULT 170,
    id_cont numeric(2,0) DEFAULT 1
);


ALTER TABLE public.sgd_dir_drecciones OWNER TO admin;
--
-- Name: COLUMN sgd_dir_drecciones.sgd_dir_nomremdes; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dir_drecciones.sgd_dir_nomremdes IS 'NOMBRE DE REMITENTE O DESTINATARIO';

--
-- Name: COLUMN sgd_dir_drecciones.sgd_trd_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dir_drecciones.sgd_trd_codigo IS 'TIPO DE REMITENTE/DESTINATARIO (1 Ciudadanao, 2 OtrasEmpresas, 3 Esp, 4 Funcionario)';

--
-- Name: COLUMN sgd_dir_drecciones.sgd_dir_tdoc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dir_drecciones.sgd_dir_tdoc IS 'NUMERO DE DOCUMENTO';

--
-- Name: sgd_dir_secue; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sgd_dir_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_dir_secue OWNER TO admin;
--
-- Name: sgd_dnufe_docnufe; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_dnufe_docnufe (
    sgd_dnufe_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    sgd_tpr_codigo numeric(4,0),
    sgd_dnufe_label character varying(150),
    trte_codi numeric(2,0),
    sgd_dnufe_main character varying(1),
    sgd_dnufe_path character varying(150),
    sgd_dnufe_gerarq character varying(10),
    anex_tipo_codi numeric(4,0)
);


ALTER TABLE public.sgd_dnufe_docnufe OWNER TO admin;
--
-- Name: TABLE sgd_dnufe_docnufe; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_dnufe_docnufe IS 'Indica los documentos que componen un proceso de numeracion y fechado';

--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_dnufe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_dnufe_codi IS 'Id del registro';

--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_pnufe_codi IS 'codigo del proceso';

--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_tpr_codigo IS 'codigo del documento que hace parte de un proceso de numeracion y fechado';

--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_dnufe_label; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_dnufe_label IS 'label del documento que ha de usarse en la interfaz de gestion de procesos de numeracion y fechado';

--
-- Name: COLUMN sgd_dnufe_docnufe.trte_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dnufe_docnufe.trte_codi IS 'indica el tipo de remitente para quien va dirigida la comunicacion';

--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_dnufe_main; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dnufe_docnufe.sgd_dnufe_main IS 'Indica si el registro es el documento principal del paquete';

--
-- Name: sgd_dt_radicado; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_dt_radicado (
    radi_nume_radi character varying(15) NOT NULL,
    dias_termino numeric(2,0) NOT NULL
);


ALTER TABLE public.sgd_dt_radicado OWNER TO admin;
--
-- Name: TABLE sgd_dt_radicado; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_dt_radicado IS 'Dias de termino por radicado';

--
-- Name: COLUMN sgd_dt_radicado.radi_nume_radi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dt_radicado.radi_nume_radi IS 'Numero de radicado';

--
-- Name: COLUMN sgd_dt_radicado.dias_termino; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_dt_radicado.dias_termino IS 'dias de termino';

--
-- Name: sgd_eanu_estanulacion; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_eanu_estanulacion (
    sgd_eanu_desc character varying(150),
    sgd_eanu_codi numeric
);


ALTER TABLE public.sgd_eanu_estanulacion OWNER TO admin;
--
-- Name: sgd_einv_inventario; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_einv_inventario (
    sgd_einv_codigo numeric NOT NULL,
    sgd_depe_nomb character varying(400),
    sgd_depe_codi character varying(5),
    sgd_einv_expnum character varying(18),
    sgd_einv_titulo character varying(400),
    sgd_einv_unidad numeric,
    sgd_einv_fech date,
    sgd_einv_fechfin date,
    sgd_einv_radicados character varying(40),
    sgd_einv_folios numeric,
    sgd_einv_nundocu numeric,
    sgd_einv_nundocubodega numeric,
    sgd_einv_caja numeric,
    sgd_einv_cajabodega numeric,
    sgd_einv_srd numeric,
    sgd_einv_nomsrd character varying(400),
    sgd_einv_sbrd numeric,
    sgd_einv_nomsbrd character varying(400),
    sgd_einv_retencion character varying(400),
    sgd_einv_disfinal character varying(400),
    sgd_einv_ubicacion character varying(400),
    sgd_einv_observacion character varying(400)
);


ALTER TABLE public.sgd_einv_inventario OWNER TO admin;
--
-- Name: sgd_eit_items; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_eit_items (
    sgd_eit_codigo numeric NOT NULL,
    sgd_eit_cod_padre numeric DEFAULT 0,
    sgd_eit_nombre character varying(40),
    sgd_eit_sigla character varying(6),
    codi_dpto numeric(4,0),
    codi_muni numeric(5,0)
);


ALTER TABLE public.sgd_eit_items OWNER TO admin;
--
-- Name: sgd_eje_tema; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_eje_tema (
    sgd_tema_codigo character varying(10) NOT NULL,
    sgd_tema_nomb character varying(150) NOT NULL,
    sgd_tema_desc character varying(350) NOT NULL,
    sgd_tema_plazo numeric(2,0),
    sgd_tema_tpplazo character varying(50),
    sgd_tema_estado numeric(2,0) NOT NULL,
    sgd_tema_depe character varying(5) NOT NULL
);


ALTER TABLE public.sgd_eje_tema OWNER TO admin;
--
-- Name: TABLE sgd_eje_tema; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_eje_tema IS 'Tabla de ejes tematicos';

--
-- Name: COLUMN sgd_eje_tema.sgd_tema_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_codigo IS 'Codigo del eje tematico';

--
-- Name: COLUMN sgd_eje_tema.sgd_tema_nomb; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_nomb IS 'Nombre del eje tematico';

--
-- Name: COLUMN sgd_eje_tema.sgd_tema_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_desc IS 'Descripcion del eje tematico';

--
-- Name: COLUMN sgd_eje_tema.sgd_tema_plazo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_plazo IS 'Dias de plazo';

--
-- Name: COLUMN sgd_eje_tema.sgd_tema_tpplazo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_tpplazo IS 'Tipo de plazo';

--
-- Name: COLUMN sgd_eje_tema.sgd_tema_estado; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_estado IS 'Estado de eje tematico';

--
-- Name: COLUMN sgd_eje_tema.sgd_tema_depe; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_eje_tema.sgd_tema_depe IS 'Dependencia asignada al eje tematico';

--
-- Name: sgd_empus_empusuario; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_empus_empusuario (
    usua_login character varying(10),
    identificador_empresa numeric(10,0)
);


ALTER TABLE public.sgd_empus_empusuario OWNER TO admin;
--
-- Name: COLUMN sgd_empus_empusuario.identificador_empresa; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_empus_empusuario.identificador_empresa IS 'Corresponde al identificador de la tabla bodega_empresas';

--
-- Name: sgd_ent_entidades; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_ent_entidades (
    sgd_ent_nit character varying(13) NOT NULL,
    sgd_ent_codsuc character varying(4) NOT NULL,
    sgd_ent_pias numeric(5,0),
    dpto_codi numeric(2,0),
    muni_codi numeric(4,0),
    sgd_ent_descrip character varying(80),
    sgd_ent_direccion character varying(50),
    sgd_ent_telefono character varying(50)
);


ALTER TABLE public.sgd_ent_entidades OWNER TO admin;
--
-- Name: sgd_enve_envioespecial; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_enve_envioespecial (
    sgd_fenv_codigo numeric(4,0),
    sgd_enve_valorl character varying(30),
    sgd_enve_valorn character varying(30),
    sgd_enve_desc character varying(30)
);


ALTER TABLE public.sgd_enve_envioespecial OWNER TO admin;
--
-- Name: COLUMN sgd_enve_envioespecial.sgd_fenv_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_enve_envioespecial.sgd_fenv_codigo IS 'Codigo Empresa de envio';

--
-- Name: COLUMN sgd_enve_envioespecial.sgd_enve_valorl; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_enve_envioespecial.sgd_enve_valorl IS 'Valor Campo Local';

--
-- Name: COLUMN sgd_enve_envioespecial.sgd_enve_valorn; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_enve_envioespecial.sgd_enve_valorn IS 'Valor Campo Nacional';

--
-- Name: COLUMN sgd_enve_envioespecial.sgd_enve_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_enve_envioespecial.sgd_enve_desc IS 'Descripcion Valor';

--
-- Name: tipo_doc_identificacion; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE tipo_doc_identificacion (
    tdid_codi numeric(2,0) NOT NULL,
    tdid_desc character varying(100) NOT NULL
);


ALTER TABLE public.tipo_doc_identificacion OWNER TO admin;
--
-- Name: TABLE tipo_doc_identificacion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE tipo_doc_identificacion IS 'TIPO_DOC_IDENTIFICACION';

--
-- Name: COLUMN tipo_doc_identificacion.tdid_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN tipo_doc_identificacion.tdid_codi IS 'CODIGO DEL TIPO DE DOCUMENTO DE IDENTIFICACION';

--
-- Name: COLUMN tipo_doc_identificacion.tdid_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN tipo_doc_identificacion.tdid_desc IS 'DESCIPCION DEL TIPO DE DOCUMENTO DE IDENTIFICACION';

--
-- Name: tipo_remitente; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE tipo_remitente (
    trte_codi numeric(2,0) NOT NULL,
    trte_desc character varying(100) NOT NULL
);


ALTER TABLE public.tipo_remitente OWNER TO admin;
--
-- Name: TABLE tipo_remitente; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE tipo_remitente IS 'TIPO_REMITENTE';

--
-- Name: COLUMN tipo_remitente.trte_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN tipo_remitente.trte_codi IS 'CODIGO TIPO DE REMITENTE';

--
-- Name: COLUMN tipo_remitente.trte_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN tipo_remitente.trte_desc IS 'DESC DEL TIPO DE REMITENTE';

--
-- Name: sgd_est_estadi; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW sgd_est_estadi AS
    SELECT a.radi_nume_radi, a.radi_fech_radi, a.radi_depe_radi, a.radi_usua_radi, a.radi_depe_actu, a.radi_usua_actu, a.trte_codi, a.tdid_codi, a.radi_nomb, a.eesp_codi, b.usua_nomb, c.depe_nomb, d.tdid_desc FROM radicado a, usuario b, dependencia c, tipo_doc_identificacion d, tipo_remitente e WHERE (((((a.radi_usua_actu = b.usua_codi) AND ((a.radi_depe_actu)::text = (b.depe_codi)::text)) AND ((a.radi_depe_actu)::text = (c.depe_codi)::text)) AND (d.tdid_codi = a.tdoc_codi)) AND (a.trte_codi = e.trte_codi));


ALTER TABLE public.sgd_est_estadi OWNER TO admin;
--
-- Name: sgd_estc_estconsolid; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_estc_estconsolid (
    sgd_estc_codigo numeric,
    sgd_tpr_codigo numeric,
    dep_nombre character varying(30),
    depe_codi character varying(5),
    sgd_estc_ctotal numeric,
    sgd_estc_centramite numeric,
    sgd_estc_csinriesgo numeric,
    sgd_estc_criesgomedio numeric,
    sgd_estc_criesgoalto numeric,
    sgd_estc_ctramitados numeric,
    sgd_estc_centermino numeric,
    sgd_estc_cfueratermino numeric,
    sgd_estc_fechgen date,
    sgd_estc_fechini date,
    sgd_estc_fechfin date,
    sgd_estc_fechiniresp date,
    sgd_estc_fechfinresp date,
    sgd_estc_dsinriesgo numeric,
    sgd_estc_driesgomegio numeric,
    sgd_estc_driesgoalto numeric,
    sgd_estc_dtermino numeric,
    sgd_estc_grupgenerado numeric
);


ALTER TABLE public.sgd_estc_estconsolid OWNER TO admin;
--
-- Name: TABLE sgd_estc_estconsolid; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_estc_estconsolid IS 'Tabla en la cual se almacenan consolidados de las territoriales.';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_codigo IS 'Codigo Registro Unico';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_tpr_codigo IS 'Tipo de Documento';

--
-- Name: COLUMN sgd_estc_estconsolid.dep_nombre; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.dep_nombre IS 'Nombre Grupo Dependenciad de cada Territorial';

--
-- Name: COLUMN sgd_estc_estconsolid.depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.depe_codi IS 'Codigo dependencia';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_ctotal; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_ctotal IS 'Cantidad Documentos';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_centramite; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_centramite IS 'Cantidad Documentos En tramite';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_csinriesgo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_csinriesgo IS 'Cantidad Documentos Sin riesgo';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_criesgomedio; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_criesgomedio IS 'Cantidad de Documentos en Riesgo Medio';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_criesgoalto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_criesgoalto IS 'Cantidad de Documentos en Riesgo Alto';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_ctramitados; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_ctramitados IS 'Cantidad de Documentos Tramitados';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_centermino; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_centermino IS 'Cantidad Documentos Tramitados en Termino';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_cfueratermino; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_cfueratermino IS 'Cantidad Documentos Tramitados Fuera de Termino';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechgen; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechgen IS 'Fecha Generados';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechini; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechini IS 'Fecha Inicio de Reporde de Radicados';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechfin; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechfin IS 'Fecha Fin de Reporte de Radicados';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechiniresp; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechiniresp IS 'Fecha inicio de Documentos respuesta';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechfinresp; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_fechfinresp IS 'Fecha Fin de Documentos Respuesta';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_dsinriesgo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_dsinriesgo IS 'Dias definidos para Riesgo Bajo';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_driesgomegio; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_driesgomegio IS 'Dias Para Riesgo Medio';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_driesgoalto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_driesgoalto IS 'Dias Para Riesgo Alto';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_dtermino; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_dtermino IS 'Dias Reales de Termino de los Documentos.';

--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_grupgenerado; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_estc_estconsolid.sgd_estc_grupgenerado IS 'Numero Historico de la Generacion.';

--
-- Name: sgd_estinst_estadoinstancia; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_estinst_estadoinstancia (
    sgd_estinst_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_instorf_codi numeric(4,0),
    sgd_estinst_valor numeric(4,0),
    sgd_estinst_habilita numeric(1,0),
    sgd_estinst_mensaje character varying(100)
);


ALTER TABLE public.sgd_estinst_estadoinstancia OWNER TO admin;
--
-- Name: sgd_exp_expediente; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_exp_expediente (
    sgd_exp_numero character varying(18),
    radi_nume_radi character varying(18),
    sgd_exp_fech date,
    sgd_exp_fech_mod date,
    depe_codi character varying(5),
    usua_codi numeric(3,0),
    usua_doc character varying(15),
    sgd_exp_estado numeric(1,0) DEFAULT 0,
    sgd_exp_titulo character varying(50),
    sgd_exp_asunto character varying(150),
    sgd_exp_carpeta character varying(30),
    sgd_exp_ufisica character varying(20),
    sgd_exp_isla character varying(10),
    sgd_exp_estante character varying(10),
    sgd_exp_caja character varying(10),
    sgd_exp_fech_arch date,
    sgd_srd_codigo numeric(3,0),
    sgd_sbrd_codigo numeric(3,0),
    sgd_fexp_codigo numeric(3,0),
    sgd_exp_subexpediente character varying(20),
    sgd_exp_archivo numeric(1,0),
    sgd_exp_unicon numeric(1,0),
    sgd_exp_fechfin date,
    sgd_exp_folios character varying(6),
    sgd_exp_rete numeric(2,0),
    sgd_exp_entrepa numeric(6,0),
    radi_usua_arch character varying(40),
    sgd_exp_edificio character varying(400),
    sgd_exp_caja_bodega character varying(40),
    sgd_exp_carro character varying(40),
    sgd_exp_carpeta_bodega character varying(40),
    sgd_exp_privado numeric(1,0),
    sgd_exp_cd character varying(10),
    sgd_exp_nref character varying(7),
    sgd_sexp_paraexp1 character varying(50)
);


ALTER TABLE public.sgd_exp_expediente OWNER TO admin;
--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_numero; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_numero IS 'Numero de Expediente';

--
-- Name: COLUMN sgd_exp_expediente.radi_nume_radi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.radi_nume_radi IS 'Radicado Asociado por cada radicado puede existir un registro de ubicacion en el expediente.';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_fech; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_fech IS 'Fecha de Creacion del Expediente';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_fech_mod; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_fech_mod IS 'Fecha de Ultima modificacion';

--
-- Name: COLUMN sgd_exp_expediente.depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.depe_codi IS 'Dependencia que crea el expediente';

--
-- Name: COLUMN sgd_exp_expediente.usua_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.usua_codi IS 'Codigo del Usuario que crea el expediente ';

--
-- Name: COLUMN sgd_exp_expediente.usua_doc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.usua_doc IS 'Documento del usuario que crea el documento';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_estado; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_estado IS 'Indica si el radicado esta archivado (1) o no (0)';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_titulo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_titulo IS 'Titulo de expediente se coloca en archivo';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_asunto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_asunto IS 'Asunto del expediente';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_carpeta; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_carpeta IS 'Ubicacion en carpeta';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_ufisica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_ufisica IS 'Ubicacion fisica';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_isla; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_isla IS 'Isla';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_estante; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_estante IS 'Estante';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_caja; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_caja IS 'Caja';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_fech_arch; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_fech_arch IS 'Fecha de archivado';

--
-- Name: COLUMN sgd_exp_expediente.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_srd_codigo IS 'Serie';

--
-- Name: COLUMN sgd_exp_expediente.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_sbrd_codigo IS 'Subserie';

--
-- Name: COLUMN sgd_exp_expediente.sgd_fexp_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_fexp_codigo IS 'Fecha del expediente';

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_subexpediente; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_exp_expediente.sgd_exp_subexpediente IS 'Nombre de subexpediente';

--
-- Name: sgd_fars_faristas; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_fars_faristas (
    sgd_fars_codigo numeric(5,0) NOT NULL,
    sgd_pexp_codigo numeric(4,0),
    sgd_fexp_codigoini numeric(6,0),
    sgd_fexp_codigofin numeric(6,0),
    sgd_fars_diasminimo numeric(3,0),
    sgd_fars_diasmaximo numeric(3,0),
    sgd_fars_desc character varying(100),
    sgd_trad_codigo numeric(2,0),
    sgd_srd_codigo numeric(3,0),
    sgd_sbrd_codigo numeric(3,0),
    sgd_fars_tipificacion numeric(1,0),
    sgd_tpr_codigo numeric,
    sgd_fars_automatico numeric,
    sgd_fars_rolgeneral numeric
);


ALTER TABLE public.sgd_fars_faristas OWNER TO admin;
--
-- Name: sgd_fenv_frmenvio; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_fenv_frmenvio (
    sgd_fenv_codigo numeric(5,0) NOT NULL,
    sgd_fenv_descrip character varying(40),
    sgd_fenv_planilla numeric(1,0) DEFAULT 0 NOT NULL,
    sgd_fenv_estado numeric(1,0) DEFAULT 1 NOT NULL
);


ALTER TABLE public.sgd_fenv_frmenvio OWNER TO admin;
--
-- Name: sgd_fexp_flujoexpedientes; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_fexp_flujoexpedientes (
    sgd_fexp_codigo numeric(6,0),
    sgd_pexp_codigo numeric(6,0),
    sgd_fexp_orden numeric(4,0),
    sgd_fexp_terminos numeric(4,0),
    sgd_fexp_imagen character varying(50),
    sgd_fexp_descrip character varying(150)
);


ALTER TABLE public.sgd_fexp_flujoexpedientes OWNER TO admin;
--
-- Name: TABLE sgd_fexp_flujoexpedientes; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_fexp_flujoexpedientes IS 'Descripcion de la etapa en el Tipo de Proceso incicado en el campo SGD_PEXP_CODIGO';

--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_codigo IS 'Codigo etapa del Flujo. Codigo debe ser Unico.';

--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_pexp_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_pexp_codigo IS 'Codigo de proceso al cual se le incluira el flujo';

--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_orden; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_orden IS 'Orden de la Etapa en el Flujo Documental';

--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_terminos; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_terminos IS 'Numero de dias de plazo para cumplimiento de esta etapa.';

--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_imagen; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_imagen IS 'Icono para distinguir la etapa.';

--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_descrip; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_descrip IS 'Descripcion de la etapa en el Tipo de Proceso incicado en el campo SGD_PEXP_CODIGO';

--
-- Name: sgd_firrad_firmarads; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_firrad_firmarads (
    sgd_firrad_id numeric(15,0) NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    sgd_firrad_firma character varying(255),
    sgd_firrad_fecha date,
    sgd_firrad_docsolic character varying(14) NOT NULL,
    sgd_firrad_fechsolic date NOT NULL,
    sgd_firrad_pk character varying(255)
);


ALTER TABLE public.sgd_firrad_firmarads OWNER TO admin;
--
-- Name: sgd_fld_flujodoc; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_fld_flujodoc (
    sgd_fld_codigo numeric(3,0),
    sgd_fld_desc character varying(100),
    sgd_tpr_codigo numeric(3,0),
    sgd_fld_imagen character varying(50),
    sgd_fld_grupoweb integer DEFAULT 0
);


ALTER TABLE public.sgd_fld_flujodoc OWNER TO admin;
--
-- Name: sgd_fun_funciones; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_fun_funciones (
    sgd_fun_codigo numeric(4,0) NOT NULL,
    sgd_fun_descrip character varying(530),
    sgd_fun_fech_ini date,
    sgd_fun_fech_fin date
);


ALTER TABLE public.sgd_fun_funciones OWNER TO admin;
--
-- Name: sgd_hfld_histflujodoc; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_hfld_histflujodoc (
    sgd_hfld_codigo numeric(6,0),
    sgd_fexp_codigo numeric(3,0) NOT NULL,
    sgd_exp_fechflujoant date,
    sgd_hfld_fech timestamp without time zone,
    sgd_exp_numero character varying(18),
    radi_nume_radi character varying(15),
    usua_doc character varying(10),
    usua_codi numeric(10,0),
    depe_codi character varying(5),
    sgd_ttr_codigo numeric(2,0),
    sgd_fexp_observa character varying(500),
    sgd_hfld_observa character varying(500),
    sgd_fars_codigo numeric,
    sgd_hfld_automatico numeric
);


ALTER TABLE public.sgd_hfld_histflujodoc OWNER TO admin;
--
-- Name: COLUMN sgd_hfld_histflujodoc.sgd_hfld_fech; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_hfld_histflujodoc.sgd_hfld_fech IS 'Fecha Historico de expediente';

--
-- Name: sgd_hmtd_hismatdoc; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_hmtd_hismatdoc (
    sgd_hmtd_codigo numeric(6,0) NOT NULL,
    sgd_hmtd_fecha date NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    sgd_hmtd_obse character varying(600) NOT NULL,
    usua_doc numeric(13,0),
    depe_codi character varying(5),
    sgd_mtd_codigo numeric(4,0)
);


ALTER TABLE public.sgd_hmtd_hismatdoc OWNER TO admin;
--
-- Name: sgd_hmtd_secue; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sgd_hmtd_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.sgd_hmtd_secue OWNER TO admin;
--
-- Name: sgd_info_secue; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sgd_info_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.sgd_info_secue OWNER TO admin;
--
-- Name: sgd_instorf_instanciasorfeo; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_instorf_instanciasorfeo (
    sgd_instorf_codi numeric(4,0),
    sgd_instorf_desc character varying(100)
);


ALTER TABLE public.sgd_instorf_instanciasorfeo OWNER TO admin;
--
-- Name: sgd_lip_linkip; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_lip_linkip (
    sgd_lip_id numeric(4,0) NOT NULL,
    sgd_lip_ipini character varying(20) NOT NULL,
    sgd_lip_ipfin character varying(20),
    sgd_lip_dirintranet character varying(150) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_lip_arch character varying(70),
    sgd_lip_diascache numeric(5,0),
    sgd_lip_rutaftp character varying(150),
    sgd_lip_servftp character varying(50),
    sgd_lip_usbd character varying(20),
    sgd_lip_nombd character varying(20),
    sgd_lip_pwdbd character varying(20),
    sgd_lip_usftp character varying(20),
    sgd_lip_pwdftp character varying(30)
);


ALTER TABLE public.sgd_lip_linkip OWNER TO admin;
--
-- Name: sgd_mat_matriz; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_mat_matriz (
    sgd_mat_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5),
    sgd_fun_codigo numeric(4,0),
    sgd_prc_codigo numeric(4,0),
    sgd_prd_codigo numeric(4,0),
    sgd_mat_fech_ini date,
    sgd_mat_fech_fin date,
    sgd_mat_peso_prd numeric(5,2)
);


ALTER TABLE public.sgd_mat_matriz OWNER TO admin;
--
-- Name: sgd_mat_secue; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sgd_mat_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_mat_secue OWNER TO admin;
--
-- Name: sgd_mpes_mddpeso; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_mpes_mddpeso (
    sgd_mpes_codigo numeric(5,0) NOT NULL,
    sgd_mpes_descrip character varying(10)
);


ALTER TABLE public.sgd_mpes_mddpeso OWNER TO admin;
--
-- Name: sgd_mrd_matrird; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_mrd_matrird (
    sgd_mrd_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_srd_codigo numeric(4,0) NOT NULL,
    sgd_sbrd_codigo numeric(4,0) NOT NULL,
    sgd_tpr_codigo numeric(4,0) NOT NULL,
    soporte character varying(12),
    sgd_mrd_fechini date,
    sgd_mrd_fechfin date,
    sgd_mrd_esta character varying(10)
);


ALTER TABLE public.sgd_mrd_matrird OWNER TO admin;
--
-- Name: sgd_msdep_msgdep; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_msdep_msgdep (
    sgd_msdep_codi numeric(15,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_msg_codi numeric(15,0) NOT NULL
);


ALTER TABLE public.sgd_msdep_msgdep OWNER TO admin;
--
-- Name: sgd_msg_mensaje; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_msg_mensaje (
    sgd_msg_codi numeric(15,0) NOT NULL,
    sgd_tme_codi numeric(3,0) NOT NULL,
    sgd_msg_desc character varying(150),
    sgd_msg_fechdesp date NOT NULL,
    sgd_msg_url character varying(150) NOT NULL,
    sgd_msg_veces numeric(3,0) NOT NULL,
    sgd_msg_ancho numeric(6,0) NOT NULL,
    sgd_msg_largo numeric(6,0) NOT NULL
);


ALTER TABLE public.sgd_msg_mensaje OWNER TO admin;
--
-- Name: sgd_mtd_matriz_doc; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_mtd_matriz_doc (
    sgd_mtd_codigo numeric(4,0) NOT NULL,
    sgd_mat_codigo numeric(4,0),
    sgd_tpr_codigo numeric(4,0)
);


ALTER TABLE public.sgd_mtd_matriz_doc OWNER TO admin;
--
-- Name: sgd_noh_nohabiles; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_noh_nohabiles (
    noh_fecha date NOT NULL
);


ALTER TABLE public.sgd_noh_nohabiles OWNER TO admin;
--
-- Name: sgd_not_notificacion; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_not_notificacion (
    sgd_not_codi numeric(3,0) NOT NULL,
    sgd_not_descrip character varying(100) NOT NULL
);


ALTER TABLE public.sgd_not_notificacion OWNER TO admin;
--
-- Name: sgd_ntrd_notifrad; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_ntrd_notifrad (
    radi_nume_radi character varying(15) NOT NULL,
    sgd_not_codi numeric(3,0) NOT NULL,
    sgd_ntrd_notificador character varying(150),
    sgd_ntrd_notificado character varying(150),
    sgd_ntrd_fecha_not date,
    sgd_ntrd_num_edicto numeric(6,0),
    sgd_ntrd_fecha_fija date,
    sgd_ntrd_fecha_desfija date,
    sgd_ntrd_observaciones character varying(150)
);


ALTER TABLE public.sgd_ntrd_notifrad OWNER TO admin;
--
-- Name: sgd_oem_oempresas; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_oem_oempresas (
    sgd_oem_codigo numeric(8,0) NOT NULL,
    tdid_codi numeric(2,0),
    sgd_oem_oempresa character varying(300),
    sgd_oem_rep_legal character varying(300),
    sgd_oem_nit character varying(14),
    sgd_oem_sigla character varying(1000),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_oem_direccion character varying(1000),
    sgd_oem_telefono character varying(1000),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    email character varying(1000)
);


ALTER TABLE public.sgd_oem_oempresas OWNER TO admin;
--
-- Name: sgd_oem_secue; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sgd_oem_secue
    START WITH 18398
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_oem_secue OWNER TO admin;
--
-- Name: sgd_panu_peranulados; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_panu_peranulados (
    sgd_panu_codi numeric(4,0),
    sgd_panu_desc character varying(200)
);


ALTER TABLE public.sgd_panu_peranulados OWNER TO admin;
--
-- Name: TABLE sgd_panu_peranulados; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_panu_peranulados IS 'Define los permisos de anulacion de documentos';

--
-- Name: COLUMN sgd_panu_peranulados.sgd_panu_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_panu_peranulados.sgd_panu_codi IS 'Descripcion';

--
-- Name: sgd_parametro; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_parametro (
    param_nomb character varying(25) NOT NULL,
    param_codi numeric(5,0) NOT NULL,
    param_valor character varying(25) NOT NULL
);


ALTER TABLE public.sgd_parametro OWNER TO admin;
--
-- Name: TABLE sgd_parametro; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_parametro IS 'Almacena parametros compuestos por dos valores: identificador y valor';

--
-- Name: COLUMN sgd_parametro.param_nomb; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_parametro.param_nomb IS 'Nombre del tipo de parametro';

--
-- Name: COLUMN sgd_parametro.param_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_parametro.param_codi IS 'Codigo identificador del parametro';

--
-- Name: COLUMN sgd_parametro.param_valor; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_parametro.param_valor IS 'Valor del parametro';

--
-- Name: sgd_parexp_paramexpediente; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_parexp_paramexpediente (
    sgd_parexp_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_parexp_tabla character varying(30) NOT NULL,
    sgd_parexp_etiqueta character varying(20) NOT NULL,
    sgd_parexp_orden numeric(1,0),
    sgd_parexp_editable numeric(1,0)
);


ALTER TABLE public.sgd_parexp_paramexpediente OWNER TO admin;
--
-- Name: COLUMN sgd_parexp_paramexpediente.sgd_parexp_editable; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_parexp_paramexpediente.sgd_parexp_editable IS '1 o 0';

--
-- Name: sgd_pen_pensionados; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_pen_pensionados (
    tdid_codi numeric(2,0),
    sgd_ciu_codigo numeric(8,0) NOT NULL,
    sgd_ciu_nombre character varying(150),
    sgd_ciu_direccion character varying(150),
    sgd_ciu_apell1 character varying(50),
    sgd_ciu_apell2 character varying(50),
    sgd_ciu_telefono character varying(50),
    sgd_ciu_email character varying(50),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_ciu_cedula character varying(20),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170
);


ALTER TABLE public.sgd_pen_pensionados OWNER TO admin;
--
-- Name: sgd_pexp_procexpedientes; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_pexp_procexpedientes (
    sgd_pexp_codigo numeric NOT NULL,
    sgd_pexp_descrip character varying(100),
    sgd_pexp_terminos numeric DEFAULT 0,
    sgd_srd_codigo numeric(3,0),
    sgd_sbrd_codigo numeric(3,0),
    sgd_pexp_automatico numeric(1,0) DEFAULT 1,
    sgd_pexp_tieneflujo numeric(1,0) DEFAULT 0
);


ALTER TABLE public.sgd_pexp_procexpedientes OWNER TO admin;
--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_pexp_codigo IS 'Codigo que identifica el proceso';

--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_descrip; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_pexp_descrip IS 'Nombre del proceso';

--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_terminos; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_pexp_terminos IS 'termino del proceso';

--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_srd_codigo IS 'Serie (trd) que identifica el proceso';

--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_sbrd_codigo IS 'Subserie (trd) que identifica el proceso';

--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_tieneflujo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pexp_procexpedientes.sgd_pexp_tieneflujo IS 'Si el expediente tiene flujo';

--
-- Name: sgd_plg_secue; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sgd_plg_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.sgd_plg_secue OWNER TO admin;
--
-- Name: sgd_pnufe_procnumfe; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_pnufe_procnumfe (
    sgd_pnufe_codi numeric(4,0) NOT NULL,
    sgd_tpr_codigo numeric(4,0),
    sgd_pnufe_descrip character varying(150),
    sgd_pnufe_serie character varying(50)
);


ALTER TABLE public.sgd_pnufe_procnumfe OWNER TO admin;
--
-- Name: TABLE sgd_pnufe_procnumfe; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_pnufe_procnumfe IS 'Cataloga los procesos de numeracion y fechado';

--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pnufe_procnumfe.sgd_pnufe_codi IS 'Codigo del proceso';

--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pnufe_procnumfe.sgd_tpr_codigo IS 'Codigo del documento que genera el procedimiento';

--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_pnufe_descrip; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pnufe_procnumfe.sgd_pnufe_descrip IS 'Descripcion del procedimiento generado';

--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_pnufe_serie; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pnufe_procnumfe.sgd_pnufe_serie IS 'Serie que maneja la numeracion de los documentos';

--
-- Name: sgd_pnun_procenum; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_pnun_procenum (
    sgd_pnun_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    depe_codi character varying(5),
    sgd_pnun_prepone character varying(50)
);


ALTER TABLE public.sgd_pnun_procenum OWNER TO admin;
--
-- Name: COLUMN sgd_pnun_procenum.sgd_pnun_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pnun_procenum.sgd_pnun_codi IS 'Id del registro';

--
-- Name: COLUMN sgd_pnun_procenum.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pnun_procenum.sgd_pnufe_codi IS 'Codigo del proceso';

--
-- Name: COLUMN sgd_pnun_procenum.depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pnun_procenum.depe_codi IS 'Codigo de la dependencia';

--
-- Name: COLUMN sgd_pnun_procenum.sgd_pnun_prepone; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_pnun_procenum.sgd_pnun_prepone IS 'Preposicion empleada para generar el numero completo del documento';

--
-- Name: sgd_prc_proceso; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_prc_proceso (
    sgd_prc_codigo numeric(4,0) NOT NULL,
    sgd_prc_descrip character varying(150),
    sgd_prc_fech_ini date,
    sgd_prc_fech_fin date
);


ALTER TABLE public.sgd_prc_proceso OWNER TO admin;
--
-- Name: sgd_prd_prcdmentos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_prd_prcdmentos (
    sgd_prd_codigo numeric(4,0) NOT NULL,
    sgd_prd_descrip character varying(200),
    sgd_prd_fech_ini date,
    sgd_prd_fech_fin date
);


ALTER TABLE public.sgd_prd_prcdmentos OWNER TO admin;
--
-- Name: sgd_rda_retdoca; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_rda_retdoca (
    anex_radi_nume numeric(15,0) NOT NULL,
    anex_codigo character varying(20) NOT NULL,
    radi_nume_salida character varying(15),
    anex_borrado character varying(1),
    sgd_mrd_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    sgd_rda_fech date,
    sgd_deve_codigo numeric(2,0),
    anex_solo_lect character varying(1),
    anex_radi_fech date,
    anex_estado numeric(1,0),
    anex_nomb_archivo character varying(50),
    anex_tipo numeric(4,0),
    sgd_dir_tipo numeric(4,0)
);


ALTER TABLE public.sgd_rda_retdoca OWNER TO admin;
--
-- Name: sgd_rdf_retdocf; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_rdf_retdocf (
    sgd_mrd_codigo numeric(4,0) NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    sgd_rdf_fech date NOT NULL
);


ALTER TABLE public.sgd_rdf_retdocf OWNER TO admin;
--
-- Name: sgd_renv_regenvio; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_renv_regenvio (
    sgd_renv_codigo numeric NOT NULL,
    sgd_fenv_codigo numeric,
    sgd_renv_fech timestamp without time zone,
    radi_nume_sal character varying(15),
    sgd_renv_destino character varying,
    sgd_renv_telefono character varying,
    sgd_renv_mail character varying,
    sgd_renv_peso character varying,
    sgd_renv_valor numeric,
    sgd_renv_certificado numeric,
    sgd_renv_estado numeric,
    usua_doc numeric,
    sgd_renv_nombre character varying,
    sgd_rem_destino numeric DEFAULT 0,
    sgd_dir_codigo numeric,
    sgd_renv_planilla character varying(8),
    sgd_renv_fech_sal timestamp without time zone,
    depe_codi character varying(5),
    sgd_dir_tipo numeric(4,0) DEFAULT 0,
    radi_nume_grupo character varying(15),
    sgd_renv_dir character varying(100),
    sgd_renv_depto character varying(30),
    sgd_renv_mpio character varying(30),
    sgd_renv_tel character varying(20),
    sgd_renv_cantidad numeric(4,0) DEFAULT 0,
    sgd_renv_tipo numeric(1,0) DEFAULT 0,
    sgd_renv_observa character varying(200),
    sgd_renv_grupo numeric(14,0),
    sgd_deve_codigo numeric(2,0),
    sgd_deve_fech timestamp without time zone,
    sgd_renv_valortotal character varying(14) DEFAULT 0,
    sgd_renv_valistamiento character varying(10) DEFAULT 0,
    sgd_renv_vdescuento character varying(10) DEFAULT 0,
    sgd_renv_vadicional character varying(14) DEFAULT 0,
    sgd_depe_genera character varying(5),
    sgd_renv_pais character varying(30) DEFAULT 'colombia'::character varying,
    sgd_renv_guia character varying(100)
);


ALTER TABLE public.sgd_renv_regenvio OWNER TO admin;
--
-- Name: sgd_renv_regenvio1; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_renv_regenvio1 (
    sgd_renv_codigo numeric(6,0) NOT NULL,
    sgd_fenv_codigo numeric(5,0),
    sgd_renv_fech date,
    radi_nume_sal character varying(15),
    sgd_renv_destino character varying(150),
    sgd_renv_telefono character varying(50),
    sgd_renv_mail character varying(150),
    sgd_renv_peso character varying(10),
    sgd_renv_valor character varying(10),
    sgd_renv_certificado numeric(1,0),
    sgd_renv_estado numeric(1,0),
    usua_doc numeric(15,0),
    sgd_renv_nombre character varying(100),
    sgd_rem_destino numeric(1,0) DEFAULT 0,
    sgd_dir_codigo numeric(10,0),
    sgd_renv_planilla character varying(8),
    sgd_renv_fech_sal date,
    depe_codi character varying(5),
    sgd_dir_tipo numeric(4,0) DEFAULT 0,
    radi_nume_grupo numeric(14,0),
    sgd_renv_dir character varying(100),
    sgd_renv_depto character varying(30),
    sgd_renv_mpio character varying(30),
    sgd_renv_tel character varying(20),
    sgd_renv_cantidad numeric(4,0) DEFAULT 0,
    sgd_renv_tipo numeric(1,0) DEFAULT 0,
    sgd_renv_observa character varying(200),
    sgd_renv_grupo numeric(14,0),
    sgd_deve_codigo numeric(2,0),
    sgd_deve_fech date,
    sgd_renv_valortotal character varying(14) DEFAULT 0,
    sgd_renv_valistamiento character varying(10) DEFAULT 0,
    sgd_renv_vdescuento character varying(10) DEFAULT 0,
    sgd_renv_vadicional character varying(14) DEFAULT 0,
    sgd_depe_genera character varying(5),
    sgd_renv_pais character varying(30) DEFAULT 'colombia'::character varying
);


ALTER TABLE public.sgd_renv_regenvio1 OWNER TO admin;
--
-- Name: COLUMN sgd_renv_regenvio1.sgd_renv_valistamiento; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_renv_regenvio1.sgd_renv_valistamiento IS 'Valor Alistamiento';

--
-- Name: COLUMN sgd_renv_regenvio1.sgd_renv_vdescuento; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_renv_regenvio1.sgd_renv_vdescuento IS 'Descuento Autorizado para el envio';

--
-- Name: COLUMN sgd_renv_regenvio1.sgd_renv_vadicional; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_renv_regenvio1.sgd_renv_vadicional IS 'Valores Adicionales cobrados dependiendo del envio';

--
-- Name: sgd_rfax_reservafax; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_rfax_reservafax (
    sgd_rfax_codigo numeric(10,0),
    sgd_rfax_fax character varying(30),
    usua_login character varying(30),
    sgd_rfax_fech date,
    sgd_rfax_fechradi date,
    radi_nume_radi character varying(15),
    sgd_rfax_observa character varying(500)
);


ALTER TABLE public.sgd_rfax_reservafax OWNER TO admin;
--
-- Name: sgd_rmr_radmasivre; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_rmr_radmasivre (
    sgd_rmr_grupo character varying(15) NOT NULL,
    sgd_rmr_radi character varying(15) NOT NULL
);


ALTER TABLE public.sgd_rmr_radmasivre OWNER TO admin;
--
-- Name: sgd_san_sancionados; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_san_sancionados (
    sgd_san_ref character varying(20) NOT NULL,
    sgd_san_decision character varying(60),
    sgd_san_cargo character varying(50),
    sgd_san_expediente character varying(20),
    sgd_san_tipo_sancion character varying(50),
    sgd_san_plazo character varying(100),
    sgd_san_valor numeric(14,2),
    sgd_san_radicacion character varying(15),
    sgd_san_fecha_radicado date,
    sgd_san_valorletras character varying(1000),
    sgd_san_nombreempresa character varying(160),
    sgd_san_motivos character varying(160),
    sgd_san_sectores character varying(160),
    sgd_san_padre character varying(15),
    sgd_san_fecha_padre date,
    sgd_san_notificado character varying(100)
);


ALTER TABLE public.sgd_san_sancionados OWNER TO admin;
--
-- Name: sgd_san_sancionados_x; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_san_sancionados_x (
    radi_nume_radi character varying(15) NOT NULL,
    sgd_san_decision character varying(60),
    sgd_san_cargo character varying(50),
    sgd_san_expediente character varying(15),
    sgd_san_tipo_sancion character varying(50),
    sgd_san_plazo character varying(100),
    sgd_san_valor numeric(14,2),
    sgd_san_radicacion character varying(15),
    sgd_san_fecha_radicado date,
    sgd_san_valorletras character varying(1000),
    sgd_san_nombreempresa character varying(160),
    sgd_san_motivos character varying(160),
    sgd_san_sectores character varying(160),
    sgd_san_padre character varying(15)
);


ALTER TABLE public.sgd_san_sancionados_x OWNER TO admin;
--
-- Name: sgd_sbrd_subserierd; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_sbrd_subserierd (
    sgd_srd_codigo numeric(4,0) NOT NULL,
    sgd_sbrd_codigo numeric(4,0) NOT NULL,
    sgd_sbrd_descrip character varying(500) NOT NULL,
    sgd_sbrd_fechini date NOT NULL,
    sgd_sbrd_fechfin date NOT NULL,
    sgd_sbrd_tiemag numeric(4,0),
    sgd_sbrd_tiemac numeric(4,0),
    sgd_sbrd_dispfin character varying(50),
    sgd_sbrd_soporte character varying(50),
    sgd_sbrd_procedi character varying(1500),
    id_tabla numeric(4,0)
);


ALTER TABLE public.sgd_sbrd_subserierd OWNER TO admin;
--
-- Name: sgd_sed_sede; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_sed_sede (
    sgd_sed_codi numeric(4,0) NOT NULL,
    sgd_sed_desc character varying(50)
);


ALTER TABLE public.sgd_sed_sede OWNER TO admin;
--
-- Name: sgd_senuf_secnumfe; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_senuf_secnumfe (
    sgd_senuf_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    depe_codi character varying(5),
    sgd_senuf_sec character varying(50)
);


ALTER TABLE public.sgd_senuf_secnumfe OWNER TO admin;
--
-- Name: sgd_sexp_secexpedientes; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_sexp_secexpedientes (
    sgd_exp_numero character varying(18) NOT NULL,
    sgd_srd_codigo numeric,
    sgd_sbrd_codigo numeric,
    sgd_sexp_secuencia numeric,
    depe_codi character varying(5),
    usua_doc character varying(15),
    sgd_sexp_fech date,
    sgd_fexp_codigo numeric,
    sgd_sexp_ano numeric,
    usua_doc_responsable character varying(18),
    sgd_sexp_parexp1 character varying(250),
    sgd_sexp_parexp2 character varying(160),
    sgd_sexp_parexp3 character varying(160),
    sgd_sexp_parexp4 character varying(160),
    sgd_sexp_parexp5 character varying(160),
    sgd_pexp_codigo numeric(3,0),
    sgd_exp_fech_arch date,
    sgd_fld_codigo numeric(3,0),
    sgd_exp_fechflujoant date,
    sgd_mrd_codigo numeric(4,0),
    sgd_exp_subexpediente numeric(18,0),
    sgd_exp_privado numeric(1,0),
    sgd_sexp_estado numeric(1,0) DEFAULT 0 NOT NULL
);


ALTER TABLE public.sgd_sexp_secexpedientes OWNER TO admin;
--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_exp_numero; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_exp_numero IS 'Numero del expediente';

--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_srd_codigo IS 'codigo serie';

--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sbrd_codigo IS 'codigo subserie';

--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_secuencia; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sexp_secuencia IS 'numero del expediente';

--
-- Name: COLUMN sgd_sexp_secexpedientes.depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.depe_codi IS 'Dependencia creadora';

--
-- Name: COLUMN sgd_sexp_secexpedientes.usua_doc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.usua_doc IS 'Documento del usuario creador';

--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_fech; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sexp_fech IS 'Fecha de inicio del proceso';

--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_fexp_codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_fexp_codigo IS 'Codigo de proceso';

--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_ano; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sexp_ano IS 'A?o del expediente';

--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_estado; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_sexp_secexpedientes.sgd_sexp_estado IS 'Estado de transferencia, 0 ninguna, 1 primaria, 2, secundaria, 3 eliminado';

--
-- Name: sgd_srd_seriesrd; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_srd_seriesrd (
    sgd_srd_codigo numeric(4,0) NOT NULL,
    sgd_srd_descrip character varying(60) NOT NULL,
    sgd_srd_fechini date NOT NULL,
    sgd_srd_fechfin date NOT NULL
);


ALTER TABLE public.sgd_srd_seriesrd OWNER TO admin;
--
-- Name: sgd_tar_tarifas; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tar_tarifas (
    sgd_fenv_codigo numeric(5,0),
    sgd_tar_codser numeric(5,0),
    sgd_tar_codigo numeric(5,0),
    sgd_tar_valenv1 numeric(15,0),
    sgd_tar_valenv2 numeric(15,0),
    sgd_tar_valenv1g1 numeric(15,0),
    sgd_clta_codser numeric(5,0),
    sgd_tar_valenv2g2 numeric(15,0),
    sgd_clta_descrip character varying(100)
);


ALTER TABLE public.sgd_tar_tarifas OWNER TO admin;
--
-- Name: sgd_tdec_tipodecision; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tdec_tipodecision (
    sgd_apli_codi numeric(4,0) NOT NULL,
    sgd_tdec_codigo numeric(4,0) NOT NULL,
    sgd_tdec_descrip character varying(150),
    sgd_tdec_sancionar numeric(1,0),
    sgd_tdec_firmeza numeric(1,0),
    sgd_tdec_versancion numeric(1,0),
    sgd_tdec_showmenu numeric(1,0),
    sgd_tdec_updnotif numeric(1,0),
    sgd_tdec_veragota numeric(1,0)
);


ALTER TABLE public.sgd_tdec_tipodecision OWNER TO admin;
--
-- Name: sgd_tid_tipdecision; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tid_tipdecision (
    sgd_tid_codi numeric(4,0) NOT NULL,
    sgd_tid_desc character varying(150),
    sgd_tpr_codigo numeric(4,0),
    sgd_pexp_codigo numeric(2,0),
    sgd_tpr_codigop numeric(2,0)
);


ALTER TABLE public.sgd_tid_tipdecision OWNER TO admin;
--
-- Name: TABLE sgd_tid_tipdecision; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_tid_tipdecision IS 'Tipos de decision';

--
-- Name: COLUMN sgd_tid_tipdecision.sgd_tid_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tid_tipdecision.sgd_tid_codi IS 'Id del registro';

--
-- Name: COLUMN sgd_tid_tipdecision.sgd_tid_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tid_tipdecision.sgd_tid_desc IS 'Descripcion';

--
-- Name: sgd_tidm_tidocmasiva; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tidm_tidocmasiva (
    sgd_tidm_codi numeric(4,0) NOT NULL,
    sgd_tidm_desc character varying(150)
);


ALTER TABLE public.sgd_tidm_tidocmasiva OWNER TO admin;
--
-- Name: TABLE sgd_tidm_tidocmasiva; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_tidm_tidocmasiva IS 'Cataloga los documentos que hacen parte del procedimiento de correspondencia masiva';

--
-- Name: COLUMN sgd_tidm_tidocmasiva.sgd_tidm_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tidm_tidocmasiva.sgd_tidm_codi IS 'Codigo del documento';

--
-- Name: COLUMN sgd_tidm_tidocmasiva.sgd_tidm_desc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tidm_tidocmasiva.sgd_tidm_desc IS 'Descripcion';

--
-- Name: sgd_tip3_tipotercero; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tip3_tipotercero (
    sgd_tip3_codigo numeric(2,0) NOT NULL,
    sgd_dir_tipo numeric(4,0),
    sgd_tip3_nombre character varying(15),
    sgd_tip3_desc character varying(30),
    sgd_tip3_imgpestana character varying(20),
    sgd_tpr_tp1 numeric(1,0) DEFAULT 0,
    sgd_tpr_tp2 numeric(1,0) DEFAULT 0,
    sgd_tpr_tp4 smallint DEFAULT 1
);


ALTER TABLE public.sgd_tip3_tipotercero OWNER TO admin;
--
-- Name: sgd_tma_temas; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tma_temas (
    sgd_tma_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5),
    sgd_prc_codigo numeric(4,0),
    sgd_tma_descrip character varying(150)
);


ALTER TABLE public.sgd_tma_temas OWNER TO admin;
--
-- Name: sgd_tme_tipmen; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tme_tipmen (
    sgd_tme_codi numeric(3,0) NOT NULL,
    sgd_tme_desc character varying(150)
);


ALTER TABLE public.sgd_tme_tipmen OWNER TO admin;
--
-- Name: sgd_tpr_tpdcumento; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tpr_tpdcumento (
    sgd_tpr_codigo numeric(4,0) NOT NULL,
    sgd_tpr_descrip character varying(500),
    sgd_tpr_termino numeric(4,0),
    sgd_tpr_tpuso numeric(1,0),
    sgd_tpr_numera character(1),
    sgd_tpr_radica character(1),
    sgd_tpr_tp1 numeric(1,0) DEFAULT 0,
    sgd_tpr_tp2 numeric(1,0) DEFAULT 0,
    sgd_tpr_estado numeric(1,0),
    sgd_termino_real numeric(4,0),
    sgd_tpr_web smallint DEFAULT 1,
    sgd_tpr_tiptermino character varying(5),
    sgd_tpr_tp4 smallint
);


ALTER TABLE public.sgd_tpr_tpdcumento OWNER TO admin;
--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_numera; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_numera IS 'INDICA SI UN DOCUMNTO PUEDE NUMERARSE';

--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_radica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_radica IS 'INDICA SI UN DOCUMNTO PUEDE RADICARSE';

--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp1; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp1 IS 'Radicados de salida';

--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp2; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp2 IS 'Radicados de entrada';

--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_estado; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_estado IS 'Estado del documento 1- habilitado 2- deshabilitado';

--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_web; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tpr_tpdcumento.sgd_tpr_web IS 'Prueba';

--
-- Name: sgd_trad_tiporad; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_trad_tiporad (
    sgd_trad_codigo numeric(2,0) NOT NULL,
    sgd_trad_descr character varying(30),
    sgd_trad_icono character varying(30),
    sgd_trad_diasbloqueo numeric(2,0),
    sgd_trad_genradsal smallint
);


ALTER TABLE public.sgd_trad_tiporad OWNER TO admin;
--
-- Name: sgd_ttr_transaccion; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_ttr_transaccion (
    sgd_ttr_codigo numeric(3,0) NOT NULL,
    sgd_ttr_descrip character varying(100) NOT NULL
);


ALTER TABLE public.sgd_ttr_transaccion OWNER TO admin;
--
-- Name: sgd_tvd_depe_id; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sgd_tvd_depe_id
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE public.sgd_tvd_depe_id OWNER TO admin;
--
-- Name: sgd_tvd_dependencia; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tvd_dependencia (
    sgd_depe_codi character varying(5) NOT NULL,
    sgd_depe_nombre character varying(200) NOT NULL,
    sgd_depe_fechini date NOT NULL,
    sgd_depe_fechfin date NOT NULL
);


ALTER TABLE public.sgd_tvd_dependencia OWNER TO admin;
--
-- Name: sgd_tvd_series; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_tvd_series (
    sgd_depe_codi character varying(5) NOT NULL,
    sgd_stvd_codi numeric(4,0) NOT NULL,
    sgd_stvd_nombre character varying(200) NOT NULL,
    sgd_stvd_ac numeric(4,0),
    sgd_stvd_dispfin numeric(2,0),
    sgd_stvd_proc character varying(500)
);


ALTER TABLE public.sgd_tvd_series OWNER TO admin;
--
-- Name: TABLE sgd_tvd_series; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_tvd_series IS 'Series de TVD';

--
-- Name: COLUMN sgd_tvd_series.sgd_depe_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tvd_series.sgd_depe_codi IS 'Codigo de dependencia TVD';

--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_codi; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_codi IS 'Codigo de serieTVD';

--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_nombre; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_nombre IS 'Nombre de serie TVD';

--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_ac; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_ac IS 'Retencion en AC';

--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_dispfin; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_dispfin IS 'Disposicion final';

--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_proc; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sgd_tvd_series.sgd_stvd_proc IS 'procedimiento';

--
-- Name: sgd_ush_usuhistorico; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_ush_usuhistorico (
    sgd_ush_admcod numeric(10,0) NOT NULL,
    sgd_ush_admdep character varying(5) NOT NULL,
    sgd_ush_admdoc character varying(14) NOT NULL,
    sgd_ush_usucod numeric(10,0) NOT NULL,
    sgd_ush_usudep character varying(5) NOT NULL,
    sgd_ush_usudoc character varying(14) NOT NULL,
    sgd_ush_modcod numeric(5,0) NOT NULL,
    sgd_ush_fechevento date NOT NULL,
    sgd_ush_usulogin character varying(20) NOT NULL
);


ALTER TABLE public.sgd_ush_usuhistorico OWNER TO admin;
--
-- Name: TABLE sgd_ush_usuhistorico; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_ush_usuhistorico IS 'Representa las modificaciones hechas a los usuarios. Registro historico por usuario sobre el tipo de transaccion realizada y los cambios con fecha y hora de realizacion.';

--
-- Name: sgd_usm_usumodifica; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sgd_usm_usumodifica (
    sgd_usm_modcod numeric(5,0) NOT NULL,
    sgd_usm_moddescr character varying(60) NOT NULL
);


ALTER TABLE public.sgd_usm_usumodifica OWNER TO admin;
--
-- Name: TABLE sgd_usm_usumodifica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sgd_usm_usumodifica IS 'Contiene los tipos de modificaciones que se pueden hacer a los usuarios del sistema.';

--
-- Name: ubicacion_fisica; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE ubicacion_fisica (
    ubic_depe_radi character varying(5),
    ubic_depe_arch character varying(5)
);


ALTER TABLE public.ubicacion_fisica OWNER TO admin;

--
-- Data for Name: anexos_tipo; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO anexos_tipo VALUES (1, 'doc', 'Word');
INSERT INTO anexos_tipo VALUES (2, 'xls', 'Excel');
INSERT INTO anexos_tipo VALUES (3, 'ppt', 'PowerPoint');
INSERT INTO anexos_tipo VALUES (4, 'tif', 'Imagen Tif');
INSERT INTO anexos_tipo VALUES (5, 'jpg', 'Imagen jpg');
INSERT INTO anexos_tipo VALUES (6, 'gif', 'Imagen gif');
INSERT INTO anexos_tipo VALUES (7, 'pdf', 'Acrobat Reader');
INSERT INTO anexos_tipo VALUES (8, 'txt', 'Documento txt');
INSERT INTO anexos_tipo VALUES (9, 'zip', 'Comprimido');
INSERT INTO anexos_tipo VALUES (10, 'rtf', 'Rich Text Format (rtf)');
INSERT INTO anexos_tipo VALUES (11, 'dia', 'Dia(Diagrama)');
INSERT INTO anexos_tipo VALUES (12, 'zargo', 'Argo(Diagrama)');
INSERT INTO anexos_tipo VALUES (13, 'csv', 'csv (separado por comas)');
INSERT INTO anexos_tipo VALUES (14, 'odt', 'OpenDocument Text');
INSERT INTO anexos_tipo VALUES (20, 'avi', '.avi (Video)');
INSERT INTO anexos_tipo VALUES (21, 'mpg', '.mpg (video)');
INSERT INTO anexos_tipo VALUES (23, 'tar', '.tar (Comprimido)');
INSERT INTO anexos_tipo VALUES (24, 'docx', 'Microsoft Word 2010+');
INSERT INTO anexos_tipo VALUES (25, 'xlsx', 'Microsoft Excel 2010+');
INSERT INTO anexos_tipo VALUES (26, 'pptx', 'Microsoft Power Point 2010+');

--
-- Data for Name: carpeta; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO carpeta VALUES (1, 'Salida');
INSERT INTO carpeta VALUES (12, 'Devueltos');
INSERT INTO carpeta VALUES (11, 'Vo.Bo.');
INSERT INTO carpeta VALUES (0, 'Entrada');
INSERT INTO carpeta VALUES (4, 'PQRs');

--
-- Data for Name: carpeta_per; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO carpeta_per VALUES (1, '0998', 'Masiva', 'Radicacion Masiva', 99);

--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO departamento VALUES (1, 'TODOS', 1, 170);
INSERT INTO departamento VALUES (5, 'ANTIOQUÍA', 1, 170);
INSERT INTO departamento VALUES (8, 'ATLÁNTICO', 1, 170);
INSERT INTO departamento VALUES (13, 'BOLÍVAR', 1, 170);
INSERT INTO departamento VALUES (15, 'BOYACÁ', 1, 170);
INSERT INTO departamento VALUES (17, 'CALDAS', 1, 170);
INSERT INTO departamento VALUES (19, 'CAUCA', 1, 170);
INSERT INTO departamento VALUES (20, 'CESAR', 1, 170);
INSERT INTO departamento VALUES (23, 'CÓRDOBA', 1, 170);
INSERT INTO departamento VALUES (25, 'CUNDINAMARCA', 1, 170);
INSERT INTO departamento VALUES (27, 'CHOCO', 1, 170);
INSERT INTO departamento VALUES (41, 'HUILA', 1, 170);
INSERT INTO departamento VALUES (44, 'LA GUAJIRA', 1, 170);
INSERT INTO departamento VALUES (47, 'MAGDALENA', 1, 170);
INSERT INTO departamento VALUES (50, 'META', 1, 170);
INSERT INTO departamento VALUES (52, 'NARIÑO', 1, 170);
INSERT INTO departamento VALUES (54, 'NORTE DE SANTANDER', 1, 170);
INSERT INTO departamento VALUES (63, 'QUINDÍO', 1, 170);
INSERT INTO departamento VALUES (66, 'RISARALDA', 1, 170);
INSERT INTO departamento VALUES (68, 'SANTANDER', 1, 170);
INSERT INTO departamento VALUES (70, 'SUCRE', 1, 170);
INSERT INTO departamento VALUES (73, 'TOLIMA', 1, 170);
INSERT INTO departamento VALUES (76, 'VALLE DEL CAUCA', 1, 170);
INSERT INTO departamento VALUES (81, 'ARAUCA', 1, 170);
INSERT INTO departamento VALUES (85, 'CASANARE', 1, 170);
INSERT INTO departamento VALUES (86, 'PUTUMAYO', 1, 170);
INSERT INTO departamento VALUES (88, 'SAN ANDRÉS', 1, 170);
INSERT INTO departamento VALUES (91, 'AMAZONAS', 1, 170);
INSERT INTO departamento VALUES (94, 'GUAINÍA', 1, 170);
INSERT INTO departamento VALUES (95, 'GUAVIARE', 1, 170);
INSERT INTO departamento VALUES (97, 'VAUPÉS', 1, 170);
INSERT INTO departamento VALUES (99, 'VICHADA', 1, 170);
INSERT INTO departamento VALUES (11, 'D.C.', 1, 170);

--
-- Data for Name: dependencia; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO dependencia VALUES ('0999', 'Dependencia de Salida', 11, '0999', 1, '0999', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 170, 1, NULL, NULL);
INSERT INTO dependencia VALUES ('0998', 'Dependencia de Prueba', 11, '0998', 1, '0998', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 170, 1, NULL, NULL);

--
-- Name: dependencias; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('dependencias', 0, false);

--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO estado VALUES (9, 'Documento Orfeo');

--
-- Data for Name: medio_recepcion; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO medio_recepcion VALUES (1, 'Correo');
INSERT INTO medio_recepcion VALUES (3, 'Internet');
INSERT INTO medio_recepcion VALUES (4, 'Mail');
INSERT INTO medio_recepcion VALUES (5, 'Personal');
INSERT INTO medio_recepcion VALUES (6, 'Telefonico');

--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO municipio VALUES (1, 10, 'NEW YORK', 1, 249, '0', NULL, 1);
INSERT INTO municipio VALUES (8, 9, 'BARCELONA', 2, 724, '0', NULL, 1);
INSERT INTO municipio VALUES (1, 16, 'GINEBRA', 2, 767, '0', NULL, 1);
INSERT INTO municipio VALUES (16, 9, 'CUENCA', 2, 724, '0', NULL, 1);
INSERT INTO municipio VALUES (999, 1, 'TODOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 5, 'MEDELLIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (2, 5, 'ABEJORRAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (4, 5, 'ABRIAQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (21, 5, 'ALEJANDRIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (30, 5, 'AMAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (31, 5, 'AMALFI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (34, 5, 'ANDES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (36, 5, 'ANGELOPOLIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (38, 5, 'ANGOSTURA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (40, 5, 'ANORI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (42, 5, 'SANTA FE DE ANTIOQUIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (44, 5, 'ANZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (45, 5, 'APARTADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 5, 'ARBOLETES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (55, 5, 'ARGELIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (59, 5, 'ARMENIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (79, 5, 'BARBOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (86, 5, 'BELMIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (88, 5, 'BELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (91, 5, 'BETANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (93, 5, 'BETULIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (101, 5, 'CIUDAD BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (107, 5, 'BRICEÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (113, 5, 'BURITICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (120, 5, 'CACERES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (125, 5, 'CAICEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (129, 5, 'CALDAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (134, 5, 'CAMPAMENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (138, 5, 'CAÑASGORDAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (142, 5, 'CARACOLI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (145, 5, 'CARAMANTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (147, 5, 'CAREPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (148, 5, 'EL CARMEN DE VIBORAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (150, 5, 'CAROLINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (154, 5, 'CAUCASIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (172, 5, 'CHIGORODO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (190, 5, 'CISNEROS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (197, 5, 'COCORNA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (206, 5, 'CONCEPCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (209, 5, 'CONCORDIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 5, 'COPACABANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (234, 5, 'DABEIBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (237, 5, 'DON MATIAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (240, 5, 'EBEJICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 5, 'EL BAGRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (264, 5, 'ENTRERRIOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (266, 5, 'ENVIGADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (282, 5, 'FREDONIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (284, 5, 'FRONTINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (306, 5, 'GIRALDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (308, 5, 'GIRARDOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (310, 5, 'GOMEZ PLATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (313, 5, 'GRANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (315, 5, 'GUADALUPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 5, 'GUARNE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (321, 5, 'GUATAPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (347, 5, 'HELICONIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (353, 5, 'HISPANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (360, 5, 'ITAGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (361, 5, 'ITUANGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (364, 5, 'JARDIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (368, 5, 'JERICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (376, 5, 'LA CEJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (380, 5, 'LA ESTRELLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (390, 5, 'LA PINTADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 5, 'LA UNION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (411, 5, 'LIBORINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (425, 5, 'MACEO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (440, 5, 'MARINILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (467, 5, 'MONTEBELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (475, 5, 'MURINDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (480, 5, 'MUTATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (483, 5, 'NARIÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (490, 5, 'NECOCLI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (495, 5, 'NECHI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (501, 5, 'OLAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (541, 5, 'PEÑOL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (543, 5, 'PEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (576, 5, 'PUEBLORRICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (585, 5, 'PUERTO NARE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (591, 5, 'PUERTO TRIUNFO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (604, 5, 'REMEDIOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (607, 5, 'RETIRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (615, 5, 'RIONEGRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (628, 5, 'SABANALARGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (631, 5, 'SABANETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (642, 5, 'SALGAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (647, 5, 'SAN ANDRES DE CUERQUIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (649, 5, 'SAN CARLOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (652, 5, 'SAN FRANCISCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (656, 5, 'SAN JERONIMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (658, 5, 'SAN JOSE DE LA MONTAÑA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (659, 5, 'SAN JUAN DE URABA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 5, 'SAN LUIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (664, 5, 'SAN PEDRO DE LOS MILAGROS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (665, 5, 'SAN PEDRO DE URABA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (667, 5, 'SAN RAFAEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 5, 'SAN ROQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (674, 5, 'SAN VICENTE FERRER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (679, 5, 'SANTA BARBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 5, 'SANTA ROSA DE OSOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (690, 5, 'SANTO DOMINGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (697, 5, 'EL SANTUARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (736, 5, 'SEGOVIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (756, 5, 'SONSON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (761, 5, 'SOPETRAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (789, 5, 'TAMESIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (790, 5, 'TARAZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (792, 5, 'TARSO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (809, 5, 'TITIRIBI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (819, 5, 'TOLEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (837, 5, 'TURBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (842, 5, 'URAMITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (847, 5, 'URRAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (854, 5, 'VALDIVIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (856, 5, 'VALPARAISO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (858, 5, 'VEGACHI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (861, 5, 'VENECIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 5, 'VIGIA DEL FUERTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 5, 'YALI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (887, 5, 'YARUMAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (890, 5, 'YOLOMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (893, 5, 'YONDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (895, 5, 'ZARAGOZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 8, 'BARRANQUILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (78, 8, 'BARANOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (137, 8, 'CAMPO DE LA CRUZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (141, 8, 'CANDELARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (296, 8, 'GALAPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (372, 8, 'JUAN DE ACOSTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (421, 8, 'LURUACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (433, 8, 'MALAMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (436, 8, 'MANATI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 8, 'PALMAR DE VARELA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (549, 8, 'PIOJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (558, 8, 'POLONUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (560, 8, 'PONEDERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 8, 'PUERTO COLOMBIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (606, 8, 'REPELON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (634, 8, 'SABANAGRANDE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (638, 8, 'SABANALARGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (675, 8, 'SANTA LUCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (685, 8, 'SANTO TOMAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (758, 8, 'SOLEDAD', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 8, 'SUAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (832, 8, 'TUBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (849, 8, 'USIACURI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 11, 'BOGOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 13, 'CARTAGENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (6, 13, 'ACHI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (30, 13, 'ALTOS DEL ROSARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (42, 13, 'ARENAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (52, 13, 'ARJONA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (62, 13, 'ARROYOHONDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (74, 13, 'BARRANCO DE LOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (140, 13, 'CALAMAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (160, 13, 'CANTAGALLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (188, 13, 'CICUCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 13, 'CORDOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (222, 13, 'CLEMENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (244, 13, 'EL CARMEN DE BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (248, 13, 'EL GUAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (268, 13, 'EL PEÑON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 13, 'HATILLO DE LOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 13, 'MAGANGUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (433, 13, 'MAHATES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (440, 13, 'MARGARITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (442, 13, 'MARIA LA BAJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (458, 13, 'MONTECRISTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (468, 13, 'MOMPOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 13, 'MORALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (490, 13, 'NOROSI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (549, 13, 'PINILLOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 13, 'REGIDOR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (600, 13, 'RIO VIEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (620, 13, 'SAN CRISTOBAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (647, 13, 'SAN ESTANISLAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (650, 13, 'SAN FERNANDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (654, 13, 'SAN JACINTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (655, 13, 'SAN JACINTO DEL CAUCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (657, 13, 'SAN JUAN NEPOMUCENO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (667, 13, 'SAN MARTIN DE LOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 13, 'SAN PABLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (673, 13, 'SANTA CATALINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (683, 13, 'SANTA ROSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (688, 13, 'SANTA ROSA DEL SUR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (744, 13, 'SIMITI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (760, 13, 'SOPLAVIENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (780, 13, 'TALAIGUA NUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (810, 13, 'TIQUISIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (836, 13, 'TURBACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (838, 13, 'TURBANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 13, 'VILLANUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (894, 13, 'ZAMBRANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 15, 'TUNJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (22, 15, 'ALMEIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (47, 15, 'AQUITANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 15, 'ARCABUCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (87, 15, 'BELEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (90, 15, 'BERBEO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (92, 15, 'BETEITIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (97, 15, 'BOAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (104, 15, 'BOYACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (106, 15, 'BRICEÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (109, 15, 'BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (114, 15, 'BUSBANZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (131, 15, 'CALDAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (135, 15, 'CAMPOHERMOSO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (162, 15, 'CERINZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (172, 15, 'CHINAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (176, 15, 'CHIQUINQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (180, 15, 'CHISCAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (183, 15, 'CHITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (185, 15, 'CHITARAQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (187, 15, 'CHIVATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (189, 15, 'CIENEGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (204, 15, 'COMBITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 15, 'COPER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (215, 15, 'CORRALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (218, 15, 'COVARACHIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (223, 15, 'CUBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (224, 15, 'CUCAITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (226, 15, 'CUITIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (232, 15, 'CHIQUIZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (236, 15, 'CHIVOR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (238, 15, 'DUITAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (244, 15, 'EL COCUY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (248, 15, 'EL ESPINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (272, 15, 'FIRAVITOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (276, 15, 'FLORESTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (293, 15, 'GACHANTIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (296, 15, 'GAMEZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (299, 15, 'GARAGOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (317, 15, 'GUACAMAYAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (322, 15, 'GUATEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (325, 15, 'GUAYATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (332, 15, 'GUICAN DE LA SIERRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (362, 15, 'IZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (367, 15, 'JENESANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (368, 15, 'JERICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 15, 'LABRANZAGRANDE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (380, 15, 'LA CAPILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (401, 15, 'LA VICTORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (403, 15, 'LA UVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (407, 15, 'VILLA DE LEYVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (425, 15, 'MACANAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (442, 15, 'MARIPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (455, 15, 'MIRAFLORES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (464, 15, 'MONGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (466, 15, 'MONGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (469, 15, 'MONIQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (476, 15, 'MOTAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (480, 15, 'MUZO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (491, 15, 'NOBSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (494, 15, 'NUEVO COLON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (500, 15, 'OICATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (507, 15, 'OTANCHE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (511, 15, 'PACHAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (514, 15, 'PAEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (516, 15, 'PAIPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (518, 15, 'PAJARITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (522, 15, 'PANQUEBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (531, 15, 'PAUNA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (533, 15, 'PAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (537, 15, 'PAZ DE RIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (542, 15, 'PESCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (550, 15, 'PISBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (572, 15, 'PUERTO BOYACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 15, 'QUIPAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (599, 15, 'RAMIRIQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (600, 15, 'RAQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (621, 15, 'RONDON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (632, 15, 'SABOYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (638, 15, 'SACHICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (646, 15, 'SAMACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 15, 'SAN EDUARDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (664, 15, 'SAN JOSE DE PARE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (667, 15, 'SAN LUIS DE GACENO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (673, 15, 'SAN MATEO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (676, 15, 'SAN MIGUEL DE SEMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (681, 15, 'SAN PABLO DE BORBUR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 15, 'SANTANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (690, 15, 'SANTA MARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (693, 15, 'SANTA ROSA DE VITERBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (696, 15, 'SANTA SOFIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 15, 'SATIVANORTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (723, 15, 'SATIVASUR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (740, 15, 'SIACHOQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (753, 15, 'SOATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (755, 15, 'SOCOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (757, 15, 'SOCHA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (759, 15, 'SOGAMOSO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (761, 15, 'SOMONDOCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (762, 15, 'SORA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (763, 15, 'SOTAQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (764, 15, 'SORACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (774, 15, 'SUSACON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (776, 15, 'SUTAMARCHAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (778, 15, 'SUTATENZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (790, 15, 'TASCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (798, 15, 'TENZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (804, 15, 'TIBANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (806, 15, 'TIBASOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (808, 15, 'TINJACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (810, 15, 'TIPACOQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (814, 15, 'TOCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (816, 15, 'TOGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (820, 15, 'TOPAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (822, 15, 'TOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (832, 15, 'TUNUNGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (835, 15, 'TURMEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (837, 15, 'TUTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (839, 15, 'TUTAZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (842, 15, 'UMBITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (861, 15, 'VENTAQUEMADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (879, 15, 'VIRACACHA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (897, 15, 'ZETAQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 17, 'MANIZALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (13, 17, 'AGUADAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (42, 17, 'ANSERMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (50, 17, 'ARANZAZU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (88, 17, 'BELALCAZAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (174, 17, 'CHINCHINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (272, 17, 'FILADELFIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (380, 17, 'LA DORADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (388, 17, 'LA MERCED', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (433, 17, 'MANZANARES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (442, 17, 'MARMATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (444, 17, 'MARQUETALIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (446, 17, 'MARULANDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (486, 17, 'NEIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (495, 17, 'NORCASIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (513, 17, 'PACORA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 17, 'PALESTINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (541, 17, 'PENSILVANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (614, 17, 'RIOSUCIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (616, 17, 'RISARALDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (653, 17, 'SALAMINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (662, 17, 'SAMANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (665, 17, 'SAN JOSE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (777, 17, 'SUPIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (867, 17, 'VICTORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 17, 'VILLAMARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (877, 17, 'VITERBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 19, 'POPAYAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (22, 19, 'ALMAGUER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (50, 19, 'ARGELIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (75, 19, 'BALBOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (100, 19, 'BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 19, 'BUENOS AIRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (130, 19, 'CAJIBIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (137, 19, 'CALDONO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (142, 19, 'CALOTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 19, 'CORINTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (256, 19, 'EL TAMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (290, 19, 'FLORENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 19, 'GUACHENE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 19, 'GUAPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (355, 19, 'INZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (364, 19, 'JAMBALO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (392, 19, 'LA SIERRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (397, 19, 'LA VEGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 19, 'LOPEZ DE MICAY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (450, 19, 'MERCADERES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (455, 19, 'MIRANDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 19, 'MORALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (513, 19, 'PADILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (517, 19, 'PAEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (532, 19, 'PATIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (533, 19, 'PIAMONTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (548, 19, 'PIENDAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 19, 'PUERTO TEJADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (585, 19, 'PURACE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (622, 19, 'ROSAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (693, 19, 'SAN SEBASTIAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (698, 19, 'SANTANDER DE QUILICHAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (701, 19, 'SANTA ROSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (743, 19, 'SILVIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (760, 19, 'SOTARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (780, 19, 'SUAREZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (785, 19, 'SUCRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (807, 19, 'TIMBIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (809, 19, 'TIMBIQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (821, 19, 'TORIBIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (824, 19, 'TOTORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (845, 19, 'VILLA RICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 20, 'VALLEDUPAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (11, 20, 'AGUACHICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (13, 20, 'AGUSTIN CODAZZI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (32, 20, 'ASTREA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (45, 20, 'BECERRIL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (60, 20, 'BOSCONIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (175, 20, 'CHIMICHAGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (178, 20, 'CHIRIGUANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (228, 20, 'CURUMANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (238, 20, 'EL COPEY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 20, 'EL PASO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (295, 20, 'GAMARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (310, 20, 'GONZALEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (383, 20, 'LA GLORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 20, 'LA JAGUA DE IBIRICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (443, 20, 'MANAURE BALCON DEL CESAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (517, 20, 'PAILITAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (550, 20, 'PELAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (570, 20, 'PUEBLO BELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (614, 20, 'RIO DE ORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (621, 20, 'LA PAZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (710, 20, 'SAN ALBERTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (750, 20, 'SAN DIEGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 20, 'SAN MARTIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (787, 20, 'TAMALAMEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 23, 'MONTERIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (68, 23, 'AYAPEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (79, 23, 'BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (90, 23, 'CANALETE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (162, 23, 'CERETE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (168, 23, 'CHIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (182, 23, 'CHINU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (189, 23, 'CIENAGA DE ORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 23, 'COTORRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (350, 23, 'LA APARTADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (417, 23, 'LORICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (419, 23, 'LOS CORDOBAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (464, 23, 'MOMIL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (466, 23, 'MONTELIBANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (500, 23, 'MOÑITOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (555, 23, 'PLANETA RICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (570, 23, 'PUEBLO NUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (574, 23, 'PUERTO ESCONDIDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 23, 'PUERTO LIBERTADOR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (586, 23, 'PURISIMA DE LA CONCEPCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 23, 'SAHAGUN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 23, 'SAN ANDRES DE SOTAVENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (672, 23, 'SAN ANTERO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (675, 23, 'SAN BERNARDO DEL VIENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (678, 23, 'SAN CARLOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (682, 23, 'SAN JOSE DE URE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 23, 'SAN PELAYO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (807, 23, 'TIERRALTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (815, 23, 'TUCHIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (855, 23, 'VALENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 25, 'AGUA DE DIOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (19, 25, 'ALBAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (35, 25, 'ANAPOIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (40, 25, 'ANOLAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (53, 25, 'ARBELAEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (86, 25, 'BELTRAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (95, 25, 'BITUIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (99, 25, 'BOJACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (120, 25, 'CABRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (123, 25, 'CACHIPAY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (126, 25, 'CAJICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (148, 25, 'CAPARRAPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (151, 25, 'CAQUEZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (154, 25, 'CARMEN DE CARUPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (168, 25, 'CHAGUANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (175, 25, 'CHIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (178, 25, 'CHIPAQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (181, 25, 'CHOACHI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (183, 25, 'CHOCONTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (200, 25, 'COGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (214, 25, 'COTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (224, 25, 'CUCUNUBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 25, 'EL COLEGIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (258, 25, 'EL PEÑON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (260, 25, 'EL ROSAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (269, 25, 'FACATATIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (279, 25, 'FOMEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (281, 25, 'FOSCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (286, 25, 'FUNZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (288, 25, 'FUQUENE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (290, 25, 'FUSAGASUGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (293, 25, 'GACHALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (295, 25, 'GACHANCIPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (297, 25, 'GACHETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (299, 25, 'GAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (307, 25, 'GIRARDOT', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (312, 25, 'GRANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (317, 25, 'GUACHETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (320, 25, 'GUADUAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (322, 25, 'GUASCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (324, 25, 'GUATAQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (326, 25, 'GUATAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (328, 25, 'GUAYABAL DE SIQUIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (335, 25, 'GUAYABETAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (339, 25, 'GUTIERREZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (368, 25, 'JERUSALEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (372, 25, 'JUNIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 25, 'LA CALERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (386, 25, 'LA MESA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (394, 25, 'LA PALMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (398, 25, 'LA PEÑA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (402, 25, 'LA VEGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (407, 25, 'LENGUAZAQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (426, 25, 'MACHETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 25, 'MADRID', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (436, 25, 'MANTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (438, 25, 'MEDINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 25, 'MOSQUERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (483, 25, 'NARIÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (486, 25, 'NEMOCON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (488, 25, 'NILO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (489, 25, 'NIMAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (491, 25, 'NOCAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (506, 25, 'VENECIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (513, 25, 'PACHO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (518, 25, 'PAIME', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 25, 'PANDI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (530, 25, 'PARATEBUENO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (535, 25, 'PASCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (572, 25, 'PUERTO SALGAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 25, 'PULI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (592, 25, 'QUEBRADANEGRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (594, 25, 'QUETAME', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (596, 25, 'QUIPILE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (599, 25, 'APULO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (612, 25, 'RICAURTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (645, 25, 'SAN ANTONIO DEL TEQUENDAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (649, 25, 'SAN BERNARDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (653, 25, 'SAN CAYETANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (658, 25, 'SAN FRANCISCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (662, 25, 'SAN JUAN DE RIOSECO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (718, 25, 'SASAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (736, 25, 'SESQUILE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (740, 25, 'SIBATE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (743, 25, 'SILVANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (745, 25, 'SIMIJACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (754, 25, 'SOACHA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (758, 25, 'SOPO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (769, 25, 'SUBACHOQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (772, 25, 'SUESCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (777, 25, 'SUPATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (779, 25, 'SUSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (781, 25, 'SUTATAUSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (785, 25, 'TABIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (793, 25, 'TAUSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (797, 25, 'TENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (799, 25, 'TENJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (805, 25, 'TIBACUY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (807, 25, 'TIBIRITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (815, 25, 'TOCAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (817, 25, 'TOCANCIPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (823, 25, 'TOPAIPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (839, 25, 'UBALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (841, 25, 'UBAQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (843, 25, 'VILLA DE SAN DIEGO DE UBATE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (845, 25, 'UNE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (851, 25, 'UTICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (862, 25, 'VERGARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (867, 25, 'VIANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (871, 25, 'VILLAGOMEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 25, 'VILLAPINZON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (875, 25, 'VILLETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (878, 25, 'VIOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 25, 'YACOPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (898, 25, 'ZIPACON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (899, 25, 'ZIPAQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 27, 'QUIBDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (6, 27, 'ACANDI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (25, 27, 'ALTO BAUDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (50, 27, 'ATRATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (73, 27, 'BAGADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (75, 27, 'BAHIA SOLANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (77, 27, 'BAJO BAUDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (99, 27, 'BOJAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (135, 27, 'EL CANTON DEL SAN PABLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (150, 27, 'CARMEN DEL DARIEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (160, 27, 'CERTEGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (205, 27, 'CONDOTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 27, 'EL CARMEN DE ATRATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 27, 'EL LITORAL DEL SAN JUAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (361, 27, 'ISTMINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (372, 27, 'JURADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (413, 27, 'LLORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (425, 27, 'MEDIO ATRATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 27, 'MEDIO BAUDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (450, 27, 'MEDIO SAN JUAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (491, 27, 'NOVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (495, 27, 'NUQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 27, 'RIO IRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (600, 27, 'RIO QUITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (615, 27, 'RIOSUCIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 27, 'SAN JOSE DEL PALMAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (745, 27, 'SIPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (787, 27, 'TADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (800, 27, 'UNGUIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (810, 27, 'UNION PANAMERICANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 41, 'NEIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (6, 41, 'ACEVEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (13, 41, 'AGRADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (16, 41, 'AIPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (20, 41, 'ALGECIRAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (26, 41, 'ALTAMIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (78, 41, 'BARAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (132, 41, 'CAMPOALEGRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (206, 41, 'COLOMBIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (244, 41, 'ELIAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (298, 41, 'GARZON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (306, 41, 'GIGANTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (319, 41, 'GUADALUPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (349, 41, 'HOBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (357, 41, 'IQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (359, 41, 'ISNOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (378, 41, 'LA ARGENTINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (396, 41, 'LA PLATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (483, 41, 'NATAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (503, 41, 'OPORAPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (518, 41, 'PAICOL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 41, 'PALERMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (530, 41, 'PALESTINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (548, 41, 'PITAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (551, 41, 'PITALITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (615, 41, 'RIVERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 41, 'SALADOBLANCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (668, 41, 'SAN AGUSTIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (676, 41, 'SANTA MARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 41, 'SUAZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (791, 41, 'TARQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (797, 41, 'TESALIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (799, 41, 'TELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (801, 41, 'TERUEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (807, 41, 'TIMANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (872, 41, 'VILLAVIEJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 41, 'YAGUARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 44, 'RIOHACHA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (35, 44, 'ALBANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (78, 44, 'BARRANCAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (90, 44, 'DIBULLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (98, 44, 'DISTRACCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 44, 'EL MOLINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (279, 44, 'FONSECA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (378, 44, 'HATONUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (420, 44, 'LA JAGUA DEL PILAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 44, 'MAICAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (560, 44, 'MANAURE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (650, 44, 'SAN JUAN DEL CESAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (847, 44, 'URIBIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (855, 44, 'URUMITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (874, 44, 'VILLANUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 47, 'SANTA MARTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (30, 47, 'ALGARROBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (53, 47, 'ARACATACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (58, 47, 'ARIGUANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (161, 47, 'CERRO DE SAN ANTONIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (170, 47, 'CHIVOLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (189, 47, 'CIENAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (205, 47, 'CONCORDIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 47, 'EL BANCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (258, 47, 'EL PIÑON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (268, 47, 'EL RETEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (288, 47, 'FUNDACION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 47, 'GUAMAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (460, 47, 'NUEVA GRANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (541, 47, 'PEDRAZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (545, 47, 'PIJIÑO DEL CARMEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (551, 47, 'PIVIJAY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (555, 47, 'PLATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (570, 47, 'PUEBLOVIEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (605, 47, 'REMOLINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 47, 'SABANAS DE SAN ANGEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (675, 47, 'SALAMINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (692, 47, 'SAN SEBASTIAN DE BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (703, 47, 'SAN ZENON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (707, 47, 'SANTA ANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 47, 'SANTA BARBARA DE PINTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (745, 47, 'SITIONUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (798, 47, 'TENERIFE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (960, 47, 'ZAPAYAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (980, 47, 'ZONA BANANERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 50, 'VILLAVICENCIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (6, 50, 'ACACIAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 50, 'BARRANCA DE UPIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (124, 50, 'CABUYARO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (150, 50, 'CASTILLA LA NUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (223, 50, 'CUBARRAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (226, 50, 'CUMARAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 50, 'EL CALVARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (251, 50, 'EL CASTILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (270, 50, 'EL DORADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (287, 50, 'FUENTE DE ORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (313, 50, 'GRANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 50, 'GUAMAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (325, 50, 'MAPIRIPAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (330, 50, 'MESETAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (350, 50, 'LA MACARENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (370, 50, 'URIBE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 50, 'LEJANIAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (450, 50, 'PUERTO CONCORDIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (568, 50, 'PUERTO GAITAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 50, 'PUERTO LOPEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (577, 50, 'PUERTO LLERAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (590, 50, 'PUERTO RICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (606, 50, 'RESTREPO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (680, 50, 'SAN CARLOS DE GUAROA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (683, 50, 'SAN JUAN DE ARAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 50, 'SAN JUANITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (689, 50, 'SAN MARTIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (711, 50, 'VISTAHERMOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 52, 'PASTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (19, 52, 'ALBAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (22, 52, 'ALDANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (36, 52, 'ANCUYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 52, 'ARBOLEDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (79, 52, 'BARBACOAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (83, 52, 'BELEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 52, 'BUESACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (203, 52, 'COLON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (207, 52, 'CONSACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (210, 52, 'CONTADERO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (215, 52, 'CORDOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (224, 52, 'CUASPUD', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (227, 52, 'CUMBAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (233, 52, 'CUMBITARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (240, 52, 'CHACHAGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 52, 'EL CHARCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (254, 52, 'EL PEÑOL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (256, 52, 'EL ROSARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (258, 52, 'EL TABLON DE GOMEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (260, 52, 'EL TAMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (287, 52, 'FUNES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (317, 52, 'GUACHUCAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (320, 52, 'GUAITARILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (323, 52, 'GUALMATAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (352, 52, 'ILES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (354, 52, 'IMUES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (356, 52, 'IPIALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (378, 52, 'LA CRUZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (381, 52, 'LA FLORIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (385, 52, 'LA LLANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (390, 52, 'LA TOLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (399, 52, 'LA UNION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (405, 52, 'LEIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (411, 52, 'LINARES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 52, 'LOS ANDES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (427, 52, 'MAGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (435, 52, 'MALLAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 52, 'MOSQUERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (480, 52, 'NARIÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (490, 52, 'OLAYA HERRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (506, 52, 'OSPINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 52, 'FRANCISCO PIZARRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (540, 52, 'POLICARPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (560, 52, 'POTOSI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (565, 52, 'PROVIDENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 52, 'PUERRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (585, 52, 'PUPIALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (612, 52, 'RICAURTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (621, 52, 'ROBERTO PAYAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (678, 52, 'SAMANIEGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (683, 52, 'SANDONA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (685, 52, 'SAN BERNARDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (687, 52, 'SAN LORENZO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (693, 52, 'SAN PABLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (694, 52, 'SAN PEDRO DE CARTAGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (696, 52, 'SANTA BARBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (699, 52, 'SANTACRUZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 52, 'SAPUYES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (786, 52, 'TAMINANGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (788, 52, 'TANGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (835, 52, 'SAN ANDRES DE TUMACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (838, 52, 'TUQUERRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 52, 'YACUANQUER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 54, 'CUCUTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (3, 54, 'ABREGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 54, 'ARBOLEDAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (99, 54, 'BOCHALEMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (109, 54, 'BUCARASICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (125, 54, 'CACOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (128, 54, 'CACHIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (172, 54, 'CHINACOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (174, 54, 'CHITAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (206, 54, 'CONVENCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (223, 54, 'CUCUTILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (239, 54, 'DURANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 54, 'EL CARMEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 54, 'EL TARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (261, 54, 'EL ZULIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (313, 54, 'GRAMALOTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (344, 54, 'HACARI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (347, 54, 'HERRAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 54, 'LABATECA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (385, 54, 'LA ESPERANZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (398, 54, 'LA PLAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (405, 54, 'LOS PATIOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 54, 'LOURDES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (480, 54, 'MUTISCUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (498, 54, 'OCAÑA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (518, 54, 'PAMPLONA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 54, 'PAMPLONITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (553, 54, 'PUERTO SANTANDER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (599, 54, 'RAGONVALIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 54, 'SALAZAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 54, 'SAN CALIXTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (673, 54, 'SAN CAYETANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (680, 54, 'SANTIAGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 54, 'SARDINATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (743, 54, 'SILOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (800, 54, 'TEORAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (810, 54, 'TIBU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (820, 54, 'TOLEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (871, 54, 'VILLA CARO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (874, 54, 'VILLA DEL ROSARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 63, 'ARMENIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (111, 63, 'BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (130, 63, 'CALARCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (190, 63, 'CIRCASIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 63, 'CORDOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (272, 63, 'FILANDIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (302, 63, 'GENOVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (401, 63, 'LA TEBAIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (470, 63, 'MONTENEGRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (548, 63, 'PIJAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (594, 63, 'QUIMBAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (690, 63, 'SALENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 66, 'PEREIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (45, 66, 'APIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (75, 66, 'BALBOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (88, 66, 'BELEN DE UMBRIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (170, 66, 'DOSQUEBRADAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 66, 'GUATICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (383, 66, 'LA CELIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 66, 'LA VIRGINIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (440, 66, 'MARSELLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (456, 66, 'MISTRATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (572, 66, 'PUEBLO RICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (594, 66, 'QUINCHIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (682, 66, 'SANTA ROSA DE CABAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (687, 66, 'SANTUARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 68, 'BUCARAMANGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (13, 68, 'AGUADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (20, 68, 'ALBANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 68, 'ARATOCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (77, 68, 'BARBOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (79, 68, 'BARICHARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (81, 68, 'BARRANCABERMEJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (92, 68, 'BETULIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (101, 68, 'BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (121, 68, 'CABRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (132, 68, 'CALIFORNIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (147, 68, 'CAPITANEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (152, 68, 'CARCASI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (160, 68, 'CEPITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (162, 68, 'CERRITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (167, 68, 'CHARALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (169, 68, 'CHARTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (176, 68, 'CHIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (179, 68, 'CHIPATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (190, 68, 'CIMITARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (207, 68, 'CONCEPCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (209, 68, 'CONFINES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (211, 68, 'CONTRATACION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (217, 68, 'COROMORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (229, 68, 'CURITI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (235, 68, 'EL CARMEN DE CHUCURI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 68, 'EL GUACAMAYO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 68, 'EL PEÑON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (255, 68, 'EL PLAYON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (264, 68, 'ENCINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (266, 68, 'ENCISO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (271, 68, 'FLORIAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (276, 68, 'FLORIDABLANCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (296, 68, 'GALAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (298, 68, 'GAMBITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (307, 68, 'GIRON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 68, 'GUACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (320, 68, 'GUADALUPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (322, 68, 'GUAPOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (324, 68, 'GUAVATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (327, 68, 'GUEPSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (344, 68, 'HATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (368, 68, 'JESUS MARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (370, 68, 'JORDAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 68, 'LA BELLEZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (385, 68, 'LANDAZURI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (397, 68, 'LA PAZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (406, 68, 'LEBRIJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 68, 'LOS SANTOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (425, 68, 'MACARAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (432, 68, 'MALAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (444, 68, 'MATANZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (464, 68, 'MOGOTES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (468, 68, 'MOLAGAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (498, 68, 'OCAMONTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (500, 68, 'OIBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (502, 68, 'ONZAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (522, 68, 'PALMAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 68, 'PALMAS DEL SOCORRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (533, 68, 'PARAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (547, 68, 'PIEDECUESTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (549, 68, 'PINCHOTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (572, 68, 'PUENTE NACIONAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 68, 'PUERTO PARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (575, 68, 'PUERTO WILCHES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (615, 68, 'RIONEGRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (655, 68, 'SABANA DE TORRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (669, 68, 'SAN ANDRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (673, 68, 'SAN BENITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (679, 68, 'SAN GIL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (682, 68, 'SAN JOAQUIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (684, 68, 'SAN JOSE DE MIRANDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 68, 'SAN MIGUEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (689, 68, 'SAN VICENTE DE CHUCURI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (705, 68, 'SANTA BARBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 68, 'SANTA HELENA DEL OPON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (745, 68, 'SIMACOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (755, 68, 'SOCORRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 68, 'SUAITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (773, 68, 'SUCRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (780, 68, 'SURATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (820, 68, 'TONA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (855, 68, 'VALLE DE SAN JOSE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (861, 68, 'VELEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (867, 68, 'VETAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (872, 68, 'VILLANUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (895, 68, 'ZAPATOCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 70, 'SINCELEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 70, 'BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (124, 70, 'CAIMITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (204, 70, 'COLOSO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (215, 70, 'COROZAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (221, 70, 'COVEÑAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (230, 70, 'CHALAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (233, 70, 'EL ROBLE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (235, 70, 'GALERAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (265, 70, 'GUARANDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 70, 'LA UNION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 70, 'LOS PALMITOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (429, 70, 'MAJAGUAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 70, 'MORROA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (508, 70, 'OVEJAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (523, 70, 'PALMITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 70, 'SAMPUES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (678, 70, 'SAN BENITO ABAD', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (702, 70, 'SAN JUAN DE BETULIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (708, 70, 'SAN MARCOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (713, 70, 'SAN ONOFRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (717, 70, 'SAN PEDRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (742, 70, 'SAN LUIS DE SINCE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (771, 70, 'SUCRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (820, 70, 'SANTIAGO DE TOLU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (823, 70, 'TOLU VIEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 73, 'IBAGUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (24, 73, 'ALPUJARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (26, 73, 'ALVARADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (30, 73, 'AMBALEMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (43, 73, 'ANZOATEGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (55, 73, 'ARMERO GUAYABAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (67, 73, 'ATACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (124, 73, 'CAJAMARCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (148, 73, 'CARMEN DE APICALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (152, 73, 'CASABIANCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (168, 73, 'CHAPARRAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (200, 73, 'COELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (217, 73, 'COYAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (226, 73, 'CUNDAY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (236, 73, 'DOLORES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (268, 73, 'ESPINAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (270, 73, 'FALAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (275, 73, 'FLANDES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (283, 73, 'FRESNO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (319, 73, 'GUAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (347, 73, 'HERVEO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (349, 73, 'HONDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (352, 73, 'ICONONZO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (408, 73, 'LERIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (411, 73, 'LIBANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (443, 73, 'SAN SEBASTIAN DE MARIQUITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (449, 73, 'MELGAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (461, 73, 'MURILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (483, 73, 'NATAGAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (504, 73, 'ORTEGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 73, 'PALOCABILDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (547, 73, 'PIEDRAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (555, 73, 'PLANADAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (563, 73, 'PRADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (585, 73, 'PURIFICACION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (616, 73, 'RIOBLANCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (622, 73, 'RONCESVALLES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (624, 73, 'ROVIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (671, 73, 'SALDAÑA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (675, 73, 'SAN ANTONIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (678, 73, 'SAN LUIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 73, 'SANTA ISABEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 73, 'SUAREZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (854, 73, 'VALLE DE SAN JUAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (861, 73, 'VENADILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (870, 73, 'VILLAHERMOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 73, 'VILLARRICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 76, 'CALI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (20, 76, 'ALCALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (36, 76, 'ANDALUCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (41, 76, 'ANSERMANUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (54, 76, 'ARGELIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (100, 76, 'BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (109, 76, 'BUENAVENTURA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (111, 76, 'GUADALAJARA DE BUGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (113, 76, 'BUGALAGRANDE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (122, 76, 'CAICEDONIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (126, 76, 'CALIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (130, 76, 'CANDELARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (147, 76, 'CARTAGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (233, 76, 'DAGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (243, 76, 'EL AGUILA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (246, 76, 'EL CAIRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (248, 76, 'EL CERRITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 76, 'EL DOVIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (275, 76, 'FLORIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (306, 76, 'GINEBRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 76, 'GUACARI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (364, 76, 'JAMUNDI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 76, 'LA CUMBRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 76, 'LA UNION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (403, 76, 'LA VICTORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (497, 76, 'OBANDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 76, 'PALMIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (563, 76, 'PRADERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (606, 76, 'RESTREPO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (616, 76, 'RIOFRIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (622, 76, 'ROLDANILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 76, 'SAN PEDRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (736, 76, 'SEVILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (823, 76, 'TORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (828, 76, 'TRUJILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (834, 76, 'TULUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (845, 76, 'ULLOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (863, 76, 'VERSALLES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (869, 76, 'VIJES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (890, 76, 'YOTOCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (892, 76, 'YUMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (895, 76, 'ZARZAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 81, 'ARAUCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (65, 81, 'ARAUQUITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (220, 81, 'CRAVO NORTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 81, 'FORTUL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (591, 81, 'PUERTO RONDON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (736, 81, 'SARAVENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (794, 81, 'TAME', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 85, 'YOPAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (10, 85, 'AGUAZUL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (15, 85, 'CHAMEZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (125, 85, 'HATO COROZAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (136, 85, 'LA SALINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (139, 85, 'MANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (162, 85, 'MONTERREY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (225, 85, 'NUNCHIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (230, 85, 'OROCUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 85, 'PAZ DE ARIPORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (263, 85, 'PORE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (279, 85, 'RECETOR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 85, 'SABANALARGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (315, 85, 'SACAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (325, 85, 'SAN LUIS DE PALENQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 85, 'TAMARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (410, 85, 'TAURAMENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 85, 'TRINIDAD', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (440, 85, 'VILLANUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 86, 'MOCOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (219, 86, 'COLON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (320, 86, 'ORITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (568, 86, 'PUERTO ASIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (569, 86, 'PUERTO CAICEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (571, 86, 'PUERTO GUZMAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 86, 'PUERTO LEGUIZAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (749, 86, 'SIBUNDOY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (755, 86, 'SAN FRANCISCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (757, 86, 'SAN MIGUEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (760, 86, 'SANTIAGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (865, 86, 'VALLE DEL GUAMUEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 86, 'VILLAGARZON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 88, 'SAN ANDRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (564, 88, 'PROVIDENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 91, 'LETICIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (263, 91, 'EL ENCANTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (405, 91, 'LA CHORRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (407, 91, 'LA PEDRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 91, 'LA VICTORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (460, 91, 'MIRITI - PARANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (530, 91, 'PUERTO ALEGRIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (536, 91, 'PUERTO ARICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (540, 91, 'PUERTO NARIÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (669, 91, 'PUERTO SANTANDER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (798, 91, 'TARAPACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 94, 'INIRIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (343, 94, 'BARRANCO MINAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (663, 94, 'MAPIRIPANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (883, 94, 'SAN FELIPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (884, 94, 'PUERTO COLOMBIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 94, 'LA GUADALUPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (886, 94, 'CACAHUAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (887, 94, 'PANA PANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (888, 94, 'MORICHAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 95, 'SAN JOSE DEL GUAVIARE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (15, 95, 'CALAMAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (25, 95, 'EL RETORNO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (200, 95, 'MIRAFLORES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 97, 'MITU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (161, 97, 'CARURU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (511, 97, 'PACOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (666, 97, 'TARAIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (777, 97, 'PAPUNAUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (889, 97, 'YAVARATE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 99, 'LA PRIMAVERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (624, 99, 'SANTA ROSALIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (773, 99, 'CUMARIBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (579, 5, 'Puerto Berrio', 1, 170, '0', NULL, 1);

--
-- Name: num_resol_dtc; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('num_resol_dtc', 24, false);

--
-- Name: num_resol_dtn; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('num_resol_dtn', 101, false);

--
-- Name: num_resol_dtoc; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('num_resol_dtoc', 21, false);

--
-- Name: num_resol_dtor; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('num_resol_dtor', 61, false);

--
-- Name: num_resol_dts; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('num_resol_dts', 61, false);

--
-- Name: num_resol_gral; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('num_resol_gral', 1, false);

--
-- Name: plsql_profiler_runnumeric; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('plsql_profiler_runnumeric', 1, false);

--
-- Name: pres_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('pres_seq', 30392, false);

--
-- Name: sec_bodega_empresas; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_bodega_empresas', 1, false);

--
-- Name: sec_central; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_central', 1, false);

--
-- Name: sec_ciu_ciudadano; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_ciu_ciudadano', 1, false);

--
-- Name: sec_def_contactos; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_def_contactos', 1, false);

--
-- Name: sec_dir_direcciones; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_dir_direcciones', 1, false);

--
-- Name: sec_edificio; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_edificio', 1, false);

--
-- Name: sec_fondo; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_fondo', 1, false);

--
-- Name: sec_inv; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_inv', 1, false);

--
-- Name: sec_oem_empresas; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_oem_empresas', 1, true);

--
-- Name: sec_oem_oempresas; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_oem_oempresas', 1, false);

--
-- Name: sec_planilla; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_planilla', 1, false);

---- Name: sec_planilla_envio; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_planilla_envio', 1, false);

--
-- Name: sec_planilla_tx; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_planilla_tx', 1, false);

--
-- Name: sec_prestamo; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_prestamo', 1, false);

--
-- Name: sec_sgd_hfld_histflujodoc; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sec_sgd_hfld_histflujodoc', 1, false);

--
-- Name: secr_tp1_; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('secr_tp1_', 1, false);


--
-- Name: secr_tp2_; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('secr_tp2_', 1, false);

--
-- Name: secr_tp4_; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('secr_tp4_', 1, false);

--
-- Name: sgd_anar_secue; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sgd_anar_secue', 1, false);

--
-- Data for Name: sgd_apli_aplintegra; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_apli_aplintegra VALUES (0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Data for Name: sgd_carp_descripcion; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_carp_descripcion VALUES ('900', 1, 'Oficio');

--
-- Data for Name: sgd_ciu_ciudadano; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_ciu_ciudadano VALUES (NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 170);

--
-- Name: sgd_ciu_secue; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sgd_ciu_secue', 1, false);

--
-- Data for Name: sgd_cob_campobliga; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_cob_campobliga VALUES (1, 'PAIS_NOMBRE', 'PAIS_NOMBRE', 2);
INSERT INTO sgd_cob_campobliga VALUES (2, 'NOMBRE', 'NOMBRE', 1);
INSERT INTO sgd_cob_campobliga VALUES (3, 'MUNI_NOMBRE', 'MUNI_NOMBRE', 1);
INSERT INTO sgd_cob_campobliga VALUES (4, 'DEPTO_NOMBRE', 'DEPTO_NOMBRE', 1);
INSERT INTO sgd_cob_campobliga VALUES (5, 'F_RAD_S', 'F_RAD_S', 1);
INSERT INTO sgd_cob_campobliga VALUES (6, 'TIPO', 'TIPO', 2);
INSERT INTO sgd_cob_campobliga VALUES (7, 'NOMBRE', 'NOMBRE', 2);
INSERT INTO sgd_cob_campobliga VALUES (8, 'MUNI_NOMBRE', 'MUNI_NOMBRE', 2);
INSERT INTO sgd_cob_campobliga VALUES (9, 'DEPTO_NOMBRE', 'DEPTO_NOMBRE', 2);
INSERT INTO sgd_cob_campobliga VALUES (10, 'DIR', 'DIR', 2);

--
-- Data for Name: sgd_def_continentes; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_def_continentes VALUES (1, 'AMERICA');
INSERT INTO sgd_def_continentes VALUES (2, 'EUROPA');
INSERT INTO sgd_def_continentes VALUES (3, 'ASIA');
INSERT INTO sgd_def_continentes VALUES (4, 'AFRICA');
INSERT INTO sgd_def_continentes VALUES (5, 'OCEANIA');
INSERT INTO sgd_def_continentes VALUES (6, 'ANTARTIDA');

--
-- Data for Name: sgd_def_paises; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_def_paises VALUES (170, 1, 'COLOMBIA');
INSERT INTO sgd_def_paises VALUES (862, 1, 'VENEZUELA');
INSERT INTO sgd_def_paises VALUES (1, 1, 'MEXICO');
INSERT INTO sgd_def_paises VALUES (214, 1, 'REPUBLICA DOMINICANA');
INSERT INTO sgd_def_paises VALUES (32, 1, 'ARGENTINA');
INSERT INTO sgd_def_paises VALUES (591, 1, 'PANAMA');
INSERT INTO sgd_def_paises VALUES (249, 1, 'ESTADOS UNIDOS');
INSERT INTO sgd_def_paises VALUES (276, 2, 'ALEMANIA');
INSERT INTO sgd_def_paises VALUES (55, 1, 'BRASIL');
INSERT INTO sgd_def_paises VALUES (244, 4, 'ANGOLA');
INSERT INTO sgd_def_paises VALUES (724, 2, 'ESPAÑA');
INSERT INTO sgd_def_paises VALUES (767, 2, 'SUIZA');
INSERT INTO sgd_def_paises VALUES (604, 1, 'PERU');

--
-- Data for Name: sgd_deve_dev_envio; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_deve_dev_envio VALUES (1, 'CASA DESOCUPADA');
INSERT INTO sgd_deve_dev_envio VALUES (5, 'DEVUELTO DE PORTERIA');
INSERT INTO sgd_deve_dev_envio VALUES (6, 'DIRECCION DEFICIENTE');
INSERT INTO sgd_deve_dev_envio VALUES (7, 'FALLECIDO');
INSERT INTO sgd_deve_dev_envio VALUES (8, 'NO EXISTE NUMERO');
INSERT INTO sgd_deve_dev_envio VALUES (9, 'NO RESIDE');
INSERT INTO sgd_deve_dev_envio VALUES (10, 'NO RECLAMADO');
INSERT INTO sgd_deve_dev_envio VALUES (13, 'NO EXISTE EMPRESA');
INSERT INTO sgd_deve_dev_envio VALUES (14, 'ZONA DE ALTO RIESGO');
INSERT INTO sgd_deve_dev_envio VALUES (15, 'SOBRE DESOCUPADO');
INSERT INTO sgd_deve_dev_envio VALUES (16, 'FUERA PERIMETRO URBANO');
INSERT INTO sgd_deve_dev_envio VALUES (17, 'ENVIADO A ADPOSTAL, CONTROL DE CALIDAD');
INSERT INTO sgd_deve_dev_envio VALUES (18, 'SIN SELLO');
INSERT INTO sgd_deve_dev_envio VALUES (90, 'DOCUMENTO MAL RADICADO');
INSERT INTO sgd_deve_dev_envio VALUES (99, 'SOBREPASO TIEMPO DE ESPERA');
INSERT INTO sgd_deve_dev_envio VALUES (12, 'SE TRASLADO');
INSERT INTO sgd_deve_dev_envio VALUES (3, 'CERRADO');
INSERT INTO sgd_deve_dev_envio VALUES (2, 'CAMBIO DE DOMICILIO USUARIO');

--
-- Data for Name: sgd_dir_drecciones; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_dir_drecciones VALUES (0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170, 1);

--
-- Name: sgd_dir_secue; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sgd_dir_secue', 1, false);
--
-- Data for Name: sgd_eanu_estanulacion; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_eanu_estanulacion VALUES ('RADICADO EN SOLICITUD DE ANULACION', 1);
INSERT INTO sgd_eanu_estanulacion VALUES ('RADICADO ANULADO', 2);
INSERT INTO sgd_eanu_estanulacion VALUES ('RADICADO EN SOLICITUD DE REVIVIR', 3);
INSERT INTO sgd_eanu_estanulacion VALUES ('RADICADO IMPOSIBLE DE ANULAR', 9);
--
-- Data for Name: sgd_enve_envioespecial; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_enve_envioespecial VALUES (109, '1200', '1200', 'Valor descuento automático');
INSERT INTO sgd_enve_envioespecial VALUES (109, '160', '160', 'Valor alistamiento');
INSERT INTO sgd_enve_envioespecial VALUES (109, '1300', '3300', 'Valor cert. acuse de recibido');
--
-- Data for Name: sgd_fexp_flujoexpedientes; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_fexp_flujoexpedientes VALUES (0, 0, 0, 0, '', '');
--
-- Name: sgd_hmtd_secue; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sgd_hmtd_secue', 1, false);

--
-- Name: sgd_info_secue; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sgd_info_secue', 1, false);
--
-- Name: sgd_mat_secue; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sgd_mat_secue', 1, false);
--
-- Data for Name: sgd_noh_nohabiles; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_noh_nohabiles VALUES ('2017-01-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-01-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-01-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-01-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-01-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-01-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-02-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-02-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-02-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-02-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-03-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-03-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-03-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-03-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-03-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-04-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-04-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-04-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-04-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-04-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-04-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-04-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-05-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-05-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-05-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-05-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-05-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-05-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-06-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-06-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-06-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-06-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-06-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-06-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-07-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-07-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-07-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-07-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-07-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-07-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-07-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-08-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-08-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-08-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-08-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-08-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-08-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-09-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-09-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-09-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-09-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-10-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-10-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-10-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-10-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-10-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-11-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-11-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-11-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-11-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-11-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-12-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-12-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-12-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-12-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-12-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-12-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2017-12-31');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-01-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-01-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-01-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-01-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-01-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-01-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-02-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-02-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-02-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-02-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-03-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-03-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-03-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-03-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-03-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-03-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-03-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-04-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-04-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-04-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-04-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-04-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-05-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-05-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-05-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-05-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-05-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-05-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-06-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-06-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-06-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-06-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-06-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-06-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-07-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-07-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-07-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-07-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-07-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-07-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-07-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-08-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-08-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-08-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-08-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-08-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-08-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-09-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-09-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-09-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-09-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-09-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-10-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-10-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-10-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-10-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-10-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-11-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-11-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-11-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-11-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-11-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-11-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-12-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-12-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-12-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-12-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-12-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-12-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2018-12-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-01-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-01-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-01-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-01-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-01-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-01-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-02-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-02-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-02-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-02-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-03-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-03-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-03-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-03-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-03-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-03-31');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-04-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-04-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-04-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-04-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-04-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-04-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-05-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-05-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-05-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-05-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-06-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-06-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-06-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-06-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-06-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-06-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-06-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-07-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-07-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-07-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-07-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-07-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-07-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-08-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-08-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-08-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-08-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-08-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-08-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-09-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-09-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-09-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-09-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-09-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-10-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-10-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-10-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-10-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-10-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-11-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-11-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-11-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-11-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-11-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-11-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-12-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-12-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-12-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-12-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-12-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2019-12-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-01-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-01-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-01-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-01-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-01-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-01-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-02-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-02-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-02-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-02-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-03-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-03-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-03-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-03-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-03-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-03-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-04-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-04-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-04-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-04-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-04-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-04-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-05-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-05-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-05-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-05-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-05-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-05-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-05-31');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-06-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-06-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-06-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-06-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-06-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-06-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-06-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-07-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-07-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-07-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-07-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-07-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-08-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-08-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-08-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-08-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-08-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-08-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-08-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-09-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-09-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-09-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-09-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-10-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-10-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-10-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-10-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-10-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-11-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-11-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-11-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-11-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-11-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-11-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-11-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-12-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-12-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-12-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-12-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-12-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2020-12-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-01-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-01-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-01-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-01-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-01-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-01-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-01-31');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-02-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-02-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-02-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-02-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-03-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-03-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-03-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-03-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-03-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-04-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-04-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-04-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-04-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-04-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-04-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-05-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-05-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-05-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-05-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-05-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-05-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-05-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-06-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-06-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-06-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-06-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-06-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-06-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-07-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-07-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-07-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-07-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-07-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-07-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-08-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-08-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-08-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-08-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-08-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-08-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-08-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-09-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-09-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-09-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-09-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-10-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-10-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-10-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-10-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-10-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-10-31');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-11-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-11-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-11-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-11-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-11-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-11-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-12-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-12-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-12-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-12-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-12-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2021-12-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-01-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-01-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-01-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-01-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-01-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-01-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-01-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-02-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-02-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-02-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-02-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-03-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-03-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-03-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-03-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-03-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-04-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-04-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-04-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-04-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-04-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-04-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-05-01');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-05-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-05-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-05-22');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-05-29');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-05-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-06-05');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-06-12');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-06-19');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-06-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-06-26');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-06-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-07-03');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-07-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-07-10');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-07-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-07-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-07-24');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-07-31');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-08-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-08-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-08-15');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-08-21');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-08-28');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-09-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-09-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-09-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-09-25');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-10-02');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-10-09');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-10-16');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-10-17');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-10-23');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-10-30');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-11-06');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-11-07');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-11-13');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-11-14');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-11-20');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-11-27');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-12-04');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-12-08');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-12-11');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-12-18');
INSERT INTO sgd_noh_nohabiles VALUES ('2022-12-25');

--
-- Data for Name: sgd_not_notificacion; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_not_notificacion VALUES (1, 'PERSONAL');
INSERT INTO sgd_not_notificacion VALUES (2, 'TELEFONICA');
--
-- Data for Name: sgd_oem_oempresas; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_oem_oempresas VALUES (0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 170, NULL);

--
-- Name: sgd_oem_secue; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sgd_oem_secue', 18398, false);
--
-- Data for Name: sgd_parametro; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_parametro VALUES ('PRESTAMO_ESTADO', 5, 'Prestamo indefinido');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_REQUERIMIENTO', 1, 'Documento');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_REQUERIMIENTO', 2, 'Anexo');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_REQUERIMIENTO', 3, 'Anexo y Documento');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_DIAS_PREST', 1, '8');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_DIAS_CANC', 1, '2');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_PASW', 1, '1');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_ESTADO', 4, 'Cancelado');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_ESTADO', 3, 'Devuelto');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_ESTADO', 2, 'Prestado');
INSERT INTO sgd_parametro VALUES ('PRESTAMO_ESTADO', 1, 'Solicitado');

--
-- Data for Name: sgd_parexp_paramexpediente; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_parexp_paramexpediente VALUES (1, '0998', '', 'Nombre de Carpeta', 1, 1);
INSERT INTO sgd_parexp_paramexpediente VALUES (2, '0999', '', 'Nombre de Carpeta', 1, 1);
--
-- Data for Name: sgd_pexp_procexpedientes; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_pexp_procexpedientes VALUES (0, NULL, 0, NULL, NULL, 1, 0);

--
-- Name: sgd_plg_secue; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sgd_plg_secue', 1, false);
--
-- Data for Name: sgd_tidm_tidocmasiva; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_tidm_tidocmasiva VALUES (1, 'PLANTILLA');
INSERT INTO sgd_tidm_tidocmasiva VALUES (2, 'CSV');

--
-- Data for Name: sgd_tip3_tipotercero; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_tip3_tipotercero VALUES (1, 1, 'REMITENTE', 'REMITENTE', 'tip3remitente.jpg', 0, 1, 1);
INSERT INTO sgd_tip3_tipotercero VALUES (2, 1, 'DESTINATARIO', 'DESTINATARIO', 'tip3destina.jpg', 1, 0, 0);
INSERT INTO sgd_tip3_tipotercero VALUES (3, 2, 'EMPRESAS', 'EMPRESAS', 'tip3predio.jpg', 1, 1, 1);
INSERT INTO sgd_tip3_tipotercero VALUES (4, 3, 'ENTIDADES', 'ENTIDADES ESTATALES', 'tip3ent.jpg', 1, 1, 1);
--
-- Data for Name: sgd_tpr_tpdcumento; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_tpr_tpdcumento VALUES (0, 'No Definido', 0, 1, ' ', '1', 1, 1, 1, 0, 1, NULL, 1);

--
-- Data for Name: sgd_trad_tiporad; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_trad_tiporad VALUES (1, 'Salida', NULL, 1, NULL);
INSERT INTO sgd_trad_tiporad VALUES (2, 'Entrada', NULL, 1, NULL);
INSERT INTO sgd_trad_tiporad VALUES (4, 'PQRs', NULL, 1, NULL);

--
-- Data for Name: sgd_ttr_transaccion; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_ttr_transaccion VALUES (40, 'Firma Digital de Documento');
INSERT INTO sgd_ttr_transaccion VALUES (41, 'Eliminacion solicitud de Firma Digital');
INSERT INTO sgd_ttr_transaccion VALUES (50, 'Cambio de Estado Expediente');
INSERT INTO sgd_ttr_transaccion VALUES (51, 'Creacion Expediente');
INSERT INTO sgd_ttr_transaccion VALUES (1, 'Recuperacion Radicado');
INSERT INTO sgd_ttr_transaccion VALUES (9, 'Reasignacion');
INSERT INTO sgd_ttr_transaccion VALUES (8, 'Informar');
INSERT INTO sgd_ttr_transaccion VALUES (19, 'Cambiar Tipo de Documento');
INSERT INTO sgd_ttr_transaccion VALUES (20, 'Crear Registro');
INSERT INTO sgd_ttr_transaccion VALUES (21, 'Editar Registro');
INSERT INTO sgd_ttr_transaccion VALUES (10, 'Movimiento entre Carpetas');
INSERT INTO sgd_ttr_transaccion VALUES (11, 'Modificacion Radicado');
INSERT INTO sgd_ttr_transaccion VALUES (7, 'Borrar Informado');
INSERT INTO sgd_ttr_transaccion VALUES (12, 'Devuelto-Reasignar');
INSERT INTO sgd_ttr_transaccion VALUES (13, 'Archivar');
INSERT INTO sgd_ttr_transaccion VALUES (14, 'Agendar');
INSERT INTO sgd_ttr_transaccion VALUES (15, 'Sacar de la agenda');
INSERT INTO sgd_ttr_transaccion VALUES (0, '--');
INSERT INTO sgd_ttr_transaccion VALUES (16, 'Reasignar para Vo.Bo.');
INSERT INTO sgd_ttr_transaccion VALUES (2, 'Radicacion');
INSERT INTO sgd_ttr_transaccion VALUES (22, 'Digitalizacion de Radicado');
INSERT INTO sgd_ttr_transaccion VALUES (23, 'Digitalizacion - Modificacion');
INSERT INTO sgd_ttr_transaccion VALUES (24, 'Asociacion Imagen fax');
INSERT INTO sgd_ttr_transaccion VALUES (30, 'Radicacion Masiva');
INSERT INTO sgd_ttr_transaccion VALUES (17, 'Modificacion de Causal');
INSERT INTO sgd_ttr_transaccion VALUES (18, 'Modificacion del Sector');
INSERT INTO sgd_ttr_transaccion VALUES (25, 'Solicitud de Anulacion');
INSERT INTO sgd_ttr_transaccion VALUES (26, 'Anulacion Rad');
INSERT INTO sgd_ttr_transaccion VALUES (27, 'Rechazo de Anulacion');
INSERT INTO sgd_ttr_transaccion VALUES (37, 'Cambio de Estado del Documento');
INSERT INTO sgd_ttr_transaccion VALUES (28, 'Devolucion de correo');
INSERT INTO sgd_ttr_transaccion VALUES (29, 'Digitalizacion de Anexo');
INSERT INTO sgd_ttr_transaccion VALUES (31, 'Borrado de Anexo a radicado');
INSERT INTO sgd_ttr_transaccion VALUES (32, 'Asignacion TRD');
INSERT INTO sgd_ttr_transaccion VALUES (33, 'Eliminar TRD');
INSERT INTO sgd_ttr_transaccion VALUES (35, 'Tipificacion de la decision');
INSERT INTO sgd_ttr_transaccion VALUES (36, 'Cambio en la Notificacion');
INSERT INTO sgd_ttr_transaccion VALUES (38, 'Cambio Vinculacion Documento');
INSERT INTO sgd_ttr_transaccion VALUES (39, 'Solicitud de Firma');
INSERT INTO sgd_ttr_transaccion VALUES (42, 'Digitalizacion Radicado(Asoc. Imagen Web)');
INSERT INTO sgd_ttr_transaccion VALUES (52, 'Excluir radicado de expediente');
INSERT INTO sgd_ttr_transaccion VALUES (53, 'Incluir radicado en expediente');
INSERT INTO sgd_ttr_transaccion VALUES (54, 'Cambio Seguridad del Documento');
INSERT INTO sgd_ttr_transaccion VALUES (57, 'Ingreso al Archivo Fisico');
INSERT INTO sgd_ttr_transaccion VALUES (55, 'Creación Subexpediente');
INSERT INTO sgd_ttr_transaccion VALUES (56, 'Cambio de Responsable');
INSERT INTO sgd_ttr_transaccion VALUES (58, 'Expediente Cerrado');
INSERT INTO sgd_ttr_transaccion VALUES (59, 'Expediente Reabierto');
INSERT INTO sgd_ttr_transaccion VALUES (61, 'Asignar TRD Multiple');
INSERT INTO sgd_ttr_transaccion VALUES (62, 'Insercion Expediente Multiple');
INSERT INTO sgd_ttr_transaccion VALUES (65, 'Archivado NRR');

--
-- Name: sgd_tvd_depe_id; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sgd_tvd_depe_id', 0, false);
--
-- Data for Name: sgd_usm_usumodifica; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO sgd_usm_usumodifica VALUES (47, 'Quito permiso impresion');
INSERT INTO sgd_usm_usumodifica VALUES (43, 'Otorgo permiso prestamo de documentos');
INSERT INTO sgd_usm_usumodifica VALUES (44, 'Quito permiso prestamo de documentos');
INSERT INTO sgd_usm_usumodifica VALUES (45, 'Otorgo permiso digitalizacion de documentos');
INSERT INTO sgd_usm_usumodifica VALUES (46, 'Quito permiso digitalizacion de documentos');
INSERT INTO sgd_usm_usumodifica VALUES (48, 'Otorgo permiso modificaciones');
INSERT INTO sgd_usm_usumodifica VALUES (49, 'Quito permiso modificaciones');
INSERT INTO sgd_usm_usumodifica VALUES (50, 'Cambio de perfil');
INSERT INTO sgd_usm_usumodifica VALUES (1, 'Creacion de usuario');
INSERT INTO sgd_usm_usumodifica VALUES (51, 'Otorgo permiso tablas retencion documental');
INSERT INTO sgd_usm_usumodifica VALUES (52, 'Quito permiso tablas retencion documental');
INSERT INTO sgd_usm_usumodifica VALUES (3, 'Cambio dependencia');
INSERT INTO sgd_usm_usumodifica VALUES (4, 'Cambio cedula');
INSERT INTO sgd_usm_usumodifica VALUES (5, 'Cambio nombre');
INSERT INTO sgd_usm_usumodifica VALUES (7, 'Cambio ubicacion');
INSERT INTO sgd_usm_usumodifica VALUES (8, 'Cambio piso');
INSERT INTO sgd_usm_usumodifica VALUES (9, 'Cambio estado');
INSERT INTO sgd_usm_usumodifica VALUES (10, 'Otorgo permiso radicacion entrada');
INSERT INTO sgd_usm_usumodifica VALUES (11, 'Otorgo permisos radicacion de entrada');
INSERT INTO sgd_usm_usumodifica VALUES (12, 'Quito permiso administracion sistema');
INSERT INTO sgd_usm_usumodifica VALUES (13, 'Otorgo permiso administracion sistema');
INSERT INTO sgd_usm_usumodifica VALUES (14, 'Quito permiso administracion archivo');
INSERT INTO sgd_usm_usumodifica VALUES (15, 'Otorgo permiso administracion archivo');
INSERT INTO sgd_usm_usumodifica VALUES (16, 'Habilitado como usuario nuevo');
INSERT INTO sgd_usm_usumodifica VALUES (17, 'Habilitado como usuario antiguo con clave');
INSERT INTO sgd_usm_usumodifica VALUES (18, 'Cambio nivel');
INSERT INTO sgd_usm_usumodifica VALUES (19, 'Otorgo permiso radicacion salida');
INSERT INTO sgd_usm_usumodifica VALUES (20, 'Otorgo permiso impresion');
INSERT INTO sgd_usm_usumodifica VALUES (21, 'Otorgo permiso radicacion masiva');
INSERT INTO sgd_usm_usumodifica VALUES (22, 'Quito permiso radicacion masiva');
INSERT INTO sgd_usm_usumodifica VALUES (23, 'Quito permiso devoluciones de correo');
INSERT INTO sgd_usm_usumodifica VALUES (24, 'Otorgo permiso devoluciones de correo');
INSERT INTO sgd_usm_usumodifica VALUES (25, 'Otorgo permiso de solicitud de anulacion');
INSERT INTO sgd_usm_usumodifica VALUES (26, 'Otorgo permiso de anulacion');
INSERT INTO sgd_usm_usumodifica VALUES (27, 'Otorgo permiso de solicitud de anulacion y anulacion');
INSERT INTO sgd_usm_usumodifica VALUES (28, 'Quito permiso radicacion memorandos');
INSERT INTO sgd_usm_usumodifica VALUES (29, 'Otorgo permiso radicacion memorandos');
INSERT INTO sgd_usm_usumodifica VALUES (30, 'Quito permiso radicacion resoluciones');
INSERT INTO sgd_usm_usumodifica VALUES (31, 'Otorgo permiso radicacion resoluciones');
INSERT INTO sgd_usm_usumodifica VALUES (33, 'Quito permiso envio de correo');
INSERT INTO sgd_usm_usumodifica VALUES (34, 'Otorgo permiso envio de correo');
INSERT INTO sgd_usm_usumodifica VALUES (35, 'Otorgo permiso radicacion de salida ');
INSERT INTO sgd_usm_usumodifica VALUES (39, 'Cambio extension');
INSERT INTO sgd_usm_usumodifica VALUES (40, 'Cambio email');
INSERT INTO sgd_usm_usumodifica VALUES (41, 'Quito permisos radicacion entrada');
INSERT INTO sgd_usm_usumodifica VALUES (42, 'Quito permisos de solicitud de anulacion y anulaciones');

--
-- Data for Name: tipo_doc_identificacion; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO tipo_doc_identificacion VALUES (0, 'Cedula de Ciudadania');
INSERT INTO tipo_doc_identificacion VALUES (1, 'Tarjeta de Identidad');
INSERT INTO tipo_doc_identificacion VALUES (2, 'Cedula de Extranjería');
INSERT INTO tipo_doc_identificacion VALUES (3, 'Pasaporte');
INSERT INTO tipo_doc_identificacion VALUES (4, 'Nit');
INSERT INTO tipo_doc_identificacion VALUES (5, 'NUIR');

--
-- Data for Name: tipo_remitente; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO tipo_remitente VALUES (0, 'Entidades');
INSERT INTO tipo_remitente VALUES (1, 'Otras empresas');
INSERT INTO tipo_remitente VALUES (2, 'Persona natural');
INSERT INTO tipo_remitente VALUES (3, 'Predio');
INSERT INTO tipo_remitente VALUES (5, 'Otros');
INSERT INTO tipo_remitente VALUES (6, 'Funcionario');
--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO usuario VALUES (1, '0999', 'DSALIDA', '2011-09-09', '123', '1', 'Usuario de Salida', '0', '0', '0', '12345678909', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, 0, NULL, 170, 1, 0, '1', '1', NULL, NULL, 0, 0, NULL, 0, 0, 0);
INSERT INTO usuario VALUES (1, '0998', 'ADMON', '2017-09-09', '1232f297a57a5a743894a0e4a8', '1', 'Usuario Administrador', '1', '1', '1', '1234567890', 5, '170921085338o1921688113ADMON', NULL, NULL, NULL, 'pruebas@skinatech.com', NULL, NULL, NULL, 4, 0, 1, NULL, NULL, 1, 1, 3, 3, 1, 1, 2, NULL, NULL, NULL, 2, NULL, 1, 1, 0, 1, 0, 1, 1, 2, NULL, 170, 1, 0, '1', '1', 1, 1, 1, 0, NULL, 0, 0, 3);

--
-- Data for Name: perfiles; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO perfiles VALUES (1, 'Directivo', '0', '0', '0', '1', 1, 0, 0, 0, 0, '0', 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '1', 0, 0, 0, 0, 1, 0, 0);
INSERT INTO perfiles VALUES (2, 'Asistente', '0', '0', '0', '1', 1, 2, 0, 0, 0, '0', 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '1', 0, 0, 0, 1, 1, 0, 0);
INSERT INTO perfiles VALUES (3, 'Jefe', '0', '0', '0', '1', 1, 2, 0, 0, 0, '0', 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '1', 0, 0, 0, 1, 1, 0, 0);
INSERT INTO perfiles VALUES (4, 'Funcionario', '0', '0', '0', '1', 1, 2, 0, 0, 0, '0', 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '1', 0, 0, 0, 1, 1, 0, 0);
INSERT INTO perfiles VALUES (5, 'Ventanilla', '0', '0', '0', '1', 1, 2, 0, 0, 0, '0', 0, 3, 3, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '1', 0, 0, 0, 1, 1, 0, 0);
INSERT INTO perfiles VALUES (6, 'Admin de sistema', '0', '0', '1', '1', 1, 2, 0, 0, 0, '0', 0, 3, 3, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '1', 0, 0, 0, 1, 1, 0, 0);
INSERT INTO perfiles VALUES (7, 'Admin de gestion documental', '0', '0', '0', '1', 1, 2, 0, 0, 0, '0', 0, 3, 3, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '1', 0, 0, 0, 1, 1, 0, 0);

--
-- Name: ID; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY sgd_arch_depe
    ADD CONSTRAINT "ID" PRIMARY KEY (sgd_arch_id);

--
-- Name: PK_SGD_TTR_TRANSACCION; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY sgd_ttr_transaccion
    ADD CONSTRAINT "PK_SGD_TTR_TRANSACCION" PRIMARY KEY (sgd_ttr_codigo);

--
-- Name: SGD_TRAD_TIPORAD_CODIGO_INX; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY sgd_trad_tiporad
    ADD CONSTRAINT "SGD_TRAD_TIPORAD_CODIGO_INX" PRIMARY KEY (sgd_trad_codigo);

--
-- Name: bodega_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY bodega_empresas
    ADD CONSTRAINT bodega_empresas_pkey PRIMARY KEY (identificador_empresa);

--
-- Name: pk_radicados; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY radicado
    ADD CONSTRAINT pk_radicados PRIMARY KEY (radi_nume_radi);

--
-- Name: sede_codi; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY sgd_sed_sede
    ADD CONSTRAINT sede_codi UNIQUE (sgd_sed_codi);

--
-- Name: sgd_archivo_central2_pk; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY sgd_archivo_central
    ADD CONSTRAINT sgd_archivo_central2_pk PRIMARY KEY (sgd_archivo_id);

--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;

--
-- Name: concat(text, text); Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON FUNCTION concat(text, text) FROM PUBLIC;
REVOKE ALL ON FUNCTION concat(text, text) FROM admin;
GRANT ALL ON FUNCTION concat(text, text) TO admin;
GRANT ALL ON FUNCTION concat(text, text) TO postgres;
GRANT ALL ON FUNCTION concat(text, text) TO PUBLIC;
--
-- Name: usuario; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE usuario FROM PUBLIC;
REVOKE ALL ON TABLE usuario FROM admin;
GRANT ALL ON TABLE usuario TO admin;
GRANT ALL ON TABLE usuario TO postgres;
GRANT ALL ON TABLE usuario TO PUBLIC;
--
-- Name: anexos; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE anexos FROM PUBLIC;
REVOKE ALL ON TABLE anexos FROM admin;
GRANT ALL ON TABLE anexos TO admin;
GRANT ALL ON TABLE anexos TO postgres;
GRANT ALL ON TABLE anexos TO PUBLIC;
--
-- Name: anexos_historico; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE anexos_historico FROM PUBLIC;
REVOKE ALL ON TABLE anexos_historico FROM admin;
GRANT ALL ON TABLE anexos_historico TO admin;
GRANT ALL ON TABLE anexos_historico TO postgres;
GRANT ALL ON TABLE anexos_historico TO PUBLIC;
--
-- Name: anexos_tipo; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE anexos_tipo FROM PUBLIC;
REVOKE ALL ON TABLE anexos_tipo FROM admin;
GRANT ALL ON TABLE anexos_tipo TO admin;
GRANT ALL ON TABLE anexos_tipo TO postgres;
GRANT ALL ON TABLE anexos_tipo TO PUBLIC;
--
-- Name: aux_01; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE aux_01 FROM PUBLIC;
REVOKE ALL ON TABLE aux_01 FROM admin;
GRANT ALL ON TABLE aux_01 TO admin;
GRANT ALL ON TABLE aux_01 TO postgres;
GRANT ALL ON TABLE aux_01 TO PUBLIC;
--
-- Name: bodega_empresas; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE bodega_empresas FROM PUBLIC;
REVOKE ALL ON TABLE bodega_empresas FROM admin;
GRANT ALL ON TABLE bodega_empresas TO admin;
GRANT ALL ON TABLE bodega_empresas TO postgres;
GRANT ALL ON TABLE bodega_empresas TO PUBLIC;
--
-- Name: borrar_carpeta_personalizada; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE borrar_carpeta_personalizada FROM PUBLIC;
REVOKE ALL ON TABLE borrar_carpeta_personalizada FROM admin;
GRANT ALL ON TABLE borrar_carpeta_personalizada TO admin;
GRANT ALL ON TABLE borrar_carpeta_personalizada TO postgres;
GRANT ALL ON TABLE borrar_carpeta_personalizada TO PUBLIC;
--
-- Name: borrar_empresa_esp; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE borrar_empresa_esp FROM PUBLIC;
REVOKE ALL ON TABLE borrar_empresa_esp FROM admin;
GRANT ALL ON TABLE borrar_empresa_esp TO admin;
GRANT ALL ON TABLE borrar_empresa_esp TO postgres;
GRANT ALL ON TABLE borrar_empresa_esp TO PUBLIC;
--
-- Name: carpeta; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE carpeta FROM PUBLIC;
REVOKE ALL ON TABLE carpeta FROM admin;
GRANT ALL ON TABLE carpeta TO admin;
GRANT ALL ON TABLE carpeta TO postgres;
GRANT ALL ON TABLE carpeta TO PUBLIC;
--
-- Name: carpeta_per; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE carpeta_per FROM PUBLIC;
REVOKE ALL ON TABLE carpeta_per FROM admin;
GRANT ALL ON TABLE carpeta_per TO admin;
GRANT ALL ON TABLE carpeta_per TO postgres;
GRANT ALL ON TABLE carpeta_per TO PUBLIC;
--
-- Name: centro_poblado; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE centro_poblado FROM PUBLIC;
REVOKE ALL ON TABLE centro_poblado FROM admin;
GRANT ALL ON TABLE centro_poblado TO admin;
GRANT ALL ON TABLE centro_poblado TO postgres;
GRANT ALL ON TABLE centro_poblado TO PUBLIC;
--
-- Name: departamento; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE departamento FROM PUBLIC;
REVOKE ALL ON TABLE departamento FROM admin;
GRANT ALL ON TABLE departamento TO admin;
GRANT ALL ON TABLE departamento TO postgres;
GRANT ALL ON TABLE departamento TO PUBLIC;
--
-- Name: dependencia; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE dependencia FROM PUBLIC;
REVOKE ALL ON TABLE dependencia FROM admin;
GRANT ALL ON TABLE dependencia TO admin;
GRANT ALL ON TABLE dependencia TO postgres;
GRANT ALL ON TABLE dependencia TO PUBLIC;
--
-- Name: dependencia_visibilidad; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE dependencia_visibilidad FROM PUBLIC;
REVOKE ALL ON TABLE dependencia_visibilidad FROM admin;
GRANT ALL ON TABLE dependencia_visibilidad TO admin;
GRANT ALL ON TABLE dependencia_visibilidad TO postgres;
GRANT ALL ON TABLE dependencia_visibilidad TO PUBLIC;
--
-- Name: dup_eliminar; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE dup_eliminar FROM PUBLIC;
REVOKE ALL ON TABLE dup_eliminar FROM admin;
GRANT ALL ON TABLE dup_eliminar TO admin;
GRANT ALL ON TABLE dup_eliminar TO postgres;
GRANT ALL ON TABLE dup_eliminar TO PUBLIC;
--
-- Name: emp_cod_actualizar; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE emp_cod_actualizar FROM PUBLIC;
REVOKE ALL ON TABLE emp_cod_actualizar FROM admin;
GRANT ALL ON TABLE emp_cod_actualizar TO admin;
GRANT ALL ON TABLE emp_cod_actualizar TO postgres;
GRANT ALL ON TABLE emp_cod_actualizar TO PUBLIC;
--
-- Name: empresas_temporal; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE empresas_temporal FROM PUBLIC;
REVOKE ALL ON TABLE empresas_temporal FROM admin;
GRANT ALL ON TABLE empresas_temporal TO admin;
GRANT ALL ON TABLE empresas_temporal TO postgres;
GRANT ALL ON TABLE empresas_temporal TO PUBLIC;
--
-- Name: estado; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE estado FROM PUBLIC;
REVOKE ALL ON TABLE estado FROM admin;
GRANT ALL ON TABLE estado TO admin;
GRANT ALL ON TABLE estado TO postgres;
GRANT ALL ON TABLE estado TO PUBLIC;
--
-- Name: fun_funcionario; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE fun_funcionario FROM PUBLIC;
REVOKE ALL ON TABLE fun_funcionario FROM admin;
GRANT ALL ON TABLE fun_funcionario TO admin;
GRANT ALL ON TABLE fun_funcionario TO postgres;
GRANT ALL ON TABLE fun_funcionario TO PUBLIC;
--
-- Name: hist_eventos; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE hist_eventos FROM PUBLIC;
REVOKE ALL ON TABLE hist_eventos FROM admin;
GRANT ALL ON TABLE hist_eventos TO admin;
GRANT ALL ON TABLE hist_eventos TO postgres;
GRANT ALL ON TABLE hist_eventos TO PUBLIC;

--
-- Name: informados; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE informados FROM PUBLIC;
REVOKE ALL ON TABLE informados FROM admin;
GRANT ALL ON TABLE informados TO admin;
GRANT ALL ON TABLE informados TO postgres;
GRANT ALL ON TABLE informados TO PUBLIC;
--
-- Name: medio_recepcion; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE medio_recepcion FROM PUBLIC;
REVOKE ALL ON TABLE medio_recepcion FROM admin;
GRANT ALL ON TABLE medio_recepcion TO admin;
GRANT ALL ON TABLE medio_recepcion TO postgres;
GRANT ALL ON TABLE medio_recepcion TO PUBLIC;

--
-- Name: municipio; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE municipio FROM PUBLIC;
REVOKE ALL ON TABLE municipio FROM admin;
GRANT ALL ON TABLE municipio TO admin;
GRANT ALL ON TABLE municipio TO postgres;
GRANT ALL ON TABLE municipio TO PUBLIC;

--
-- Name: par_serv_servicios; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE par_serv_servicios FROM PUBLIC;
REVOKE ALL ON TABLE par_serv_servicios FROM admin;
GRANT ALL ON TABLE par_serv_servicios TO admin;
GRANT ALL ON TABLE par_serv_servicios TO postgres;
GRANT ALL ON TABLE par_serv_servicios TO PUBLIC;

--
-- Name: pl_generado_plg; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE pl_generado_plg FROM PUBLIC;
REVOKE ALL ON TABLE pl_generado_plg FROM admin;
GRANT ALL ON TABLE pl_generado_plg TO admin;
GRANT ALL ON TABLE pl_generado_plg TO postgres;
GRANT ALL ON TABLE pl_generado_plg TO PUBLIC;

--
-- Name: pl_tipo_plt; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE pl_tipo_plt FROM PUBLIC;
REVOKE ALL ON TABLE pl_tipo_plt FROM admin;
GRANT ALL ON TABLE pl_tipo_plt TO admin;
GRANT ALL ON TABLE pl_tipo_plt TO postgres;
GRANT ALL ON TABLE pl_tipo_plt TO PUBLIC;

--
-- Name: plan_table; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE plan_table FROM PUBLIC;
REVOKE ALL ON TABLE plan_table FROM admin;
GRANT ALL ON TABLE plan_table TO admin;
GRANT ALL ON TABLE plan_table TO postgres;
GRANT ALL ON TABLE plan_table TO PUBLIC;

--
-- Name: plantilla_pl; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE plantilla_pl FROM PUBLIC;
REVOKE ALL ON TABLE plantilla_pl FROM admin;
GRANT ALL ON TABLE plantilla_pl TO admin;
GRANT ALL ON TABLE plantilla_pl TO postgres;
GRANT ALL ON TABLE plantilla_pl TO PUBLIC;

--
-- Name: plsql_profiler_data; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE plsql_profiler_data FROM PUBLIC;
REVOKE ALL ON TABLE plsql_profiler_data FROM admin;
GRANT ALL ON TABLE plsql_profiler_data TO admin;
GRANT ALL ON TABLE plsql_profiler_data TO postgres;
GRANT ALL ON TABLE plsql_profiler_data TO PUBLIC;

--
-- Name: plsql_profiler_runs; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE plsql_profiler_runs FROM PUBLIC;
REVOKE ALL ON TABLE plsql_profiler_runs FROM admin;
GRANT ALL ON TABLE plsql_profiler_runs TO admin;
GRANT ALL ON TABLE plsql_profiler_runs TO postgres;
GRANT ALL ON TABLE plsql_profiler_runs TO PUBLIC;

--
-- Name: plsql_profiler_units; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE plsql_profiler_units FROM PUBLIC;
REVOKE ALL ON TABLE plsql_profiler_units FROM admin;
GRANT ALL ON TABLE plsql_profiler_units TO admin;
GRANT ALL ON TABLE plsql_profiler_units TO postgres;
GRANT ALL ON TABLE plsql_profiler_units TO PUBLIC;

--
-- Name: prestamo; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE prestamo FROM PUBLIC;
REVOKE ALL ON TABLE prestamo FROM admin;
GRANT ALL ON TABLE prestamo TO admin;
GRANT ALL ON TABLE prestamo TO postgres;
GRANT ALL ON TABLE prestamo TO PUBLIC;

--
-- Name: radicado; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE radicado FROM PUBLIC;
REVOKE ALL ON TABLE radicado FROM admin;
GRANT ALL ON TABLE radicado TO admin;
GRANT ALL ON TABLE radicado TO postgres;
GRANT ALL ON TABLE radicado TO PUBLIC;

--
-- Name: retencion_doc_tmp; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE retencion_doc_tmp FROM PUBLIC;
REVOKE ALL ON TABLE retencion_doc_tmp FROM admin;
GRANT ALL ON TABLE retencion_doc_tmp TO admin;
GRANT ALL ON TABLE retencion_doc_tmp TO postgres;
GRANT ALL ON TABLE retencion_doc_tmp TO PUBLIC;

--
-- Name: series; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE series FROM PUBLIC;
REVOKE ALL ON TABLE series FROM admin;
GRANT ALL ON TABLE series TO admin;
GRANT ALL ON TABLE series TO postgres;
GRANT ALL ON TABLE series TO PUBLIC;

--
-- Name: sgd_acm_acusemsg; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_acm_acusemsg FROM PUBLIC;
REVOKE ALL ON TABLE sgd_acm_acusemsg FROM admin;
GRANT ALL ON TABLE sgd_acm_acusemsg TO admin;
GRANT ALL ON TABLE sgd_acm_acusemsg TO postgres;
GRANT ALL ON TABLE sgd_acm_acusemsg TO PUBLIC;

--
-- Name: sgd_actadd_actualiadicional; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_actadd_actualiadicional FROM PUBLIC;
REVOKE ALL ON TABLE sgd_actadd_actualiadicional FROM admin;
GRANT ALL ON TABLE sgd_actadd_actualiadicional TO admin;
GRANT ALL ON TABLE sgd_actadd_actualiadicional TO postgres;
GRANT ALL ON TABLE sgd_actadd_actualiadicional TO PUBLIC;

--
-- Name: sgd_agen_agendados; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_agen_agendados FROM PUBLIC;
REVOKE ALL ON TABLE sgd_agen_agendados FROM admin;
GRANT ALL ON TABLE sgd_agen_agendados TO admin;
GRANT ALL ON TABLE sgd_agen_agendados TO postgres;
GRANT ALL ON TABLE sgd_agen_agendados TO PUBLIC;

--
-- Name: sgd_anar_anexarg; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_anar_anexarg FROM PUBLIC;
REVOKE ALL ON TABLE sgd_anar_anexarg FROM admin;
GRANT ALL ON TABLE sgd_anar_anexarg TO admin;
GRANT ALL ON TABLE sgd_anar_anexarg TO postgres;
GRANT ALL ON TABLE sgd_anar_anexarg TO PUBLIC;

--
-- Name: sgd_anu_anulados; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_anu_anulados FROM PUBLIC;
REVOKE ALL ON TABLE sgd_anu_anulados FROM admin;
GRANT ALL ON TABLE sgd_anu_anulados TO admin;
GRANT ALL ON TABLE sgd_anu_anulados TO postgres;
GRANT ALL ON TABLE sgd_anu_anulados TO PUBLIC;

--
-- Name: sgd_aper_adminperfiles; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_aper_adminperfiles FROM PUBLIC;
REVOKE ALL ON TABLE sgd_aper_adminperfiles FROM admin;
GRANT ALL ON TABLE sgd_aper_adminperfiles TO admin;
GRANT ALL ON TABLE sgd_aper_adminperfiles TO postgres;
GRANT ALL ON TABLE sgd_aper_adminperfiles TO PUBLIC;

--
-- Name: sgd_aplfad_plicfunadi; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_aplfad_plicfunadi FROM PUBLIC;
REVOKE ALL ON TABLE sgd_aplfad_plicfunadi FROM admin;
GRANT ALL ON TABLE sgd_aplfad_plicfunadi TO admin;
GRANT ALL ON TABLE sgd_aplfad_plicfunadi TO postgres;
GRANT ALL ON TABLE sgd_aplfad_plicfunadi TO PUBLIC;

--
-- Name: sgd_apli_aplintegra; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_apli_aplintegra FROM PUBLIC;
REVOKE ALL ON TABLE sgd_apli_aplintegra FROM admin;
GRANT ALL ON TABLE sgd_apli_aplintegra TO admin;
GRANT ALL ON TABLE sgd_apli_aplintegra TO postgres;
GRANT ALL ON TABLE sgd_apli_aplintegra TO PUBLIC;

--
-- Name: sgd_aplmen_aplimens; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_aplmen_aplimens FROM PUBLIC;
REVOKE ALL ON TABLE sgd_aplmen_aplimens FROM admin;
GRANT ALL ON TABLE sgd_aplmen_aplimens TO admin;
GRANT ALL ON TABLE sgd_aplmen_aplimens TO postgres;
GRANT ALL ON TABLE sgd_aplmen_aplimens TO PUBLIC;

--
-- Name: sgd_aplus_plicusua; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_aplus_plicusua FROM PUBLIC;
REVOKE ALL ON TABLE sgd_aplus_plicusua FROM admin;
GRANT ALL ON TABLE sgd_aplus_plicusua TO admin;
GRANT ALL ON TABLE sgd_aplus_plicusua TO postgres;
GRANT ALL ON TABLE sgd_aplus_plicusua TO PUBLIC;

--
-- Name: sgd_archivo_central; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_archivo_central FROM PUBLIC;
REVOKE ALL ON TABLE sgd_archivo_central FROM admin;
GRANT ALL ON TABLE sgd_archivo_central TO admin;
GRANT ALL ON TABLE sgd_archivo_central TO postgres;
GRANT ALL ON TABLE sgd_archivo_central TO PUBLIC;

--
-- Name: sgd_archivo_hist; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_archivo_hist FROM PUBLIC;
REVOKE ALL ON TABLE sgd_archivo_hist FROM admin;
GRANT ALL ON TABLE sgd_archivo_hist TO admin;
GRANT ALL ON TABLE sgd_archivo_hist TO postgres;
GRANT ALL ON TABLE sgd_archivo_hist TO PUBLIC;

--
-- Name: sgd_arg_pliego; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_arg_pliego FROM PUBLIC;
REVOKE ALL ON TABLE sgd_arg_pliego FROM admin;
GRANT ALL ON TABLE sgd_arg_pliego TO admin;
GRANT ALL ON TABLE sgd_arg_pliego TO postgres;
GRANT ALL ON TABLE sgd_arg_pliego TO PUBLIC;

--
-- Name: sgd_argd_argdoc; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_argd_argdoc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_argd_argdoc FROM admin;
GRANT ALL ON TABLE sgd_argd_argdoc TO admin;
GRANT ALL ON TABLE sgd_argd_argdoc TO postgres;
GRANT ALL ON TABLE sgd_argd_argdoc TO PUBLIC;

--
-- Name: sgd_argup_argudoctop; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_argup_argudoctop FROM PUBLIC;
REVOKE ALL ON TABLE sgd_argup_argudoctop FROM admin;
GRANT ALL ON TABLE sgd_argup_argudoctop TO admin;
GRANT ALL ON TABLE sgd_argup_argudoctop TO postgres;
GRANT ALL ON TABLE sgd_argup_argudoctop TO PUBLIC;

--
-- Name: sgd_camexp_campoexpediente; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_camexp_campoexpediente FROM PUBLIC;
REVOKE ALL ON TABLE sgd_camexp_campoexpediente FROM admin;
GRANT ALL ON TABLE sgd_camexp_campoexpediente TO admin;
GRANT ALL ON TABLE sgd_camexp_campoexpediente TO postgres;
GRANT ALL ON TABLE sgd_camexp_campoexpediente TO PUBLIC;

--
-- Name: sgd_carp_descripcion; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_carp_descripcion FROM PUBLIC;
REVOKE ALL ON TABLE sgd_carp_descripcion FROM admin;
GRANT ALL ON TABLE sgd_carp_descripcion TO admin;
GRANT ALL ON TABLE sgd_carp_descripcion TO postgres;
GRANT ALL ON TABLE sgd_carp_descripcion TO PUBLIC;

--
-- Name: sgd_cau_causal; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_cau_causal FROM PUBLIC;
REVOKE ALL ON TABLE sgd_cau_causal FROM admin;
GRANT ALL ON TABLE sgd_cau_causal TO admin;
GRANT ALL ON TABLE sgd_cau_causal TO postgres;
GRANT ALL ON TABLE sgd_cau_causal TO PUBLIC;

--
-- Name: sgd_caux_causales; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_caux_causales FROM PUBLIC;
REVOKE ALL ON TABLE sgd_caux_causales FROM admin;
GRANT ALL ON TABLE sgd_caux_causales TO admin;
GRANT ALL ON TABLE sgd_caux_causales TO postgres;
GRANT ALL ON TABLE sgd_caux_causales TO PUBLIC;

--
-- Name: sgd_clta_clstarif; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_clta_clstarif FROM PUBLIC;
REVOKE ALL ON TABLE sgd_clta_clstarif FROM admin;
GRANT ALL ON TABLE sgd_clta_clstarif TO admin;
GRANT ALL ON TABLE sgd_clta_clstarif TO postgres;
GRANT ALL ON TABLE sgd_clta_clstarif TO PUBLIC;

--
-- Name: sgd_cob_campobliga; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_cob_campobliga FROM PUBLIC;
REVOKE ALL ON TABLE sgd_cob_campobliga FROM admin;
GRANT ALL ON TABLE sgd_cob_campobliga TO admin;
GRANT ALL ON TABLE sgd_cob_campobliga TO postgres;
GRANT ALL ON TABLE sgd_cob_campobliga TO PUBLIC;

--
-- Name: sgd_dcau_causal; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_dcau_causal FROM PUBLIC;
REVOKE ALL ON TABLE sgd_dcau_causal FROM admin;
GRANT ALL ON TABLE sgd_dcau_causal TO admin;
GRANT ALL ON TABLE sgd_dcau_causal TO postgres;
GRANT ALL ON TABLE sgd_dcau_causal TO PUBLIC;

--
-- Name: sgd_ddca_ddsgrgdo; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_ddca_ddsgrgdo FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ddca_ddsgrgdo FROM admin;
GRANT ALL ON TABLE sgd_ddca_ddsgrgdo TO admin;
GRANT ALL ON TABLE sgd_ddca_ddsgrgdo TO postgres;
GRANT ALL ON TABLE sgd_ddca_ddsgrgdo TO PUBLIC;

--
-- Name: sgd_def_contactos; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_def_contactos FROM PUBLIC;
REVOKE ALL ON TABLE sgd_def_contactos FROM admin;
GRANT ALL ON TABLE sgd_def_contactos TO admin;
GRANT ALL ON TABLE sgd_def_contactos TO postgres;
GRANT ALL ON TABLE sgd_def_contactos TO PUBLIC;

--
-- Name: sgd_def_continentes; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_def_continentes FROM PUBLIC;
REVOKE ALL ON TABLE sgd_def_continentes FROM admin;
GRANT ALL ON TABLE sgd_def_continentes TO admin;
GRANT ALL ON TABLE sgd_def_continentes TO postgres;
GRANT ALL ON TABLE sgd_def_continentes TO PUBLIC;

--
-- Name: sgd_def_paises; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_def_paises FROM PUBLIC;
REVOKE ALL ON TABLE sgd_def_paises FROM admin;
GRANT ALL ON TABLE sgd_def_paises TO admin;
GRANT ALL ON TABLE sgd_def_paises TO postgres;
GRANT ALL ON TABLE sgd_def_paises TO PUBLIC;

--
-- Name: sgd_deve_dev_envio; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_deve_dev_envio FROM PUBLIC;
REVOKE ALL ON TABLE sgd_deve_dev_envio FROM admin;
GRANT ALL ON TABLE sgd_deve_dev_envio TO admin;
GRANT ALL ON TABLE sgd_deve_dev_envio TO postgres;
GRANT ALL ON TABLE sgd_deve_dev_envio TO PUBLIC;

--
-- Name: sgd_dir_drecciones; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_dir_drecciones FROM PUBLIC;
REVOKE ALL ON TABLE sgd_dir_drecciones FROM admin;
GRANT ALL ON TABLE sgd_dir_drecciones TO admin;
GRANT ALL ON TABLE sgd_dir_drecciones TO postgres;
GRANT ALL ON TABLE sgd_dir_drecciones TO PUBLIC;

--
-- Name: sgd_dnufe_docnufe; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_dnufe_docnufe FROM PUBLIC;
REVOKE ALL ON TABLE sgd_dnufe_docnufe FROM admin;
GRANT ALL ON TABLE sgd_dnufe_docnufe TO admin;
GRANT ALL ON TABLE sgd_dnufe_docnufe TO postgres;
GRANT ALL ON TABLE sgd_dnufe_docnufe TO PUBLIC;

--
-- Name: sgd_eanu_estanulacion; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_eanu_estanulacion FROM PUBLIC;
REVOKE ALL ON TABLE sgd_eanu_estanulacion FROM admin;
GRANT ALL ON TABLE sgd_eanu_estanulacion TO admin;
GRANT ALL ON TABLE sgd_eanu_estanulacion TO postgres;
GRANT ALL ON TABLE sgd_eanu_estanulacion TO PUBLIC;

--
-- Name: sgd_einv_inventario; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_einv_inventario FROM PUBLIC;
REVOKE ALL ON TABLE sgd_einv_inventario FROM admin;
GRANT ALL ON TABLE sgd_einv_inventario TO admin;
GRANT ALL ON TABLE sgd_einv_inventario TO postgres;
GRANT ALL ON TABLE sgd_einv_inventario TO PUBLIC;

--
-- Name: sgd_eit_items; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_eit_items FROM PUBLIC;
REVOKE ALL ON TABLE sgd_eit_items FROM admin;
GRANT ALL ON TABLE sgd_eit_items TO admin;
GRANT ALL ON TABLE sgd_eit_items TO postgres;
GRANT ALL ON TABLE sgd_eit_items TO PUBLIC;

--
-- Name: sgd_ent_entidades; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_ent_entidades FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ent_entidades FROM admin;
GRANT ALL ON TABLE sgd_ent_entidades TO admin;
GRANT ALL ON TABLE sgd_ent_entidades TO postgres;
GRANT ALL ON TABLE sgd_ent_entidades TO PUBLIC;

--
-- Name: sgd_enve_envioespecial; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_enve_envioespecial FROM PUBLIC;
REVOKE ALL ON TABLE sgd_enve_envioespecial FROM admin;
GRANT ALL ON TABLE sgd_enve_envioespecial TO admin;
GRANT ALL ON TABLE sgd_enve_envioespecial TO postgres;
GRANT ALL ON TABLE sgd_enve_envioespecial TO PUBLIC;

--
-- Name: tipo_doc_identificacion; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE tipo_doc_identificacion FROM PUBLIC;
REVOKE ALL ON TABLE tipo_doc_identificacion FROM admin;
GRANT ALL ON TABLE tipo_doc_identificacion TO admin;
GRANT ALL ON TABLE tipo_doc_identificacion TO postgres;
GRANT ALL ON TABLE tipo_doc_identificacion TO PUBLIC;

--
-- Name: tipo_remitente; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE tipo_remitente FROM PUBLIC;
REVOKE ALL ON TABLE tipo_remitente FROM admin;
GRANT ALL ON TABLE tipo_remitente TO admin;
GRANT ALL ON TABLE tipo_remitente TO postgres;
GRANT ALL ON TABLE tipo_remitente TO PUBLIC;
--
-- Name: sgd_est_estadi; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_est_estadi FROM PUBLIC;
REVOKE ALL ON TABLE sgd_est_estadi FROM admin;
GRANT ALL ON TABLE sgd_est_estadi TO admin;
GRANT ALL ON TABLE sgd_est_estadi TO postgres;
GRANT ALL ON TABLE sgd_est_estadi TO PUBLIC;
--
-- Name: sgd_estc_estconsolid; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_estc_estconsolid FROM PUBLIC;
REVOKE ALL ON TABLE sgd_estc_estconsolid FROM admin;
GRANT ALL ON TABLE sgd_estc_estconsolid TO admin;
GRANT ALL ON TABLE sgd_estc_estconsolid TO postgres;
GRANT ALL ON TABLE sgd_estc_estconsolid TO PUBLIC;
--
-- Name: sgd_estinst_estadoinstancia; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_estinst_estadoinstancia FROM PUBLIC;
REVOKE ALL ON TABLE sgd_estinst_estadoinstancia FROM admin;
GRANT ALL ON TABLE sgd_estinst_estadoinstancia TO admin;
GRANT ALL ON TABLE sgd_estinst_estadoinstancia TO postgres;
GRANT ALL ON TABLE sgd_estinst_estadoinstancia TO PUBLIC;
--
-- Name: sgd_exp_expediente; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_exp_expediente FROM PUBLIC;
REVOKE ALL ON TABLE sgd_exp_expediente FROM admin;
GRANT ALL ON TABLE sgd_exp_expediente TO admin;
GRANT ALL ON TABLE sgd_exp_expediente TO postgres;
GRANT ALL ON TABLE sgd_exp_expediente TO PUBLIC;
--
-- Name: sgd_fars_faristas; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_fars_faristas FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fars_faristas FROM admin;
GRANT ALL ON TABLE sgd_fars_faristas TO admin;
GRANT ALL ON TABLE sgd_fars_faristas TO postgres;
GRANT ALL ON TABLE sgd_fars_faristas TO PUBLIC;
--
-- Name: sgd_fenv_frmenvio; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_fenv_frmenvio FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fenv_frmenvio FROM admin;
GRANT ALL ON TABLE sgd_fenv_frmenvio TO admin;
GRANT ALL ON TABLE sgd_fenv_frmenvio TO postgres;
GRANT ALL ON TABLE sgd_fenv_frmenvio TO PUBLIC;
--
-- Name: sgd_fexp_flujoexpedientes; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_fexp_flujoexpedientes FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fexp_flujoexpedientes FROM admin;
GRANT ALL ON TABLE sgd_fexp_flujoexpedientes TO admin;
GRANT ALL ON TABLE sgd_fexp_flujoexpedientes TO postgres;
GRANT ALL ON TABLE sgd_fexp_flujoexpedientes TO PUBLIC;
--
-- Name: sgd_firrad_firmarads; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_firrad_firmarads FROM PUBLIC;
REVOKE ALL ON TABLE sgd_firrad_firmarads FROM admin;
GRANT ALL ON TABLE sgd_firrad_firmarads TO admin;
GRANT ALL ON TABLE sgd_firrad_firmarads TO postgres;
GRANT ALL ON TABLE sgd_firrad_firmarads TO PUBLIC;

--
-- Name: sgd_fld_flujodoc; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_fld_flujodoc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fld_flujodoc FROM admin;
GRANT ALL ON TABLE sgd_fld_flujodoc TO admin;
GRANT ALL ON TABLE sgd_fld_flujodoc TO postgres;
GRANT ALL ON TABLE sgd_fld_flujodoc TO PUBLIC;
--
-- Name: sgd_fun_funciones; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_fun_funciones FROM PUBLIC;
REVOKE ALL ON TABLE sgd_fun_funciones FROM admin;
GRANT ALL ON TABLE sgd_fun_funciones TO admin;
GRANT ALL ON TABLE sgd_fun_funciones TO postgres;
GRANT ALL ON TABLE sgd_fun_funciones TO PUBLIC;
--
-- Name: sgd_hfld_histflujodoc; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_hfld_histflujodoc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_hfld_histflujodoc FROM admin;
GRANT ALL ON TABLE sgd_hfld_histflujodoc TO admin;
GRANT ALL ON TABLE sgd_hfld_histflujodoc TO postgres;
GRANT ALL ON TABLE sgd_hfld_histflujodoc TO PUBLIC;
--
-- Name: sgd_hmtd_hismatdoc; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_hmtd_hismatdoc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_hmtd_hismatdoc FROM admin;
GRANT ALL ON TABLE sgd_hmtd_hismatdoc TO admin;
GRANT ALL ON TABLE sgd_hmtd_hismatdoc TO postgres;
GRANT ALL ON TABLE sgd_hmtd_hismatdoc TO PUBLIC;

--
-- Name: sgd_instorf_instanciasorfeo; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_instorf_instanciasorfeo FROM PUBLIC;
REVOKE ALL ON TABLE sgd_instorf_instanciasorfeo FROM admin;
GRANT ALL ON TABLE sgd_instorf_instanciasorfeo TO admin;
GRANT ALL ON TABLE sgd_instorf_instanciasorfeo TO postgres;
GRANT ALL ON TABLE sgd_instorf_instanciasorfeo TO PUBLIC;
--
-- Name: sgd_lip_linkip; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_lip_linkip FROM PUBLIC;
REVOKE ALL ON TABLE sgd_lip_linkip FROM admin;
GRANT ALL ON TABLE sgd_lip_linkip TO admin;
GRANT ALL ON TABLE sgd_lip_linkip TO postgres;
GRANT ALL ON TABLE sgd_lip_linkip TO PUBLIC;
--
-- Name: sgd_mat_matriz; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_mat_matriz FROM PUBLIC;
REVOKE ALL ON TABLE sgd_mat_matriz FROM admin;
GRANT ALL ON TABLE sgd_mat_matriz TO admin;
GRANT ALL ON TABLE sgd_mat_matriz TO postgres;
GRANT ALL ON TABLE sgd_mat_matriz TO PUBLIC;
--
-- Name: sgd_mpes_mddpeso; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_mpes_mddpeso FROM PUBLIC;
REVOKE ALL ON TABLE sgd_mpes_mddpeso FROM admin;
GRANT ALL ON TABLE sgd_mpes_mddpeso TO admin;
GRANT ALL ON TABLE sgd_mpes_mddpeso TO postgres;
GRANT ALL ON TABLE sgd_mpes_mddpeso TO PUBLIC;
--
-- Name: sgd_mrd_matrird; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_mrd_matrird FROM PUBLIC;
REVOKE ALL ON TABLE sgd_mrd_matrird FROM admin;
GRANT ALL ON TABLE sgd_mrd_matrird TO admin;
GRANT ALL ON TABLE sgd_mrd_matrird TO postgres;
GRANT ALL ON TABLE sgd_mrd_matrird TO PUBLIC;
--
-- Name: sgd_msdep_msgdep; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_msdep_msgdep FROM PUBLIC;
REVOKE ALL ON TABLE sgd_msdep_msgdep FROM admin;
GRANT ALL ON TABLE sgd_msdep_msgdep TO admin;
GRANT ALL ON TABLE sgd_msdep_msgdep TO postgres;
GRANT ALL ON TABLE sgd_msdep_msgdep TO PUBLIC;
--
-- Name: sgd_msg_mensaje; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_msg_mensaje FROM PUBLIC;
REVOKE ALL ON TABLE sgd_msg_mensaje FROM admin;
GRANT ALL ON TABLE sgd_msg_mensaje TO admin;
GRANT ALL ON TABLE sgd_msg_mensaje TO postgres;
GRANT ALL ON TABLE sgd_msg_mensaje TO PUBLIC;
--
-- Name: sgd_mtd_matriz_doc; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_mtd_matriz_doc FROM PUBLIC;
REVOKE ALL ON TABLE sgd_mtd_matriz_doc FROM admin;
GRANT ALL ON TABLE sgd_mtd_matriz_doc TO admin;
GRANT ALL ON TABLE sgd_mtd_matriz_doc TO postgres;
GRANT ALL ON TABLE sgd_mtd_matriz_doc TO PUBLIC;
--
-- Name: sgd_noh_nohabiles; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_noh_nohabiles FROM PUBLIC;
REVOKE ALL ON TABLE sgd_noh_nohabiles FROM admin;
GRANT ALL ON TABLE sgd_noh_nohabiles TO admin;
GRANT ALL ON TABLE sgd_noh_nohabiles TO postgres;
GRANT ALL ON TABLE sgd_noh_nohabiles TO PUBLIC;
--
-- Name: sgd_not_notificacion; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_not_notificacion FROM PUBLIC;
REVOKE ALL ON TABLE sgd_not_notificacion FROM admin;
GRANT ALL ON TABLE sgd_not_notificacion TO admin;
GRANT ALL ON TABLE sgd_not_notificacion TO postgres;
GRANT ALL ON TABLE sgd_not_notificacion TO PUBLIC;
--
-- Name: sgd_ntrd_notifrad; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_ntrd_notifrad FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ntrd_notifrad FROM admin;
GRANT ALL ON TABLE sgd_ntrd_notifrad TO admin;
GRANT ALL ON TABLE sgd_ntrd_notifrad TO postgres;
GRANT ALL ON TABLE sgd_ntrd_notifrad TO PUBLIC;
--
-- Name: sgd_oem_oempresas; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_oem_oempresas FROM PUBLIC;
REVOKE ALL ON TABLE sgd_oem_oempresas FROM admin;
GRANT ALL ON TABLE sgd_oem_oempresas TO admin;
GRANT ALL ON TABLE sgd_oem_oempresas TO postgres;
GRANT ALL ON TABLE sgd_oem_oempresas TO PUBLIC;
--
-- Name: sgd_panu_peranulados; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_panu_peranulados FROM PUBLIC;
REVOKE ALL ON TABLE sgd_panu_peranulados FROM admin;
GRANT ALL ON TABLE sgd_panu_peranulados TO admin;
GRANT ALL ON TABLE sgd_panu_peranulados TO postgres;
GRANT ALL ON TABLE sgd_panu_peranulados TO PUBLIC;
--
-- Name: sgd_parametro; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_parametro FROM PUBLIC;
REVOKE ALL ON TABLE sgd_parametro FROM admin;
GRANT ALL ON TABLE sgd_parametro TO admin;
GRANT ALL ON TABLE sgd_parametro TO postgres;
GRANT ALL ON TABLE sgd_parametro TO PUBLIC;
--
-- Name: sgd_parexp_paramexpediente; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_parexp_paramexpediente FROM PUBLIC;
REVOKE ALL ON TABLE sgd_parexp_paramexpediente FROM admin;
GRANT ALL ON TABLE sgd_parexp_paramexpediente TO admin;
GRANT ALL ON TABLE sgd_parexp_paramexpediente TO postgres;
GRANT ALL ON TABLE sgd_parexp_paramexpediente TO PUBLIC;
--
-- Name: sgd_pexp_procexpedientes; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_pexp_procexpedientes FROM PUBLIC;
REVOKE ALL ON TABLE sgd_pexp_procexpedientes FROM admin;
GRANT ALL ON TABLE sgd_pexp_procexpedientes TO admin;
GRANT ALL ON TABLE sgd_pexp_procexpedientes TO postgres;
GRANT ALL ON TABLE sgd_pexp_procexpedientes TO PUBLIC;
--
-- Name: sgd_pnufe_procnumfe; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_pnufe_procnumfe FROM PUBLIC;
REVOKE ALL ON TABLE sgd_pnufe_procnumfe FROM admin;
GRANT ALL ON TABLE sgd_pnufe_procnumfe TO admin;
GRANT ALL ON TABLE sgd_pnufe_procnumfe TO postgres;
GRANT ALL ON TABLE sgd_pnufe_procnumfe TO PUBLIC;
--
-- Name: sgd_pnun_procenum; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_pnun_procenum FROM PUBLIC;
REVOKE ALL ON TABLE sgd_pnun_procenum FROM admin;
GRANT ALL ON TABLE sgd_pnun_procenum TO admin;
GRANT ALL ON TABLE sgd_pnun_procenum TO postgres;
GRANT ALL ON TABLE sgd_pnun_procenum TO PUBLIC;
--
-- Name: sgd_prc_proceso; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_prc_proceso FROM PUBLIC;
REVOKE ALL ON TABLE sgd_prc_proceso FROM admin;
GRANT ALL ON TABLE sgd_prc_proceso TO admin;
GRANT ALL ON TABLE sgd_prc_proceso TO postgres;
GRANT ALL ON TABLE sgd_prc_proceso TO PUBLIC;
--
-- Name: sgd_prd_prcdmentos; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_prd_prcdmentos FROM PUBLIC;
REVOKE ALL ON TABLE sgd_prd_prcdmentos FROM admin;
GRANT ALL ON TABLE sgd_prd_prcdmentos TO admin;
GRANT ALL ON TABLE sgd_prd_prcdmentos TO postgres;
GRANT ALL ON TABLE sgd_prd_prcdmentos TO PUBLIC;
--
-- Name: sgd_rda_retdoca; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_rda_retdoca FROM PUBLIC;
REVOKE ALL ON TABLE sgd_rda_retdoca FROM admin;
GRANT ALL ON TABLE sgd_rda_retdoca TO admin;
GRANT ALL ON TABLE sgd_rda_retdoca TO postgres;
GRANT ALL ON TABLE sgd_rda_retdoca TO PUBLIC;
--
-- Name: sgd_rdf_retdocf; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_rdf_retdocf FROM PUBLIC;
REVOKE ALL ON TABLE sgd_rdf_retdocf FROM admin;
GRANT ALL ON TABLE sgd_rdf_retdocf TO admin;
GRANT ALL ON TABLE sgd_rdf_retdocf TO postgres;
GRANT ALL ON TABLE sgd_rdf_retdocf TO PUBLIC;
--
-- Name: sgd_renv_regenvio; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_renv_regenvio FROM PUBLIC;
REVOKE ALL ON TABLE sgd_renv_regenvio FROM admin;
GRANT ALL ON TABLE sgd_renv_regenvio TO admin;
GRANT ALL ON TABLE sgd_renv_regenvio TO postgres;
GRANT ALL ON TABLE sgd_renv_regenvio TO PUBLIC;
--
-- Name: sgd_renv_regenvio1; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_renv_regenvio1 FROM PUBLIC;
REVOKE ALL ON TABLE sgd_renv_regenvio1 FROM admin;
GRANT ALL ON TABLE sgd_renv_regenvio1 TO admin;
GRANT ALL ON TABLE sgd_renv_regenvio1 TO postgres;
GRANT ALL ON TABLE sgd_renv_regenvio1 TO PUBLIC;
--
-- Name: sgd_rfax_reservafax; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_rfax_reservafax FROM PUBLIC;
REVOKE ALL ON TABLE sgd_rfax_reservafax FROM admin;
GRANT ALL ON TABLE sgd_rfax_reservafax TO admin;
GRANT ALL ON TABLE sgd_rfax_reservafax TO postgres;
GRANT ALL ON TABLE sgd_rfax_reservafax TO PUBLIC;
--
-- Name: sgd_rmr_radmasivre; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_rmr_radmasivre FROM PUBLIC;
REVOKE ALL ON TABLE sgd_rmr_radmasivre FROM admin;
GRANT ALL ON TABLE sgd_rmr_radmasivre TO admin;
GRANT ALL ON TABLE sgd_rmr_radmasivre TO postgres;
GRANT ALL ON TABLE sgd_rmr_radmasivre TO PUBLIC;
--
-- Name: sgd_san_sancionados; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_san_sancionados FROM PUBLIC;
REVOKE ALL ON TABLE sgd_san_sancionados FROM admin;
GRANT ALL ON TABLE sgd_san_sancionados TO admin;
GRANT ALL ON TABLE sgd_san_sancionados TO postgres;
GRANT ALL ON TABLE sgd_san_sancionados TO PUBLIC;
--
-- Name: sgd_san_sancionados_x; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_san_sancionados_x FROM PUBLIC;
REVOKE ALL ON TABLE sgd_san_sancionados_x FROM admin;
GRANT ALL ON TABLE sgd_san_sancionados_x TO admin;
GRANT ALL ON TABLE sgd_san_sancionados_x TO postgres;
GRANT ALL ON TABLE sgd_san_sancionados_x TO PUBLIC;
--
-- Name: sgd_sbrd_subserierd; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_sbrd_subserierd FROM PUBLIC;
REVOKE ALL ON TABLE sgd_sbrd_subserierd FROM admin;
GRANT ALL ON TABLE sgd_sbrd_subserierd TO admin;
GRANT ALL ON TABLE sgd_sbrd_subserierd TO postgres;
GRANT ALL ON TABLE sgd_sbrd_subserierd TO PUBLIC;
--
-- Name: sgd_sed_sede; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_sed_sede FROM PUBLIC;
REVOKE ALL ON TABLE sgd_sed_sede FROM admin;
GRANT ALL ON TABLE sgd_sed_sede TO admin;
GRANT ALL ON TABLE sgd_sed_sede TO postgres;
GRANT ALL ON TABLE sgd_sed_sede TO PUBLIC;
--
-- Name: sgd_senuf_secnumfe; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_senuf_secnumfe FROM PUBLIC;
REVOKE ALL ON TABLE sgd_senuf_secnumfe FROM admin;
GRANT ALL ON TABLE sgd_senuf_secnumfe TO admin;
GRANT ALL ON TABLE sgd_senuf_secnumfe TO postgres;
GRANT ALL ON TABLE sgd_senuf_secnumfe TO PUBLIC;
--
-- Name: sgd_sexp_secexpedientes; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_sexp_secexpedientes FROM PUBLIC;
REVOKE ALL ON TABLE sgd_sexp_secexpedientes FROM admin;
GRANT ALL ON TABLE sgd_sexp_secexpedientes TO admin;
GRANT ALL ON TABLE sgd_sexp_secexpedientes TO postgres;
GRANT ALL ON TABLE sgd_sexp_secexpedientes TO PUBLIC;
--
-- Name: sgd_srd_seriesrd; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_srd_seriesrd FROM PUBLIC;
REVOKE ALL ON TABLE sgd_srd_seriesrd FROM admin;
GRANT ALL ON TABLE sgd_srd_seriesrd TO admin;
GRANT ALL ON TABLE sgd_srd_seriesrd TO postgres;
GRANT ALL ON TABLE sgd_srd_seriesrd TO PUBLIC;
--
-- Name: sgd_tar_tarifas; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_tar_tarifas FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tar_tarifas FROM admin;
GRANT ALL ON TABLE sgd_tar_tarifas TO admin;
GRANT ALL ON TABLE sgd_tar_tarifas TO postgres;
GRANT ALL ON TABLE sgd_tar_tarifas TO PUBLIC;
--
-- Name: sgd_tdec_tipodecision; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_tdec_tipodecision FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tdec_tipodecision FROM admin;
GRANT ALL ON TABLE sgd_tdec_tipodecision TO admin;
GRANT ALL ON TABLE sgd_tdec_tipodecision TO postgres;
GRANT ALL ON TABLE sgd_tdec_tipodecision TO PUBLIC;
--
-- Name: sgd_tid_tipdecision; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_tid_tipdecision FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tid_tipdecision FROM admin;
GRANT ALL ON TABLE sgd_tid_tipdecision TO admin;
GRANT ALL ON TABLE sgd_tid_tipdecision TO postgres;
GRANT ALL ON TABLE sgd_tid_tipdecision TO PUBLIC;
--
-- Name: sgd_tidm_tidocmasiva; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_tidm_tidocmasiva FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tidm_tidocmasiva FROM admin;
GRANT ALL ON TABLE sgd_tidm_tidocmasiva TO admin;
GRANT ALL ON TABLE sgd_tidm_tidocmasiva TO postgres;
GRANT ALL ON TABLE sgd_tidm_tidocmasiva TO PUBLIC;
--
-- Name: sgd_tip3_tipotercero; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_tip3_tipotercero FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tip3_tipotercero FROM admin;
GRANT ALL ON TABLE sgd_tip3_tipotercero TO admin;
GRANT ALL ON TABLE sgd_tip3_tipotercero TO postgres;
GRANT ALL ON TABLE sgd_tip3_tipotercero TO PUBLIC;
--
-- Name: sgd_tma_temas; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_tma_temas FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tma_temas FROM admin;
GRANT ALL ON TABLE sgd_tma_temas TO admin;
GRANT ALL ON TABLE sgd_tma_temas TO postgres;
GRANT ALL ON TABLE sgd_tma_temas TO PUBLIC;
--
-- Name: sgd_tme_tipmen; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_tme_tipmen FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tme_tipmen FROM admin;
GRANT ALL ON TABLE sgd_tme_tipmen TO admin;
GRANT ALL ON TABLE sgd_tme_tipmen TO postgres;
GRANT ALL ON TABLE sgd_tme_tipmen TO PUBLIC;
--
-- Name: sgd_tpr_tpdcumento; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_tpr_tpdcumento FROM PUBLIC;
REVOKE ALL ON TABLE sgd_tpr_tpdcumento FROM admin;
GRANT ALL ON TABLE sgd_tpr_tpdcumento TO admin;
GRANT ALL ON TABLE sgd_tpr_tpdcumento TO postgres;
GRANT ALL ON TABLE sgd_tpr_tpdcumento TO PUBLIC;
--
-- Name: sgd_trad_tiporad; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_trad_tiporad FROM PUBLIC;
REVOKE ALL ON TABLE sgd_trad_tiporad FROM admin;
GRANT ALL ON TABLE sgd_trad_tiporad TO admin;
GRANT ALL ON TABLE sgd_trad_tiporad TO postgres;
GRANT ALL ON TABLE sgd_trad_tiporad TO PUBLIC;
--
-- Name: sgd_ttr_transaccion; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_ttr_transaccion FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ttr_transaccion FROM admin;
GRANT ALL ON TABLE sgd_ttr_transaccion TO admin;
GRANT ALL ON TABLE sgd_ttr_transaccion TO postgres;
GRANT ALL ON TABLE sgd_ttr_transaccion TO PUBLIC;
--
-- Name: sgd_ush_usuhistorico; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_ush_usuhistorico FROM PUBLIC;
REVOKE ALL ON TABLE sgd_ush_usuhistorico FROM admin;
GRANT ALL ON TABLE sgd_ush_usuhistorico TO admin;
GRANT ALL ON TABLE sgd_ush_usuhistorico TO postgres;
GRANT ALL ON TABLE sgd_ush_usuhistorico TO PUBLIC;
--
-- Name: sgd_usm_usumodifica; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE sgd_usm_usumodifica FROM PUBLIC;
REVOKE ALL ON TABLE sgd_usm_usumodifica FROM admin;
GRANT ALL ON TABLE sgd_usm_usumodifica TO admin;
GRANT ALL ON TABLE sgd_usm_usumodifica TO postgres;
GRANT ALL ON TABLE sgd_usm_usumodifica TO PUBLIC;
--
-- Name: ubicacion_fisica; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE ubicacion_fisica FROM PUBLIC;
REVOKE ALL ON TABLE ubicacion_fisica FROM admin;
GRANT ALL ON TABLE ubicacion_fisica TO admin;
GRANT ALL ON TABLE ubicacion_fisica TO postgres;
GRANT ALL ON TABLE ubicacion_fisica TO PUBLIC;

--
-- Name: perfiles; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE perfiles FROM PUBLIC;
REVOKE ALL ON TABLE perfiles FROM admin;
GRANT ALL ON TABLE perfiles TO admin;
GRANT ALL ON TABLE perfiles TO postgres;
GRANT ALL ON TABLE perfiles TO PUBLIC;

--
-- PostgreSQL database dump complete
--

