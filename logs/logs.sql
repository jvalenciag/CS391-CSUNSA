--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.10
-- Dumped by pg_dump version 9.1.10
-- Started on 2013-11-19 18:39:46 PET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = security, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 259 (class 1259 OID 22094)
-- Dependencies: 2055 10
-- Name: log; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE log (
    id bigint NOT NULL,
    id_assigned_profile bigint NOT NULL,
    id_user bigint,
    id_institution integer NOT NULL,
    functionality character varying NOT NULL,
    date timestamp with time zone NOT NULL,
    source_device character varying(32) NOT NULL,
    version integer DEFAULT 0 NOT NULL,
    day integer NOT NULL,
    month integer NOT NULL,
    year integer NOT NULL,
    week_day integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE security.log OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 22101)
-- Dependencies: 259 10
-- Name: log_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.log_id_seq OWNER TO postgres;

--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 260
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE log_id_seq OWNED BY log.id;


--
-- TOC entry 2056 (class 2604 OID 22174)
-- Dependencies: 260 259
-- Name: id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY log ALTER COLUMN id SET DEFAULT nextval('log_id_seq'::regclass);


--
-- TOC entry 2160 (class 0 OID 22094)
-- Dependencies: 259 2162
-- Data for Name: log; Type: TABLE DATA; Schema: security; Owner: postgres
--

COPY log (id, id_assigned_profile, id_user, id_institution, functionality, date, source_device, version, day, month, year, week_day, hour) FROM stdin;
\.


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 260
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('log_id_seq', 1, false);


--
-- TOC entry 2058 (class 2606 OID 22275)
-- Dependencies: 259 259 2163
-- Name: pk_log; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log
    ADD CONSTRAINT pk_log PRIMARY KEY (id);


-- Completed on 2013-11-19 18:39:46 PET

--
-- PostgreSQL database dump complete
--

