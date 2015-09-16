--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-10 23:30:40 COT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 59652)
-- Name: docencia; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA docencia;


--
-- TOC entry 7 (class 2615 OID 59517)
-- Name: kyron; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA kyron;


--
-- TOC entry 9 (class 2615 OID 59801)
-- Name: menu; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA menu;


--
-- TOC entry 213 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 213
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = docencia, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 195 (class 1259 OID 59653)
-- Name: comunicacion_corta; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE comunicacion_corta (
    documento_docente text NOT NULL,
    nombre_revista text NOT NULL,
    id_contexto smallint NOT NULL,
    paiscodigo text NOT NULL,
    id_tipo_indexacion smallint NOT NULL,
    numero_issn smallint NOT NULL,
    anno_publicacion smallint NOT NULL,
    volumen_revista smallint NOT NULL,
    numero_revista smallint NOT NULL,
    paginas_revista smallint NOT NULL,
    titulo_articulo text NOT NULL,
    numero_autores smallint NOT NULL,
    numero_autores_ud smallint NOT NULL,
    fecha_publicacion date NOT NULL,
    numero_acta text NOT NULL,
    fecha_acta date NOT NULL,
    numero_caso integer NOT NULL,
    puntaje real NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 59659)
-- Name: contexto; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE contexto (
    id_contexto smallint NOT NULL,
    descripcion text NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 59665)
-- Name: docente; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE docente (
    documento_docente text NOT NULL,
    id_tipo_documento smallint NOT NULL,
    primer_apellido text NOT NULL,
    segundo_apellido text,
    primer_nombre text NOT NULL,
    segundo_nombre text,
    genero text NOT NULL,
    estado boolean DEFAULT true NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 59672)
-- Name: docente_proyectocurricular; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE docente_proyectocurricular (
    documento_docente text NOT NULL,
    id_proyectocurricular smallint NOT NULL,
    estado boolean DEFAULT true NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 59679)
-- Name: facultad; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE facultad (
    id_facultad smallint NOT NULL,
    nombre text NOT NULL,
    abreviatura text NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 59685)
-- Name: pais; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE pais (
    paiscodigo character(3) NOT NULL,
    paisnombre character(52),
    paiscontinente character varying(50),
    paisregion character varying(26),
    paisarea double precision,
    paisindependencia smallint,
    paispoblacion integer,
    paisexpectativadevida double precision,
    paisproductointernobruto double precision,
    paisproductointernobrutoantiguo double precision,
    paisnombrelocal character varying(45),
    paisgobierno character varying(45),
    paisjefedeestado character varying(60),
    paiscapital integer,
    paiscodigo2 character(2)
);


--
-- TOC entry 201 (class 1259 OID 59688)
-- Name: proyectocurricular; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE proyectocurricular (
    id_proyectocurricular smallint NOT NULL,
    id_facultad smallint NOT NULL,
    nombre text NOT NULL,
    estado boolean DEFAULT true NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 59695)
-- Name: revista_indexada; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE revista_indexada (
    documento_docente text NOT NULL,
    nombre_revista text NOT NULL,
    id_contexto smallint NOT NULL,
    paiscodigo text NOT NULL,
    id_tipo_indexacion smallint NOT NULL,
    numero_issn text NOT NULL,
    anno_publicacion smallint NOT NULL,
    volumen_revista smallint NOT NULL,
    numero_revista smallint NOT NULL,
    paginas_revista smallint NOT NULL,
    titulo_articulo text NOT NULL,
    numero_autores smallint NOT NULL,
    numero_autores_ud smallint NOT NULL,
    fecha_publicacion date NOT NULL,
    numero_acta text NOT NULL,
    fecha_acta date NOT NULL,
    numero_caso integer NOT NULL,
    puntaje real NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 59701)
-- Name: tipo_documento; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE tipo_documento (
    id_tipo_documento smallint NOT NULL,
    descripcion text NOT NULL,
    abreviatura text NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 59707)
-- Name: tipo_indexacion; Type: TABLE; Schema: docencia; Owner: -
--

CREATE TABLE tipo_indexacion (
    id_tipo_indexacion smallint NOT NULL,
    descripcion text NOT NULL,
    id_contexto smallint NOT NULL
);


SET search_path = kyron, pg_catalog;

--
-- TOC entry 175 (class 1259 OID 59518)
-- Name: kyron_bloque; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_bloque (
    id_bloque integer NOT NULL,
    nombre character(50) NOT NULL,
    descripcion character(255) DEFAULT NULL::bpchar,
    grupo character(200) NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 59525)
-- Name: kyron_bloque_id_bloque_seq; Type: SEQUENCE; Schema: kyron; Owner: -
--

CREATE SEQUENCE kyron_bloque_id_bloque_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 176
-- Name: kyron_bloque_id_bloque_seq; Type: SEQUENCE OWNED BY; Schema: kyron; Owner: -
--

ALTER SEQUENCE kyron_bloque_id_bloque_seq OWNED BY kyron_bloque.id_bloque;


--
-- TOC entry 177 (class 1259 OID 59527)
-- Name: kyron_bloque_pagina; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_bloque_pagina (
    idrelacion integer NOT NULL,
    id_pagina integer DEFAULT 0 NOT NULL,
    id_bloque integer DEFAULT 0 NOT NULL,
    seccion character(1) NOT NULL,
    posicion integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 59533)
-- Name: kyron_bloque_pagina_idrelacion_seq; Type: SEQUENCE; Schema: kyron; Owner: -
--

CREATE SEQUENCE kyron_bloque_pagina_idrelacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 178
-- Name: kyron_bloque_pagina_idrelacion_seq; Type: SEQUENCE OWNED BY; Schema: kyron; Owner: -
--

ALTER SEQUENCE kyron_bloque_pagina_idrelacion_seq OWNED BY kyron_bloque_pagina.idrelacion;


--
-- TOC entry 193 (class 1259 OID 59641)
-- Name: kyron_configuracion; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_configuracion (
    id_parametro integer NOT NULL,
    parametro character(255) NOT NULL,
    valor character(255) NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 59647)
-- Name: kyron_configuracion_id_parametro_seq; Type: SEQUENCE; Schema: kyron; Owner: -
--

CREATE SEQUENCE kyron_configuracion_id_parametro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 194
-- Name: kyron_configuracion_id_parametro_seq; Type: SEQUENCE OWNED BY; Schema: kyron; Owner: -
--

ALTER SEQUENCE kyron_configuracion_id_parametro_seq OWNED BY kyron_configuracion.id_parametro;


--
-- TOC entry 179 (class 1259 OID 59543)
-- Name: kyron_dbms; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_dbms (
    idconexion integer NOT NULL,
    nombre character varying(50) NOT NULL,
    dbms character varying(20) NOT NULL,
    servidor character varying(50) NOT NULL,
    puerto integer NOT NULL,
    conexionssh character varying(50) NOT NULL,
    db character varying(100) NOT NULL,
    esquema character varying(100) NOT NULL,
    usuario character varying(100) NOT NULL,
    password character varying(200) NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 59549)
-- Name: kyron_dbms_idconexion_seq; Type: SEQUENCE; Schema: kyron; Owner: -
--

CREATE SEQUENCE kyron_dbms_idconexion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 180
-- Name: kyron_dbms_idconexion_seq; Type: SEQUENCE OWNED BY; Schema: kyron; Owner: -
--

ALTER SEQUENCE kyron_dbms_idconexion_seq OWNED BY kyron_dbms.idconexion;


--
-- TOC entry 181 (class 1259 OID 59551)
-- Name: kyron_estilo; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_estilo (
    usuario character(50) DEFAULT '0'::bpchar NOT NULL,
    estilo character(50) NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 59555)
-- Name: kyron_logger; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_logger (
    id integer NOT NULL,
    evento character(255) NOT NULL,
    fecha character(50) NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 59558)
-- Name: kyron_logger_id_seq; Type: SEQUENCE; Schema: kyron; Owner: -
--

CREATE SEQUENCE kyron_logger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 183
-- Name: kyron_logger_id_seq; Type: SEQUENCE OWNED BY; Schema: kyron; Owner: -
--

ALTER SEQUENCE kyron_logger_id_seq OWNED BY kyron_logger.id;


--
-- TOC entry 184 (class 1259 OID 59560)
-- Name: kyron_pagina; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_pagina (
    id_pagina integer NOT NULL,
    nombre character(50) DEFAULT ''::bpchar NOT NULL,
    descripcion character(250) DEFAULT ''::bpchar NOT NULL,
    modulo character(50) DEFAULT ''::bpchar NOT NULL,
    nivel integer DEFAULT 0 NOT NULL,
    parametro character(255) NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 59570)
-- Name: kyron_pagina_id_pagina_seq; Type: SEQUENCE; Schema: kyron; Owner: -
--

CREATE SEQUENCE kyron_pagina_id_pagina_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 185
-- Name: kyron_pagina_id_pagina_seq; Type: SEQUENCE OWNED BY; Schema: kyron; Owner: -
--

ALTER SEQUENCE kyron_pagina_id_pagina_seq OWNED BY kyron_pagina.id_pagina;


--
-- TOC entry 186 (class 1259 OID 59572)
-- Name: kyron_subsistema; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_subsistema (
    id_subsistema integer NOT NULL,
    nombre character varying(250) NOT NULL,
    etiqueta character varying(100) NOT NULL,
    id_pagina integer DEFAULT 0 NOT NULL,
    observacion text
);


--
-- TOC entry 187 (class 1259 OID 59579)
-- Name: kyron_subsistema_id_subsistema_seq; Type: SEQUENCE; Schema: kyron; Owner: -
--

CREATE SEQUENCE kyron_subsistema_id_subsistema_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 187
-- Name: kyron_subsistema_id_subsistema_seq; Type: SEQUENCE OWNED BY; Schema: kyron; Owner: -
--

ALTER SEQUENCE kyron_subsistema_id_subsistema_seq OWNED BY kyron_subsistema.id_subsistema;


--
-- TOC entry 188 (class 1259 OID 59581)
-- Name: kyron_tempformulario; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_tempformulario (
    id_sesion character(32) NOT NULL,
    formulario character(100) NOT NULL,
    campo character(100) NOT NULL,
    valor text NOT NULL,
    fecha character(50) NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 59587)
-- Name: kyron_usuario; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_usuario (
    id_usuario integer NOT NULL,
    nombre character varying(50) DEFAULT ''::character varying NOT NULL,
    apellido character varying(50) DEFAULT ''::character varying NOT NULL,
    correo character varying(100) DEFAULT ''::character varying NOT NULL,
    telefono character varying(50) DEFAULT ''::character varying NOT NULL,
    imagen character(255) NOT NULL,
    clave character varying(100) DEFAULT ''::character varying NOT NULL,
    tipo character varying(255) DEFAULT ''::character varying NOT NULL,
    estilo character varying(50) DEFAULT 'basico'::character varying NOT NULL,
    idioma character varying(50) DEFAULT 'es_es'::character varying NOT NULL,
    estado integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 59602)
-- Name: kyron_usuario_id_usuario_seq; Type: SEQUENCE; Schema: kyron; Owner: -
--

CREATE SEQUENCE kyron_usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 190
-- Name: kyron_usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: kyron; Owner: -
--

ALTER SEQUENCE kyron_usuario_id_usuario_seq OWNED BY kyron_usuario.id_usuario;


--
-- TOC entry 191 (class 1259 OID 59604)
-- Name: kyron_usuario_subsistema; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_usuario_subsistema (
    id_usuario integer DEFAULT 0 NOT NULL,
    id_subsistema integer DEFAULT 0 NOT NULL,
    estado integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 59610)
-- Name: kyron_valor_sesion; Type: TABLE; Schema: kyron; Owner: -
--

CREATE TABLE kyron_valor_sesion (
    sesionid character(32) NOT NULL,
    variable character(20) NOT NULL,
    valor character(255) NOT NULL,
    expiracion bigint DEFAULT 0 NOT NULL
);


SET search_path = menu, pg_catalog;

--
-- TOC entry 205 (class 1259 OID 59802)
-- Name: grupo; Type: TABLE; Schema: menu; Owner: -
--

CREATE TABLE grupo (
    id_grupo integer NOT NULL,
    descripcion text NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 59808)
-- Name: grupo_id_grupo_seq; Type: SEQUENCE; Schema: menu; Owner: -
--

CREATE SEQUENCE grupo_id_grupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 206
-- Name: grupo_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: menu; Owner: -
--

ALTER SEQUENCE grupo_id_grupo_seq OWNED BY grupo.id_grupo;


--
-- TOC entry 207 (class 1259 OID 59810)
-- Name: item; Type: TABLE; Schema: menu; Owner: -
--

CREATE TABLE item (
    id_item integer NOT NULL,
    id_menu smallint NOT NULL,
    id_grupo smallint NOT NULL,
    id_tipo_item smallint NOT NULL,
    descripcion text NOT NULL,
    columna smallint DEFAULT 1 NOT NULL,
    orden_item smallint DEFAULT 0 NOT NULL,
    link text,
    estado_registro boolean DEFAULT true NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 59819)
-- Name: item_id_item_seq; Type: SEQUENCE; Schema: menu; Owner: -
--

CREATE SEQUENCE item_id_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 208
-- Name: item_id_item_seq; Type: SEQUENCE OWNED BY; Schema: menu; Owner: -
--

ALTER SEQUENCE item_id_item_seq OWNED BY item.id_item;


--
-- TOC entry 209 (class 1259 OID 59821)
-- Name: menu; Type: TABLE; Schema: menu; Owner: -
--

CREATE TABLE menu (
    id_menu integer NOT NULL,
    descripcion text NOT NULL,
    perfil_usuario smallint DEFAULT 0 NOT NULL,
    estado_registro boolean DEFAULT true NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 59829)
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: menu; Owner: -
--

CREATE SEQUENCE menu_id_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 210
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: menu; Owner: -
--

ALTER SEQUENCE menu_id_menu_seq OWNED BY menu.id_menu;


--
-- TOC entry 211 (class 1259 OID 59831)
-- Name: tipo_item; Type: TABLE; Schema: menu; Owner: -
--

CREATE TABLE tipo_item (
    id_tipo_item integer NOT NULL,
    descripcion text NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 59837)
-- Name: tipo_item_id_tipo_item_seq; Type: SEQUENCE; Schema: menu; Owner: -
--

CREATE SEQUENCE tipo_item_id_tipo_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 212
-- Name: tipo_item_id_tipo_item_seq; Type: SEQUENCE OWNED BY; Schema: menu; Owner: -
--

ALTER SEQUENCE tipo_item_id_tipo_item_seq OWNED BY tipo_item.id_tipo_item;


SET search_path = public, pg_catalog;

--
-- TOC entry 173 (class 1259 OID 59507)
-- Name: kyron_bloque; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kyron_bloque (
    id_bloque integer NOT NULL,
    nombre character(50) NOT NULL,
    descripcion character(255) DEFAULT NULL::bpchar,
    grupo character(200) NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 59514)
-- Name: kyron_bloque_id_bloque_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE kyron_bloque_id_bloque_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 174
-- Name: kyron_bloque_id_bloque_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE kyron_bloque_id_bloque_seq OWNED BY kyron_bloque.id_bloque;


SET search_path = kyron, pg_catalog;

--
-- TOC entry 2015 (class 2604 OID 59614)
-- Name: id_bloque; Type: DEFAULT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_bloque ALTER COLUMN id_bloque SET DEFAULT nextval('kyron_bloque_id_bloque_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 59615)
-- Name: idrelacion; Type: DEFAULT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_bloque_pagina ALTER COLUMN idrelacion SET DEFAULT nextval('kyron_bloque_pagina_idrelacion_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 59649)
-- Name: id_parametro; Type: DEFAULT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_configuracion ALTER COLUMN id_parametro SET DEFAULT nextval('kyron_configuracion_id_parametro_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 59617)
-- Name: idconexion; Type: DEFAULT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_dbms ALTER COLUMN idconexion SET DEFAULT nextval('kyron_dbms_idconexion_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 59618)
-- Name: id; Type: DEFAULT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_logger ALTER COLUMN id SET DEFAULT nextval('kyron_logger_id_seq'::regclass);


--
-- TOC entry 2027 (class 2604 OID 59619)
-- Name: id_pagina; Type: DEFAULT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_pagina ALTER COLUMN id_pagina SET DEFAULT nextval('kyron_pagina_id_pagina_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 59620)
-- Name: id_subsistema; Type: DEFAULT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_subsistema ALTER COLUMN id_subsistema SET DEFAULT nextval('kyron_subsistema_id_subsistema_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 59621)
-- Name: id_usuario; Type: DEFAULT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_usuario ALTER COLUMN id_usuario SET DEFAULT nextval('kyron_usuario_id_usuario_seq'::regclass);


SET search_path = menu, pg_catalog;

--
-- TOC entry 2048 (class 2604 OID 59839)
-- Name: id_grupo; Type: DEFAULT; Schema: menu; Owner: -
--

ALTER TABLE ONLY grupo ALTER COLUMN id_grupo SET DEFAULT nextval('grupo_id_grupo_seq'::regclass);


--
-- TOC entry 2052 (class 2604 OID 59840)
-- Name: id_item; Type: DEFAULT; Schema: menu; Owner: -
--

ALTER TABLE ONLY item ALTER COLUMN id_item SET DEFAULT nextval('item_id_item_seq'::regclass);


--
-- TOC entry 2055 (class 2604 OID 59841)
-- Name: id_menu; Type: DEFAULT; Schema: menu; Owner: -
--

ALTER TABLE ONLY menu ALTER COLUMN id_menu SET DEFAULT nextval('menu_id_menu_seq'::regclass);


--
-- TOC entry 2056 (class 2604 OID 59842)
-- Name: id_tipo_item; Type: DEFAULT; Schema: menu; Owner: -
--

ALTER TABLE ONLY tipo_item ALTER COLUMN id_tipo_item SET DEFAULT nextval('tipo_item_id_tipo_item_seq'::regclass);


SET search_path = docencia, pg_catalog;

--
-- TOC entry 2248 (class 0 OID 59653)
-- Dependencies: 195
-- Data for Name: comunicacion_corta; Type: TABLE DATA; Schema: docencia; Owner: -
--



--
-- TOC entry 2249 (class 0 OID 59659)
-- Dependencies: 196
-- Data for Name: contexto; Type: TABLE DATA; Schema: docencia; Owner: -
--

INSERT INTO contexto (id_contexto, descripcion) VALUES (0, 'Nacional');
INSERT INTO contexto (id_contexto, descripcion) VALUES (1, 'Internacional');


--
-- TOC entry 2250 (class 0 OID 59665)
-- Dependencies: 197
-- Data for Name: docente; Type: TABLE DATA; Schema: docencia; Owner: -
--

INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('254589', 1, 'ALFARO', 'ECHEVARRIA', 'ANGEL', 'BASILIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('300397', 1, 'ROSARIO', 'MORALES RODRIGUEZ', 'YUDY', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('5247350', 1, 'GOMEZ', 'MORENO', 'PEDRO', 'PABLO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('6808947', 1, 'CANTILLO', 'BLANCO', 'ELIECER', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('11442568', 1, 'VILLAMIL', 'MEDINA', 'CESAR', 'AUGUSTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('16586610', 1, 'DONEYS', '', 'JAIME', 'TORRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('16629380', 1, 'REY', '', 'SANDRO', 'ROMERO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19259731', 1, 'OSORIO', '', 'CARLOS', 'ARAQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19269688', 1, 'ALFEREZ', '', 'NESTOR', 'LAMBULEY', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19288119', 1, 'ASSAD', 'CUELLAR', 'JOSE', 'FELIX', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19311189', 1, 'PENUELA', '', 'JORGE', 'EDILBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19375961', 1, 'MENDEZ', 'BERNAL', 'RAFAEL', 'MAURICIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19410349', 1, 'RAMIREZ', 'TRIANA', 'CAMILO', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19448688', 1, 'CORREDOR', 'VARGAS', 'ALVARO', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19466738', 1, 'FERREIRA', '', 'ANDRES', 'RODRIGUEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19497257', 1, 'GONZALEZ', '', 'FERNEY', 'SHAMBO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('24579306', 1, 'LOPEZ', '', 'ELIZABETH', 'GARAVITO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('35458635', 1, 'ARBELAEZ', 'GRUNNDMAN', 'MARIA', 'JOSE', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('36167952', 1, 'HAKIM', '', 'GENOVEVA', 'SALAZAR', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('39685668', 1, 'GARCIA', 'SCHLEGEL.', 'MARIA', 'TERESA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('39709575', 1, 'BALLEN', '', 'SONIA', 'CASTILLO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51585403', 1, 'VALDERRAMA', 'GIL', 'DILMA', 'JULIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51711342', 1, 'BUSTOS', 'GOMEZ', 'MARTHA', 'LUCIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51722992', 1, 'OSPINA', 'ESPITIA', 'MARTHA', 'ESPERANZA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51832546', 1, 'ORTEGA', 'GARZON', 'SANDRA', 'MARIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51865527', 1, 'MENDEZ', 'PINZON', 'EDNA', 'ROCIO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52045004', 1, 'CACERES', 'RUEDA', 'SANDRA', 'BIBIANA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52073732', 1, 'ORJUELA', 'PARRADO', 'DORIS', 'HELENA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79280228', 1, 'LAMBULEY', 'ALFEREZ', 'EDGAR', 'RICARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79285259', 1, 'PARRA', 'GAITAN', 'RAUL', 'HERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79420258', 1, 'HERNANDEZ', '', 'GUSTAVO', 'SANABRIA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79460073', 1, 'CARDENAS', '', 'RICARDO', 'FORERO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79522574', 1, 'MORALES', '', 'SANTIAGO', 'NINO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79537917', 1, 'CARDENAS', 'GARZON', 'JOHN', 'MARIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79568016', 1, 'HERNANDEZ', 'RODRIGUEZ', 'ALVARO', 'IVAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79638007', 1, 'BARRERA', 'TACHA', 'WILLIAM', 'RICARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79797978', 1, 'CACERES', 'JARAMILLO', 'JUAN', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('89007438', 1, 'JIMENEZ', '', 'GUILLERMO', 'BOCANEGRA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('197446', 1, 'OCHOA', 'CASTILLO', 'CARLOS', 'ORLANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('4235710', 1, 'SANTOYO', 'RENDON', 'JULIO', 'ERNESTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('5937474', 1, 'FLOREZ', 'PEREZ', 'JOSE', 'MANUEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7514128', 1, 'DUARTE', '', 'RICARDO', 'GARCIA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('8682227', 1, 'BUSTAMANTE', 'BOHORQUEZ', 'BORIS', 'RAFAEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('8724617', 1, 'JESUS', 'FERRER FRANCO', 'YURY', 'DE', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('8734136', 1, 'GARY', '', 'MURIEL', 'GARY', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('9534006', 1, 'PEREZ', 'CUBIDES', 'JAVIER', 'ALONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('11437716', 1, 'CASTANEDA', 'PENA', 'HAROLD', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('11438303', 1, 'SERNA', 'DIMAS', 'ADRIAN', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('12119277', 1, 'CALDERON', '', 'OMER', '', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('12124455', 1, 'CAMARGO', '', 'FRANK', 'MOLANO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('13011182', 1, 'GUERRERO', 'RECALDE', 'NESTOR', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('13012390', 1, 'QUINTERO', 'POLO', 'ALVARO', 'HERNAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('16590041', 1, 'FAJARDO', '', 'CARLOS', 'FAJARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19091196', 1, 'CALVO', 'MOZO', 'JULIO', 'CESAR', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19118168', 1, 'DIAZ', '', 'FERNANDO', 'ARANGUREN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19196428', 1, 'GAVIRIA', '', 'ARMANDO', 'GRANDA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19205866', 1, 'HERNANDEZ', 'RODRIGUEZ', 'DANIEL', 'ARTURO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19217540', 1, 'MARTINEZ', 'PARRALES', 'MIGUEL', 'ANGEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19234595', 1, 'CASTILLO', '', 'RIGOBERTO', '', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19255446', 1, 'GUEVARA', 'AMORTEGUI', 'CARLOS', 'ARTURO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19256360', 1, 'PARDO', 'ACOSTA', 'JORGE', 'MANUEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19258804', 1, 'LOPEZ', 'VEGA', 'SEGUNDO', 'ALFONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19273614', 1, 'BETANCOURT', 'GODOY', 'JOSE', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19277095', 1, 'BEJARANO', '', 'JORGE', 'RODRIGUEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19306909', 1, 'SANCHEZ', 'ARDILA', 'JORGE', 'DAVID', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19335474', 1, 'SANCHEZ', 'QUINTERO', 'CARLOS', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19336756', 1, 'ROMERO', 'CRUZ', 'JAIME', 'HUMBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19342408', 1, 'MALDONADO', 'GARCIA', 'MIGUEL', 'ANGEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19346526', 1, 'LURDUY', 'ORTEGON', 'JORGE', 'ORLANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19346572', 1, 'CUNCANCHUN', '', 'FRANCISCO', 'RAMOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19393150', 1, 'LIZARRALDE', 'JARAMILLO', 'MAURICIO', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19405417', 1, 'GOMEZ', 'ESTEBAN', 'JAIRO', 'HERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19427153', 1, 'QUEVEDO', 'CARDENAS', 'LUIS', 'ARMANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19433505', 1, 'PINILLA', 'GONZALEZ', 'JAIRO', 'RICARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19438171', 1, 'MARQUEZ', '', 'ALEJANDRO', 'HURTADO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19446209', 1, 'MASMELA', '', 'PEDRO', 'BAQUERO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19449705', 1, 'ROCHA', 'SALAMANCA', 'PEDRO', 'GERARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19453598', 1, 'ARIAS', 'AVILA', 'NELSON', 'AUGUSTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19474855', 1, 'VILLARRAGA', 'POVEDA', 'LUIS', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19498411', 1, 'PENA', 'PRIETO', 'LUIS', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('20525593', 1, 'LA', 'TORRE DE MANTILLA', 'OMAIRA', 'DE', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('21069836', 1, 'PILAR', 'JARAMILLO MANTILLA', 'MARIA', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('21175244', 1, 'OLARTE', '', 'AMPARO', 'CLAVIJO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('23490618', 1, 'GARCIA', 'SANCHEZ', 'BARBARA', 'YADIRA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('23495318', 1, 'GUERRERO', 'NIETO', 'CARMEN', 'HELENA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('23554403', 1, 'BERDUGO', '', 'CECILIA', 'RINCON', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('29462640', 1, 'ALARCON', '', 'ISABEL', 'BORJA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('30206629', 1, 'DUARTE', '', 'ELIANA', 'GARZON', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('31906885', 1, 'SOCORRO', 'JUTINICO FERNANDEZ', 'MARIA', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('32787844', 1, 'MENDEZ', 'RIVERA', 'PILAR', 'ESTHER', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('34981544', 1, 'PAEZ', 'MADERA', 'MEYRA', 'JUDITH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('38280216', 1, 'DEVIA', 'CASTILLO', 'BEATRIZ', 'OFELIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('39534107', 1, 'ARIZA', 'HERNANDEZ', 'NOHORA', 'PATRICIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('39717991', 1, 'CELIS', '', 'OMAYRA', 'TAPIERO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('39757077', 1, 'TORRES', 'GARAY', 'ISABEL', 'MERCEDES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('39761555', 1, 'VELASCO', 'FORERO', 'MARTHA', 'JANETH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('40033593', 1, 'BOHORQUEZ', '', 'YOLANDA', 'SAMACA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41467889', 1, 'DELGADO', 'FAJARDO', 'BERTA', 'INES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41494276', 1, 'ORTIZ', 'MOLINA', 'BLANCA', 'INES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41572835', 1, 'QUINONEZ', 'RODRIGUEZ', 'MARIA', 'ARACELY', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41574277', 1, 'HEREDIA', '', 'NEILA', 'SANCHEZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41581908', 1, 'RINCON', 'MUNOZ', 'FLOR', 'ANGELA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41609727', 1, 'MORENO', 'DURAN', 'CARMEN', 'HELENA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41635492', 1, 'BARRIGA', '', 'MARTHA', 'LUCIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41636318', 1, 'RAMIREZ', '', 'MARITZA', 'PINZON', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41682394', 1, 'ECHANDIA', '', 'CLAUDIA', 'PIEDRAHITA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41686929', 1, 'MANTILLA', '', 'LUCIA', 'PINTO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41724424', 1, 'BONILLA', '', 'NANCY', 'GOMEZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41747221', 1, 'PARDO', '', 'PIEDAD', 'RAMIREZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41937510', 1, 'TREJOS', 'ANGEL', 'DECCY', 'JANETH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('43586042', 1, 'BOTHERT', 'ORTIZ', 'KARINA', 'CLAUDIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51577649', 1, 'LEON', 'CORREDOR', 'OLGA', 'LUCIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51581998', 1, 'MUNAR', '', 'MARGOTH', 'GUZMAN', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51606049', 1, 'MEJIA', '', 'MARIETA', 'QUINTERO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51609317', 1, 'VILLARREAL', 'GIL', 'ELDA', 'JANNETH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51664884', 1, 'ORTIZ', 'SANCHEZ', 'LUZ', 'MARYLIN', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51666199', 1, 'RUBIANO', 'ZORNOSA', 'CLARA', 'INES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51694974', 1, 'CALDERON', '', 'DORA', 'INES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51696154', 1, 'FAJARDO', '', 'ADIS', 'AYALA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51713373', 1, 'GUZMAN', '', 'BETTY', 'SANDOVAL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51721199', 1, 'GARCIA', 'RIOS', 'DIANA', 'PATRICIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51772712', 1, 'RIOS', '', 'LYDA', 'MOJICA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51782406', 1, 'MARTINEZ', 'RIVERA', 'CARMEN', 'ALICIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51808679', 1, 'VALENCIA', '', 'ASTRID', 'RAMIREZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51810666', 1, 'SANTANA', 'GAITAN', 'LUISA', 'CARLOTA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51810667', 1, 'CHAVES', '', 'DIANA', 'GIL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51838555', 1, 'CASTRO', 'BARBOSA', 'SOL', 'MERCEDES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51882328', 1, 'VASQUEZ', '', 'RUTH', 'MOLINA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51891092', 1, 'BORJA', 'OROZCO', 'MIRIAN', 'GLIDIS', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51899150', 1, 'QUITIAN', 'BERNAL', 'SANDRA', 'PATRICIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51910071', 1, 'CASTILLO', 'HERNANDEZ', 'ADRIANA', 'ESTHER', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51918736', 1, 'CASTILLO', '', 'SANDRA', 'SOLER', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51919104', 1, 'RODRIGUEZ', 'PIZZINATO', 'LILIANA', 'ANGELICA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51946252', 1, 'LACHE', '', 'NUBIA', 'MORENO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51951480', 1, 'DELGADILLO', 'CELY', 'INGRID', 'SISSY', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51952467', 1, 'VARGAS', 'TORRES', 'MARGARITA', 'ROSA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51973513', 1, 'PILAR', 'INFANTE LUNA', 'ESPERANZA', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51979635', 1, 'ZAMUDIO', 'RODRIGUEZ', 'CARMEN', 'ROSA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51982893', 1, 'SOCORRO', 'DAZA ARDILA', 'DIANA', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51993911', 1, 'ALFONSO', '', 'ADRIANA', 'GORDILLO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52032337', 1, 'CASTIBLANCO', 'ABRIL', 'OLGA', 'LUCIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52035695', 1, 'ALVAREZ', '', 'GLORIA', 'ROJAS', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52048952', 1, 'CARMEN', 'OLAYA LEON', 'ALBA', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52108111', 1, 'NOGUERA', '', 'YAMILET', 'ANGULO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52118512', 1, 'UZETA', '', 'CAROLINA', 'MARTINEZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52118853', 1, 'RUIZ', 'PACHECO', 'NELLY', 'JANNETH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52185597', 1, 'BONILLA', 'MEDINA', 'SANDRA', 'XIMENA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52205136', 1, 'MONCADA', 'CARDENAS', 'LILIA', 'BIBIANA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52242740', 1, 'VARGAS', '', 'VERONICA', 'CIFUENTES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52376700', 1, 'LANDAZABAL', 'CUERVO', 'DIANA', 'PATRICIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52415452', 1, 'MUNOZ', 'ALBARRACIN', 'LIZ', 'MAYOLY', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52844857', 1, 'GOMEZ', 'NAVAS', 'DIANA', 'MARCELA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52911038', 1, 'SANCHEZ', 'ROBAYO', 'BRIGITTE', 'JOHANNA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('53097588', 1, 'NARVAEZ', 'ORTIZ', 'DEISSY', 'MILENA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('65739917', 1, 'POSADA', 'ORTIZ', 'JULIA', 'ZORAIDA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('71576310', 1, 'GOMEZ', 'DUQUE', 'JORGE', 'EVELIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('71694410', 1, 'AGUDELO', 'COLORADO', 'ELKIN', 'DARIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('73147234', 1, 'FERNANDEZ', '', 'ALEJANDRO', 'MCNEIL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79040298', 1, 'NINO', 'GALEANO', 'GERMAN', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79136697', 1, 'ORTIZ', 'SALAMANCA', 'HENRY', 'MAURICIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79159246', 1, 'GARZON', 'CHIRIVI', 'OMAR', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79161764', 1, 'FORERO', 'CHACON', 'NELSON', 'LIBARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79211385', 1, 'GARCIA', '', 'ALEXANDER', 'GARCIA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79216811', 1, 'RODRIGUEZ', '', 'GIOVANNY', 'CARDONA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79243024', 1, 'AMAYA', '', 'GUILLERMO', 'FONSECA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79283463', 1, 'FIERRO', '', 'RAFAEL', 'MARROQUIN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79296179', 1, 'MOSQUERA', 'SUAREZ', 'CARLOS', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79300908', 1, 'RAMIREZ', '', 'ANTONIO', 'QUINTANA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79311460', 1, 'AMAYA', '', 'TOMAS', 'SANCHEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79327682', 1, 'NOVOA', 'PATINO', 'JOSE', 'BENEDICTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79330128', 1, 'GARCIA', 'SANCHEZ', 'LUIS', 'CARLOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79335447', 1, 'ACOSTA', 'GEMPELER', 'MARTIN', 'EDWARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79339398', 1, 'CASTRILLON', 'CARDONA', 'WILLIAM', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79339447', 1, 'BRICENO', '', 'ORLANDO', 'SILVA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79356009', 1, 'CASTANEDA', '', 'SERGIO', 'BRICENO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79365714', 1, 'DIAZ', 'SOLER', 'CARLOS', 'GILMAR', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79367999', 1, 'CASTILLO', '', 'MARIO', 'MONTOYA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79382488', 1, 'RODRIGUEZ', 'RODRIGUEZ', 'HUMBERTO', 'ALEXIS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79410860', 1, 'BOLANOS', '', 'ABELARDO', 'RODRIGUEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79411667', 1, 'REYES', 'RONCANCIO', 'JAIME', 'DUVAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79457686', 1, 'ARIAS', 'GOMEZ', 'DIEGO', 'HERNAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79481574', 1, 'MARTINEZ', '', 'ALVARO', 'GARCIA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79503765', 1, 'MASMELA', 'CAITA', 'LUIS', 'ALEJANDRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79533899', 1, 'MARTINEZ', '', 'HANZ', 'PLATA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79546301', 1, 'BECERRA', '', 'ABSALON', 'JIMENEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79567865', 1, 'BOHORQUEZ', 'ARENAS', 'LUIS', 'ANGEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79568999', 1, 'GONZALEZ', 'MELO', 'HAMLET', 'SANTIAGO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79582659', 1, 'BELTRAN', 'RIANO', 'DANIEL', 'ERNESTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79590698', 1, 'BELTRAN', 'GUTIERREZ', 'HECTOR', 'EDWIN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79593951', 1, 'DUARTE', '', 'JOSE', 'TORRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79610470', 1, 'HERRENO', 'FIERRO', 'CESAR', 'AURELIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79627246', 1, 'ORTIZ', '', 'GABRIEL', 'MANCERA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79655066', 1, 'AMADOR', '', 'JUAN', 'CARLOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79688416', 1, 'BLANCO', 'SUAREZ', 'JORGE', 'ORLANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79688945', 1, 'GARCIA', 'DUSSAN', 'EDER', 'ALEXANDER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79844451', 1, 'SALAMANCA', 'BERNAL', 'JULIAN', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79858959', 1, 'CAMELO', 'BUSTOS', 'FRANCISCO', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79945743', 1, 'PAEZ', 'RODRIGUEZ', 'JOHN', 'JAIRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79986048', 1, 'ESPITIA', '', 'EDWIN', 'MUNEVAR', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80020955', 1, 'SANJUAN', 'CUELLAR', 'ALVARO', 'ARTURO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80067185', 1, 'CASTIBLANCO', 'ROLDAN', 'ANDRES', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80216526', 1, 'BELLO', 'CHAVEZ', 'JHON', 'HELVER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('86039591', 1, 'ROMERO', 'REY', 'JULIO', 'HERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('88139621', 1, 'CAUSADO', '', 'RODOLFO', 'VERGEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('88278955', 1, 'JACOME', 'MUNOZ', 'CARLOS', 'EFRAIN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('91291766', 1, 'PEREA', 'ACEVEDO', 'ADRIAN', 'JOSE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('91462820', 1, 'FERNANDEZ', '', 'RUBEN', 'MUNOZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('93360324', 1, 'VARGAS', 'MANRIQUE', 'PEDRO', 'JOSE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('197019', 1, 'PEREZ', 'CASTILLO', 'JOSE', 'NELSON', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('268856', 1, 'GOMEZ', 'PAREDES', 'JUAN', 'CARLOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('3228052', 1, 'MENDOZA', 'PROIESSENG', 'CARLOS', 'LEONARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('3228510', 1, 'CASTELLANOS', 'GARCIA', 'CESAR', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('4242702', 1, 'MEDINA', 'GARCIA', 'VICTOR', 'HUGO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('5638393', 1, 'LIZARAZO', 'SALCEDO', 'IVAN', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7164610', 1, 'CARDENAS', 'QUINTERO', 'BEITTMAN', 'GEOVANNY', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7181718', 1, 'GAONA', 'BARRERA', 'ANDRES', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7314677', 1, 'ALARCON', 'VILLAMIL', 'JORGE', 'ALEXANDER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7724669', 1, 'PERDOMO', 'CHARRY', 'CESAR', 'ANDREY', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('9074120', 1, 'PENARETE', '', 'JAIRO', 'GONZALEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('9395122', 1, 'NOSSA', '', 'LEONARDO', 'PLAZAS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('11077061', 1, 'RICO', '', 'MIGUEL', 'ESPITIA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('11343316', 1, 'CASTANEDA', 'FANDINO', 'JOSE', 'IGNACIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('11377750', 1, 'VARGAS', 'HEREDIA', 'TITO', 'ERNESTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('12237136', 1, 'BOLANOS', 'CASTRO', 'SANDRO', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('17163056', 1, 'MONTOYA', '', 'ORLANDO', 'MARTINEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('17192344', 1, 'CANCINO', 'DE GREIFF', 'HECTOR', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19053960', 1, 'GARCIA', 'SUAREZ', 'JULIO', 'CESAR', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19110045', 1, 'MARTIN', 'SANTAMARIA', 'LUIS', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19123015', 1, 'ANGULO', 'CHAVARRO', 'JAIME', 'HUMBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19125126', 1, 'BENITEZ', 'FORERO', 'JAIME', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19165408', 1, 'OSORIO', '', 'EDMUNDO', 'VEGA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19204484', 1, 'GUTIERREZ', 'RAMIREZ', 'HUMBERTO', 'HERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19219119', 1, 'CARVAJAL', '', 'HERNANDO', 'ACUNA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19228296', 1, 'NAVARRETE', 'LOPEZ', 'ABEL', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19235204', 1, 'RAMIREZ', 'RAMOS', 'CARLOS', 'GERMAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19241728', 1, 'PARADA', '', 'FERNANDO', 'LEON', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19259014', 1, 'SANABRIA', 'DUQUE', 'MARCO', 'ALVARO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19267731', 1, 'ARNEDO', 'GONZALEZ', 'LUIS', 'RAUL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19268902', 1, 'PENA', 'RODRIGUEZ', 'JAIME', 'HERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19275313', 1, 'ARANGO', '', 'GILBERTO', 'ENCINALES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19279196', 1, 'CAMACHO', '', 'RIGOBERTO', 'QUINTERO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19289020', 1, 'CARDENAS', 'CASTIBLANCO', 'JOSE', 'ROBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19299110', 1, 'SALINAS', 'BERMUDEZ', 'CESAR', 'AUGUSTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19308520', 1, 'FLOREZ', 'BAEZ', 'JULIO', 'CESAR', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19308787', 1, 'DEAZA', 'RINCON', 'PEDRO', 'IGNACIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19316812', 1, 'HERRERA', 'GARCIA', 'RODRIGO', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19328698', 1, 'MONTENEGRO', 'SALCEDO', 'LUIS', 'EMILIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19331673', 1, 'TORRES', 'ACOSTA', 'JAIRO', 'HUMBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19348975', 1, 'AYA', 'BAQUERO', 'HUGO', 'LIBARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19354498', 1, 'SARTA', 'FUENTES', 'JOSE', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19373890', 1, 'JESUS', 'PATERNINA ANAYA', 'JOSE', 'DE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19378504', 1, 'S‚AREZ', 'FAJARDO', 'CARLOS', 'ARTURO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19402686', 1, 'S‚AREZ', 'PARRA', 'CESAR', 'AUGUSTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19417230', 1, 'SORIANO', 'MENDEZ', 'JOSE', 'JAIRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19422121', 1, 'TORRES', 'COLMENARES', 'OSCAR', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19432914', 1, 'MARTINEZ', '', 'ORLANDO', 'VILLANUEVA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19437829', 1, 'RIANO', '', 'ALEJANDRO', 'SILVA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19483708', 1, 'ORTEGA', '', 'ALVARO', 'ESPINEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19483959', 1, 'LOPEZ', '', 'ALBERTO', 'ACOSTA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('23350114', 1, 'ELIZALDE', '', 'ISABEL', 'ESCOBAR', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('23493588', 1, 'PENA', 'REYES', 'ANA', 'MARIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('35477204', 1, 'GALLEGO', 'TORRES', 'ADRIANA', 'PATRICIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('38252071', 1, 'GIRALDO', 'MONCALEANO', 'LAURA', 'MARCELA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41574857', 1, 'BONILLA', 'ROMERO', 'CLARA', 'INES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41765378', 1, 'CARMEN', 'ORDONEZ SALINAS', 'SONIA', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('45455721', 1, 'PORRAS', '', 'ALEXANDRA', 'ABUCHAR', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51551021', 1, 'MUNOZ', 'GARZON', 'MABEL', 'RUBIELA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51568897', 1, 'BAYONA', '', 'ZULIMA', 'ORTIZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51593752', 1, 'PILAR', 'BOHORQUEZ JIMENEZ', 'MARIA', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51610577', 1, 'ROCHA', 'SALAMANCA', 'LUZ', 'ANGELA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51653275', 1, 'NEIRA', 'SANABRIA', 'GLORIA', 'INES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51703985', 1, 'APARICIO', 'PICO', 'LILIA', 'EDITH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51740903', 1, 'BLANCO', '', 'FABIOLA', 'SAENZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51766077', 1, 'NIETO', 'LEMUS', 'ALBA', 'CONSUELO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51821928', 1, 'ALVARADO', 'NIETO', 'LUZ', 'DEICY', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51822635', 1, 'BEJARANO', 'GARZON', 'LILIAN', 'ASTRID', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51903175', 1, 'CALDERON', '', 'MARIA', 'EUGENIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51935901', 1, 'AMADO', '', 'MYRIAM', 'MORENO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51978494', 1, 'VEGA', 'ESCOBAR', 'ADRIANA', 'MARCELA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52083089', 1, 'ROA', '', 'CARMENZA', 'MORENO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52085662', 1, 'GARCIA', 'MIRANDA', 'DIANA', 'STELLA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52103956', 1, 'OSPINA', 'TORRES', 'MARTHA', 'RUTH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52116530', 1, 'AMAYA', 'BARRERA', 'EDILMA', 'ISABEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52204982', 1, 'JARAMILLO', 'MORENO', 'BEATRIZ', 'ELISA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52223898', 1, 'LOPEZ', '', 'KARINA', 'MANRIQUE', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52310001', 1, 'BOHORQUEZ', 'AREVALO', 'LUZ', 'ESPERANZA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52379603', 1, 'GOMEZ', '', 'YENNY', 'ESPINOSA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52478481', 1, 'CAMARGO', 'CASALLAS', 'LUZ', 'HELENA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52532855', 1, 'POMAR', '', 'LINDSAY', 'ALVAREZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52833443', 1, 'UPEGUI', 'CARDONA', 'ERIKA', 'SOFIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52961466', 1, 'OVALLE', 'MARTINEZ', 'DIANA', 'MARCELA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('60261576', 1, 'GELVEZ', 'GARCIA', 'NANCY', 'YANETH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('63316139', 1, 'MARIA', 'UMANA VILLAMIZAR', 'FLOR', 'DE', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('74184661', 1, 'PUERTO', 'LEGUIZAMON', 'GUSTAVO', 'ADOLFO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('74301090', 1, 'POVEDA', 'ZAFRA', 'JOSE', 'NOE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('74371532', 1, 'FUENTES', 'LOPEZ', 'HECTOR', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('74373175', 1, 'VARGAS', '', 'ERNESTO', 'GOMEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('74373323', 1, 'ESPITIA', 'CUCHANGO', 'HELBERT', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79045647', 1, 'RODRIGUEZ', 'BERNAL', 'LUIS', 'LEONARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79100377', 1, 'VEGA', '', 'ANSELMO', 'VEGA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79148264', 1, 'LOPEZ', 'BELLO', 'CESAR', 'AMILCAR', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79270174', 1, 'ORJUELA', 'CASTRO', 'JAVIER', 'ARTURO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79293930', 1, 'PALACIOS', 'OSMA', 'JOSE', 'IGNACIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79297396', 1, 'MENDEZ', 'GIRALDO', 'GERMAN', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79319014', 1, 'RODRIGUEZ', '', 'FERNANDO', 'MARTINEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79339719', 1, 'GARZON', 'VELANDIA', 'RAFAEL', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79367935', 1, 'ORTIZ', 'DAVILA', 'ALVARO', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79368729', 1, 'HERRERA', 'ESCORCIA', 'JOSE', 'LUIS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79370039', 1, 'ROZO', 'GARCIA', 'PABLO', 'EMILIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79390069', 1, 'VALERO', 'MEDINA', 'JOSE', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79391646', 1, 'REAL', 'FLOREZ', 'GUILLERMO', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79397454', 1, 'AVILA', '', 'MIGUEL', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79406007', 1, 'HURTADO', '', 'ORLANDO', 'GARCIA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79425787', 1, 'SALAMANCA', 'CESPEDES', 'JORGE', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79432645', 1, 'TOCASUCHE', 'GONZALEZ', 'HELVER', 'RICARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79454547', 1, 'HURTADO', 'BETANCOURTH', 'JUAN', 'CARLOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79456915', 1, 'GONZALEZ', 'RODRIGUEZ', 'IVAN', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79471198', 1, 'NAVARRO', '', 'FRANCISCO', 'ZAMORA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79472540', 1, 'COMBITA', 'ALFONSO', 'LUIS', 'FRANCISCO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79493825', 1, 'PEREZ', 'CARVAJAL', 'EDWIN', 'ROBERT', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79508767', 1, 'SALCEDO', 'PARRA', 'OCTAVIO', 'JOSE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79520115', 1, 'TOLEDO', 'BUENO', 'CARLOS', 'AUGUSTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79521015', 1, 'CANO', 'RUEDA', 'JUAN', 'CARLOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79537607', 1, 'REINA', 'RODRIGUEZ', 'CARLOS', 'ARTURO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79553193', 1, 'MUNOZ', 'QUINONES', 'GERARDO', 'ALCIDES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79560853', 1, 'CAMARGO', 'LOPEZ', 'JULIAN', 'ROLANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79563205', 1, 'POVEDA', 'CHAVES', 'ROBERTO', 'MANUEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79571941', 1, 'TARAZONA', 'BERMUDEZ', 'GIOVANNY', 'MAURICIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79572003', 1, 'MEDINA', 'DAZA', 'RUBEN', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79591170', 1, 'MELO', 'MARTINEZ', 'CARLOS', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79647592', 1, 'SANCHEZ', 'CESPEDES', 'JUAN', 'MANUEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79655614', 1, 'FLOREZ', 'CEDIEL', 'OSCAR', 'DAVID', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79657603', 1, 'ESCOBAR', '', 'ROBERTO', 'FERRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79671115', 1, 'RODRIGUEZ', 'MOLANO', 'JOSE', 'IGNACIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79698280', 1, 'LOPEZ', 'SARMIENTO', 'DANILO', 'ALFONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79702248', 1, 'ROMERO', 'VILLALOBOS', 'OSWALDO', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79708124', 1, 'CORONADO', 'SANCHEZ', 'PAULO', 'CESAR', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79752717', 1, 'CONTRERAS', '', 'ANDRES', 'CARDENAS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79753365', 1, 'TORRES', '', 'EDILBERTO', 'S‚AREZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79754586', 1, 'MONCADA', 'SANCHEZ', 'JAVIER', 'FELIPE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79757342', 1, 'ROJAS', 'GALEANO', 'SERGIO', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79790857', 1, 'TRISTANCHO', 'ORTIZ', 'JULIAN', 'ALFONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79792252', 1, 'GAMBA', '', 'WILSON', 'DIAZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79839336', 1, 'DIAZ', 'FORERO', 'JHON', 'HERNAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79853581', 1, 'PIEDRAHITA', '', 'FRANCISCO', 'SANTAMARIA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79858818', 1, 'CASTRO', 'ORTEGA', 'CARLOS', 'HERNAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79863843', 1, 'GUACANEME', 'MORENO', 'JAVIER', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79865119', 1, 'NARVAEZ', 'CUBILLOS', 'EIDER', 'ALEXANDER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79866835', 1, 'VELANDIA', '', 'JULIO', 'BARON', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79940535', 1, 'CAVIEDES', 'AGUDELO', 'CARLOS', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79942070', 1, 'VARGAS', 'TAMAYO', 'LUIS', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79943556', 1, 'PAVA', 'DIAZ', 'ROBERTO', 'ALBEIRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79950025', 1, 'GAONA', 'GARCIA', 'ELVIS', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79973967', 1, 'FIGUEROA', 'GARCIA', 'JUAN', 'CARLOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79974515', 1, 'MELGAREJO', 'REY', 'MIGUEL', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80033827', 1, 'LOPEZ', 'CHAVEZ', 'HANS', 'IGOR', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80038171', 1, 'HERNANDEZ', 'MORA', 'JOHANN', 'ALEXANDER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80052469', 1, 'TRUJILLO', 'RODRIGUEZ', 'CESAR', 'LEONARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80092512', 1, 'GAONA', 'GARCIA', 'PAULO', 'ALONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80093200', 1, 'MONTENEGRO', 'MARIN', 'CARLOS', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80158457', 1, 'ROJAS', 'CUBIDES', 'HELBERT', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80235048', 1, 'RODRIGUEZ', 'PATARROYO', 'DIEGO', 'JULIAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80264735', 1, 'DIOSA', '', 'HENRY', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80757372', 1, 'RUEDA', 'VELASCO', 'FEIZAR', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80857171', 1, 'DIAZ', 'ALDANA', 'NELSON', 'LEONARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('86052448', 1, 'HERRERA', 'CUBIDES', 'JHON', 'FRANCINED', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('91013827', 1, 'AVELLANEDA', '', 'ALFI', 'JIMENEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('91238598', 1, 'TRUJILLO', '', 'EDWIN', 'RIVAS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('92530374', 1, 'CONTRERAS', 'BRAVO', 'LEONARDO', 'EMIRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('93401117', 1, 'CASTILLO', 'MENDEZ', 'LUIS', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('93414671', 1, 'VERA', 'PARRA', 'NELSON', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('94331274', 1, 'JARAMILLO', 'MATTA', 'ADOLFO', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('1033687596', 1, 'LOPEZ', 'SANTANA', 'EDUYN', 'RAMIRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('2470624', 1, 'URIBE', '', 'EDISON', '', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('6761520', 1, 'GIL', 'MOLINA', 'MARTIN', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('6773087', 1, 'GONZALEZ', 'VERGARA', 'CARLOS', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('9522644', 1, 'PIRAGAUTA', 'AGUILAR', 'MIGUEL', 'ANGEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('9525297', 1, 'BOTIA', '', 'FABIO', 'LOPEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('10237637', 1, 'CASTILLO', 'PINILLA', 'ALVARO', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('11436099', 1, 'GARCIA', '', 'HELMUT', 'ESPINOSA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('12969124', 1, 'RODRIGUEZ', '', 'JAYERTH', 'GUERRA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('13170456', 1, 'PATINO', 'PEREZ', 'RAUL', 'ORLANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('13259848', 1, 'PENARANDA', 'OSORIO', 'CAUDEX', 'VITELIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('13870221', 1, 'VALERO', 'FANDINO', 'JORGE', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('13925626', 1, 'ROZO', 'ALVAREZ', 'CARLOS', 'YESID', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('14235383', 1, 'BAQUERO', '', 'ISMAEL', 'OSORIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('16258051', 1, 'VALENCIA', 'MONEDERO', 'CARLOS', 'HERNAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('17354512', 1, 'BAUTISTA', 'HERRERA', 'HAYDER', 'O.', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19128837', 1, 'GUTIERREZ', '', 'ELADIO', 'REY', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19204617', 1, 'LADINO', 'PERALTA', 'RAFAEL', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19207999', 1, 'CARRENO', '', 'ALVARO', 'CARRENO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19219037', 1, 'MEJIA', '', 'GUSTAVO', 'CHACON', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19227352', 1, 'CEPEDA', 'RENDON', 'JOSE', 'MIGUEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19231419', 1, 'HERNANDEZ', 'ROJAS', 'LUIS', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19236093', 1, 'ESPINOSA', '', 'EDGAR', 'LOZANO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19260579', 1, 'GUTIERREZ', 'DAZA', 'TITO', 'ERNESTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19270881', 1, 'BELTRAN', 'VARGAS', 'JULIO', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19287751', 1, 'SANCHEZ', 'BUENDIA', 'EDGAR', 'EMILIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19310358', 1, 'PENARANDA', 'GALVIS', 'VIDAL', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19333154', 1, 'GUTIERREZ', '', 'NESTOR', 'SERGIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19349320', 1, 'CARDENAS', 'LEON', 'JORGE', 'ALONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19350861', 1, 'MELO', '', 'ORLANDO', 'RIANO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19352582', 1, 'CALDERON', 'MARTINEZ', 'FERNANDO', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19360418', 1, 'NARANJO', 'LASSO', 'DANNY', 'ORLANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19380272', 1, 'NINO', '', 'EDILBERTO', 'NINO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19420950', 1, 'THIRIAT', '', 'WILSON', 'GORDILLO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19440276', 1, 'CADENA', '', 'GERMAN', 'TORRIJOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19451396', 1, 'ALVAREZ', '', 'ALFONSO', 'PAZOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19461648', 1, 'MORA', 'PENAGOS', 'WILLIAM', 'MANUEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19476164', 1, 'CASTELLANOS', '', 'ORLANDO', 'RODRIGUEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19481982', 1, 'SANCHEZ', '', 'FERNANDO', 'SANCHEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19489088', 1, 'LEAL', 'PULIDO', 'ROBERT', 'ORLANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('22807498', 1, 'MEJIA', 'DE ALBA', 'MARTHA', 'ISABEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('35500902', 1, 'ALDANA', 'BOUTIN', 'ROSE', 'MARIE', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('38240308', 1, 'DIAZ', 'LOZANO', 'AURA', 'YOLANDA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('40026493', 1, 'MOJICA', 'HERNANDEZ', 'MARTHA', 'LUCIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('40370518', 1, 'MORENO', 'AGUILAR', 'RUTH', 'MIRIAM', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('40924205', 1, 'MELO', 'BRITO', 'NADENKA', 'BEATRIZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41699620', 1, 'PALACIOS', 'PALACIOS', 'OLGA', 'ISABEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('43497775', 1, 'CARDONA', 'LONDONO', 'CLAUDIA', 'MARIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('45451853', 1, 'CARMEN', 'AGUALIMPIA DUALIBY', 'YOLIMA', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51553994', 1, 'CASTRO', '', 'EDITH', 'ALAYON', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51677301', 1, 'MONTANA', '', 'VILMA', 'HERNANDEZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51678774', 1, 'HERNANDEZ', 'PENA', 'YOLANDA', 'TERESA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51766603', 1, 'GUTIERREZ', 'SARMIENTO', 'MARTHA', 'CECILIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51768982', 1, 'ACOSTA', 'PENALOZA', 'GLORIA', 'STELLA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51774980', 1, 'PULIDO', 'RODRIGUEZ', 'ESPERANZA', 'NANCY', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51882764', 1, 'PINZON', '', 'JANETH', 'PARDO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51947405', 1, 'GALVIS', 'LAGOS', 'MARIA', 'FERNANDA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51967452', 1, 'GACHARNA', 'H.', 'ESPERANZA', 'CALDERON', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51974018', 1, 'GODOY', 'MORALES', 'OLGA', 'LUCIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51978212', 1, 'WILCHES', 'FLOREZ', 'ANGELA', 'MARIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51985431', 1, 'CARDENAS', 'TORRES', 'LUZ', 'FABIOLA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52006591', 1, 'BELTRAN', 'PENA', 'NUBIA', 'JANETH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52028537', 1, 'PARSONS', 'DELGADO', 'ASTRID', 'XIMENA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52144018', 1, 'BOTIA', 'FLECHAS', 'CLARA', 'JUDITH', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52154118', 1, 'VILLARRAGA', 'FLOREZ', 'LYZ', 'FARLEIDY', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52216615', 1, 'RIVERA', '', 'MARIBEL', 'PINILLA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52527490', 1, 'BONZA', 'PEREZ', 'NYRIA', 'PASTORA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52622477', 1, 'ROSSELLI', '', 'ANGELA', 'PARRADO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52646311', 1, 'GONZALEZ', 'RAMIREZ', 'LUISA', 'FERNANDA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52710194', 1, 'ECHEVERRY', 'PRIETO', 'LENA', 'CAROLINA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('72302730', 1, 'RODRIGUEZ', 'MIRANDA', 'JUAN', 'PABLO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('74300954', 1, 'GARCIA', 'REYES', 'MIGUEL', 'ANGEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('75066443', 1, 'FLOREZ', 'MORENO', 'CARLOS', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79045552', 1, 'ORTIZ', 'QUINTERO', 'LUIS', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79207497', 1, 'BUSTOS', 'VELAZCO', 'EDIER', 'HERNAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79257588', 1, 'CANO', '', 'RAFAEL', 'BAUTISTA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79273865', 1, 'LEGUIZAMO', '', 'HUMBERTO', 'VALBUENA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79276643', 1, 'CANTILLO', 'HIGUERA', 'EDGAR', 'ERNESTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79290728', 1, 'FAJARDO', '', 'NELSON', 'RAUL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79303780', 1, 'AGUDELO', 'GOMEZ', 'NESTOR', 'GUSTAVO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79354423', 1, 'TRIANA', 'GOMEZ', 'MAX', 'ALEJANDRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79357153', 1, 'PATINO', 'SILVA', 'OMAR', 'FRANCISCO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79374419', 1, 'BELTRAN', '', 'JAIR', 'PRECIADO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79396653', 1, 'CORRADINE', 'MORA', 'DIEGO', 'TOMAS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79398855', 1, 'AVELLA', 'GUZMAN', 'OSCAR', 'RENE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79418769', 1, 'VALBUENA', '', 'CESAR', 'GARCIA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79483026', 1, 'MANOSALVA', '', 'EDINSON', 'ANGARITA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79490190', 1, 'BERNAL', 'SUAREZ', 'NESTOR', 'RICARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79494815', 1, 'FERNANDEZ', 'GOMEZ', 'WILMAR', 'DARIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79497472', 1, 'LAGOS', 'CABALLERO', 'JESUS', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79497552', 1, 'RODRIGUEZ', 'ROJAS', 'CARLOS', 'ALFREDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79497562', 1, 'CAMACHO', '', 'RENE', 'LOPEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79505180', 1, 'MORENO', 'GUTIERREZ', 'JAIME', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79512283', 1, 'PUENTES', '', 'ROBINSON', 'QUINTANA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79537982', 1, 'VERGEL', '', 'OSCAR', 'HURTADO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79558538', 1, 'ALARCON', 'HINCAPIE', 'JUAN', 'CARLOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79558986', 1, 'SARMIENTO', '', 'EDILBERTO', 'SARMIENTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79601302', 1, 'FRANCO', '', 'HELVAR', 'RODOLFO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79609726', 1, 'PINZON', 'CASALLAS', 'WILSON', 'J.', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79623199', 1, 'QUIJANO', 'WILCHES', 'LUIS', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79640012', 1, 'MARTINEZ', 'ABELLO', 'JAIRO', 'MIGUEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79640469', 1, 'CORDOBA', '', 'ZAMIR', 'MATURANA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79642535', 1, 'BOGOTA', 'ANGEL', 'RAUL', 'GIOVANNY', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79656850', 1, 'MURAD', 'PEDRAZA', 'JOSE', 'ALEJANDRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79721124', 1, 'POLANCO', 'TAPIA', 'CESAR', 'AUGUSTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79756506', 1, 'GUZMAN', 'AVENDANO', 'ANTONIO', 'JOSE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79794356', 1, 'USSA', 'GARZON', 'JAIME', 'EDDY', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79873683', 1, 'BARRAGAN', 'ZAQUE', 'WILLIAM', 'BENIGNO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79892283', 1, 'VARGAS', 'VARGAS', 'WILSON', 'ERNESTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79904224', 1, 'LARA', '', 'YEFER', 'ASPRILLA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80234909', 1, 'ARIZA', 'CORTES', 'WILLIAM', 'GILBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80268588', 1, 'BONILLA', 'ROMERO', 'JULIO', 'HERNAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80374502', 1, 'VILLALBA', '', 'MARIO', 'RINCON', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80880637', 1, 'ALVARADO', 'TORRES', 'JHON', 'EDISSON', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('86002561', 1, 'ROJAS', '', 'LINDON', 'CARVAJAL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('88154173', 1, 'LIZCANO', 'CARO', 'JOSE', 'ANDELFO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('88233355', 1, 'RONDON', 'QUINTANA', 'HUGO', 'ALEXANDER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('91012707', 1, 'RODRIGUEZ', '', 'CARLOS', 'DIAZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('91157701', 1, 'ZAFRA', 'MEJIA', 'CARLOS', 'ALFONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('93401747', 1, 'GUTIERREZ', 'MALAXECHEBARRIA', 'ALVARO', 'MARTIN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('94322033', 1, 'CASTRO', 'LOPEZ', 'WILLIAM', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('265313', 1, 'POPOVA', '', 'MIRNA', 'JIRON', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('3182871', 1, 'PORRAS', 'BOADA', 'RICARDO', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('3225689', 1, 'HERNANDEZ', 'PARDO', 'JORGE', 'ADELMO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('3242496', 1, 'PINZON', 'LOPEZ', 'HECTOR', 'ALFONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('4251239', 1, 'CORREA', 'MURILLO', 'LUIS', 'HERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('5824376', 1, 'DIAZ', '', 'ANDRES', 'ESCOBAR', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('6774454', 1, 'PRIETO', '', 'WILMAN', 'MUNOZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('6816778', 1, 'ARRIETA', '', 'THOMAS', 'VASQUEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7161428', 1, 'REYES', 'MOZO', 'JOSE', 'VICENTE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7165116', 1, 'RODRIGUEZ', 'RODRIGUEZ', 'JORGE', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7168268', 1, 'LEGUIZAMON', 'PAEZ', 'MIGUEL', 'ANGEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7169011', 1, 'RODRIGUEZ', 'BARRERA', 'MARIO', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7225208', 1, 'OLARTE', 'TORRES', 'JAVIER', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('7463070', 1, 'GONZALEZ', '', 'ROSENDO', 'LOPEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('10241493', 1, 'POVEDA', '', 'GUSTAVO', 'PEDRAZA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('11187193', 1, 'MARTINEZ', 'SARMIENTO', 'FREDY', 'HERNAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('12978060', 1, 'VILLOTA', 'POSSO', 'HERNANDO', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('13170992', 1, 'BELTRAN', '', 'OSWALDO', 'PASTRAN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('13840311', 1, 'BECERRA', 'CORREA', 'NELSON', 'REINALDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('14222479', 1, 'ZARTA', '', 'RODRIGO', 'RINCON', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19262169', 1, 'SANCHEZ', '', 'HERNANDO', 'VELEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19274281', 1, 'MAYORGA', 'MORATO', 'MANUEL', 'ALFONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19296014', 1, 'LOPEZ', 'MARTINEZ', 'GERMAN', 'ARTURO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19316945', 1, 'DIAZ', 'ORTIZ', 'VICTOR', 'HUGO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19332568', 1, 'CASAS', '', 'FERNANDO', 'GONZALEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19353736', 1, 'PORTELA', '', 'ROBERTO', 'VERGARA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19388543', 1, 'CARDENAS', 'FRANCO', 'HUGO', 'ARMANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19407164', 1, 'REYES', '', 'RODRIGO', 'QUINTERO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19416737', 1, 'FONSECA', '', 'MEDARDO', '', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19435227', 1, 'BURGOS', 'DIAZ', 'JAIME', 'ALFREDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19436656', 1, 'TORRES', '', 'NORBERTO', 'NOVOA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19461640', 1, 'SABY', 'BELTRAN', 'JORGE', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19462458', 1, 'BONILLA', 'ISAZA', 'RUBEN', 'DARIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19473974', 1, 'GARCIA', 'UBAQUE', 'CESAR', 'AUGUSTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19475241', 1, 'ACOSTA', '', 'HENRY', 'MORENO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19480298', 1, 'MEDINA', '', 'ELISEO', 'PEREZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19483215', 1, 'MANTILLA', 'BAUTISTA', 'EDGAR', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19486492', 1, 'VANEGAS', '', 'CARLOS', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('30282756', 1, 'BURITICA', 'ARBOLEDA', 'CLARA', 'INES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('32768047', 1, 'ACUNA', 'HERRERA', 'YISSELLE', 'INDIRA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('39540850', 1, 'MADRID', 'SOTO', 'NANCY', 'ESPERANZA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('39750690', 1, 'ROMAN', 'CASTILLO', 'RUTH', 'ESPERANZA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('40394241', 1, 'PEREZ', 'SANTOS', 'ALEXANDRA', 'SASHENKA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('45512868', 1, 'JESUS', 'BALANTA CASTILLA', 'NEVIS', 'DE', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('46676633', 1, 'GARCIA', '', 'MARILUZ', 'ROMERO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51563377', 1, 'OLEA', 'SUAREZ', 'DORIS', 'MARLEN', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51754701', 1, 'AVELLANEDA', 'LEAL', 'ROSA', 'MYRIAM', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51882539', 1, 'HEREDIA', '', 'ANGELA', 'PARDO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51953330', 1, 'MORENO', 'PENAGOS', 'CLAUDIA', 'MABEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51956392', 1, 'PULIDO', '', 'CARMEN', 'LEONOR', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51959092', 1, 'MENDEZ', 'CARO', 'SANDRA', 'ESPERANZA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52023088', 1, 'MARTINEZ', 'CAMARGO', 'DORA', 'MARCELA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52031041', 1, 'LUENGAS', 'CONTRERAS', 'LELY', 'ADRIANA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52204302', 1, 'PINZON', 'NUNEZ', 'SONIA', 'ALEXANDRA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52222640', 1, 'CAVANZO', 'NISSO', 'GLORIA', 'ANDREA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52369898', 1, 'GUERRERO', '', 'ROCIO', 'RODRIGUEZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52439401', 1, 'POLO', '', 'YOLIMA', 'ALVAREZ', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52526421', 1, 'NOVOA', 'ROLDAN', 'KRISTEL', 'SOLANGE', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52529975', 1, 'RODRIGUEZ', '', 'YAQUELINE', 'GARZON', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52764221', 1, 'CASALLAS', '', 'ESPERANZA', 'CAMARGO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('52839371', 1, 'NINO', 'VILLAMIZAR', 'JENY', 'ANDREA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('70125904', 1, 'ZULUAGA', 'ATEHORTUA', 'IVAN', 'DARIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('72151337', 1, 'NAVARRO', 'MEJIA', 'WILMAN', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('72184246', 1, 'SALAS', 'RUIZ', 'ROBERTO', 'EMILIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('72201799', 1, 'ESCOBAR', '', 'PEDRO', 'TORRENEGRA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79040266', 1, 'RODRIGUEZ', 'MONTANA', 'NELSON', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79055619', 1, 'CELY', 'CALLEJAS', 'JOSE', 'DAVID', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79134027', 1, 'IBANEZ', 'OLAYA', 'HENRY', 'FELIPE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79267964', 1, 'ZAMBRANO', 'CAVIEDES', 'JUAN', 'NEPOMUCENO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79271389', 1, 'CASTILLO', 'HERNANDEZ', 'JAIRO', 'ERNESTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79289693', 1, 'GUEVARA', 'VELANDIA', 'GERMAN', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79298720', 1, 'RUIZ', 'CAICEDO', 'JAIRO', 'ALFONSO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79312331', 1, 'SALAS', '', 'HUMBERTO', 'GUERRERO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79321899', 1, 'CONTRERAS', '', 'RODOLFO', 'FELIZZOLA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79325476', 1, 'PINZON', '', 'MAURICIO', 'BUENO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79327235', 1, 'DELGADILLO', 'GOMEZ', 'EDUARDO', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79369589', 1, 'FUQUENE', 'ARDILA', 'HECTOR', 'JULIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79380996', 1, 'SANCHEZ', 'COTE', 'EDGAR', 'HUMBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79385670', 1, 'GARCIA', '', 'ALFREDO', 'CHACON', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79407592', 1, 'HUERTAS', '', 'EDUARDO', 'ZAMUDIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79408962', 1, 'BOHORQUEZ', 'AVILA', 'CARLOS', 'ARTURO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79410371', 1, 'MENDEZ', 'GARZON', 'JESUS', 'EDUARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79417529', 1, 'TAMARA', '', 'RICARDO', 'CASTANO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79422893', 1, 'GUEVARA', 'BOLANOS', 'JUAN', 'CARLOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79435911', 1, 'GIRALDO', 'ACUNA', 'JUAN', 'CARLOS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79450784', 1, 'VELASQUEZ', '', 'ALDEMAR', 'FONSECA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79457691', 1, 'PANTOJA', 'BENAVIDEZ', 'JAIME', 'FRANCISCO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79459303', 1, 'RAMIREZ', 'ESCOBAR', 'JORGE', 'FEDERICO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79461906', 1, 'GAONA', '', 'GIOVANNY', 'MANCILLA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79464234', 1, 'GONZALEZ', '', 'HAROLD', 'VACCA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79474810', 1, 'GARZON', 'CARRENO', 'PABLO', 'EMILIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79480545', 1, 'MOSQUERA', 'PALACIOS', 'DARIN', 'JAIRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79496815', 1, 'GONZALEZ', '', 'ARMANDO', 'LUGO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79499750', 1, 'FINO', 'SANDOVAL', 'RAFAEL', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79502261', 1, 'RIVEROS', 'GOMEZ', 'VICTOR', 'HUGO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79520182', 1, 'MORA', '', 'MILLER', 'GOMEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79524407', 1, 'ROJAS', '', 'GERMAN', 'SICACHA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79533881', 1, 'RAIRAN', 'ANTOLINES', 'JOSE', 'DANILO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79534797', 1, 'ESLAVA', 'BLANCO', 'HERMES', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79553249', 1, 'DUENAS', 'ROJAS', 'JONNY', 'RICARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79554816', 1, 'GARCIA', '', 'ROBINSON', 'PACHECO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79562116', 1, 'BERNAL', '', 'MARLON', 'PATINO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79572667', 1, 'HURTADO', 'CORTES', 'LUINI', 'LEONARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79615177', 1, 'AVENDANO', 'AVENDANO', 'CARLOS', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79617870', 1, 'PENA', '', 'JAVIER', 'PARRA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79630557', 1, 'FORERO', 'CASALLAS', 'JOHN', 'ALEJANDRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79632640', 1, 'PASTRAN', 'BELTRAN', 'CARLOS', 'GREGORIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79670620', 1, 'MORENO', '', 'WILSON', 'INFANTE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79686079', 1, 'MOSQUERA', '', 'ASDRUBAL', 'MORENO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79713775', 1, 'TRIANA', '', 'ALEXANDER', 'JIMENEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79715783', 1, 'QUINTERO', '', 'HENRY', 'MONTANA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79720572', 1, 'VALBUENA', 'PORRAS', 'SERGIO', 'GIOVANNY', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79735905', 1, 'GIRALDO', 'RAMOS', 'FRANK', 'NIXON', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79756323', 1, 'RUIZ', 'ROSAS', 'VICTOR', 'ELBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79799595', 1, 'CASTANG', 'MONTIEL', 'GERARDO', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79841999', 1, 'ORTIZ', 'SUAREZ', 'HELMUTH', 'EDGARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79880251', 1, 'PEDRAZA', 'MARTINEZ', 'LUIS', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79904602', 1, 'WANUMEN', 'SILVA', 'LUIS', 'FELIPE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79945369', 1, 'ARIAS', 'HENAO', 'CAMILO', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79948354', 1, 'GUASCA', 'GONZALEZ', 'ANDRES', 'GUILLERMO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79966414', 1, 'NOGUERA', 'VEGA', 'LUIS', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79974667', 1, 'GOMEZ', '', 'EDWAR', 'JACINTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79974871', 1, 'ROJAS', 'CASTELLAR', 'LUIS', 'ALEJANDRO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80037519', 1, 'DIAZ', 'CARDENAS', 'OSCAR', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80059056', 1, 'ARIZA', '', 'HOLMAN', 'MONTIEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80152009', 1, 'SANTA', '', 'FERNANDO', 'MARTINEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80180279', 1, 'FLOREZ', 'FERNANDEZ', 'HECTOR', 'ARTURO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80430974', 1, 'GARZON', 'GONZALEZ', 'ENRIQUE', 'YAMID', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80472494', 1, 'PINZON', 'RUEDA', 'WILSON', 'ALEXANDER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80491981', 1, 'CHACON', 'CARDONA', 'CESAR', 'ALEXANDER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('80528225', 1, 'ESQUIVEL', 'RAMIREZ', 'RODRIGO', 'ELIAS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('85442611', 1, 'PEREZ', 'PEREIRA', 'MIGUEL', 'RICARDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('86062285', 1, 'HERNANDEZ', 'SUAREZ', 'CESAR', 'AUGUSTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('88279512', 1, 'BERMUDEZ', 'BOHORQEZ', 'GIOVANNI', 'RODRIGO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('92516256', 1, 'BUELVAS', 'PENAREDONDO', 'DUILIO', 'ARNULFO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('94379661', 1, 'SERNA', '', 'MILTON', 'MENA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('98397948', 1, 'ACOSTA', 'SOLARTE', 'PABLO', 'ANDRES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('230234', 1, 'ARDILA', 'MONTANEZ', 'JORGE', 'LUIS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('3020979', 1, 'VARGAS', '', 'GERMAN', 'ANGEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('4058613', 1, 'SUAREZ', '', 'GABRIEL', 'CORDOBA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('6757461', 1, 'QUINTERO', 'ACEVEDO', 'JORGE', 'LUIS', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('17164875', 1, 'MORENO', '', 'FRANCISCO', 'VITOLO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('17165699', 1, 'MENDEZ', 'MEJIA', 'LUIS', 'AUGUSTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('17170823', 1, 'RODRIGUEZ', '', 'MARIO', 'SANCHEZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('17191772', 1, 'CIFUENTES', 'OROBIO', 'OMAR', 'ALEXANDER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19051562', 1, 'PABON', 'RIANO', 'VICTOR', 'MANUEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19097454', 1, 'CASTRO', 'AVELLANEDA', 'JOSE', 'JOAQUIN', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19142934', 1, 'JIMENEZ', 'MONTOYA', 'JESUS', 'ALVARO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19169370', 1, 'CELY', 'FAJARDO', 'JOSE', 'EUGENIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19179717', 1, 'CELY', '', 'EUGENIO', 'GUTIERREZ', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19180385', 1, 'NIETO', 'ECHEVERRY', 'RODOLFO', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19247110', 1, 'MOTTA', 'MARROQUIN', 'JESUS', 'ALBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19260394', 1, 'GOMEZ', '', 'OSCAR', 'OCANA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19262182', 1, 'ROZO', '', 'EDGAR', 'BETANCOURT', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19263996', 1, 'CASTILLO', 'LESMES ACOSTA', 'MILTON', 'DEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19273542', 1, 'JULIO', 'ARRIETA', 'CARLOS', 'ANTONIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19282168', 1, 'AGUILAR', 'SOTO', 'JUAN', 'FRANCISCO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19297848', 1, 'MORA', 'VALBUENA', 'LUIS', 'ORIOL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19398951', 1, 'LARA', 'ROMERO', 'HECTOR', 'JOSE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('23488220', 1, 'CESPEDES', 'GOMEZ', 'MIRYAM', 'CONSUELO', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('27785563', 1, 'MUNOZ', 'ARENAS', 'ELVA', 'ROSA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('35455125', 1, 'DURAN', 'VERGARA', 'LUZ', 'MARLEN', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('38227613', 1, 'MACIAS', '', 'CLEMENCIA', 'VILLA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41544718', 1, 'P.', 'ESCALANTE GUZMAN', 'HILDA', 'MARIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41571490', 1, 'ANDRADE', '', 'ADELA', 'MOLINA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41576075', 1, 'SANTAMARIA', 'VALERO', 'FLOR', 'ALBA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41655487', 1, 'CALDERON', 'SALCEDO', 'RUTH', 'AMIRA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41672059', 1, 'HENAO', 'DE ARIAS', 'HILDA', 'MARIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41786430', 1, 'ESCOBAR', 'QUINTERO', 'GILDA', 'PATRICIA', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('91202081', 1, 'ROJAS', 'GARZON', 'PEDRO', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('14211726', 1, 'GONZALEZ', 'OVIEDO', 'EDGAR', 'MARINO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('17312219', 1, 'MELO', '', 'SAMUEL', 'BARRETO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19183946', 1, 'MEZA', 'ALVAREZ', 'JOAQUIN', 'JAVIER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19187046', 1, 'SUESCA', '', 'RAFAEL', 'PENA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19190664', 1, 'RICO', 'BAEZ', 'JOSE', 'ABEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19224335', 1, 'GOMEZ', 'RODRIGUEZ', 'LUIS', 'FERNANDO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19232205', 1, 'NIETO', 'CLAVIJO', 'GUSTAVO', 'ADOLFO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19257731', 1, 'CONTRERAS', '', 'GERMAN', 'CIFUENTES', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19315280', 1, 'RINCON', 'ROJAS', 'EDGAR', 'JACINTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19402881', 1, 'SERRANO', 'DEVIA', 'JOSE', 'HUMBERTO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('79312869', 1, 'ALZATE', 'MONROY', 'MARCO', 'AURELIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('11791776', 1, 'BRAHAN', '', 'WILLIAM', 'KLINGER', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('12226037', 1, 'VERANO', '', 'URIEL', 'COY', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('14216604', 1, 'GARCIA', 'OLMOS', 'CARLOS', 'FRANCISCO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19139959', 1, 'MEDINA', 'VARGAS', 'CARLOS', 'ENRIQUE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19158790', 1, 'PALMA', '', 'HENRY', 'ZUNIGA', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19241272', 1, 'PERDOMO', '', 'ALEJANDRO', 'COPETE', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19259972', 1, 'OROZCO', 'MUNOZ', 'JOSE', 'MIGUEL', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('19328090', 1, 'CADENA', 'ROMERO', 'MIGUEL', 'EUGENIO', '1', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41444374', 1, 'CARMEN', 'QUEZADA', 'MARIA', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('41632183', 1, 'CARRASCO', '', 'MARITZA', 'TORRES', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51754859', 1, 'PILAR', 'CORTES BALLEN', 'ROCIO', 'DEL', '0', true);
INSERT INTO docente (documento_docente, id_tipo_documento, primer_apellido, segundo_apellido, primer_nombre, segundo_nombre, genero, estado) VALUES ('51799486', 1, 'PINZON', 'FLORIAN', 'OLGA', 'PATRICIA', '0', true);


--
-- TOC entry 2251 (class 0 OID 59672)
-- Dependencies: 198
-- Data for Name: docente_proyectocurricular; Type: TABLE DATA; Schema: docencia; Owner: -
--

INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('254589', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('300397', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('5247350', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('6808947', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('11442568', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('16586610', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('16629380', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19259731', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19269688', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19288119', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19311189', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19375961', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19410349', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19448688', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19466738', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19497257', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('24579306', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('35458635', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('36167952', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('39685668', 102, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('39709575', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51585403', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51711342', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51722992', 102, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51832546', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51865527', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52045004', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52073732', 102, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79280228', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79285259', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79420258', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79460073', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79522574', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79537917', 102, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79568016', 104, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79638007', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79797978', 16, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('89007438', 98, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('197446', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('4235710', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('5937474', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7514128', 57, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('8682227', 164, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('8724617', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('8734136', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('9534006', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('11437716', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('11438303', 57, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('12119277', 134, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('12124455', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('13011182', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('13012390', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('16590041', 191, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19091196', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19118168', 191, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19196428', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19205866', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19217540', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19234595', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19255446', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19256360', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19258804', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19273614', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19277095', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19306909', 176, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19335474', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19336756', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19342408', 192, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19346526', 47, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19346572', 56, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19393150', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19405417', 57, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19427153', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19433505', 56, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19438171', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19446209', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19449705', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19453598', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19474855', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19498411', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('20525593', 134, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('21069836', 134, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('21175244', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('23490618', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('23495318', 191, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('23554403', 23, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('29462640', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('30206629', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('31906885', 47, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('32787844', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('34981544', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('38280216', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('39534107', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('39717991', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('39757077', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('39761555', 134, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('40033593', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41467889', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41494276', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41572835', 176, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41574277', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41581908', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41609727', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41635492', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41636318', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41682394', 57, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41686929', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41724424', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41747221', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41937510', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('43586042', 23, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51577649', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51581998', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51606049', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51609317', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51664884', 176, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51666199', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51694974', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51696154', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51713373', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51721199', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51772712', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51782406', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51808679', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51810666', 134, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51810667', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51838555', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51882328', 39, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51891092', 57, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51899150', 192, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51910071', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51918736', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51919104', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51946252', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51951480', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51952467', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51973513', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51979635', 70, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51982893', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51993911', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52032337', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52035695', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52048952', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52108111', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52118512', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52118853', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52185597', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52205136', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52242740', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52376700', 134, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52415452', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52844857', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52911038', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('53097588', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('65739917', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('71576310', 70, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('71694410', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('73147234', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79040298', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79136697', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79159246', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79161764', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79211385', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79216811', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79243024', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79283463', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79296179', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79300908', 39, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79311460', 134, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79327682', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79330128', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79335447', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79339398', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79339447', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79356009', 39, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79365714', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79367999', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79382488', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79410860', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79411667', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79457686', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79481574', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79503765', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79533899', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79546301', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79567865', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79568999', 134, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79582659', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79590698', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79593951', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79610470', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79627246', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79655066', 191, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79688416', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79688945', 192, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79844451', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79858959', 47, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79945743', 39, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79986048', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80020955', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80067185', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80216526', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('86039591', 47, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('88139621', 145, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('88278955', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('91291766', 57, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('91462820', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('93360324', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('197019', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('268856', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('3228052', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('3228510', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('4242702', 20, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('5638393', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7164610', 197, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7181718', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7314677', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7724669', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('9074120', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('9395122', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('11077061', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('11343316', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('11377750', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('12237136', 20, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('17163056', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('17192344', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19053960', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19110045', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19123015', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19125126', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19165408', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19204484', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19219119', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19228296', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19235204', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19241728', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19259014', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19267731', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19268902', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19275313', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19279196', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19289020', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19299110', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19308520', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19308787', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19316812', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19328698', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19331673', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19348975', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19354498', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19373890', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19378504', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19402686', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19417230', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19422121', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19432914', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19437829', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19483708', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19483959', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('23350114', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('23493588', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('35477204', 196, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('38252071', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41574857', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41765378', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('45455721', 100, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51551021', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51568897', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51593752', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51610577', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51653275', 20, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51703985', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51740903', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51766077', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51821928', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51822635', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51903175', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51935901', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51978494', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52083089', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52085662', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52103956', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52116530', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52204982', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52223898', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52310001', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52379603', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52478481', 2, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52532855', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52833443', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52961466', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('60261576', 20, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('63316139', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('74184661', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('74301090', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('74371532', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('74373175', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('74373323', 20, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79045647', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79100377', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79148264', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79270174', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79293930', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79297396', 196, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79319014', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79339719', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79367935', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79368729', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79370039', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79390069', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79391646', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79397454', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79406007', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79425787', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79432645', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79454547', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79456915', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79471198', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79472540', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79493825', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79508767', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79520115', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79521015', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79537607', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79553193', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79560853', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79563205', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79571941', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79572003', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79591170', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79647592', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79655614', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79657603', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79671115', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79698280', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79702248', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79708124', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79752717', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79753365', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79754586', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79757342', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79790857', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79792252', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79839336', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79853581', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79858818', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79863843', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79865119', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79866835', 20, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79940535', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79942070', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79943556', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79950025', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79973967', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79974515', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80033827', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80038171', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80052469', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80092512', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80093200', 20, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80158457', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80235048', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80264735', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80757372', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80857171', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('86052448', 20, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('91013827', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('91238598', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('92530374', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('93401117', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('93414671', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('94331274', 7, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('1033687596', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('2470624', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('6761520', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('6773087', 14, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('9522644', 181, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('9525297', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('10237637', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('11436099', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('12969124', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('13170456', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('13259848', 181, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('13870221', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('13925626', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('14235383', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('16258051', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('17354512', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19128837', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19204617', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19207999', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19219037', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19227352', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19231419', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19236093', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19260579', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19270881', 110, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19287751', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19310358', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19333154', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19349320', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19350861', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19352582', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19360418', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19380272', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19420950', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19440276', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19451396', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19461648', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19476164', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19481982', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19489088', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('22807498', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('35500902', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('38240308', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('40026493', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('40370518', 114, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('40924205', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41699620', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('43497775', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('45451853', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51553994', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51677301', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51678774', 110, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51766603', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51768982', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51774980', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51882764', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51947405', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51967452', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51974018', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51978212', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51985431', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52006591', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52028537', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52144018', 114, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52154118', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52216615', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52527490', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52646311', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52710194', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('72302730', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('74300954', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('75066443', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79045552', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79207497', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79257588', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79273865', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79276643', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79290728', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79303780', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79354423', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79357153', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79374419', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79396653', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79398855', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79418769', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79483026', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79490190', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79494815', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79497472', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79497552', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79497562', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79505180', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79512283', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79537982', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79558538', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79558986', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79601302', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79609726', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79623199', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79640012', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79640469', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79642535', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79656850', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79721124', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79756506', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79794356', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79873683', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79892283', 14, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79904224', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80234909', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80268588', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80374502', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80880637', 1, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('86002561', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('88154173', 81, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('88233355', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('91012707', 186, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('91157701', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('93401747', 180, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('94322033', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('265313', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('3182871', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('3225689', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('3242496', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('4251239', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('5824376', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('6774454', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('6816778', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7161428', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7165116', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7168268', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7169011', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7225208', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('7463070', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('10241493', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('11187193', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('12978060', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('13170992', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('13840311', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('14222479', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19262169', 274, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19274281', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19296014', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19316945', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19332568', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19353736', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19388543', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19407164', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19416737', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19435227', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19436656', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19461640', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19462458', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19473974', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19475241', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19480298', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19483215', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19486492', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('30282756', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('32768047', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('39540850', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('39750690', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('40394241', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('45512868', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('46676633', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51563377', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51754701', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51882539', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51953330', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51956392', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51959092', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52023088', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52031041', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52204302', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52222640', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52369898', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52439401', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52526421', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52529975', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52764221', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('52839371', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('70125904', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('72151337', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('72184246', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('72201799', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79040266', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79055619', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79134027', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79267964', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79271389', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79289693', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79298720', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79312331', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79321899', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79325476', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79327235', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79369589', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79380996', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79385670', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79407592', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79408962', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79410371', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79417529', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79422893', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79435911', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79450784', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79457691', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79459303', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79461906', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79464234', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79474810', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79480545', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79496815', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79499750', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79502261', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79520182', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79524407', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79533881', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79534797', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79553249', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79554816', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79562116', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79572667', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79615177', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79617870', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79630557', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79632640', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79670620', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79686079', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79713775', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79715783', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79720572', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79735905', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79756323', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79799595', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79841999', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79880251', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79904602', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79945369', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79948354', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79966414', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79974667', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79974871', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80037519', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80059056', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80152009', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80180279', 78, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80430974', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80472494', 77, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80491981', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('80528225', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('85442611', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('86062285', 72, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('88279512', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('92516256', 73, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('94379661', 79, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('98397948', 74, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('230234', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('3020979', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('4058613', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('6757461', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('17164875', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('17165699', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('17170823', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('17191772', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19051562', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19097454', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19142934', 50, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19169370', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19179717', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19180385', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19247110', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19260394', 35, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19262182', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19263996', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19273542', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19282168', 155, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19297848', 167, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19398951', 57, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('23488220', 160, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('27785563', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('35455125', 187, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('38227613', 188, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41544718', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41571490', 601, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41576075', 23, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41655487', 165, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41672059', 40, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41786430', 134, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('91202081', 47, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('14211726', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('17312219', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19183946', 15, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19187046', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19190664', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19224335', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19232205', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19257731', 25, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19315280', 295, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19402881', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('79312869', 5, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('11791776', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('12226037', 33, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('14216604', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19139959', 30, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19158790', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19241272', 113, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19259972', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('19328090', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41444374', 485, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('41632183', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51754859', 10, true);
INSERT INTO docente_proyectocurricular (documento_docente, id_proyectocurricular, estado) VALUES ('51799486', 10, true);


--
-- TOC entry 2252 (class 0 OID 59679)
-- Dependencies: 199
-- Data for Name: facultad; Type: TABLE DATA; Schema: docencia; Owner: -
--

INSERT INTO facultad (id_facultad, nombre, abreviatura) VALUES (23, 'FACULTAD DE MEDIO AMBIENTE Y RECURSOS NATURALES', 'FM');
INSERT INTO facultad (id_facultad, nombre, abreviatura) VALUES (101, 'FACULTAD DE ARTES-ASAB', 'FA');
INSERT INTO facultad (id_facultad, nombre, abreviatura) VALUES (24, 'FACULTAD DE CIENCIAS Y EDUCACIÓN', 'FC');
INSERT INTO facultad (id_facultad, nombre, abreviatura) VALUES (33, 'FACULTAD DE INGENIERÍA', 'FI');
INSERT INTO facultad (id_facultad, nombre, abreviatura) VALUES (32, 'FACULTAD TECNOLÓGICA', 'FT');


--
-- TOC entry 2253 (class 0 OID 59685)
-- Dependencies: 200
-- Data for Name: pais; Type: TABLE DATA; Schema: docencia; Owner: -
--

INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LKA', 'Sri Lanka                                           ', 'Asia', 'Southern and Central Asia', 65610, 1948, 18827000, 71.7999999999999972, 15706, 15091, 'Sri Lanka/Ilankai', 'Redocencia', 'Chandrika Kumaratunga', 3217, 'LK');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SLV', 'El Salvador                                         ', 'North America', 'Central America', 21041, 1841, 6276000, 69.7000000000000028, 11863, 11203, 'El Salvador', 'Redocencia', 'Francisco Guillermo Flores Pérez', 645, 'SV');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SUR', 'Suriname                                            ', 'South America', 'South America', 163265, 1975, 417000, 71.4000000000000057, 870, 706, 'Suriname', 'Redocencia', 'Ronald Venetiaan', 3243, 'SR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GMB', 'Gambia                                              ', 'Africa', 'Western Africa', 11295, 1965, 1305000, 53.2000000000000028, 320, 325, 'The Gambia', 'Redocencia', 'Yahya Jammeh', 904, 'GM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PYF', 'French Polynesia                                    ', 'Oceania', 'Polynesia', 4000, NULL, 235000, 74.7999999999999972, 818, 781, 'Polynésie française', 'Nonmetropolitan Territory of France', 'Jacques Chirac', 3016, 'PF');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('DNK', 'Denmark                                             ', 'Europe', 'Nordic Countries', 43094, 800, 5330000, 76.5, 174099, 169264, 'Danmark', 'Constitutional Monarchy', 'Margrethe II', 3315, 'DK');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MMR', 'Myanmar                                             ', 'Asia', 'Southeast Asia', 676578, 1948, 45611000, 54.8999999999999986, 180375, 171028, 'Myanma Pye', 'Redocencia', 'kenraali Than Shwe', 2710, 'MM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('RUS', 'Russian Federation                                  ', 'Europe', 'Eastern Europe', 17075400, 1991, 146934000, 67.2000000000000028, 276608, 442989, 'Rossija', 'Federal Redocencia', 'Vladimir Putin', 3580, 'RU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BGR', 'Bulgaria                                            ', 'Europe', 'Eastern Europe', 110994, 1908, 8190900, 70.9000000000000057, 12178, 10169, 'Balgarija', 'Redocencia', 'Petar Stojanov', 539, 'BG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PHL', 'Philippines                                         ', 'Asia', 'Southeast Asia', 300000, 1946, 75967000, 67.5, 65107, 82239, 'Pilipinas', 'Redocencia', 'Gloria Macapagal-Arroyo', 766, 'PH');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SVK', 'Slovakia                                            ', 'Europe', 'Eastern Europe', 49012, 1993, 5398700, 73.7000000000000028, 20594, 19452, 'Slovensko', 'Redocencia', 'Rudolf Schuster', 3209, 'SK');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GRD', 'Grenada                                             ', 'North America', 'Caribbean', 344, 1974, 94000, 64.5, 318, NULL, 'Grenada', 'Constitutional Monarchy', 'Elisabeth II', 916, 'GD');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BEN', 'Benin                                               ', 'Africa', 'Western Africa', 112622, 1960, 6097000, 50.2000000000000028, 2357, 2141, 'Bénin', 'Redocencia', 'Mathieu Kérékou', 187, 'BJ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CCK', 'Cocos (Keeling) Islands                             ', 'Oceania', 'Australia and New Zealand', 14, NULL, 600, NULL, 0, NULL, 'Cocos (Keeling) Islands', 'Territory of Australia', 'Elisabeth II', 2317, 'CC');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TON', 'Tonga                                               ', 'Oceania', 'Polynesia', 650, 1970, 99000, 67.9000000000000057, 146, 170, 'Tonga', 'Monarchy', 'Taufa''ahau Tupou IV', 3334, 'TO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('KHM', 'Cambodia                                            ', 'Asia', 'Southeast Asia', 181035, 1953, 11168000, 56.5, 5121, 5670, 'Kâmpuchéa', 'Constitutional Monarchy', 'Norodom Sihanouk', 1800, 'KH');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('AGO', 'Angola                                              ', 'Africa', 'Central Africa', 1246700, 1975, 12878000, 38.2999999999999972, 6648, 7984, 'Angola', 'Redocencia', 'José Eduardo dos Santos', 56, 'AO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('FRA', 'France                                              ', 'Europe', 'Western Europe', 551500, 843, 59225700, 78.7999999999999972, 1424285, 1392448, 'France', 'Redocencia', 'Jacques Chirac', 2974, 'FR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('UZB', 'Uzbekistan                                          ', 'Asia', 'Southern and Central Asia', 447400, 1991, 24318000, 63.7000000000000028, 14194, 21300, 'Uzbekiston', 'Redocencia', 'Islam Karimov', 3503, 'UZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('COD', 'Congo, The Democratic Redocencia of the             ', 'Africa', 'Central Africa', 2344858, 1960, 51654000, 48.7999999999999972, 6964, 2474, 'République Démocratique du Congo', 'Redocencia', 'Joseph Kabila', 2298, 'CD');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TUR', 'Turkey                                              ', 'Asia', 'Middle East', 774815, 1923, 66591000, 71, 210721, 189122, 'Türkiye', 'Redocencia', 'Ahmet Necdet Sezer', 3358, 'TR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LBY', 'Libyan Arab Jamahiriya                              ', 'Africa', 'Northern Africa', 1759540, 1951, 5605000, 75.5, 44806, 40562, 'Libiya', 'Socialistic State', 'Muammar al-Qadhafi', 2441, 'LY');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GRC', 'Greece                                              ', 'Europe', 'Southern Europe', 131626, 1830, 10545700, 78.4000000000000057, 120724, 119946, 'Elláda', 'Redocencia', 'Kostis Stefanopoulos', 2401, 'GR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ZMB', 'Zambia                                              ', 'Africa', 'Eastern Africa', 752618, 1964, 9169000, 37.2000000000000028, 3377, 3922, 'Zambia', 'Redocencia', 'Frederick Chiluba', 3162, 'ZM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SGS', 'South Georgia and the South Sandwich Islands        ', 'Antarctica', 'Antarctica', 3903, NULL, 0, NULL, 0, NULL, 'South Georgia and the South Sandwich Islands', 'Dependent Territory of the UK', 'Elisabeth II', NULL, 'GS');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GRL', 'Greenland                                           ', 'North America', 'North America', 2166090, NULL, 56000, 68.0999999999999943, 0, NULL, 'Kalaallit Nunaat/Grønland', 'Part of Denmark', 'Margrethe II', 917, 'GL');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CAN', 'Canada                                              ', 'North America', 'North America', 9970610, 1867, 31147000, 79.4000000000000057, 598862, 625626, 'Canada', 'Constitutional Monarchy, Federation', 'Elisabeth II', 1822, 'CA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GNQ', 'Equatorial Guinea                                   ', 'Africa', 'Central Africa', 28051, 1968, 453000, 53.6000000000000014, 283, 542, 'Guinea Ecuatorial', 'Redocencia', 'Teodoro Obiang Nguema Mbasogo', 2972, 'GQ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('EGY', 'Egypt                                               ', 'Africa', 'Northern Africa', 1001449, 1922, 68470000, 63.2999999999999972, 82710, 75617, 'Misr', 'Redocencia', 'Hosni Mubarak', 608, 'EG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TWN', 'Taiwan                                              ', 'Asia', 'Eastern Asia', 36188, 1945, 22256000, 76.4000000000000057, 256254, 263451, 'T’ai-wan', 'Redocencia', 'Chen Shui-bian', 3263, 'TW');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('IRN', 'Iran                                                ', 'Asia', 'Southern and Central Asia', 1648195, 1906, 67702000, 69.7000000000000028, 195746, 160151, 'Iran', 'Islamic Redocencia', 'Ali Mohammad Khatami-Ardakani', 1380, 'IR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('AIA', 'Anguilla                                            ', 'North America', 'Caribbean', 96, NULL, 8000, 76.0999999999999943, 63.2000000000000028, NULL, 'Anguilla', 'Dependent Territory of the UK', 'Elisabeth II', 62, 'AI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('KEN', 'Kenya                                               ', 'Africa', 'Eastern Africa', 580367, 1963, 30080000, 48, 9217, 10241, 'Kenya', 'Redocencia', 'Daniel arap Moi', 1881, 'KE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SGP', 'Singapore                                           ', 'Asia', 'Southeast Asia', 618, 1965, 3567000, 80.0999999999999943, 86503, 96318, 'Singapore/Singapura/Xinjiapo/Singapur', 'Redocencia', 'Sellapan Rama Nathan', 3208, 'SG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('VAT', 'Holy See (Vatican City State)                       ', 'Europe', 'Southern Europe', 0.400000000000000022, 1929, 1000, NULL, 9, NULL, 'Santa Sede/Città del Vaticano', 'Independent Church State', 'Johannes Paavali II', 3538, 'VA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ASM', 'American Samoa                                      ', 'Oceania', 'Polynesia', 199, NULL, 68000, 75.0999999999999943, 334, NULL, 'Amerika Samoa', 'US Territory', 'George W. Bush', 54, 'AS');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GUF', 'French Guiana                                       ', 'South America', 'South America', 90000, NULL, 181000, 76.0999999999999943, 681, NULL, 'Guyane française', 'Overseas Department of France', 'Jacques Chirac', 3014, 'GF');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('DMA', 'Dominica                                            ', 'North America', 'Caribbean', 751, 1978, 71000, 73.4000000000000057, 256, 243, 'Dominica', 'Redocencia', 'Vernon Shaw', 586, 'DM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MCO', 'Monaco                                              ', 'Europe', 'Western Europe', 1.5, 1861, 34000, 78.7999999999999972, 776, NULL, 'Monaco', 'Constitutional Monarchy', 'Rainier III', 2695, 'MC');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TZA', 'Tanzania                                            ', 'Africa', 'Eastern Africa', 883749, 1961, 33517000, 52.2999999999999972, 8005, 7388, 'Tanzania', 'Redocencia', 'Benjamin William Mkapa', 3306, 'TZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('DOM', 'Dominican Redocencia                                ', 'North America', 'Caribbean', 48511, 1844, 8495000, 73.2000000000000028, 15846, 15076, 'República Dominicana', 'Redocencia', 'Hipólito Mejía Domínguez', 587, 'DO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MNP', 'Northern Mariana Islands                            ', 'Oceania', 'Micronesia', 464, NULL, 78000, 75.5, 0, NULL, 'Northern Mariana Islands', 'Commonwealth of the US', 'George W. Bush', 2913, 'MP');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CRI', 'Costa Rica                                          ', 'North America', 'Central America', 51100, 1821, 4023000, 75.7999999999999972, 10226, 9757, 'Costa Rica', 'Redocencia', 'Miguel Ángel Rodríguez Echeverría', 584, 'CR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NIC', 'Nicaragua                                           ', 'North America', 'Central America', 130000, 1838, 5074000, 68.7000000000000028, 1988, 2023, 'Nicaragua', 'Redocencia', 'Arnoldo Alemán Lacayo', 2734, 'NI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('KGZ', 'Kyrgyzstan                                          ', 'Asia', 'Southern and Central Asia', 199900, 1991, 4699000, 63.3999999999999986, 1626, 1767, 'Kyrgyzstan', 'Redocencia', 'Askar Akajev', 2253, 'KG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LUX', 'Luxembourg                                          ', 'Europe', 'Western Europe', 2586, 1867, 435700, 77.0999999999999943, 16321, 15519, 'Luxembourg/Lëtzebuerg', 'Constitutional Monarchy', 'Henri', 2452, 'LU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BVT', 'Bouvet Island                                       ', 'Antarctica', 'Antarctica', 59, NULL, 0, NULL, 0, NULL, 'Bouvetøya', 'Dependent Territory of Norway', 'Harald V', NULL, 'BV');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SWZ', 'Swaziland                                           ', 'Africa', 'Southern Africa', 17364, 1968, 1008000, 40.3999999999999986, 1206, 1312, 'kaNgwane', 'Monarchy', 'Mswati III', 3244, 'SZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SEN', 'Senegal                                             ', 'Africa', 'Western Africa', 196722, 1960, 9481000, 62.2000000000000028, 4787, 4542, 'Sénégal/Sounougal', 'Redocencia', 'Abdoulaye Wade', 3198, 'SN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ISR', 'Israel                                              ', 'Asia', 'Middle East', 21056, 1948, 6217000, 78.5999999999999943, 97477, 98577, 'Yisra’el/Isra’il', 'Redocencia', 'Moshe Katzav', 1450, 'IL');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TUN', 'Tunisia                                             ', 'Africa', 'Northern Africa', 163610, 1956, 9586000, 73.7000000000000028, 20026, 18898, 'Tunis/Tunisie', 'Redocencia', 'Zine al-Abidine Ben Ali', 3349, 'TN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('YUG', 'Yugoslavia                                          ', 'Europe', 'Southern Europe', 102173, 1918, 10640000, 72.4000000000000057, 17000, NULL, 'Jugoslavija', 'Federal Redocencia', 'Vojislav Koštunica', 1792, 'YU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SPM', 'Saint Pierre and Miquelon                           ', 'North America', 'North America', 242, NULL, 7000, 77.5999999999999943, 0, NULL, 'Saint-Pierre-et-Miquelon', 'Territorial Collectivity of France', 'Jacques Chirac', 3067, 'PM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MEX', 'Mexico                                              ', 'North America', 'Central America', 1958201, 1810, 98881000, 71.5, 414972, 401461, 'México', 'Federal Redocencia', 'Vicente Fox Quesada', 2515, 'MX');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MLT', 'Malta                                               ', 'Europe', 'Southern Europe', 316, 1964, 380200, 77.9000000000000057, 3512, 3338, 'Malta', 'Redocencia', 'Guido de Marco', 2484, 'MT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('COG', 'Congo                                               ', 'Africa', 'Central Africa', 342000, 1960, 2943000, 47.3999999999999986, 2108, 2287, 'Congo', 'Redocencia', 'Denis Sassou-Nguesso', 2296, 'CG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('HRV', 'Croatia                                             ', 'Europe', 'Southern Europe', 56538, 1991, 4473000, 73.7000000000000028, 20208, 19300, 'Hrvatska', 'Redocencia', 'Štipe Mesic', 2409, 'HR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BRB', 'Barbados                                            ', 'North America', 'Caribbean', 430, 1966, 270000, 73, 2223, 2186, 'Barbados', 'Constitutional Monarchy', 'Elisabeth II', 174, 'BB');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('COL', 'Colombia                                            ', 'South America', 'South America', 1138914, 1810, 42321000, 70.2999999999999972, 102896, 105116, 'Colombia', 'Redocencia', 'Andrés Pastrana Arango', 2257, 'CO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MUS', 'Mauritius                                           ', 'Africa', 'Eastern Africa', 2040, 1968, 1158000, 71, 4251, 4186, 'Mauritius', 'Redocencia', 'Cassam Uteem', 2511, 'MU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ITA', 'Italy                                               ', 'Europe', 'Southern Europe', 301316, 1861, 57680000, 79, 1161755, 1145372, 'Italia', 'Redocencia', 'Carlo Azeglio Ciampi', 1464, 'IT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MWI', 'Malawi                                              ', 'Africa', 'Eastern Africa', 118484, 1964, 10925000, 37.6000000000000014, 1687, 2527, 'Malawi', 'Redocencia', 'Bakili Muluzi', 2462, 'MW');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('WLF', 'Wallis and Futuna                                   ', 'Oceania', 'Polynesia', 200, NULL, 15000, NULL, 0, NULL, 'Wallis-et-Futuna', 'Nonmetropolitan Territory of France', 'Jacques Chirac', 3536, 'WF');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('FRO', 'Faroe Islands                                       ', 'Europe', 'Nordic Countries', 1399, NULL, 43000, 78.4000000000000057, 0, NULL, 'Føroyar', 'Part of Denmark', 'Margrethe II', 901, 'FO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NOR', 'Norway                                              ', 'Europe', 'Nordic Countries', 323877, 1905, 4478500, 78.7000000000000028, 145895, 153370, 'Norge', 'Constitutional Monarchy', 'Harald V', 2807, 'NO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ATA', 'Antarctica                                          ', 'Antarctica', 'Antarctica', 13120000, NULL, 0, NULL, 0, NULL, '–', 'Co-administrated', '', NULL, 'AQ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('COM', 'Comoros                                             ', 'Africa', 'Eastern Africa', 1862, 1975, 578000, 60, 4401, 4361, 'Komori/Comores', 'Redocencia', 'Azali Assoumani', 2295, 'KM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PAN', 'Panama                                              ', 'North America', 'Central America', 75517, 1903, 2856000, 75.5, 9131, 8700, 'Panamá', 'Redocencia', 'Mireya Elisa Moscoso Rodríguez', 2882, 'PA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('FJI', 'Fiji Islands                                        ', 'Oceania', 'Melanesia', 18274, 1970, 817000, 67.9000000000000057, 1536, 2149, 'Fiji Islands', 'Redocencia', 'Josefa Iloilo', 764, 'FJ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('HKG', 'Hong Kong                                           ', 'Asia', 'Eastern Asia', 1075, NULL, 6782000, 79.5, 166448, 173610, 'Xianggang/Hong Kong', 'Special Administrative Region of China', 'Jiang Zemin', 937, 'HK');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NGA', 'Nigeria                                             ', 'Africa', 'Western Africa', 923768, 1960, 111506000, 51.6000000000000014, 65707, 58623, 'Nigeria', 'Federal Redocencia', 'Olusegun Obasanjo', 2754, 'NG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CHL', 'Chile                                               ', 'South America', 'South America', 756626, 1810, 15211000, 75.7000000000000028, 72949, 75780, 'Chile', 'Redocencia', 'Ricardo Lagos Escobar', 554, 'CL');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('UGA', 'Uganda                                              ', 'Africa', 'Eastern Africa', 241038, 1962, 21778000, 42.8999999999999986, 6313, 6887, 'Uganda', 'Redocencia', 'Yoweri Museveni', 3425, 'UG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LSO', 'Lesotho                                             ', 'Africa', 'Southern Africa', 30355, 1966, 2153000, 50.7999999999999972, 1061, 1161, 'Lesotho', 'Constitutional Monarchy', 'Letsie III', 2437, 'LS');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MRT', 'Mauritania                                          ', 'Africa', 'Western Africa', 1025520, 1960, 2670000, 50.7999999999999972, 998, 1081, 'Muritaniya/Mauritanie', 'Redocencia', 'Maaouiya Ould Sid´Ahmad Taya', 2509, 'MR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LBN', 'Lebanon                                             ', 'Asia', 'Middle East', 10400, 1941, 3282000, 71.2999999999999972, 17121, 15129, 'Lubnan', 'Redocencia', 'Émile Lahoud', 2438, 'LB');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('VIR', 'Virgin Islands, U.S.                                ', 'North America', 'Caribbean', 347, NULL, 93000, 78.0999999999999943, 0, NULL, 'Virgin Islands of the United States', 'US Territory', 'George W. Bush', 4067, 'VI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ESH', 'Western Sahara                                      ', 'Africa', 'Northern Africa', 266000, NULL, 293000, 49.7999999999999972, 60, NULL, 'As-Sahrawiya', 'Occupied by Marocco', 'Mohammed Abdel Aziz', 2453, 'EH');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('THA', 'Thailand                                            ', 'Asia', 'Southeast Asia', 513115, 1350, 61399000, 68.5999999999999943, 116416, 153907, 'Prathet Thai', 'Constitutional Monarchy', 'Bhumibol Adulyadej', 3320, 'TH');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TJK', 'Tajikistan                                          ', 'Asia', 'Southern and Central Asia', 143100, 1991, 6188000, 64.0999999999999943, 1990, 1056, 'Toçikiston', 'Redocencia', 'Emomali Rahmonov', 3261, 'TJ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BLZ', 'Belize                                              ', 'North America', 'Central America', 22696, 1981, 241000, 70.9000000000000057, 630, 616, 'Belize', 'Constitutional Monarchy', 'Elisabeth II', 185, 'BZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NAM', 'Namibia                                             ', 'Africa', 'Southern Africa', 824292, 1990, 1726000, 42.5, 3101, 3384, 'Namibia', 'Redocencia', 'Sam Nujoma', 2726, 'NA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('AZE', 'Azerbaijan                                          ', 'Asia', 'Middle East', 86600, 1991, 7734000, 62.8999999999999986, 4127, 4100, 'Azärbaycan', 'Federal Redocencia', 'Heydär Äliyev', 144, 'AZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BTN', 'Bhutan                                              ', 'Asia', 'Southern and Central Asia', 47000, 1910, 2124000, 52.3999999999999986, 372, 383, 'Druk-Yul', 'Monarchy', 'Jigme Singye Wangchuk', 192, 'BT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CAF', 'Central African Redocencia                          ', 'Africa', 'Central Africa', 622984, 1960, 3615000, 44, 1054, 993, 'Centrafrique/Bê-Afrîka', 'Redocencia', 'Ange-Félix Patassé', 1889, 'CF');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MYT', 'Mayotte                                             ', 'Africa', 'Eastern Africa', 373, NULL, 149000, 59.5, 0, NULL, 'Mayotte', 'Territorial Collectivity of France', 'Jacques Chirac', 2514, 'YT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BMU', 'Bermuda                                             ', 'North America', 'North America', 53, NULL, 65000, 76.9000000000000057, 2328, 2190, 'Bermuda', 'Dependent Territory of the UK', 'Elisabeth II', 191, 'BM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GLP', 'Guadeloupe                                          ', 'North America', 'Caribbean', 1705, NULL, 456000, 77, 3501, NULL, 'Guadeloupe', 'Overseas Department of France', 'Jacques Chirac', 919, 'GP');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('WSM', 'Samoa                                               ', 'Oceania', 'Polynesia', 2831, 1962, 180000, 69.2000000000000028, 141, 157, 'Samoa', 'Parlementary Monarchy', 'Malietoa Tanumafili II', 3169, 'WS');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TMP', 'East Timor                                          ', 'Asia', 'Southeast Asia', 14874, NULL, 885000, 46, 0, NULL, 'Timor Timur', 'Administrated by the UN', 'José Alexandre Gusmão', 1522, 'TP');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('VNM', 'Vietnam                                             ', 'Asia', 'Southeast Asia', 331689, 1945, 79832000, 69.2999999999999972, 21929, 22834, 'Viêt Nam', 'Socialistic Redocencia', 'Trân Duc Luong', 3770, 'VN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MDV', 'Maldives                                            ', 'Asia', 'Southern and Central Asia', 298, 1965, 286000, 62.2000000000000028, 199, NULL, 'Dhivehi Raajje/Maldives', 'Redocencia', 'Maumoon Abdul Gayoom', 2463, 'MV');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MDG', 'Madagascar                                          ', 'Africa', 'Eastern Africa', 587041, 1960, 15942000, 55, 3750, 3545, 'Madagasikara/Madagascar', 'Federal Redocencia', 'Didier Ratsiraka', 2455, 'MG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('QAT', 'Qatar                                               ', 'Asia', 'Middle East', 11000, 1971, 599000, 72.4000000000000057, 9472, 8920, 'Qatar', 'Monarchy', 'Hamad ibn Khalifa al-Thani', 2973, 'QA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ARG', 'Argentina                                           ', 'South America', 'South America', 2780400, 1816, 37032000, 75.0999999999999943, 340238, 323310, 'Argentina', 'Federal Redocencia', 'Fernando de la Rúa', 69, 'AR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('JPN', 'Japan                                               ', 'Asia', 'Eastern Asia', 377829, -660, 126714000, 80.7000000000000028, 3787042, 4192638, 'Nihon/Nippon', 'Constitutional Monarchy', 'Akihito', 1532, 'JP');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BWA', 'Botswana                                            ', 'Africa', 'Southern Africa', 581730, 1966, 1622000, 39.2999999999999972, 4834, 4935, 'Botswana', 'Redocencia', 'Festus G. Mogae', 204, 'BW');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('KNA', 'Saint Kitts and Nevis                               ', 'North America', 'Caribbean', 261, 1983, 38000, 70.7000000000000028, 299, NULL, 'Saint Kitts and Nevis', 'Constitutional Monarchy', 'Elisabeth II', 3064, 'KN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('UMI', 'United States Minor Outlying Islands                ', 'Oceania', 'Micronesia/Caribbean', 16, NULL, 0, NULL, 0, NULL, 'United States Minor Outlying Islands', 'Dependent Territory of the US', 'George W. Bush', NULL, 'UM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('REU', 'Réunion                                             ', 'Africa', 'Eastern Africa', 2510, NULL, 699000, 72.7000000000000028, 8287, 7988, 'Réunion', 'Overseas Department of France', 'Jacques Chirac', 3017, 'RE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TUV', 'Tuvalu                                              ', 'Oceania', 'Polynesia', 26, 1978, 12000, 66.2999999999999972, 6, NULL, 'Tuvalu', 'Constitutional Monarchy', 'Elisabeth II', 3424, 'TV');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ANT', 'Netherlands Antilles                                ', 'North America', 'Caribbean', 800, NULL, 217000, 74.7000000000000028, 1941, NULL, 'Nederlandse Antillen', 'Nonmetropolitan Territory of The Netherlands', 'Beatrix', 33, 'AN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GAB', 'Gabon                                               ', 'Africa', 'Central Africa', 267668, 1960, 1226000, 50.1000000000000014, 5493, 5279, 'Le Gabon', 'Redocencia', 'Omar Bongo', 902, 'GA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('POL', 'Poland                                              ', 'Europe', 'Eastern Europe', 323250, 1918, 38653600, 73.2000000000000028, 151697, 135636, 'Polska', 'Redocencia', 'Aleksander Kwasniewski', 2928, 'PL');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SHN', 'Saint Helena                                        ', 'Africa', 'Western Africa', 314, NULL, 6000, 76.7999999999999972, 0, NULL, 'Saint Helena', 'Dependent Territory of the UK', 'Elisabeth II', 3063, 'SH');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SLE', 'Sierra Leone                                        ', 'Africa', 'Western Africa', 71740, 1961, 4854000, 45.2999999999999972, 746, 858, 'Sierra Leone', 'Redocencia', 'Ahmed Tejan Kabbah', 3207, 'SL');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BIH', 'Bosnia and Herzegovina                              ', 'Europe', 'Southern Europe', 51197, 1992, 3972000, 71.5, 2841, NULL, 'Bosna i Hercegovina', 'Federal Redocencia', 'Ante Jelavic', 201, 'BA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GNB', 'Guinea-Bissau                                       ', 'Africa', 'Western Africa', 36125, 1974, 1213000, 49, 293, 272, 'Guiné-Bissau', 'Redocencia', 'Kumba Ialá', 927, 'GW');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LTU', 'Lithuania                                           ', 'Europe', 'Baltic Countries', 65301, 1991, 3698500, 69.0999999999999943, 10692, 9585, 'Lietuva', 'Redocencia', 'Valdas Adamkus', 2447, 'LT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SOM', 'Somalia                                             ', 'Africa', 'Eastern Africa', 637657, 1960, 10097000, 46.2000000000000028, 935, NULL, 'Soomaaliya', 'Redocencia', 'Abdiqassim Salad Hassan', 3214, 'SO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TGO', 'Togo                                                ', 'Africa', 'Western Africa', 56785, 1960, 4629000, 54.7000000000000028, 1449, 1400, 'Togo', 'Redocencia', 'Gnassingbé Eyadéma', 3332, 'TG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CYP', 'Cyprus                                              ', 'Asia', 'Middle East', 9251, 1960, 754700, 76.7000000000000028, 9333, 8246, 'Kýpros/Kibris', 'Redocencia', 'Glafkos Klerides', 2430, 'CY');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GIB', 'Gibraltar                                           ', 'Europe', 'Southern Europe', 6, NULL, 25000, 79, 258, NULL, 'Gibraltar', 'Dependent Territory of the UK', 'Elisabeth II', 915, 'GI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BRN', 'Brunei                                              ', 'Asia', 'Southeast Asia', 5765, 1984, 328000, 73.5999999999999943, 11705, 12460, 'Brunei Darussalam', 'Monarchy (Sultanate)', 'Haji Hassan al-Bolkiah', 538, 'BN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CIV', 'Côte d’Ivoire                                       ', 'Africa', 'Western Africa', 322463, 1960, 14786000, 45.2000000000000028, 11345, 10285, 'Côte d’Ivoire', 'Redocencia', 'Laurent Gbagbo', 2814, 'CI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MSR', 'Montserrat                                          ', 'North America', 'Caribbean', 102, NULL, 11000, 78, 109, NULL, 'Montserrat', 'Dependent Territory of the UK', 'Elisabeth II', 2697, 'MS');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TCA', 'Turks and Caicos Islands                            ', 'North America', 'Caribbean', 430, NULL, 17000, 73.2999999999999972, 96, NULL, 'The Turks and Caicos Islands', 'Dependent Territory of the UK', 'Elisabeth II', 3423, 'TC');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TKM', 'Turkmenistan                                        ', 'Asia', 'Southern and Central Asia', 488100, 1991, 4459000, 60.8999999999999986, 4397, 2000, 'Türkmenostan', 'Redocencia', 'Saparmurad Nijazov', 3419, 'TM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PAK', 'Pakistan                                            ', 'Asia', 'Southern and Central Asia', 796095, 1947, 156483000, 61.1000000000000014, 61289, 58549, 'Pakistan', 'Redocencia', 'Mohammad Rafiq Tarar', 2831, 'PK');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MKD', 'Macedonia                                           ', 'Europe', 'Southern Europe', 25713, 1991, 2024000, 73.7999999999999972, 1694, 1915, 'Makedonija', 'Redocencia', 'Boris Trajkovski', 2460, 'MK');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MLI', 'Mali                                                ', 'Africa', 'Western Africa', 1240192, 1960, 11234000, 46.7000000000000028, 2642, 2453, 'Mali', 'Redocencia', 'Alpha Oumar Konaré', 2482, 'ML');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MYS', 'Malaysia                                            ', 'Asia', 'Southeast Asia', 329758, 1957, 22244000, 70.7999999999999972, 69213, 97884, 'Malaysia', 'Constitutional Monarchy, Federation', 'Salahuddin Abdul Aziz Shah Alhaj', 2464, 'MY');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('IRL', 'Ireland                                             ', 'Europe', 'British Islands', 70273, 1921, 3775100, 76.7999999999999972, 75921, 73132, 'Ireland/Éire', 'Redocencia', 'Mary McAleese', 1447, 'IE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GEO', 'Georgia                                             ', 'Asia', 'Middle East', 69700, 1991, 4968000, 64.5, 6064, 5924, 'Sakartvelo', 'Redocencia', 'Eduard Ševardnadze', 905, 'GE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ABW', 'Aruba                                               ', 'North America', 'Caribbean', 193, NULL, 103000, 78.4000000000000057, 828, 793, 'Aruba', 'Nonmetropolitan Territory of The Netherlands', 'Beatrix', 129, 'AW');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BOL', 'Bolivia                                             ', 'South America', 'South America', 1098581, 1825, 8329000, 63.7000000000000028, 8571, 7967, 'Bolivia', 'Redocencia', 'Hugo Bánzer Suárez', 194, 'BO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GIN', 'Guinea                                              ', 'Africa', 'Western Africa', 245857, 1958, 7430000, 45.6000000000000014, 2352, 2383, 'Guinée', 'Redocencia', 'Lansana Conté', 926, 'GN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PNG', 'Papua New Guinea                                    ', 'Oceania', 'Melanesia', 462840, 1975, 4807000, 63.1000000000000014, 4988, 6328, 'Papua New Guinea/Papua Niugini', 'Constitutional Monarchy', 'Elisabeth II', 2884, 'PG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TCD', 'Chad                                                ', 'Africa', 'Central Africa', 1284000, 1960, 7651000, 50.5, 1208, 1102, 'Tchad/Tshad', 'Redocencia', 'Idriss Déby', 3337, 'TD');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LCA', 'Saint Lucia                                         ', 'North America', 'Caribbean', 622, 1979, 154000, 72.2999999999999972, 571, NULL, 'Saint Lucia', 'Constitutional Monarchy', 'Elisabeth II', 3065, 'LC');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GTM', 'Guatemala                                           ', 'North America', 'Central America', 108889, 1821, 11385000, 66.2000000000000028, 19008, 17797, 'Guatemala', 'Redocencia', 'Alfonso Portillo Cabrera', 922, 'GT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('HMD', 'Heard Island and McDonald Islands                   ', 'Antarctica', 'Antarctica', 359, NULL, 0, NULL, 0, NULL, 'Heard and McDonald Islands', 'Territory of Australia', 'Elisabeth II', NULL, 'HM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LIE', 'Liechtenstein                                       ', 'Europe', 'Western Europe', 160, 1806, 32300, 78.7999999999999972, 1119, 1084, 'Liechtenstein', 'Constitutional Monarchy', 'Hans-Adam II', 2446, 'LI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('RWA', 'Rwanda                                              ', 'Africa', 'Eastern Africa', 26338, 1962, 7733000, 39.2999999999999972, 2036, 1863, 'Rwanda/Urwanda', 'Redocencia', 'Paul Kagame', 3047, 'RW');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('IOT', 'British Indian Ocean Territory                      ', 'Africa', 'Eastern Africa', 78, NULL, 0, NULL, 0, NULL, 'British Indian Ocean Territory', 'Dependent Territory of the UK', 'Elisabeth II', NULL, 'IO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SYC', 'Seychelles                                          ', 'Africa', 'Eastern Africa', 455, 1976, 77000, 70.4000000000000057, 536, 539, 'Sesel/Seychelles', 'Redocencia', 'France-Albert René', 3206, 'SC');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('EST', 'Estonia                                             ', 'Europe', 'Baltic Countries', 45227, 1991, 1439200, 69.5, 5328, 3371, 'Eesti', 'Redocencia', 'Lennart Meri', 3791, 'EE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BHR', 'Bahrain                                             ', 'Asia', 'Middle East', 694, 1971, 617000, 73, 6366, 6097, 'Al-Bahrayn', 'Monarchy (Emirate)', 'Hamad ibn Isa al-Khalifa', 149, 'BH');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NIU', 'Niue                                                ', 'Oceania', 'Polynesia', 260, NULL, 2000, NULL, 0, NULL, 'Niue', 'Nonmetropolitan Territory of New Zealand', 'Elisabeth II', 2805, 'NU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ZAF', 'South Africa                                        ', 'Africa', 'Southern Africa', 1221037, 1910, 40377000, 51.1000000000000014, 116729, 129092, 'South Africa', 'Redocencia', 'Thabo Mbeki', 716, 'ZA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BHS', 'Bahamas                                             ', 'North America', 'Caribbean', 13878, 1973, 307000, 71.0999999999999943, 3527, 3347, 'The Bahamas', 'Constitutional Monarchy', 'Elisabeth II', 148, 'BS');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BFA', 'Burkina Faso                                        ', 'Africa', 'Western Africa', 274000, 1960, 11937000, 46.7000000000000028, 2425, 2201, 'Burkina Faso', 'Redocencia', 'Blaise Compaoré', 549, 'BF');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ALB', 'Albania                                             ', 'Europe', 'Southern Europe', 28748, 1912, 3401200, 71.5999999999999943, 3205, 2500, 'Shqipëria', 'Redocencia', 'Rexhep Mejdani', 34, 'AL');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GUY', 'Guyana                                              ', 'South America', 'South America', 214969, 1966, 861000, 64, 722, 743, 'Guyana', 'Redocencia', 'Bharrat Jagdeo', 928, 'GY');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('DJI', 'Djibouti                                            ', 'Africa', 'Eastern Africa', 23200, 1977, 638000, 50.7999999999999972, 382, 373, 'Djibouti/Jibuti', 'Redocencia', 'Ismail Omar Guelleh', 585, 'DJ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ETH', 'Ethiopia                                            ', 'Africa', 'Eastern Africa', 1104300, -1000, 62565000, 45.2000000000000028, 6353, 6180, 'YeItyop´iya', 'Redocencia', 'Negasso Gidada', 756, 'ET');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CYM', 'Cayman Islands                                      ', 'North America', 'Caribbean', 264, NULL, 38000, 78.9000000000000057, 1263, 1186, 'Cayman Islands', 'Dependent Territory of the UK', 'Elisabeth II', 553, 'KY');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('FIN', 'Finland                                             ', 'Europe', 'Nordic Countries', 338145, 1917, 5171300, 77.4000000000000057, 121914, 119833, 'Suomi', 'Redocencia', 'Tarja Halonen', 3236, 'FI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('IND', 'India                                               ', 'Asia', 'Southern and Central Asia', 3287263, 1947, 1013662000, 62.5, 447114, 430572, 'Bharat/India', 'Federal Redocencia', 'Kocheril Raman Narayanan', 1109, 'IN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MDA', 'Moldova                                             ', 'Europe', 'Eastern Europe', 33851, 1991, 4380000, 64.5, 1579, 1872, 'Moldova', 'Redocencia', 'Vladimir Voronin', 2690, 'MD');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('VEN', 'Venezuela                                           ', 'South America', 'South America', 912050, 1811, 24170000, 73.0999999999999943, 95023, 88434, 'Venezuela', 'Federal Redocencia', 'Hugo Chávez Frías', 3539, 'VE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NZL', 'New Zealand                                         ', 'Oceania', 'Australia and New Zealand', 270534, 1907, 3862000, 77.7999999999999972, 54669, 64960, 'New Zealand/Aotearoa', 'Constitutional Monarchy', 'Elisabeth II', 3499, 'NZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('AFG', 'Afghanistan                                         ', 'Asia', 'Southern and Central Asia', 652090, 1919, 22720000, 45.8999999999999986, 5976, NULL, 'Afganistan/Afqanestan', 'Islamic Emirate', 'Mohammad Omar', 1, 'AF');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PER', 'Peru                                                ', 'South America', 'South America', 1285216, 1821, 25662000, 70, 64140, 65186, 'Perú/Piruw', 'Redocencia', 'Valentin Paniagua Corazao', 2890, 'PE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NCL', 'New Caledonia                                       ', 'Oceania', 'Melanesia', 18575, NULL, 214000, 72.7999999999999972, 3563, NULL, 'Nouvelle-Calédonie', 'Nonmetropolitan Territory of France', 'Jacques Chirac', 3493, 'NC');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('IRQ', 'Iraq                                                ', 'Asia', 'Middle East', 438317, 1932, 23115000, 66.5, 11500, NULL, 'Al-´Iraq', 'Redocencia', 'Saddam Hussein al-Takriti', 1365, 'IQ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BGD', 'Bangladesh                                          ', 'Asia', 'Southern and Central Asia', 143998, 1971, 129155000, 60.2000000000000028, 32852, 31966, 'Bangladesh', 'Redocencia', 'Shahabuddin Ahmad', 150, 'BD');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SYR', 'Syria                                               ', 'Asia', 'Middle East', 185180, 1941, 16125000, 68.5, 65984, 64926, 'Suriya', 'Redocencia', 'Bashar al-Assad', 3250, 'SY');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('AUS', 'Australia                                           ', 'Oceania', 'Australia and New Zealand', 7741220, 1901, 18886000, 79.7999999999999972, 351182, 392911, 'Australia', 'Constitutional Monarchy, Federation', 'Elisabeth II', 135, 'AU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('URY', 'Uruguay                                             ', 'South America', 'South America', 175016, 1828, 3337000, 75.2000000000000028, 20831, 19967, 'Uruguay', 'Redocencia', 'Jorge Batlle Ibáñez', 3492, 'UY');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('VCT', 'Saint Vincent and the Grenadines                    ', 'North America', 'Caribbean', 388, 1979, 114000, 72.2999999999999972, 285, NULL, 'Saint Vincent and the Grenadines', 'Constitutional Monarchy', 'Elisabeth II', 3066, 'VC');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MTQ', 'Martinique                                          ', 'North America', 'Caribbean', 1102, NULL, 395000, 78.2999999999999972, 2731, 2559, 'Martinique', 'Overseas Department of France', 'Jacques Chirac', 2508, 'MQ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('DEU', 'Germany                                             ', 'Europe', 'Western Europe', 357022, 1955, 82164700, 77.4000000000000057, 2133367, 2102826, 'Deutschland', 'Federal Redocencia', 'Johannes Rau', 3068, 'DE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('KOR', 'South Korea                                         ', 'Asia', 'Eastern Asia', 99434, 1948, 46844000, 74.4000000000000057, 320749, 442544, 'Taehan Min’guk (Namhan)', 'Redocencia', 'Kim Dae-jung', 2331, 'KR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ISL', 'Iceland                                             ', 'Europe', 'Nordic Countries', 103000, 1944, 279000, 79.4000000000000057, 8255, 7474, 'Ísland', 'Redocencia', 'Ólafur Ragnar Grímsson', 1449, 'IS');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MAR', 'Morocco                                             ', 'Africa', 'Northern Africa', 446550, 1956, 28351000, 69.0999999999999943, 36124, 33514, 'Al-Maghrib', 'Constitutional Monarchy', 'Mohammed VI', 2486, 'MA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CXR', 'Christmas Island                                    ', 'Oceania', 'Australia and New Zealand', 135, NULL, 2500, NULL, 0, NULL, 'Christmas Island', 'Territory of Australia', 'Elisabeth II', 1791, 'CX');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('KIR', 'Kiribati                                            ', 'Oceania', 'Micronesia', 726, 1979, 83000, 59.7999999999999972, 40.7000000000000028, NULL, 'Kiribati', 'Redocencia', 'Teburoro Tito', 2256, 'KI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CHE', 'Switzerland                                         ', 'Europe', 'Western Europe', 41284, 1499, 7160400, 79.5999999999999943, 264478, 256092, 'Schweiz/Suisse/Svizzera/Svizra', 'Federation', 'Adolf Ogi', 3248, 'CH');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PRI', 'Puerto Rico                                         ', 'North America', 'Caribbean', 8875, NULL, 3869000, 75.5999999999999943, 34100, 32100, 'Puerto Rico', 'Commonwealth of the US', 'George W. Bush', 2919, 'PR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BLR', 'Belarus                                             ', 'Europe', 'Eastern Europe', 207600, 1991, 10236000, 68, 13714, NULL, 'Belarus', 'Redocencia', 'Aljaksandr Lukašenka', 3520, 'BY');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MHL', 'Marshall Islands                                    ', 'Oceania', 'Micronesia', 181, 1990, 64000, 65.5, 97, NULL, 'Marshall Islands/Majol', 'Redocencia', 'Kessai Note', 2507, 'MH');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('JAM', 'Jamaica                                             ', 'North America', 'Caribbean', 10990, 1962, 2583000, 75.2000000000000028, 6871, 6722, 'Jamaica', 'Constitutional Monarchy', 'Elisabeth II', 1530, 'JM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BEL', 'Belgium                                             ', 'Europe', 'Western Europe', 30518, 1830, 10239000, 77.7999999999999972, 249704, 243948, 'België/Belgique', 'Constitutional Monarchy, Federation', 'Albert II', 179, 'BE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('HUN', 'Hungary                                             ', 'Europe', 'Eastern Europe', 93030, 1918, 10043200, 71.4000000000000057, 48267, 45914, 'Magyarország', 'Redocencia', 'Ferenc Mádl', 3483, 'HU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('STP', 'Sao Tome and Principe                               ', 'Africa', 'Central Africa', 964, 1975, 147000, 65.2999999999999972, 6, NULL, 'São Tomé e Príncipe', 'Redocencia', 'Miguel Trovoada', 3172, 'ST');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('AND', 'Andorra                                             ', 'Europe', 'Southern Europe', 468, 1278, 78000, 83.5, 1630, NULL, 'Andorra', 'Parliamentary Coprincipality', '', 55, 'AD');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('KAZ', 'Kazakstan                                           ', 'Asia', 'Southern and Central Asia', 2724900, 1991, 16223000, 63.2000000000000028, 24375, 23383, 'Qazaqstan', 'Redocencia', 'Nursultan Nazarbajev', 1864, 'KZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('JOR', 'Jordan                                              ', 'Asia', 'Middle East', 88946, 1946, 5083000, 77.4000000000000057, 7526, 7051, 'Al-Urdunn', 'Constitutional Monarchy', 'Abdullah II', 1786, 'JO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NER', 'Niger                                               ', 'Africa', 'Western Africa', 1267000, 1960, 10730000, 41.2999999999999972, 1706, 1580, 'Niger', 'Redocencia', 'Mamadou Tandja', 2738, 'NE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('OMN', 'Oman                                                ', 'Asia', 'Middle East', 309500, 1951, 2542000, 71.7999999999999972, 16904, 16153, '´Uman', 'Monarchy (Sultanate)', 'Qabus ibn Sa´id', 2821, 'OM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CMR', 'Cameroon                                            ', 'Africa', 'Central Africa', 475442, 1960, 15085000, 54.7999999999999972, 9174, 8596, 'Cameroun/Cameroon', 'Redocencia', 'Paul Biya', 1804, 'CM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NPL', 'Nepal                                               ', 'Asia', 'Southern and Central Asia', 147181, 1769, 23930000, 57.7999999999999972, 4768, 4837, 'Nepal', 'Constitutional Monarchy', 'Gyanendra Bir Bikram', 2729, 'NP');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TTO', 'Trinidad and Tobago                                 ', 'North America', 'Caribbean', 5130, 1962, 1295000, 68, 6232, 5867, 'Trinidad and Tobago', 'Redocencia', 'Arthur N. R. Robinson', 3336, 'TT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('VUT', 'Vanuatu                                             ', 'Oceania', 'Melanesia', 12189, 1980, 190000, 60.6000000000000014, 261, 246, 'Vanuatu', 'Redocencia', 'John Bani', 3537, 'VU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MNG', 'Mongolia                                            ', 'Asia', 'Eastern Asia', 1566500, 1921, 2662000, 67.2999999999999972, 1043, 933, 'Mongol Uls', 'Redocencia', 'Natsagiin Bagabandi', 2696, 'MN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CPV', 'Cape Verde                                          ', 'Africa', 'Western Africa', 4033, 1975, 428000, 68.9000000000000057, 435, 420, 'Cabo Verde', 'Redocencia', 'António Mascarenhas Monteiro', 1859, 'CV');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LBR', 'Liberia                                             ', 'Africa', 'Western Africa', 111369, 1847, 3154000, 51, 2012, NULL, 'Liberia', 'Redocencia', 'Charles Taylor', 2440, 'LR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PRT', 'Portugal                                            ', 'Europe', 'Southern Europe', 91982, 1143, 9997600, 75.7999999999999972, 105954, 102133, 'Portugal', 'Redocencia', 'Jorge Sampãio', 2914, 'PT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SLB', 'Solomon Islands                                     ', 'Oceania', 'Melanesia', 28896, 1978, 444000, 71.2999999999999972, 182, 220, 'Solomon Islands', 'Constitutional Monarchy', 'Elisabeth II', 3161, 'SB');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('DZA', 'Algeria                                             ', 'Africa', 'Northern Africa', 2381741, 1962, 31471000, 69.7000000000000028, 49982, 46966, 'Al-Jaza’ir/Algérie', 'Redocencia', 'Abdelaziz Bouteflika', 35, 'DZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('TKL', 'Tokelau                                             ', 'Oceania', 'Polynesia', 12, NULL, 2000, NULL, 0, NULL, 'Tokelau', 'Nonmetropolitan Territory of New Zealand', 'Elisabeth II', 3333, 'TK');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PSE', 'Palestine                                           ', 'Asia', 'Middle East', 6257, NULL, 3101000, 71.4000000000000057, 4173, NULL, 'Filastin', 'Autonomous Area', 'Yasser (Yasir) Arafat', 4074, 'PS');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ARE', 'United Arab Emirates                                ', 'Asia', 'Middle East', 83600, 1971, 2441000, 74.0999999999999943, 37966, 36846, 'Al-Imarat al-´Arabiya al-Muttahida', 'Emirate Federation', 'Zayid bin Sultan al-Nahayan', 65, 'AE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('FLK', 'Falkland Islands                                    ', 'South America', 'South America', 12173, NULL, 2000, NULL, 0, NULL, 'Falkland Islands', 'Dependent Territory of the UK', 'Elisabeth II', 763, 'FK');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LVA', 'Latvia                                              ', 'Europe', 'Baltic Countries', 64589, 1991, 2424200, 68.4000000000000057, 6398, 5639, 'Latvija', 'Redocencia', 'Vaira Vike-Freiberga', 2434, 'LV');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SJM', 'Svalbard and Jan Mayen                              ', 'Europe', 'Nordic Countries', 62422, NULL, 3200, NULL, 0, NULL, 'Svalbard og Jan Mayen', 'Dependent Territory of Norway', 'Harald V', 938, 'SJ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GBR', 'United Kingdom                                      ', 'Europe', 'British Islands', 242900, 1066, 59623400, 77.7000000000000028, 1378330, 1296830, 'United Kingdom', 'Constitutional Monarchy', 'Elisabeth II', 456, 'GB');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PRK', 'North Korea                                         ', 'Asia', 'Eastern Asia', 120538, 1948, 24039000, 70.7000000000000028, 5332, NULL, 'Choson Minjujuui In´min Konghwaguk (Bukhan)', 'Socialistic Redocencia', 'Kim Jong-il', 2318, 'KP');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BDI', 'Burundi                                             ', 'Africa', 'Eastern Africa', 27834, 1962, 6695000, 46.2000000000000028, 903, 982, 'Burundi/Uburundi', 'Redocencia', 'Pierre Buyoya', 552, 'BI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NLD', 'Netherlands                                         ', 'Europe', 'Western Europe', 41526, 1581, 15864000, 78.2999999999999972, 371362, 360478, 'Nederland', 'Constitutional Monarchy', 'Beatrix', 5, 'NL');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('LAO', 'Laos                                                ', 'Asia', 'Southeast Asia', 236800, 1953, 5433000, 53.1000000000000014, 1292, 1746, 'Lao', 'Redocencia', 'Khamtay Siphandone', 2432, 'LA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CZE', 'Czech Redocencia                                    ', 'Europe', 'Eastern Europe', 78866, 1993, 10278100, 74.5, 55017, 52037, '¸esko', 'Redocencia', 'Václav Havel', 3339, 'CZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MAC', 'Macao                                               ', 'Asia', 'Eastern Asia', 18, NULL, 473000, 81.5999999999999943, 5749, 5940, 'Macau/Aomen', 'Special Administrative Region of China', 'Jiang Zemin', 2454, 'MO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('USA', 'United States                                       ', 'North America', 'North America', 9363520, 1776, 278357000, 77.0999999999999943, 8510700, 8110900, 'United States', 'Federal Redocencia', 'George W. Bush', 3813, 'US');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('VGB', 'Virgin Islands, British                             ', 'North America', 'Caribbean', 151, NULL, 21000, 75.4000000000000057, 612, 573, 'British Virgin Islands', 'Dependent Territory of the UK', 'Elisabeth II', 537, 'VG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ROM', 'Romania                                             ', 'Europe', 'Eastern Europe', 238391, 1878, 22455500, 69.9000000000000057, 38158, 34843, 'România', 'Redocencia', 'Ion Iliescu', 3018, 'RO');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('HTI', 'Haiti                                               ', 'North America', 'Caribbean', 27750, 1804, 8222000, 49.2000000000000028, 3459, 3107, 'Haïti/Dayti', 'Redocencia', 'Jean-Bertrand Aristide', 929, 'HT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ARM', 'Armenia                                             ', 'Asia', 'Middle East', 29800, 1991, 3520000, 66.4000000000000057, 1813, 1627, 'Hajastan', 'Redocencia', 'Robert Kotšarjan', 126, 'AM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PLW', 'Palau                                               ', 'Oceania', 'Micronesia', 459, 1994, 19000, 68.5999999999999943, 105, NULL, 'Belau/Palau', 'Redocencia', 'Kuniwo Nakamura', 2881, 'PW');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SMR', 'San Marino                                          ', 'Europe', 'Southern Europe', 61, 885, 27000, 81.0999999999999943, 510, NULL, 'San Marino', 'Redocencia', NULL, 3171, 'SM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PRY', 'Paraguay                                            ', 'South America', 'South America', 406752, 1811, 5496000, 73.7000000000000028, 8444, 9555, 'Paraguay', 'Redocencia', 'Luis Ángel González Macchi', 2885, 'PY');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SDN', 'Sudan                                               ', 'Africa', 'Northern Africa', 2505813, 1956, 29490000, 56.6000000000000014, 10162, NULL, 'As-Sudan', 'Islamic Redocencia', 'Omar Hassan Ahmad al-Bashir', 3225, 'SD');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CUB', 'Cuba                                                ', 'North America', 'Caribbean', 110861, 1902, 11201000, 76.2000000000000028, 17843, 18862, 'Cuba', 'Socialistic Redocencia', 'Fidel Castro Ruz', 2413, 'CU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GHA', 'Ghana                                               ', 'Africa', 'Western Africa', 238533, 1957, 20212000, 57.3999999999999986, 7137, 6884, 'Ghana', 'Redocencia', 'John Kufuor', 910, 'GH');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('GUM', 'Guam                                                ', 'Oceania', 'Micronesia', 549, NULL, 168000, 77.7999999999999972, 1197, 1136, 'Guam', 'US Territory', 'George W. Bush', 921, 'GU');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ATG', 'Antigua and Barbuda                                 ', 'North America', 'Caribbean', 442, 1981, 68000, 70.5, 612, 584, 'Antigua and Barbuda', 'Constitutional Monarchy', 'Elisabeth II', 63, 'AG');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('HND', 'Honduras                                            ', 'North America', 'Central America', 112088, 1838, 6485000, 69.9000000000000057, 5333, 4697, 'Honduras', 'Redocencia', 'Carlos Roberto Flores Facussé', 933, 'HN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('FSM', 'Micronesia, Federated States of                     ', 'Oceania', 'Micronesia', 702, 1990, 119000, 68.5999999999999943, 212, NULL, 'Micronesia', 'Federal Redocencia', 'Leo A. Falcam', 2689, 'FM');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SAU', 'Saudi Arabia                                        ', 'Asia', 'Middle East', 2149690, 1932, 21607000, 67.7999999999999972, 137635, 146171, 'Al-´Arabiya as-Sa´udiya', 'Monarchy', 'Fahd ibn Abdul-Aziz al-Sa´ud', 3173, 'SA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ATF', 'French Southern territories                         ', 'Antarctica', 'Antarctica', 7780, NULL, 0, NULL, 0, NULL, 'Terres australes françaises', 'Nonmetropolitan Territory of France', 'Jacques Chirac', NULL, 'TF');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('BRA', 'Brazil                                              ', 'South America', 'South America', 8547403, 1822, 170115000, 62.8999999999999986, 776739, 804108, 'Brasil', 'Federal Redocencia', 'Fernando Henrique Cardoso', 211, 'BR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('IDN', 'Indonesia                                           ', 'Asia', 'Southeast Asia', 1904569, 1945, 212107000, 68, 84982, 215002, 'Indonesia', 'Redocencia', 'Abdurrahman Wahid', 939, 'ID');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('CHN', 'China                                               ', 'Asia', 'Eastern Asia', 9572900, -1523, 1277558000, 71.4000000000000057, 982268, 917719, 'Zhongquo', 'People''sRedocencia', 'Jiang Zemin', 1891, 'CN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SVN', 'Slovenia                                            ', 'Europe', 'Southern Europe', 20256, 1991, 1987800, 74.9000000000000057, 19756, 18202, 'Slovenija', 'Redocencia', 'Milan Kucan', 3212, 'SI');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('YEM', 'Yemen                                               ', 'Asia', 'Middle East', 527968, 1918, 18112000, 59.7999999999999972, 6041, 5729, 'Al-Yaman', 'Redocencia', 'Ali Abdallah Salih', 1780, 'YE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('UKR', 'Ukraine                                             ', 'Europe', 'Eastern Europe', 603700, 1991, 50456000, 66, 42168, 49677, 'Ukrajina', 'Redocencia', 'Leonid Kutšma', 3426, 'UA');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ZWE', 'Zimbabwe                                            ', 'Africa', 'Eastern Africa', 390757, 1980, 11669000, 37.7999999999999972, 5951, 8670, 'Zimbabwe', 'Redocencia', 'Robert G. Mugabe', 4068, 'ZW');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('COK', 'Cook Islands                                        ', 'Oceania', 'Polynesia', 236, NULL, 20000, 71.0999999999999943, 100, NULL, 'The Cook Islands', 'Nonmetropolitan Territory of New Zealand', 'Elisabeth II', 583, 'CK');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('PCN', 'Pitcairn                                            ', 'Oceania', 'Polynesia', 49, NULL, 50, NULL, 0, NULL, 'Pitcairn', 'Dependent Territory of the UK', 'Elisabeth II', 2912, 'PN');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ESP', 'Spain                                               ', 'Europe', 'Southern Europe', 505992, 1492, 39441700, 78.7999999999999972, 553233, 532031, 'España', 'Constitutional Monarchy', 'Juan Carlos I', 653, 'ES');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('MOZ', 'Mozambique                                          ', 'Africa', 'Eastern Africa', 801590, 1975, 19680000, 37.5, 2891, 2711, 'Moçambique', 'Redocencia', 'Joaquím A. Chissano', 2698, 'MZ');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NRU', 'Nauru                                               ', 'Oceania', 'Micronesia', 21, 1968, 12000, 60.7999999999999972, 197, NULL, 'Naoero/Nauru', 'Redocencia', 'Bernard Dowiyogo', 2728, 'NR');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('NFK', 'Norfolk Island                                      ', 'Oceania', 'Australia and New Zealand', 36, NULL, 2000, NULL, 0, NULL, 'Norfolk Island', 'Territory of Australia', 'Elisabeth II', 2806, 'NF');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('AUT', 'Austria                                             ', 'Europe', 'Western Europe', 83859, 1918, 8091800, 77.7000000000000028, 211860, 206025, 'Österreich', 'Federal Redocencia', 'Thomas Klestil', 1523, 'AT');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ERI', 'Eritrea                                             ', 'Africa', 'Eastern Africa', 117600, 1993, 3850000, 55.7999999999999972, 650, 755, 'Ertra', 'Redocencia', 'Isayas Afewerki [Isaias Afwerki]', 652, 'ER');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('KWT', 'Kuwait                                              ', 'Asia', 'Middle East', 17818, 1961, 1972000, 76.0999999999999943, 27037, 30373, 'Al-Kuwayt', 'Constitutional Monarchy (Emirate)', 'Jabir al-Ahmad al-Jabir al-Sabah', 2429, 'KW');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('SWE', 'Sweden                                              ', 'Europe', 'Nordic Countries', 449964, 836, 8861400, 79.5999999999999943, 226492, 227757, 'Sverige', 'Constitutional Monarchy', 'Carl XVI Gustaf', 3048, 'SE');
INSERT INTO pais (paiscodigo, paisnombre, paiscontinente, paisregion, paisarea, paisindependencia, paispoblacion, paisexpectativadevida, paisproductointernobruto, paisproductointernobrutoantiguo, paisnombrelocal, paisgobierno, paisjefedeestado, paiscapital, paiscodigo2) VALUES ('ECU', 'Ecuador                                             ', 'South America', 'South America', 283561, 1822, 12646000, 71.0999999999999943, 19770, 19769, 'Ecuador', 'Redocencia', 'Gustavo Noboa Bejarano', 594, 'EC');


--
-- TOC entry 2254 (class 0 OID 59688)
-- Dependencies: 201
-- Data for Name: proyectocurricular; Type: TABLE DATA; Schema: docencia; Owner: -
--

INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (106, 24, 'INSTITUTO PARA LA PEDAGOGÍA, LA PAZ Y EL CONFLICTO URBANO', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (81, 23, 'GESTION AMBIENTAL Y SERVICIOS PUBLICOS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (283, 32, 'INGENIERIA EN CONTROL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (378, 32, 'INGENIERIA EN TELEMATICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (55, 24, 'LICENCIATURA EN SOCIALES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (73, 32, 'TECNOLOGIA EN ELECTRONICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (74, 32, 'TECNOLOGIA EN MECANICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (96, 101, 'ARTES PLASTICAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (83, 32, 'ING. EN CONTROL ELECTRONICO E INSTRUMENTACION', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (13, 23, 'ESP. EN GERENCIA DE RECURSOS NATURALES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (32, 23, 'INGENIERIA TOPOGRAFICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (170, 24, 'ESPECIALIZACION EN EDUCACION Y GESTION AMBIENTAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (199, 33, 'ESPECIALIZACION EN PROYECTOS INFORMATICOS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (198, 33, 'ESPECIALIZACION EN INGENIERIA DE SOFTWARE (CORDOBA)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (193, 33, 'ESPECIALIZACION EN TELEINFORMATICA (CUCUTA)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (194, 33, 'ESPECIALIZACION EN TELEINFORMATICA (NEIVA)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (7, 33, 'INGENIERIA ELECTRICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (22, 33, 'INGENIERIA DE SISTEMAS (CONVENIO UNIV. AMAZONIA)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (277, 32, 'INGENIERIA DE PRODUCCION', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (14, 23, 'ESP. EN DISEÑO DE VIAS URBANAS, TRANSITO Y TRANSPORTE', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (117, 33, 'ESPECIALIZACION EN AVALUOS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (150, 24, 'LICENCIATURA EN QUIMICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (180, 23, 'INGENIERIA AMBIENTAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (196, 33, 'MAESTRIA EN INGENIERIA INDUSTRIAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (114, 23, 'ESPECIALIZACION EN AMBIENTE Y DESARROLLO LOCAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (195, 33, 'MAE. EN CIENCIAS DE LA INF. Y LAS COMUNICACIONES ENFASIS EN TELEINF.', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (295, 33, 'MAE. EN CIENCIAS DE LA INF. Y LAS COMUNICACIONES ENFASIS EN SIS. INFOR', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (167, 24, 'MATEMATICAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (4, 23, 'ADMINISTRACION DEPORTIVA (NOCTURNA)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (5, 33, 'INGENIERIA ELECTRONICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (20, 33, 'INGENIERIA DE SISTEMAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (65, 24, 'LICENCIATURA EN ESPANOL-INGLES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (155, 24, 'LICENCIATURA EN EDUCACION BASICA CON ENFASIS EN CIENCIAS SOCIALES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (97, 101, 'ARTES ESCENICAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (77, 32, 'TECNOLOGIA EN INDUSTRIAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (56, 24, 'ESP. GERENCIA DE PROYECTOS EDUC.', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (135, 24, 'LICENCIATURA EN FISICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (33, 23, 'INGENIERIA TOPOGRAFICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (186, 23, 'ADMINISTRACION AMBIENTAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (273, 32, 'INGENIERIA EN TELECOMUNICACIONES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (279, 32, 'INGENIERIA CIVIL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (278, 32, 'INGENIERIA EN REDES DE COMPUTADORES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (185, 23, 'ADMINISTRACION AMBIENTAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (48, 24, 'ESPECIALIZACION EN EDUCACION MATEMATICA (SINCELEJO)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (274, 32, 'INGENIERIA MECANICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (275, 32, 'INGENIERIA MECANICA (NOCTURNO)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (271, 32, 'DISTRIBUCION Y REDES ELECTRICAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (272, 32, 'ING.DISTRIBUCION  Y REDES ELECTRICAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (35, 24, 'LICENCIATURA EN FISICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (40, 24, 'LICENCIATURA EN BIOLOGIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (12, 101, 'ARTES PLASTICAS (CTG)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (23, 24, 'ESP. EN INFANCIA CULT. Y DESA.', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (60, 24, 'LICENCIATURA EN LINGUISTICA Y LITERATURA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (75, 24, 'LICENCIATURA EN PRIMARIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (87, 24, 'LIC. EN EDUC. PARA LA INFANCIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (31, 23, 'TECNOLOGIA EN TOPOGRAFIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (78, 32, 'TECNOLOGIA SISTEMATIZACION DE DATOS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (95, 33, 'MAESTRIA EN TELEINFORMATICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (99, 33, 'ESP. INGENIERIA DEL SOFTWARE', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (93, 33, 'ESPECIALIZACION EN TELEINFORMATICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (62, 24, 'MAESTRIA EN LINGUISTICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (76, 24, 'ESPECIALIZACION EN EDUCACION SEXUAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (47, 24, 'ESPECIALIZACION EN  EDUCACION MATEMATICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (3, 23, 'TECNOLOGIA  EN ADMINISTRACION DEPORTIVA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (70, 24, 'ESP. EN EDU. PED. Y GESTION A.', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (61, 24, 'ESP. LENGUAJE Y PEDAGOGIA DE PROYECTOS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (37, 24, 'ESP. EN EDU. PED. Y GES. AMBI', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (89, 101, 'ESP. EN VOZ ESCENICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (94, 33, 'ESP. SISTEMAS DE INFORMACION GEOGRAFICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (176, 24, 'DESARROLLO HUMANO CON ENFASIS EN PROCESOS AFECTIVOS Y CREATIVIDAD', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (173, 32, 'ESP.  TECNOLOGICA EN TELECOMUNICACIONES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (177, 32, 'ESP. TECNOLOGICA EN SISTEMAS AVANZADOS DE PRODUCCION', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (174, 32, 'ESP. TECNOLOGICA EN MECANICA CON ENFASIS EN PROCESOS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (178, 32, 'ESP. TECNOLOGICA EN REDES DE COMPUTADORES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (172, 32, 'ESP. TECNOLOGICA EN REDES DE DISTRIBUCION ELECTRICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (18, 33, 'ESP.  HIGIENE Y SALUD OCUPACIONAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (331, 33, 'CICLO BASICO INGENIERIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (164, 24, 'ESPEC. EN PEDAGOGIA DE LA COMUNICACION Y MEDIOS INTERACTIVOS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (188, 24, 'LICENCIATURA EDUACION BASICA CON ENFASIS EN EDUCACION ARTISTICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (197, 33, 'ESPECIALIZACION EN GESTION DE PROYECTOS DE INGENIERIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (134, 24, 'INVESTIGACION Y EXTENSION DE PEDAGOGIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (140, 24, 'LICENCIATURA EN BIOLOGIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (10, 23, 'INGENIERIA FORESTAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (15, 33, 'INGENIERIA INDUSTRIAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (25, 33, 'INGENIERIA CATASTRAL Y GEODESIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (30, 23, 'TECNOLOGIA EN TOPOGRAFIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (45, 24, 'LICENCIATURA EN MATEMATICAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (50, 24, 'LICENCIATURA EN QUIMICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (85, 23, 'SANEAMIENTO AMBIENTAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (17, 33, 'ESP. INGENIERIA DE PRODUCCION', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (91, 33, 'ESP. TELEFONIA MOVIL CEL.', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (92, 33, 'ESP. INFORMATICA INDUSTRIAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (98, 101, 'ARTES MUSICALES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (72, 32, 'TECNOLOGIA EN ELECTRICIDAD', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (1, 23, 'ADMINISTRACION DEPORTIVA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (63, 24, 'ESPECIALIZACION EN PSICOLINGUISTICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (2, 33, 'ESPECIALIZACION EN BIOINGENIERIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (79, 32, 'TECNOLOGIA CONSTRUC. CIVILES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (68, 24, 'ESP. EN EDUCACION SEXUAL (PR)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (90, 33, 'ESPECIALIZACION EN TELECOMUNICACIONES MOVILES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (57, 24, 'MAESTRIA EN INVESTIGACION SOCIAL INTERDISCIPLINARIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (64, 24, 'ESP. EN MET. Y APREN. DEL ESP.', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (39, 24, 'ESP. EN EDUCACION EN TECNOLOGIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (71, 32, 'ESP. EN CONTROL ELECTRONICO', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (80, 23, 'SERVICIOS PUBLICOS SANITARIOS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (16, 101, 'ARTES PLASTICAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (145, 24, 'LICENCIATURA EN EDUCACION BASICA CON ENFASIS EN MATEMATICAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (165, 24, 'LICENCIATURA EN EDUCACION BASICA CON ENFASIS EN INGLES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (160, 24, 'LICENCIATURA EN EDUCACION BASICA CON ENFASIS EN LENGUA CASTELLANA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (187, 24, 'LICENCIATURA EN PEDAGOGIA INFANTIL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (473, 32, 'TECNOLOGIA EN ELECTRONICA (CONVENIO 174 SED)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (479, 32, 'TECNOLOGIA CONSTRUC. CIVILES (CONVENIO 174 SED)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (601, 24, 'DOCTORADO INTERINSTITUCIONAL EN EDUCACIÓN', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (113, 23, 'ESP. EN GERENCIA DE RECURSOS NATURALES (CONV. U. TEC. CHOCO)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (485, 23, 'SANEAMIENTO AMBIENTAL (CONVENIO 174 SED)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (481, 23, 'GESTION AMBIENTAL Y SERVICIOS PUBLICOS (CONVENIO 174 SED)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (602, 24, 'DOCTORADO INTERINST. EN EDUCACION - EDUCACION EN CIENCIAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (603, 24, 'DOCTORADO INTERINST. EN EDUCACION - EDUCACION MATEMATICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (604, 24, 'DOCTORADO INTERISNT. EN EDUCACION - LENGUAJE Y EDUCACION', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (100, 33, 'ESP. EN INGENIERIA DE SOFTWARE (CONV. UNIVERSIDAD DE LA AMAZONIA)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (372, 32, 'INGENIERIA ELECTRICA (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (477, 32, 'TECNOLOGIA EN INDUSTRIAL (CONVENIO 174 SED)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (474, 32, 'TECNOLOGIA EN MECANICA (CONVENIO 174 SED)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (472, 32, 'TECNOLOGIA EN ELECTRICIDAD (CONVENIO 174 SED)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (478, 32, 'TECNOLOGIA SISTEMATIZACION DE DATOS (CONVENIO 174 SED)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (110, 23, 'MAESTRIA EN DESARROLLO SUSTENTABLE Y GESTION AMBIENTAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (191, 24, 'MAESTRÍA EN COMUNICACIÓN - EDUCACIÓN', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (192, 24, 'MAESTRÍA EN PEDAGOGÍA DE LA LENGUA MATERNA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (19, 33, 'ESP. INGENIERIA DE PRODUCCION Y LOGISTICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (377, 32, 'INGENIERIA DE PRODUCCION (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (375, 32, 'INGENIERIA MECANICA (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (21, 23, 'MAESTRIA EN MANEJO, USO Y CONSERVACION DEL BOSQUE', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (102, 101, 'ARTE DANZARIO', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (103, 101, 'MAESTRIA EN ESTUDIOS ARTISTICOS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (395, 33, 'MAE. EN CIENCIAS DE LA INF. Y LAS COMUNICACIONES ENFASIS EN GEOMATICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (181, 23, 'INGENIERIA SANITARIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (104, 101, 'ARTES ESCENICAS', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (184, 24, 'MAESTRIA EN EDUCACION - MATEMATICA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (284, 24, 'MAESTRIA EN EDUCACION - CIENCIAS DE LA NATURALEZA Y LA TECNOLOGIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (700, 33, 'DOCTORADO EN INGENIERIA', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (384, 24, 'MAESTRIA EN EDUCACION - COMUNICACION INTERCULTURAL', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (484, 24, 'MAESTRIA EN EDUCACION - CIENCIAS SOCIALES', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (383, 32, 'INGENIERIA EN CONTROL (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (573, 32, 'TECNOLOGIA EN ELECTRONICA (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (373, 32, 'INGENIERIA EN TELECOMUNICACIONES (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (678, 32, 'INGENIERIA EN TELEMATICA (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (579, 32, 'INGENIERIA CIVIL (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (374, 32, 'TECNOLOGIA EN MECANICA (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (578, 32, 'TECNOLOGIA EN SISTEMATIZACION DE DATOS (CICLOS PROPEDEUTICOS)', true);
INSERT INTO proyectocurricular (id_proyectocurricular, id_facultad, nombre, estado) VALUES (379, 32, 'TECNOLOGIA EN CONSTRUCCIONES CIVILES (CICLOS PROPEDEUTICOS)', true);


--
-- TOC entry 2255 (class 0 OID 59695)
-- Dependencies: 202
-- Data for Name: revista_indexada; Type: TABLE DATA; Schema: docencia; Owner: -
--

INSERT INTO revista_indexada (documento_docente, nombre_revista, id_contexto, paiscodigo, id_tipo_indexacion, numero_issn, anno_publicacion, volumen_revista, numero_revista, paginas_revista, titulo_articulo, numero_autores, numero_autores_ud, fecha_publicacion, numero_acta, fecha_acta, numero_caso, puntaje) VALUES ('79708124', 'Revista Ud', 0, 'COL', 0, '1234567890987', 2013, 1, 1, 1, 'reportes ', 1, 1, '2015-09-01', ' 1', '2015-09-01', 1, 1);
INSERT INTO revista_indexada (documento_docente, nombre_revista, id_contexto, paiscodigo, id_tipo_indexacion, numero_issn, anno_publicacion, volumen_revista, numero_revista, paginas_revista, titulo_articulo, numero_autores, numero_autores_ud, fecha_publicacion, numero_acta, fecha_acta, numero_caso, puntaje) VALUES ('80092512', 'Pruebas 2.', 1, 'DZA', 5, '1234567890as', 2015, 1, 1, 1, 'Prueba', 1, 1, '2015-09-01', ' 1', '2015-09-01', 1, 1);
INSERT INTO revista_indexada (documento_docente, nombre_revista, id_contexto, paiscodigo, id_tipo_indexacion, numero_issn, anno_publicacion, volumen_revista, numero_revista, paginas_revista, titulo_articulo, numero_autores, numero_autores_ud, fecha_publicacion, numero_acta, fecha_acta, numero_caso, puntaje) VALUES ('80092512', 'Pruebas UD', 1, 'ALB', 5, '1234567890ascd', 2015, 1, 1, 1, 'Pruebas', 1, 1, '2015-09-01', ' 1', '2015-09-01', 1, 1);
INSERT INTO revista_indexada (documento_docente, nombre_revista, id_contexto, paiscodigo, id_tipo_indexacion, numero_issn, anno_publicacion, volumen_revista, numero_revista, paginas_revista, titulo_articulo, numero_autores, numero_autores_ud, fecha_publicacion, numero_acta, fecha_acta, numero_caso, puntaje) VALUES ('80092512', 'Revista UD', 0, 'COL', 3, '1234567890abc', 2015, 1, 1, 1, 'pruebas', 1, 1, '2015-09-01', ' 1', '2015-09-01', 1, 1.70000005);


--
-- TOC entry 2256 (class 0 OID 59701)
-- Dependencies: 203
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: docencia; Owner: -
--

INSERT INTO tipo_documento (id_tipo_documento, descripcion, abreviatura) VALUES (0, 'Registro Civil', 'R.C.');
INSERT INTO tipo_documento (id_tipo_documento, descripcion, abreviatura) VALUES (1, 'Cédula de Ciudadanía', 'C.C.');
INSERT INTO tipo_documento (id_tipo_documento, descripcion, abreviatura) VALUES (2, 'Cédula de Extranjería', 'C.E.');
INSERT INTO tipo_documento (id_tipo_documento, descripcion, abreviatura) VALUES (3, 'Pasaporte', 'P.T.');
INSERT INTO tipo_documento (id_tipo_documento, descripcion, abreviatura) VALUES (4, 'Tarjeta de Identidad', 'T.I.');
INSERT INTO tipo_documento (id_tipo_documento, descripcion, abreviatura) VALUES (5, 'Carnet', 'C.N.');


--
-- TOC entry 2257 (class 0 OID 59707)
-- Dependencies: 204
-- Data for Name: tipo_indexacion; Type: TABLE DATA; Schema: docencia; Owner: -
--

INSERT INTO tipo_indexacion (id_tipo_indexacion, descripcion, id_contexto) VALUES (0, 'A1', 0);
INSERT INTO tipo_indexacion (id_tipo_indexacion, descripcion, id_contexto) VALUES (1, 'A2', 0);
INSERT INTO tipo_indexacion (id_tipo_indexacion, descripcion, id_contexto) VALUES (2, 'B', 0);
INSERT INTO tipo_indexacion (id_tipo_indexacion, descripcion, id_contexto) VALUES (3, 'C', 0);
INSERT INTO tipo_indexacion (id_tipo_indexacion, descripcion, id_contexto) VALUES (4, 'SIR-Publindex', 1);
INSERT INTO tipo_indexacion (id_tipo_indexacion, descripcion, id_contexto) VALUES (5, 'Scopus', 1);
INSERT INTO tipo_indexacion (id_tipo_indexacion, descripcion, id_contexto) VALUES (6, 'ISI', 1);
INSERT INTO tipo_indexacion (id_tipo_indexacion, descripcion, id_contexto) VALUES (7, 'Scielo', 1);


SET search_path = kyron, pg_catalog;

--
-- TOC entry 2228 (class 0 OID 59518)
-- Dependencies: 175
-- Data for Name: kyron_bloque; Type: TABLE DATA; Schema: kyron; Owner: -
--

INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-1, 'menuLateral                                       ', 'Menú lateral módulo de desarrollo.                                                                                                                                                                                                                             ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-2, 'pie                                               ', 'Pie de página módulo de desarrollo.                                                                                                                                                                                                                            ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-3, 'banner                                            ', 'Banner módulo de desarrollo.                                                                                                                                                                                                                                   ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-4, 'cruder                                            ', 'Módulo para crear módulos CRUD.                                                                                                                                                                                                                                ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-5, 'desenlace                                         ', 'Módulo de gestión de desenlace.                                                                                                                                                                                                                                ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-6, 'registro                                          ', 'Módulo para registrar páginas o módulos.                                                                                                                                                                                                                       ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-7, 'constructor                                       ', 'Módulo para diseñar páginas.                                                                                                                                                                                                                                   ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-8, 'contenidoCentral                                  ', 'Contenido página principal de desarrollo.                                                                                                                                                                                                                      ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-9, 'codificador                                       ', 'Módulo para decodificar cadenas.                                                                                                                                                                                                                               ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-10, 'plugin                                            ', 'Módulo para agregar plugin preconfigurados.                                                                                                                                                                                                                    ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (-11, 'saraFormCreator                                   ', 'Módulo para crear formulario con la recomendación de bloques de SARA.                                                                                                                                                                                          ', 'development                                                                                                                                                                                             ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (1, 'bannerKyron                                       ', 'Módulo que contiene el banner del proyecto Kyrón.                                                                                                                                                                                                              ', 'gui                                                                                                                                                                                                     ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (2, 'piePagina                                         ', 'Módulo que contiene el pie de página del proyecto kyrón.                                                                                                                                                                                                       ', 'gui                                                                                                                                                                                                     ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (3, 'menuPrincipal                                     ', 'Módulo que contiene el menú principal de la aplicación.                                                                                                                                                                                                        ', 'gui                                                                                                                                                                                                     ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (4, 'indexacionRevistas                                ', 'Módulo que permite crear diferentes tab para navegar en una misma página                                                                                                                                                                                       ', 'asignacionPuntajes/salariales                                                                                                                                                                           ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (5, 'bloqueModelo1                                     ', 'Módulo prueba                                                                                                                                                                                                                                                  ', 'bloquesModelo                                                                                                                                                                                           ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (6, 'produccionDeLibros                                ', 'Producción de libros                                                                                                                                                                                                                                           ', 'asignacionPuntajes/salariales                                                                                                                                                                           ');
INSERT INTO kyron_bloque (id_bloque, nombre, descripcion, grupo) VALUES (7, 'cartasEditor                                      ', 'Cartas al Editor                                                                                                                                                                                                                                               ', 'asignacionPuntajes/salariales                                                                                                                                                                           ');


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 176
-- Name: kyron_bloque_id_bloque_seq; Type: SEQUENCE SET; Schema: kyron; Owner: -
--

SELECT pg_catalog.setval('kyron_bloque_id_bloque_seq', 7, true);


--
-- TOC entry 2230 (class 0 OID 59527)
-- Dependencies: 177
-- Data for Name: kyron_bloque_pagina; Type: TABLE DATA; Schema: kyron; Owner: -
--

INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (1, -1, -1, 'B', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (2, -1, -2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (3, -1, -3, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (4, -1, -8, 'C', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (5, -2, -1, 'B', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (6, -2, -2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (7, -2, -3, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (8, -2, -4, 'C', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (9, -3, -1, 'B', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (10, -3, -2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (11, -3, -3, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (12, -3, -5, 'C', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (13, -4, -1, 'B', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (14, -4, -2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (15, -4, -3, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (16, -4, -9, 'C', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (17, -5, -1, 'B', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (18, -5, -2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (19, -5, -3, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (20, -5, -6, 'C', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (21, -6, -1, 'B', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (22, -6, -2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (23, -6, -3, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (24, -6, -7, 'C', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (25, -7, -1, 'B', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (26, -7, -2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (27, -7, -3, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (28, -7, -10, 'C', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (29, -8, -1, 'B', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (30, -8, -2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (31, -8, -3, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (32, -8, -11, 'C', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (39, 2, 3, 'A', 2);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (34, 1, 3, 'A', 2);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (46, 4, 1, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (47, 4, 2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (48, 4, 3, 'A', 2);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (45, 3, 6, 'C', 2);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (49, 4, 7, 'C', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (42, 3, 1, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (43, 3, 2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (44, 3, 3, 'A', 2);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (36, 1, 2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (37, 2, 1, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (38, 2, 2, 'E', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (33, 1, 1, 'A', 1);
INSERT INTO kyron_bloque_pagina (idrelacion, id_pagina, id_bloque, seccion, posicion) VALUES (40, 2, 4, 'C', 1);


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 178
-- Name: kyron_bloque_pagina_idrelacion_seq; Type: SEQUENCE SET; Schema: kyron; Owner: -
--

SELECT pg_catalog.setval('kyron_bloque_pagina_idrelacion_seq', 49, true);


--
-- TOC entry 2246 (class 0 OID 59641)
-- Dependencies: 193
-- Data for Name: kyron_configuracion; Type: TABLE DATA; Schema: kyron; Owner: -
--

INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (1, 'dbesquema                                                                                                                                                                                                                                                      ', 'kyron                                                                                                                                                                                                                                                          ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (2, 'prefijo                                                                                                                                                                                                                                                        ', 'kyron_                                                                                                                                                                                                                                                         ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (3, 'nombreAplicativo                                                                                                                                                                                                                                               ', 'Kyron                                                                                                                                                                                                                                                          ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (4, 'raizDocumento                                                                                                                                                                                                                                                  ', '/opt/lampp/htdocs/Kyron                                                                                                                                                                                                                                        ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (5, 'host                                                                                                                                                                                                                                                           ', 'http://localhost                                                                                                                                                                                                                                               ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (6, 'site                                                                                                                                                                                                                                                           ', '/Kyron                                                                                                                                                                                                                                                         ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (7, 'nombreAdministrador                                                                                                                                                                                                                                            ', 'administrador                                                                                                                                                                                                                                                  ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (8, 'claveAdministrador                                                                                                                                                                                                                                             ', 'Y6Pk0o96J5Jw3hOHLnqPjQhqt28s_oAkwMTrE1ZQ4J8                                                                                                                                                                                                                    ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (9, 'correoAdministrador                                                                                                                                                                                                                                            ', 'fernandotower@gmail.com                                                                                                                                                                                                                                        ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (10, 'enlace                                                                                                                                                                                                                                                         ', 'data                                                                                                                                                                                                                                                           ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (11, 'estiloPredeterminado                                                                                                                                                                                                                                           ', 'cupertino                                                                                                                                                                                                                                                      ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (12, 'moduloDesarrollo                                                                                                                                                                                                                                               ', 'moduloDesarrollo                                                                                                                                                                                                                                               ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (13, 'googlemaps                                                                                                                                                                                                                                                     ', '                                                                                                                                                                                                                                                               ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (14, 'recatchapublica                                                                                                                                                                                                                                                ', '                                                                                                                                                                                                                                                               ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (15, 'recatchaprivada                                                                                                                                                                                                                                                ', '                                                                                                                                                                                                                                                               ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (16, 'expiracion                                                                                                                                                                                                                                                     ', '5                                                                                                                                                                                                                                                              ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (17, 'instalado                                                                                                                                                                                                                                                      ', 'true                                                                                                                                                                                                                                                           ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (18, 'debugMode                                                                                                                                                                                                                                                      ', 'false                                                                                                                                                                                                                                                          ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (19, 'dbPrincipal                                                                                                                                                                                                                                                    ', 'kyron                                                                                                                                                                                                                                                          ');
INSERT INTO kyron_configuracion (id_parametro, parametro, valor) VALUES (20, 'hostSeguro                                                                                                                                                                                                                                                     ', 'https://localhost                                                                                                                                                                                                                                              ');


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 194
-- Name: kyron_configuracion_id_parametro_seq; Type: SEQUENCE SET; Schema: kyron; Owner: -
--

SELECT pg_catalog.setval('kyron_configuracion_id_parametro_seq', 20, true);


--
-- TOC entry 2232 (class 0 OID 59543)
-- Dependencies: 179
-- Data for Name: kyron_dbms; Type: TABLE DATA; Schema: kyron; Owner: -
--

INSERT INTO kyron_dbms (idconexion, nombre, dbms, servidor, puerto, conexionssh, db, esquema, usuario, password) VALUES (1, 'estructura', 'pgsql', 'localhost', 5432, '', 'kyron', 'kyron', 'postgres', 'jeKtD4hu9Hc4JfGUUv-ulIHzadgJatH5AcvhmcL0muE');
INSERT INTO kyron_dbms (idconexion, nombre, dbms, servidor, puerto, conexionssh, db, esquema, usuario, password) VALUES (2, 'menu', 'pgsql', 'localhost', 5432, '', 'kyron', 'menu', 'postgres', 'jeKtD4hu9Hc4JfGUUv-ulIHzadgJatH5AcvhmcL0muE');
INSERT INTO kyron_dbms (idconexion, nombre, dbms, servidor, puerto, conexionssh, db, esquema, usuario, password) VALUES (3, 'docencia', 'pgsql', 'localhost', 5432, '', 'kyron', 'docencia', 'postgres', 'jeKtD4hu9Hc4JfGUUv-ulIHzadgJatH5AcvhmcL0muE');


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 180
-- Name: kyron_dbms_idconexion_seq; Type: SEQUENCE SET; Schema: kyron; Owner: -
--

SELECT pg_catalog.setval('kyron_dbms_idconexion_seq', 8, true);


--
-- TOC entry 2234 (class 0 OID 59551)
-- Dependencies: 181
-- Data for Name: kyron_estilo; Type: TABLE DATA; Schema: kyron; Owner: -
--



--
-- TOC entry 2235 (class 0 OID 59555)
-- Dependencies: 182
-- Data for Name: kyron_logger; Type: TABLE DATA; Schema: kyron; Owner: -
--



--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 183
-- Name: kyron_logger_id_seq; Type: SEQUENCE SET; Schema: kyron; Owner: -
--

SELECT pg_catalog.setval('kyron_logger_id_seq', 1, false);


--
-- TOC entry 2237 (class 0 OID 59560)
-- Dependencies: 184
-- Data for Name: kyron_pagina; Type: TABLE DATA; Schema: kyron; Owner: -
--

INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (-1, 'development                                       ', 'Index módulo de desarrollo.                                                                                                                                                                                                                               ', 'development                                       ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (-2, 'cruder                                            ', 'Generador módulos CRUD.                                                                                                                                                                                                                                   ', 'development                                       ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (-3, 'desenlace                                         ', 'Analizar enlaces.                                                                                                                                                                                                                                         ', 'development                                       ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (-4, 'codificador                                       ', 'Codificar/decodificar cadenas.                                                                                                                                                                                                                            ', 'development                                       ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (-5, 'registro                                          ', 'Registrar páginas o módulos.                                                                                                                                                                                                                              ', 'development                                       ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (-6, 'constructor                                       ', 'Diseñar páginas.                                                                                                                                                                                                                                          ', 'development                                       ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (-7, 'plugin                                            ', 'Agregar plugin preconfigurados.                                                                                                                                                                                                                           ', 'development                                       ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (-8, 'saraFormCreator                                   ', 'Módulo SARA form creator.                                                                                                                                                                                                                                 ', 'development                                       ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (3, 'produccionDeLibros                                ', 'Página que contiene el módulo de producción de libros                                                                                                                                                                                                     ', '                                                  ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (4, 'cartasEditor                                      ', 'Página que contiene el módulo de cartas al editor                                                                                                                                                                                                         ', '                                                  ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (1, 'index                                             ', 'Página principal del proyecto Kyrón.                                                                                                                                                                                                                      ', '                                                  ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');
INSERT INTO kyron_pagina (id_pagina, nombre, descripcion, modulo, nivel, parametro) VALUES (2, 'revistasIndexadas                                 ', 'Página que contiene el módulo de revistas indexadas.                                                                                                                                                                                                      ', '                                                  ', 0, 'jquery=true&jquery-ui=true&jquery-validation=true                                                                                                                                                                                                              ');


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 185
-- Name: kyron_pagina_id_pagina_seq; Type: SEQUENCE SET; Schema: kyron; Owner: -
--

SELECT pg_catalog.setval('kyron_pagina_id_pagina_seq', 6, true);


--
-- TOC entry 2239 (class 0 OID 59572)
-- Dependencies: 186
-- Data for Name: kyron_subsistema; Type: TABLE DATA; Schema: kyron; Owner: -
--



--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 187
-- Name: kyron_subsistema_id_subsistema_seq; Type: SEQUENCE SET; Schema: kyron; Owner: -
--

SELECT pg_catalog.setval('kyron_subsistema_id_subsistema_seq', 1, false);


--
-- TOC entry 2241 (class 0 OID 59581)
-- Dependencies: 188
-- Data for Name: kyron_tempformulario; Type: TABLE DATA; Schema: kyron; Owner: -
--



--
-- TOC entry 2242 (class 0 OID 59587)
-- Dependencies: 189
-- Data for Name: kyron_usuario; Type: TABLE DATA; Schema: kyron; Owner: -
--



--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 190
-- Name: kyron_usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: kyron; Owner: -
--

SELECT pg_catalog.setval('kyron_usuario_id_usuario_seq', 1, false);


--
-- TOC entry 2244 (class 0 OID 59604)
-- Dependencies: 191
-- Data for Name: kyron_usuario_subsistema; Type: TABLE DATA; Schema: kyron; Owner: -
--



--
-- TOC entry 2245 (class 0 OID 59610)
-- Dependencies: 192
-- Data for Name: kyron_valor_sesion; Type: TABLE DATA; Schema: kyron; Owner: -
--



SET search_path = menu, pg_catalog;

--
-- TOC entry 2258 (class 0 OID 59802)
-- Dependencies: 205
-- Data for Name: grupo; Type: TABLE DATA; Schema: menu; Owner: -
--

INSERT INTO grupo (id_grupo, descripcion) VALUES (1, 'inicio');
INSERT INTO grupo (id_grupo, descripcion) VALUES (2, 'hojaVida');
INSERT INTO grupo (id_grupo, descripcion) VALUES (3, 'asignacionPuntajes');
INSERT INTO grupo (id_grupo, descripcion) VALUES (4, 'reportesDocencia');
INSERT INTO grupo (id_grupo, descripcion) VALUES (5, 'cerrarSesion');


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 206
-- Name: grupo_id_grupo_seq; Type: SEQUENCE SET; Schema: menu; Owner: -
--

SELECT pg_catalog.setval('grupo_id_grupo_seq', 5, true);


--
-- TOC entry 2260 (class 0 OID 59810)
-- Dependencies: 207
-- Data for Name: item; Type: TABLE DATA; Schema: menu; Owner: -
--

INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (1, 1, 2, 3, 'crearDocente', 1, 1, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (2, 1, 2, 3, 'titulosAcademicos', 1, 2, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (3, 1, 2, 3, 'sinTitulosAcademicos', 1, 3, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (4, 1, 2, 3, 'consultarActividadDocente', 1, 4, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (5, 1, 3, 2, 'tituloSalariales', 1, 0, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (16, 1, 3, 3, 'comunicacionCorta', 1, 11, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (17, 1, 3, 3, 'obrasArtisticasDocente', 1, 12, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (18, 1, 3, 3, 'patentes', 1, 13, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (19, 1, 3, 3, 'PremiosDocente', 1, 14, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (20, 1, 3, 3, 'produccionVideosDocente', 1, 15, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (22, 1, 3, 3, 'traducciones', 1, 17, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (23, 1, 3, 3, 'registroTecnicaSoftware', 1, 18, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (24, 1, 3, 2, 'tituloBonificacion', 2, 0, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (25, 1, 3, 3, 'publicacionesImpresas', 2, 1, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (26, 1, 3, 3, 'estudiosPostdoctorales', 2, 2, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (27, 1, 3, 3, 'resenaCritica', 2, 3, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (28, 1, 3, 3, 'traduccionArticulo', 2, 4, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (29, 1, 3, 3, 'ponenciasArticulos', 2, 5, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (30, 1, 3, 2, 'tituloNovedades', 3, 0, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (31, 1, 3, 3, 'novedades', 3, 1, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (32, 1, 4, 2, 'tituloConsultaReportes', 1, 0, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (33, 1, 4, 3, 'consultaReportes', 1, 1, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (34, 1, 4, 3, 'estadoCuentaDocente', 1, 2, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (35, 1, 1, 1, '''', 1, 0, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (36, 1, 5, 1, '''', 1, 0, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (6, 1, 3, 3, 'capituloLibros', 1, 2, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (7, 1, 3, 3, 'cartasEditor', 1, 3, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (8, 1, 3, 3, 'direccionTrabajosGrado', 1, 4, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (9, 1, 3, 3, 'experienciaDireccionAcademica', 1, 5, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (10, 1, 3, 3, 'experienciaInvestigacion', 1, 6, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (11, 1, 3, 3, 'experienciaDocencia', 1, 7, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (12, 1, 3, 3, 'experienciaProfesional', 1, 8, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (13, 1, 3, 3, 'experienciaCalificada', 1, 9, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (14, 1, 3, 3, 'excelenciaAcademica', 1, 10, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (15, 1, 3, 3, 'revistasIndexadas', 1, 1, NULL, true);
INSERT INTO item (id_item, id_menu, id_grupo, id_tipo_item, descripcion, columna, orden_item, link, estado_registro) VALUES (21, 1, 3, 3, 'produccionDeLibros', 1, 16, NULL, true);


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 208
-- Name: item_id_item_seq; Type: SEQUENCE SET; Schema: menu; Owner: -
--

SELECT pg_catalog.setval('item_id_item_seq', 37, true);


--
-- TOC entry 2262 (class 0 OID 59821)
-- Dependencies: 209
-- Data for Name: menu; Type: TABLE DATA; Schema: menu; Owner: -
--

INSERT INTO menu (id_menu, descripcion, perfil_usuario, estado_registro) VALUES (1, 'principal', 0, true);


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 210
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: menu; Owner: -
--

SELECT pg_catalog.setval('menu_id_menu_seq', 1, true);


--
-- TOC entry 2264 (class 0 OID 59831)
-- Dependencies: 211
-- Data for Name: tipo_item; Type: TABLE DATA; Schema: menu; Owner: -
--

INSERT INTO tipo_item (id_tipo_item, descripcion) VALUES (1, 'menu');
INSERT INTO tipo_item (id_tipo_item, descripcion) VALUES (2, 'tittle');
INSERT INTO tipo_item (id_tipo_item, descripcion) VALUES (3, 'item');
INSERT INTO tipo_item (id_tipo_item, descripcion) VALUES (4, 'link');


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 212
-- Name: tipo_item_id_tipo_item_seq; Type: SEQUENCE SET; Schema: menu; Owner: -
--

SELECT pg_catalog.setval('tipo_item_id_tipo_item_seq', 4, true);


SET search_path = public, pg_catalog;

--
-- TOC entry 2226 (class 0 OID 59507)
-- Dependencies: 173
-- Data for Name: kyron_bloque; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 174
-- Name: kyron_bloque_id_bloque_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('kyron_bloque_id_bloque_seq', 1, false);


SET search_path = docencia, pg_catalog;

--
-- TOC entry 2076 (class 2606 OID 59714)
-- Name: comunicacion_corta_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY comunicacion_corta
    ADD CONSTRAINT comunicacion_corta_pkey PRIMARY KEY (documento_docente, numero_issn);


--
-- TOC entry 2078 (class 2606 OID 59716)
-- Name: contexto_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY contexto
    ADD CONSTRAINT contexto_pkey PRIMARY KEY (id_contexto);


--
-- TOC entry 2080 (class 2606 OID 59718)
-- Name: docente_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (documento_docente);


--
-- TOC entry 2082 (class 2606 OID 59720)
-- Name: docente_proyectocurricular_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY docente_proyectocurricular
    ADD CONSTRAINT docente_proyectocurricular_pkey PRIMARY KEY (documento_docente, id_proyectocurricular);


--
-- TOC entry 2084 (class 2606 OID 59722)
-- Name: facultad_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY facultad
    ADD CONSTRAINT facultad_pkey PRIMARY KEY (id_facultad);


--
-- TOC entry 2086 (class 2606 OID 59724)
-- Name: pais_k_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_k_pkey PRIMARY KEY (paiscodigo);


--
-- TOC entry 2088 (class 2606 OID 59726)
-- Name: proyectocurricular_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY proyectocurricular
    ADD CONSTRAINT proyectocurricular_pkey PRIMARY KEY (id_proyectocurricular);


--
-- TOC entry 2090 (class 2606 OID 59728)
-- Name: revista_indexada_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY revista_indexada
    ADD CONSTRAINT revista_indexada_pkey PRIMARY KEY (documento_docente, numero_issn);


--
-- TOC entry 2092 (class 2606 OID 59730)
-- Name: tipo_documento_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (id_tipo_documento);


--
-- TOC entry 2094 (class 2606 OID 59732)
-- Name: tipo_indexacion_pkey; Type: CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY tipo_indexacion
    ADD CONSTRAINT tipo_indexacion_pkey PRIMARY KEY (id_tipo_indexacion);


SET search_path = kyron, pg_catalog;

--
-- TOC entry 2060 (class 2606 OID 59623)
-- Name: kyron_bloque_pagina_pkey; Type: CONSTRAINT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_bloque_pagina
    ADD CONSTRAINT kyron_bloque_pagina_pkey PRIMARY KEY (idrelacion);


--
-- TOC entry 2058 (class 2606 OID 59625)
-- Name: kyron_bloque_pkey; Type: CONSTRAINT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_bloque
    ADD CONSTRAINT kyron_bloque_pkey PRIMARY KEY (id_bloque);


--
-- TOC entry 2074 (class 2606 OID 59651)
-- Name: kyron_configuracion_pkey; Type: CONSTRAINT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_configuracion
    ADD CONSTRAINT kyron_configuracion_pkey PRIMARY KEY (id_parametro);


--
-- TOC entry 2062 (class 2606 OID 59629)
-- Name: kyron_dbms_pkey; Type: CONSTRAINT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_dbms
    ADD CONSTRAINT kyron_dbms_pkey PRIMARY KEY (idconexion);


--
-- TOC entry 2064 (class 2606 OID 59631)
-- Name: kyron_estilo_pkey; Type: CONSTRAINT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_estilo
    ADD CONSTRAINT kyron_estilo_pkey PRIMARY KEY (usuario, estilo);


--
-- TOC entry 2066 (class 2606 OID 59633)
-- Name: kyron_pagina_pkey; Type: CONSTRAINT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_pagina
    ADD CONSTRAINT kyron_pagina_pkey PRIMARY KEY (id_pagina);


--
-- TOC entry 2068 (class 2606 OID 59635)
-- Name: kyron_subsistema_pkey; Type: CONSTRAINT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_subsistema
    ADD CONSTRAINT kyron_subsistema_pkey PRIMARY KEY (id_subsistema);


--
-- TOC entry 2070 (class 2606 OID 59637)
-- Name: kyron_usuario_pkey; Type: CONSTRAINT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_usuario
    ADD CONSTRAINT kyron_usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2072 (class 2606 OID 59639)
-- Name: kyron_valor_sesion_pkey; Type: CONSTRAINT; Schema: kyron; Owner: -
--

ALTER TABLE ONLY kyron_valor_sesion
    ADD CONSTRAINT kyron_valor_sesion_pkey PRIMARY KEY (sesionid, variable);


SET search_path = menu, pg_catalog;

--
-- TOC entry 2096 (class 2606 OID 59844)
-- Name: grupo_pkey; Type: CONSTRAINT; Schema: menu; Owner: -
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 2098 (class 2606 OID 59846)
-- Name: item_pkey; Type: CONSTRAINT; Schema: menu; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id_item);


--
-- TOC entry 2100 (class 2606 OID 59848)
-- Name: menu_pkey; Type: CONSTRAINT; Schema: menu; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- TOC entry 2102 (class 2606 OID 59850)
-- Name: tipo_item_pkey; Type: CONSTRAINT; Schema: menu; Owner: -
--

ALTER TABLE ONLY tipo_item
    ADD CONSTRAINT tipo_item_pkey PRIMARY KEY (id_tipo_item);


SET search_path = docencia, pg_catalog;

--
-- TOC entry 2103 (class 2606 OID 59733)
-- Name: comunicacion_corta_documento_docente_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY comunicacion_corta
    ADD CONSTRAINT comunicacion_corta_documento_docente_fkey FOREIGN KEY (documento_docente) REFERENCES docente(documento_docente);


--
-- TOC entry 2104 (class 2606 OID 59738)
-- Name: comunicacion_corta_id_contexto_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY comunicacion_corta
    ADD CONSTRAINT comunicacion_corta_id_contexto_fkey FOREIGN KEY (id_contexto) REFERENCES contexto(id_contexto);


--
-- TOC entry 2105 (class 2606 OID 59743)
-- Name: comunicacion_corta_id_tipo_indexacion_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY comunicacion_corta
    ADD CONSTRAINT comunicacion_corta_id_tipo_indexacion_fkey FOREIGN KEY (id_tipo_indexacion) REFERENCES tipo_indexacion(id_tipo_indexacion);


--
-- TOC entry 2106 (class 2606 OID 59748)
-- Name: comunicacion_corta_paiscodigo_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY comunicacion_corta
    ADD CONSTRAINT comunicacion_corta_paiscodigo_fkey FOREIGN KEY (paiscodigo) REFERENCES pais(paiscodigo);


--
-- TOC entry 2107 (class 2606 OID 59753)
-- Name: docente_id_tipo_documento_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT docente_id_tipo_documento_fkey FOREIGN KEY (id_tipo_documento) REFERENCES tipo_documento(id_tipo_documento);


--
-- TOC entry 2108 (class 2606 OID 59758)
-- Name: docente_proyectocurricular_documento_docente_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY docente_proyectocurricular
    ADD CONSTRAINT docente_proyectocurricular_documento_docente_fkey FOREIGN KEY (documento_docente) REFERENCES docente(documento_docente);


--
-- TOC entry 2109 (class 2606 OID 59763)
-- Name: docente_proyectocurricular_id_proyectocurricular_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY docente_proyectocurricular
    ADD CONSTRAINT docente_proyectocurricular_id_proyectocurricular_fkey FOREIGN KEY (id_proyectocurricular) REFERENCES proyectocurricular(id_proyectocurricular);


--
-- TOC entry 2110 (class 2606 OID 59768)
-- Name: proyectocurricular_id_facultad_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY proyectocurricular
    ADD CONSTRAINT proyectocurricular_id_facultad_fkey FOREIGN KEY (id_facultad) REFERENCES facultad(id_facultad);


--
-- TOC entry 2111 (class 2606 OID 59773)
-- Name: revista_indexada_documento_docente_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY revista_indexada
    ADD CONSTRAINT revista_indexada_documento_docente_fkey FOREIGN KEY (documento_docente) REFERENCES docente(documento_docente);


--
-- TOC entry 2112 (class 2606 OID 59778)
-- Name: revista_indexada_id_contexto_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY revista_indexada
    ADD CONSTRAINT revista_indexada_id_contexto_fkey FOREIGN KEY (id_contexto) REFERENCES contexto(id_contexto);


--
-- TOC entry 2113 (class 2606 OID 59783)
-- Name: revista_indexada_id_tipo_indexacion_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY revista_indexada
    ADD CONSTRAINT revista_indexada_id_tipo_indexacion_fkey FOREIGN KEY (id_tipo_indexacion) REFERENCES tipo_indexacion(id_tipo_indexacion);


--
-- TOC entry 2114 (class 2606 OID 59788)
-- Name: revista_indexada_paiscodigo_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY revista_indexada
    ADD CONSTRAINT revista_indexada_paiscodigo_fkey FOREIGN KEY (paiscodigo) REFERENCES pais(paiscodigo);


--
-- TOC entry 2115 (class 2606 OID 59793)
-- Name: tipo_indexacion_id_contexto_fkey; Type: FK CONSTRAINT; Schema: docencia; Owner: -
--

ALTER TABLE ONLY tipo_indexacion
    ADD CONSTRAINT tipo_indexacion_id_contexto_fkey FOREIGN KEY (id_contexto) REFERENCES contexto(id_contexto);


SET search_path = menu, pg_catalog;

--
-- TOC entry 2116 (class 2606 OID 59851)
-- Name: item_id_grupo_fkey; Type: FK CONSTRAINT; Schema: menu; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo);


--
-- TOC entry 2117 (class 2606 OID 59856)
-- Name: item_id_menu_fkey; Type: FK CONSTRAINT; Schema: menu; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_id_menu_fkey FOREIGN KEY (id_menu) REFERENCES menu(id_menu);


--
-- TOC entry 2118 (class 2606 OID 59861)
-- Name: item_id_tipo_item_fkey; Type: FK CONSTRAINT; Schema: menu; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_id_tipo_item_fkey FOREIGN KEY (id_tipo_item) REFERENCES tipo_item(id_tipo_item);


-- Completed on 2015-09-10 23:30:41 COT

--
-- PostgreSQL database dump complete
--

