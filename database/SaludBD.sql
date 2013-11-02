--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.1
-- Dumped by pg_dump version 9.3.1
-- Started on 2013-11-02 09:23:30 PET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 10 (class 2615 OID 35123)
-- Name: administrative; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA administrative;


ALTER SCHEMA administrative OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 35121)
-- Name: general; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA general;


ALTER SCHEMA general OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 35122)
-- Name: health; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA health;


ALTER SCHEMA health OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 35120)
-- Name: security; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA security;


ALTER SCHEMA security OWNER TO postgres;

--
-- TOC entry 277 (class 3079 OID 11791)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 277
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = administrative, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 34047)
-- Name: allowed_to_work_at; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE allowed_to_work_at (
    id bigint NOT NULL,
    id_person bigint NOT NULL,
    id_institution integer NOT NULL,
    id_document bigint NOT NULL,
    id_unit integer NOT NULL,
    starting_date date,
    end_date date,
    enabled boolean DEFAULT true
);


ALTER TABLE administrative.allowed_to_work_at OWNER TO postgres;

--
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN allowed_to_work_at.end_date; Type: COMMENT; Schema: administrative; Owner: postgres
--

COMMENT ON COLUMN allowed_to_work_at.end_date IS 'TODO: Asignar fecha muy al futuro';


--
-- TOC entry 179 (class 1259 OID 34051)
-- Name: allowed_to_work_at_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE allowed_to_work_at_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.allowed_to_work_at_id_seq OWNER TO postgres;

--
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 179
-- Name: allowed_to_work_at_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE allowed_to_work_at_id_seq OWNED BY allowed_to_work_at.id;


--
-- TOC entry 194 (class 1259 OID 34089)
-- Name: employee; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE employee (
    id bigint NOT NULL,
    id_person bigint NOT NULL,
    id_profession integer,
    id_institution integer NOT NULL,
    starting_date date NOT NULL,
    id_init_document bigint NOT NULL,
    id_end_cause integer,
    end_date date,
    id_end_document bigint,
    active boolean DEFAULT false,
    id_specialization integer,
    id_position integer
);


ALTER TABLE administrative.employee OWNER TO postgres;

--
-- TOC entry 2710 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN employee.id_profession; Type: COMMENT; Schema: administrative; Owner: postgres
--

COMMENT ON COLUMN employee.id_profession IS 'profesion por la cual se le contrata';


--
-- TOC entry 195 (class 1259 OID 34093)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.employee_id_seq OWNER TO postgres;

--
-- TOC entry 2711 (class 0 OID 0)
-- Dependencies: 195
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE employee_id_seq OWNED BY employee.id;


--
-- TOC entry 216 (class 1259 OID 34154)
-- Name: service_schedule; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE service_schedule (
    id bigint NOT NULL,
    id_slot integer,
    id_unit integer
);


ALTER TABLE administrative.service_schedule OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 34157)
-- Name: horario_de_atencion_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE horario_de_atencion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.horario_de_atencion_id_seq OWNER TO postgres;

--
-- TOC entry 2712 (class 0 OID 0)
-- Dependencies: 217
-- Name: horario_de_atencion_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE horario_de_atencion_id_seq OWNED BY service_schedule.id;


--
-- TOC entry 218 (class 1259 OID 34159)
-- Name: institution; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE institution (
    id integer NOT NULL,
    name character varying(100),
    "RUC" character(11),
    "WebPage" character varying(120)
);


ALTER TABLE administrative.institution OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 34176)
-- Name: manager_of_unit; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE manager_of_unit (
    id integer NOT NULL,
    date_from date,
    date_to date,
    id_person bigint,
    id_unit integer,
    id_institution integer
);


ALTER TABLE administrative.manager_of_unit OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 34202)
-- Name: operation_time; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE operation_time (
    id integer NOT NULL,
    id_item integer,
    id_institution integer,
    starting_time time without time zone,
    end_time time without time zone,
    starting_date date,
    end_date date
);


ALTER TABLE administrative.operation_time OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 34223)
-- Name: physical_space; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE physical_space (
    id integer NOT NULL,
    name character varying(64),
    description character varying,
    id_parent integer,
    id_institution integer
);


ALTER TABLE administrative.physical_space OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 34229)
-- Name: physical_space_assigned_to_unit; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE physical_space_assigned_to_unit (
    id integer NOT NULL,
    id_physical_space integer,
    id_unit integer,
    starting_date timestamp without time zone,
    end_date timestamp without time zone,
    enabled boolean DEFAULT false
);


ALTER TABLE administrative.physical_space_assigned_to_unit OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 34233)
-- Name: physical_space_assigned_to_unit_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE physical_space_assigned_to_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.physical_space_assigned_to_unit_id_seq OWNER TO postgres;

--
-- TOC entry 2713 (class 0 OID 0)
-- Dependencies: 241
-- Name: physical_space_assigned_to_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE physical_space_assigned_to_unit_id_seq OWNED BY physical_space_assigned_to_unit.id;


--
-- TOC entry 242 (class 1259 OID 34235)
-- Name: physical_space_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE physical_space_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.physical_space_id_seq OWNER TO postgres;

--
-- TOC entry 2714 (class 0 OID 0)
-- Dependencies: 242
-- Name: physical_space_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE physical_space_id_seq OWNED BY physical_space.id;


--
-- TOC entry 253 (class 1259 OID 34268)
-- Name: resource; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE resource (
    id integer NOT NULL,
    id_sbn integer,
    id_sequential_number integer,
    features character varying
);


ALTER TABLE administrative.resource OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 34274)
-- Name: resource_belongs_to_institution; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE resource_belongs_to_institution (
    id integer NOT NULL,
    id_resource integer NOT NULL,
    id_institution integer NOT NULL,
    sequence_number integer,
    id_moved_to integer,
    entry_date date NOT NULL,
    id_entry_document integer,
    retire_date date,
    id_retire_document integer,
    id_reason_of_retirement integer,
    retired boolean DEFAULT false
);


ALTER TABLE administrative.resource_belongs_to_institution OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 34278)
-- Name: resource_belongs_to_institution_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE resource_belongs_to_institution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.resource_belongs_to_institution_id_seq OWNER TO postgres;

--
-- TOC entry 2715 (class 0 OID 0)
-- Dependencies: 255
-- Name: resource_belongs_to_institution_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE resource_belongs_to_institution_id_seq OWNED BY resource_belongs_to_institution.id;


--
-- TOC entry 256 (class 1259 OID 34280)
-- Name: resource_belongs_to_unit; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE resource_belongs_to_unit (
    id integer NOT NULL,
    id_resource_belongs_to_institution integer NOT NULL,
    id_unit integer NOT NULL,
    assigning_date date NOT NULL,
    id_type_of_assigment integer,
    retirement_date date,
    id_document integer
);


ALTER TABLE administrative.resource_belongs_to_unit OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 34283)
-- Name: resource_belongs_to_unit_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE resource_belongs_to_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.resource_belongs_to_unit_id_seq OWNER TO postgres;

--
-- TOC entry 2716 (class 0 OID 0)
-- Dependencies: 257
-- Name: resource_belongs_to_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE resource_belongs_to_unit_id_seq OWNED BY resource_belongs_to_unit.id;


--
-- TOC entry 258 (class 1259 OID 34285)
-- Name: resource_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.resource_id_seq OWNER TO postgres;

--
-- TOC entry 2717 (class 0 OID 0)
-- Dependencies: 258
-- Name: resource_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE resource_id_seq OWNED BY resource.id;


--
-- TOC entry 263 (class 1259 OID 34298)
-- Name: slot_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE slot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.slot_id_seq OWNER TO postgres;

--
-- TOC entry 2718 (class 0 OID 0)
-- Dependencies: 263
-- Name: slot_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE slot_id_seq OWNED BY operation_time.id;


--
-- TOC entry 269 (class 1259 OID 34317)
-- Name: unit; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE unit (
    id integer NOT NULL,
    name character varying(50),
    unit_type integer,
    id_unit_belong_to integer,
    id_institution integer
);


ALTER TABLE administrative.unit OWNER TO postgres;

--
-- TOC entry 2719 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN unit.unit_type; Type: COMMENT; Schema: administrative; Owner: postgres
--

COMMENT ON COLUMN unit.unit_type IS 'Adminsitrativo, Asistencial, ...';


--
-- TOC entry 270 (class 1259 OID 34320)
-- Name: unit_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.unit_id_seq OWNER TO postgres;

--
-- TOC entry 2720 (class 0 OID 0)
-- Dependencies: 270
-- Name: unit_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE unit_id_seq OWNED BY unit.id;


--
-- TOC entry 271 (class 1259 OID 34322)
-- Name: unit_skill; Type: TABLE; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE TABLE unit_skill (
    id integer NOT NULL,
    id_unit integer,
    id_skill integer
);


ALTER TABLE administrative.unit_skill OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 34325)
-- Name: unit_skill_id_seq; Type: SEQUENCE; Schema: administrative; Owner: postgres
--

CREATE SEQUENCE unit_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrative.unit_skill_id_seq OWNER TO postgres;

--
-- TOC entry 2721 (class 0 OID 0)
-- Dependencies: 272
-- Name: unit_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: administrative; Owner: postgres
--

ALTER SEQUENCE unit_skill_id_seq OWNED BY unit_skill.id;


SET search_path = general, pg_catalog;

--
-- TOC entry 174 (class 1259 OID 34037)
-- Name: activity_type; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE activity_type (
    id integer NOT NULL,
    id_unit integer,
    acronym character varying(4),
    description character varying(64),
    priority integer,
    enabled boolean
);


ALTER TABLE general.activity_type OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 34040)
-- Name: activity_type_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE activity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.activity_type_id_seq OWNER TO postgres;

--
-- TOC entry 2722 (class 0 OID 0)
-- Dependencies: 175
-- Name: activity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE activity_type_id_seq OWNED BY activity_type.id;


--
-- TOC entry 176 (class 1259 OID 34042)
-- Name: address; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE address (
    id integer NOT NULL
);


ALTER TABLE general.address OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 34045)
-- Name: address_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.address_id_seq OWNER TO postgres;

--
-- TOC entry 2723 (class 0 OID 0)
-- Dependencies: 177
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE address_id_seq OWNED BY address.id;


--
-- TOC entry 182 (class 1259 OID 34058)
-- Name: event; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE event (
    id bigint NOT NULL,
    starting_time timestamp without time zone,
    end_time timestamp without time zone,
    id_owner bigint NOT NULL,
    id_institution integer NOT NULL,
    id_init_document bigint NOT NULL,
    id_unit integer NOT NULL,
    id_physical_space_assigned_to_unit integer NOT NULL,
    id_type bigint NOT NULL,
    dd smallint NOT NULL,
    mm smallint NOT NULL,
    yyyy integer NOT NULL,
    hh smallint NOT NULL,
    min smallint NOT NULL,
    id_state integer NOT NULL,
    sequence smallint NOT NULL,
    id_roster integer,
    id_event_parent bigint,
    id_encounter_reason integer,
    "timestamp" timestamp with time zone
);


ALTER TABLE general.event OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 34061)
-- Name: appointment_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.appointment_id_seq OWNER TO postgres;

--
-- TOC entry 2724 (class 0 OID 0)
-- Dependencies: 183
-- Name: appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE appointment_id_seq OWNED BY event.id;


--
-- TOC entry 192 (class 1259 OID 34084)
-- Name: document; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE document (
    id bigint NOT NULL,
    id_type integer,
    number character varying(32),
    id_institution integer,
    issued date
);


ALTER TABLE general.document OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 34087)
-- Name: document_id_document_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE document_id_document_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.document_id_document_seq OWNER TO postgres;

--
-- TOC entry 2725 (class 0 OID 0)
-- Dependencies: 193
-- Name: document_id_document_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE document_id_document_seq OWNED BY document.id;


--
-- TOC entry 201 (class 1259 OID 34108)
-- Name: event_guest; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE event_guest (
    id_event bigint NOT NULL,
    id_invitee bigint NOT NULL
);


ALTER TABLE general.event_guest OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 34116)
-- Name: form_result; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE form_result (
    id bigint NOT NULL,
    id_form_template integer,
    id_laboratorian bigint,
    date_of_order date,
    id_event bigint,
    description text
);


ALTER TABLE general.form_result OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 34122)
-- Name: form_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.form_id_seq OWNER TO postgres;

--
-- TOC entry 2726 (class 0 OID 0)
-- Dependencies: 203
-- Name: form_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE form_id_seq OWNED BY form_result.id;


--
-- TOC entry 204 (class 1259 OID 34124)
-- Name: form_order; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE form_order (
    id bigint NOT NULL,
    id_event bigint NOT NULL,
    id_form_template integer NOT NULL,
    time_of_order timestamp without time zone,
    scheduled_time timestamp without time zone
);


ALTER TABLE general.form_order OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 34127)
-- Name: form_order_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE form_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.form_order_id_seq OWNER TO postgres;

--
-- TOC entry 2727 (class 0 OID 0)
-- Dependencies: 205
-- Name: form_order_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE form_order_id_seq OWNED BY form_order.id;


--
-- TOC entry 206 (class 1259 OID 34129)
-- Name: form_result_item; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE form_result_item (
    id bigint NOT NULL,
    id_form_result bigint,
    value double precision,
    id_form_template_item bigint,
    date date
);


ALTER TABLE general.form_result_item OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 34132)
-- Name: form_result_item_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE form_result_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.form_result_item_id_seq OWNER TO postgres;

--
-- TOC entry 2728 (class 0 OID 0)
-- Dependencies: 207
-- Name: form_result_item_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE form_result_item_id_seq OWNED BY form_result_item.id;


--
-- TOC entry 208 (class 1259 OID 34134)
-- Name: form_template; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE form_template (
    id bigint NOT NULL,
    name character varying(32),
    id_type_of_form integer
);


ALTER TABLE general.form_template OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 34137)
-- Name: form_template_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE form_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.form_template_id_seq OWNER TO postgres;

--
-- TOC entry 2729 (class 0 OID 0)
-- Dependencies: 209
-- Name: form_template_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE form_template_id_seq OWNED BY form_template.id;


--
-- TOC entry 210 (class 1259 OID 34139)
-- Name: form_template_item; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE form_template_item (
    id bigint NOT NULL,
    name character varying(32),
    id_unit integer,
    id_form_template bigint NOT NULL,
    priority smallint,
    id_form_template_item_parent bigint
);


ALTER TABLE general.form_template_item OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 34142)
-- Name: form_template_item_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE form_template_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.form_template_item_id_seq OWNER TO postgres;

--
-- TOC entry 2730 (class 0 OID 0)
-- Dependencies: 211
-- Name: form_template_item_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE form_template_item_id_seq OWNED BY form_template_item.id;


--
-- TOC entry 214 (class 1259 OID 34149)
-- Name: group_of_items; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE group_of_items (
    id smallint NOT NULL,
    description character varying(32)
);


ALTER TABLE general.group_of_items OWNER TO postgres;

--
-- TOC entry 2731 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE group_of_items; Type: COMMENT; Schema: general; Owner: postgres
--

COMMENT ON TABLE group_of_items IS 'Tipo de Documento
    Oficio
    Resolución
Etnia';


--
-- TOC entry 2732 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN group_of_items.description; Type: COMMENT; Schema: general; Owner: postgres
--

COMMENT ON COLUMN group_of_items.description IS 'TODO: it must be fixed length (32)';


--
-- TOC entry 215 (class 1259 OID 34152)
-- Name: group_of_items_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE group_of_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.group_of_items_id_seq OWNER TO postgres;

--
-- TOC entry 2733 (class 0 OID 0)
-- Dependencies: 215
-- Name: group_of_items_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE group_of_items_id_seq OWNED BY group_of_items.id;


--
-- TOC entry 219 (class 1259 OID 34162)
-- Name: item; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE item (
    id bigint NOT NULL,
    id_group_of_items smallint,
    description character varying(32),
    priority integer,
    id_parent bigint
);


ALTER TABLE general.item OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 34165)
-- Name: item_of_list_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE item_of_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.item_of_list_id_seq OWNER TO postgres;

--
-- TOC entry 2734 (class 0 OID 0)
-- Dependencies: 220
-- Name: item_of_list_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE item_of_list_id_seq OWNED BY item.id;


--
-- TOC entry 226 (class 1259 OID 34184)
-- Name: nomenclature_hierarchy; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE nomenclature_hierarchy (
    id integer NOT NULL,
    id_parent integer,
    parent_code character varying(8),
    code character varying(5),
    description character varying(107),
    hierarchy_type_id bigint NOT NULL
);


ALTER TABLE general.nomenclature_hierarchy OWNER TO postgres;

--
-- TOC entry 2735 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN nomenclature_hierarchy.parent_code; Type: COMMENT; Schema: general; Owner: postgres
--

COMMENT ON COLUMN nomenclature_hierarchy.parent_code IS 'i.e. A00';


--
-- TOC entry 2736 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN nomenclature_hierarchy.code; Type: COMMENT; Schema: general; Owner: postgres
--

COMMENT ON COLUMN nomenclature_hierarchy.code IS '.65';


--
-- TOC entry 227 (class 1259 OID 34187)
-- Name: medical_nomenclature_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE medical_nomenclature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.medical_nomenclature_id_seq OWNER TO postgres;

--
-- TOC entry 2737 (class 0 OID 0)
-- Dependencies: 227
-- Name: medical_nomenclature_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE medical_nomenclature_id_seq OWNED BY nomenclature_hierarchy.id;


--
-- TOC entry 235 (class 1259 OID 34210)
-- Name: person; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE person (
    id bigint NOT NULL,
    id_document_type integer,
    document_number integer,
    first_surname character varying(50),
    second_surname character varying(50),
    names character varying(50),
    date_of_birth date,
    id_sex integer,
    "Id_citizenship" integer,
    extra_information character varying,
    id_legal_address integer,
    id_place_of_birth integer,
    id_marital_status integer,
    id_instruction_level integer,
    id_occupation integer,
    id_profession integer,
    id_religion integer,
    id_ethnic integer,
    id_father integer,
    id_mother integer
);


ALTER TABLE general.person OWNER TO postgres;

--
-- TOC entry 2738 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN person.date_of_birth; Type: COMMENT; Schema: general; Owner: postgres
--

COMMENT ON COLUMN person.date_of_birth IS 'Date of Birth';


--
-- TOC entry 2739 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN person."Id_citizenship"; Type: COMMENT; Schema: general; Owner: postgres
--

COMMENT ON COLUMN person."Id_citizenship" IS 'country';


--
-- TOC entry 2740 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN person.id_legal_address; Type: COMMENT; Schema: general; Owner: postgres
--

COMMENT ON COLUMN person.id_legal_address IS 'departamento, provincia, distrito, 
calle, mz, Urb, etc';


--
-- TOC entry 2741 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN person.id_place_of_birth; Type: COMMENT; Schema: general; Owner: postgres
--

COMMENT ON COLUMN person.id_place_of_birth IS 'solo hasta distrito';


--
-- TOC entry 236 (class 1259 OID 34216)
-- Name: person_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.person_id_seq OWNER TO postgres;

--
-- TOC entry 2742 (class 0 OID 0)
-- Dependencies: 236
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- TOC entry 237 (class 1259 OID 34218)
-- Name: person_skill; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE person_skill (
    id integer NOT NULL,
    id_person bigint,
    id_skill integer
);


ALTER TABLE general.person_skill OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 34221)
-- Name: person_skill_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE person_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.person_skill_id_seq OWNER TO postgres;

--
-- TOC entry 2743 (class 0 OID 0)
-- Dependencies: 238
-- Name: person_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE person_skill_id_seq OWNED BY person_skill.id;


--
-- TOC entry 245 (class 1259 OID 34242)
-- Name: profession; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE profession (
    id integer NOT NULL,
    description character varying
);


ALTER TABLE general.profession OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 34248)
-- Name: profession_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE profession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.profession_id_seq OWNER TO postgres;

--
-- TOC entry 2744 (class 0 OID 0)
-- Dependencies: 246
-- Name: profession_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE profession_id_seq OWNED BY profession.id;


--
-- TOC entry 249 (class 1259 OID 34255)
-- Name: relationship; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE relationship (
    id integer NOT NULL,
    id_relationship_type integer,
    id_person_related_from integer,
    id_person_related_to integer
);


ALTER TABLE general.relationship OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 34258)
-- Name: relationship_type; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE relationship_type (
    id integer NOT NULL,
    description character varying
);


ALTER TABLE general.relationship_type OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 34264)
-- Name: relationship_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE relationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.relationship_id_seq OWNER TO postgres;

--
-- TOC entry 2745 (class 0 OID 0)
-- Dependencies: 251
-- Name: relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE relationship_id_seq OWNED BY relationship_type.id;


--
-- TOC entry 252 (class 1259 OID 34266)
-- Name: relationship_id_seq1; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE relationship_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.relationship_id_seq1 OWNER TO postgres;

--
-- TOC entry 2746 (class 0 OID 0)
-- Dependencies: 252
-- Name: relationship_id_seq1; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE relationship_id_seq1 OWNED BY relationship.id;


--
-- TOC entry 259 (class 1259 OID 34287)
-- Name: roster; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE roster (
    id integer NOT NULL,
    id_person bigint,
    id_institution integer,
    id_unit integer,
    id_init_document integer,
    id_service_offered integer,
    id_shift integer,
    id_activity_type integer,
    number_of_tasks_allowed smallint,
    dd smallint,
    mm smallint,
    yyyy smallint,
    id_physical_location integer
);


ALTER TABLE general.roster OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 34290)
-- Name: roster_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE roster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.roster_id_seq OWNER TO postgres;

--
-- TOC entry 2747 (class 0 OID 0)
-- Dependencies: 260
-- Name: roster_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE roster_id_seq OWNED BY roster.id;


--
-- TOC entry 261 (class 1259 OID 34292)
-- Name: shift; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE shift (
    id integer NOT NULL,
    id_institution integer,
    id_item integer,
    starting_time timestamp without time zone,
    end_time timestamp without time zone,
    enabled boolean DEFAULT false
);


ALTER TABLE general.shift OWNER TO postgres;

--
-- TOC entry 2748 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE shift; Type: COMMENT; Schema: general; Owner: postgres
--

COMMENT ON TABLE shift IS 'turnos disponibles';


--
-- TOC entry 262 (class 1259 OID 34296)
-- Name: shift_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE shift_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.shift_id_seq OWNER TO postgres;

--
-- TOC entry 2749 (class 0 OID 0)
-- Dependencies: 262
-- Name: shift_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE shift_id_seq OWNED BY shift.id;


--
-- TOC entry 266 (class 1259 OID 34306)
-- Name: specialization; Type: TABLE; Schema: general; Owner: postgres; Tablespace: 
--

CREATE TABLE specialization (
    id integer NOT NULL,
    description character varying,
    id_profession integer
);


ALTER TABLE general.specialization OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 34312)
-- Name: specialization_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE specialization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.specialization_id_seq OWNER TO postgres;

--
-- TOC entry 2750 (class 0 OID 0)
-- Dependencies: 267
-- Name: specialization_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE specialization_id_seq OWNED BY specialization.id;


SET search_path = health, pg_catalog;

--
-- TOC entry 180 (class 1259 OID 34053)
-- Name: anamnesis; Type: TABLE; Schema: health; Owner: postgres; Tablespace: 
--

CREATE TABLE anamnesis (
    id bigint NOT NULL,
    id_event bigint
);


ALTER TABLE health.anamnesis OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 34056)
-- Name: anamnesis_id_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE anamnesis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.anamnesis_id_seq OWNER TO postgres;

--
-- TOC entry 2751 (class 0 OID 0)
-- Dependencies: 181
-- Name: anamnesis_id_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE anamnesis_id_seq OWNED BY anamnesis.id;


--
-- TOC entry 186 (class 1259 OID 34069)
-- Name: clinic_history; Type: TABLE; Schema: health; Owner: postgres; Tablespace: 
--

CREATE TABLE clinic_history (
    id bigint NOT NULL,
    id_person bigint
);


ALTER TABLE health.clinic_history OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 34072)
-- Name: clinic_history_id_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE clinic_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.clinic_history_id_seq OWNER TO postgres;

--
-- TOC entry 2752 (class 0 OID 0)
-- Dependencies: 187
-- Name: clinic_history_id_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE clinic_history_id_seq OWNED BY clinic_history.id;


--
-- TOC entry 188 (class 1259 OID 34074)
-- Name: clinic_history_summary; Type: TABLE; Schema: health; Owner: postgres; Tablespace: 
--

CREATE TABLE clinic_history_summary (
    id bigint NOT NULL,
    id_institution integer,
    id_person bigint
);


ALTER TABLE health.clinic_history_summary OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 34077)
-- Name: clinic_history_summary_id_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE clinic_history_summary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.clinic_history_summary_id_seq OWNER TO postgres;

--
-- TOC entry 2753 (class 0 OID 0)
-- Dependencies: 189
-- Name: clinic_history_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE clinic_history_summary_id_seq OWNED BY clinic_history_summary.id;


--
-- TOC entry 190 (class 1259 OID 34079)
-- Name: diagnostic; Type: TABLE; Schema: health; Owner: postgres; Tablespace: 
--

CREATE TABLE diagnostic (
    id bigint NOT NULL,
    id_event bigint,
    id_nomenclature bigint,
    description character varying,
    id_type bigint
);


ALTER TABLE health.diagnostic OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 34082)
-- Name: diagnostic_id_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE diagnostic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.diagnostic_id_seq OWNER TO postgres;

--
-- TOC entry 2754 (class 0 OID 0)
-- Dependencies: 191
-- Name: diagnostic_id_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE diagnostic_id_seq OWNED BY diagnostic.id;


--
-- TOC entry 224 (class 1259 OID 34179)
-- Name: medical_center_clinic_history; Type: TABLE; Schema: health; Owner: postgres; Tablespace: 
--

CREATE TABLE medical_center_clinic_history (
    id integer NOT NULL,
    id_medical_center integer,
    id_clinic_history integer,
    registration_date date
);


ALTER TABLE health.medical_center_clinic_history OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 34182)
-- Name: medical_center_clinic_history_id_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE medical_center_clinic_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.medical_center_clinic_history_id_seq OWNER TO postgres;

--
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 225
-- Name: medical_center_clinic_history_id_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE medical_center_clinic_history_id_seq OWNED BY medical_center_clinic_history.id;


--
-- TOC entry 228 (class 1259 OID 34189)
-- Name: medicine; Type: TABLE; Schema: health; Owner: postgres; Tablespace: 
--

CREATE TABLE medicine (
    id integer NOT NULL,
    name character varying(64)
);


ALTER TABLE health.medicine OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 34192)
-- Name: medicine_id_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE medicine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.medicine_id_seq OWNER TO postgres;

--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 229
-- Name: medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE medicine_id_seq OWNED BY medicine.id;


--
-- TOC entry 233 (class 1259 OID 34205)
-- Name: patient; Type: TABLE; Schema: health; Owner: postgres; Tablespace: 
--

CREATE TABLE patient (
    id integer NOT NULL,
    id_institution integer NOT NULL,
    id_person bigint NOT NULL,
    date_of_registration timestamp without time zone
);


ALTER TABLE health.patient OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 34208)
-- Name: patient_registration_id_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE patient_registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.patient_registration_id_seq OWNER TO postgres;

--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 234
-- Name: patient_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE patient_registration_id_seq OWNED BY patient.id;


--
-- TOC entry 243 (class 1259 OID 34237)
-- Name: prescription; Type: TABLE; Schema: health; Owner: postgres; Tablespace: 
--

CREATE TABLE prescription (
    id integer NOT NULL,
    id_event integer,
    id_medicine integer,
    amount integer,
    frequency integer,
    id_frequency_unit integer,
    expiration timestamp without time zone NOT NULL
);


ALTER TABLE health.prescription OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 34240)
-- Name: prescription_id_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE prescription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.prescription_id_seq OWNER TO postgres;

--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 244
-- Name: prescription_id_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE prescription_id_seq OWNED BY prescription.id;


SET search_path = public, pg_catalog;

--
-- TOC entry 230 (class 1259 OID 34194)
-- Name: next_step; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE next_step (
    id integer NOT NULL,
    prescription character varying,
    ts timestamp without time zone,
    status character varying(20)
);


ALTER TABLE public.next_step OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 34200)
-- Name: next_step_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE next_step_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.next_step_id_seq OWNER TO postgres;

--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 231
-- Name: next_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE next_step_id_seq OWNED BY next_step.id;


--
-- TOC entry 268 (class 1259 OID 34314)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE supplier (
);


ALTER TABLE public.supplier OWNER TO postgres;

SET search_path = security, pg_catalog;

--
-- TOC entry 184 (class 1259 OID 34063)
-- Name: authorized_people; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE authorized_people (
    id bigint NOT NULL,
    id_roster_owner integer NOT NULL,
    id_roster_assistant integer NOT NULL,
    ts timestamp without time zone,
    principal boolean DEFAULT false
);


ALTER TABLE security.authorized_people OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 34067)
-- Name: authorized_people_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE authorized_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.authorized_people_id_seq OWNER TO postgres;

--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 185
-- Name: authorized_people_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE authorized_people_id_seq OWNED BY authorized_people.id;


--
-- TOC entry 196 (class 1259 OID 34095)
-- Name: functionality_by_profile; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE functionality_by_profile (
    id bigint NOT NULL,
    id_functionality bigint NOT NULL,
    id_profile bigint NOT NULL
);


ALTER TABLE security.functionality_by_profile OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 34098)
-- Name: enabled_functionality_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE enabled_functionality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.enabled_functionality_id_seq OWNER TO postgres;

--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 197
-- Name: enabled_functionality_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE enabled_functionality_id_seq OWNED BY functionality_by_profile.id;


--
-- TOC entry 198 (class 1259 OID 34100)
-- Name: enabled_module; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE enabled_module (
    id bigint NOT NULL,
    description character varying(64) NOT NULL,
    id_institution integer NOT NULL,
    id_software_module bigint NOT NULL,
    validity boolean NOT NULL
);


ALTER TABLE security.enabled_module OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 34103)
-- Name: enabled_profile; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE enabled_profile (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    id_enabled_module integer NOT NULL,
    id_user bigint NOT NULL
);


ALTER TABLE security.enabled_profile OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 34106)
-- Name: enabled_profile_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE enabled_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.enabled_profile_id_seq OWNER TO postgres;

--
-- TOC entry 2762 (class 0 OID 0)
-- Dependencies: 200
-- Name: enabled_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE enabled_profile_id_seq OWNED BY enabled_profile.id;


--
-- TOC entry 212 (class 1259 OID 34144)
-- Name: functionality; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE functionality (
    id integer NOT NULL,
    description character varying(128) NOT NULL,
    id_software_module integer NOT NULL,
    id_parent_functionality bigint
);


ALTER TABLE security.functionality OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 34147)
-- Name: functionality_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE functionality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.functionality_id_seq OWNER TO postgres;

--
-- TOC entry 2763 (class 0 OID 0)
-- Dependencies: 213
-- Name: functionality_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE functionality_id_seq OWNED BY functionality.id;


--
-- TOC entry 221 (class 1259 OID 34167)
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
    version integer DEFAULT 0 NOT NULL
);


ALTER TABLE security.log OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 34174)
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
-- TOC entry 2764 (class 0 OID 0)
-- Dependencies: 222
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE log_id_seq OWNED BY log.id;


--
-- TOC entry 247 (class 1259 OID 34250)
-- Name: profile; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE profile (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    id_software_module integer NOT NULL
);


ALTER TABLE security.profile OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 34253)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.profile_id_seq OWNER TO postgres;

--
-- TOC entry 2765 (class 0 OID 0)
-- Dependencies: 248
-- Name: profile_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE profile_id_seq OWNED BY profile.id;


--
-- TOC entry 264 (class 1259 OID 34300)
-- Name: software_module; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE software_module (
    id bigint NOT NULL,
    description character varying(64) NOT NULL,
    release character varying(32) NOT NULL,
    path character varying(32) NOT NULL,
    version integer DEFAULT 0 NOT NULL,
    id_software_module_parent bigint NOT NULL,
    validity boolean NOT NULL
);


ALTER TABLE security.software_module OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 34304)
-- Name: software_module_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE software_module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.software_module_id_seq OWNER TO postgres;

--
-- TOC entry 2766 (class 0 OID 0)
-- Dependencies: 265
-- Name: software_module_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE software_module_id_seq OWNED BY software_module.id;


--
-- TOC entry 276 (class 1259 OID 36459)
-- Name: special_functionality_by_user_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE special_functionality_by_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.special_functionality_by_user_id_seq OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 36439)
-- Name: special_functionality_by_user; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE special_functionality_by_user (
    id integer DEFAULT nextval('special_functionality_by_user_id_seq'::regclass) NOT NULL,
    id_functionality integer,
    id_enabled_module integer NOT NULL,
    id_user integer NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE security.special_functionality_by_user OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 34327)
-- Name: user; Type: TABLE; Schema: security; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    id bigint NOT NULL,
    id_employee integer NOT NULL,
    login_name character varying(32) NOT NULL,
    encrypted_pw character varying(512),
    keypublic character varying,
    keyprivate character varying,
    enabled boolean DEFAULT true,
    signature_image bytea,
    version integer DEFAULT 0 NOT NULL
);


ALTER TABLE security."user" OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 34335)
-- Name: user_id_seq; Type: SEQUENCE; Schema: security; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE security.user_id_seq OWNER TO postgres;

--
-- TOC entry 2767 (class 0 OID 0)
-- Dependencies: 274
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: security; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


SET search_path = administrative, pg_catalog;

--
-- TOC entry 2189 (class 2604 OID 34339)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at ALTER COLUMN id SET DEFAULT nextval('allowed_to_work_at_id_seq'::regclass);


--
-- TOC entry 2199 (class 2604 OID 34346)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY employee ALTER COLUMN id SET DEFAULT nextval('employee_id_seq'::regclass);


--
-- TOC entry 2217 (class 2604 OID 34364)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY operation_time ALTER COLUMN id SET DEFAULT nextval('slot_id_seq'::regclass);


--
-- TOC entry 2221 (class 2604 OID 34368)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY physical_space ALTER COLUMN id SET DEFAULT nextval('physical_space_id_seq'::regclass);


--
-- TOC entry 2223 (class 2604 OID 34369)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY physical_space_assigned_to_unit ALTER COLUMN id SET DEFAULT nextval('physical_space_assigned_to_unit_id_seq'::regclass);


--
-- TOC entry 2229 (class 2604 OID 34375)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource ALTER COLUMN id SET DEFAULT nextval('resource_id_seq'::regclass);


--
-- TOC entry 2231 (class 2604 OID 34376)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution ALTER COLUMN id SET DEFAULT nextval('resource_belongs_to_institution_id_seq'::regclass);


--
-- TOC entry 2232 (class 2604 OID 34377)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit ALTER COLUMN id SET DEFAULT nextval('resource_belongs_to_unit_id_seq'::regclass);


--
-- TOC entry 2209 (class 2604 OID 34379)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY service_schedule ALTER COLUMN id SET DEFAULT nextval('horario_de_atencion_id_seq'::regclass);


--
-- TOC entry 2239 (class 2604 OID 34383)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY unit ALTER COLUMN id SET DEFAULT nextval('unit_id_seq'::regclass);


--
-- TOC entry 2240 (class 2604 OID 34384)
-- Name: id; Type: DEFAULT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY unit_skill ALTER COLUMN id SET DEFAULT nextval('unit_skill_id_seq'::regclass);


SET search_path = general, pg_catalog;

--
-- TOC entry 2186 (class 2604 OID 34337)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY activity_type ALTER COLUMN id SET DEFAULT nextval('activity_type_id_seq'::regclass);


--
-- TOC entry 2187 (class 2604 OID 34338)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 34345)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY document ALTER COLUMN id SET DEFAULT nextval('document_id_document_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 34348)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('appointment_id_seq'::regclass);


--
-- TOC entry 2203 (class 2604 OID 34350)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_order ALTER COLUMN id SET DEFAULT nextval('form_order_id_seq'::regclass);


--
-- TOC entry 2202 (class 2604 OID 34351)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_result ALTER COLUMN id SET DEFAULT nextval('form_id_seq'::regclass);


--
-- TOC entry 2204 (class 2604 OID 34352)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_result_item ALTER COLUMN id SET DEFAULT nextval('form_result_item_id_seq'::regclass);


--
-- TOC entry 2205 (class 2604 OID 34353)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_template ALTER COLUMN id SET DEFAULT nextval('form_template_id_seq'::regclass);


--
-- TOC entry 2206 (class 2604 OID 34354)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_template_item ALTER COLUMN id SET DEFAULT nextval('form_template_item_id_seq'::regclass);


--
-- TOC entry 2208 (class 2604 OID 34357)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY group_of_items ALTER COLUMN id SET DEFAULT nextval('group_of_items_id_seq'::regclass);


--
-- TOC entry 2210 (class 2604 OID 34358)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY item ALTER COLUMN id SET DEFAULT nextval('item_of_list_id_seq'::regclass);


--
-- TOC entry 2214 (class 2604 OID 34361)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY nomenclature_hierarchy ALTER COLUMN id SET DEFAULT nextval('medical_nomenclature_id_seq'::regclass);


--
-- TOC entry 2219 (class 2604 OID 34366)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- TOC entry 2220 (class 2604 OID 34367)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person_skill ALTER COLUMN id SET DEFAULT nextval('person_skill_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 34371)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY profession ALTER COLUMN id SET DEFAULT nextval('profession_id_seq'::regclass);


--
-- TOC entry 2227 (class 2604 OID 34373)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY relationship ALTER COLUMN id SET DEFAULT nextval('relationship_id_seq1'::regclass);


--
-- TOC entry 2228 (class 2604 OID 34374)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY relationship_type ALTER COLUMN id SET DEFAULT nextval('relationship_id_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 34378)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster ALTER COLUMN id SET DEFAULT nextval('roster_id_seq'::regclass);


--
-- TOC entry 2235 (class 2604 OID 34380)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY shift ALTER COLUMN id SET DEFAULT nextval('shift_id_seq'::regclass);


--
-- TOC entry 2238 (class 2604 OID 34382)
-- Name: id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY specialization ALTER COLUMN id SET DEFAULT nextval('specialization_id_seq'::regclass);


SET search_path = health, pg_catalog;

--
-- TOC entry 2190 (class 2604 OID 34340)
-- Name: id; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY anamnesis ALTER COLUMN id SET DEFAULT nextval('anamnesis_id_seq'::regclass);


--
-- TOC entry 2194 (class 2604 OID 34342)
-- Name: id; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY clinic_history ALTER COLUMN id SET DEFAULT nextval('clinic_history_id_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 34343)
-- Name: id; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY clinic_history_summary ALTER COLUMN id SET DEFAULT nextval('clinic_history_summary_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 34344)
-- Name: id; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY diagnostic ALTER COLUMN id SET DEFAULT nextval('diagnostic_id_seq'::regclass);


--
-- TOC entry 2213 (class 2604 OID 34360)
-- Name: id; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY medical_center_clinic_history ALTER COLUMN id SET DEFAULT nextval('medical_center_clinic_history_id_seq'::regclass);


--
-- TOC entry 2215 (class 2604 OID 34362)
-- Name: id; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY medicine ALTER COLUMN id SET DEFAULT nextval('medicine_id_seq'::regclass);


--
-- TOC entry 2218 (class 2604 OID 34365)
-- Name: id; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY patient ALTER COLUMN id SET DEFAULT nextval('patient_registration_id_seq'::regclass);


--
-- TOC entry 2224 (class 2604 OID 34370)
-- Name: id; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY prescription ALTER COLUMN id SET DEFAULT nextval('prescription_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2216 (class 2604 OID 34363)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY next_step ALTER COLUMN id SET DEFAULT nextval('next_step_id_seq'::regclass);


SET search_path = security, pg_catalog;

--
-- TOC entry 2193 (class 2604 OID 34341)
-- Name: id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY authorized_people ALTER COLUMN id SET DEFAULT nextval('authorized_people_id_seq'::regclass);


--
-- TOC entry 2201 (class 2604 OID 34347)
-- Name: id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY enabled_profile ALTER COLUMN id SET DEFAULT nextval('enabled_profile_id_seq'::regclass);


--
-- TOC entry 2207 (class 2604 OID 34355)
-- Name: id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY functionality ALTER COLUMN id SET DEFAULT nextval('functionality_id_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 34356)
-- Name: id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY functionality_by_profile ALTER COLUMN id SET DEFAULT nextval('enabled_functionality_id_seq'::regclass);


--
-- TOC entry 2212 (class 2604 OID 34359)
-- Name: id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY log ALTER COLUMN id SET DEFAULT nextval('log_id_seq'::regclass);


--
-- TOC entry 2226 (class 2604 OID 34372)
-- Name: id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY profile ALTER COLUMN id SET DEFAULT nextval('profile_id_seq'::regclass);


--
-- TOC entry 2237 (class 2604 OID 34381)
-- Name: id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY software_module ALTER COLUMN id SET DEFAULT nextval('software_module_id_seq'::regclass);


--
-- TOC entry 2243 (class 2604 OID 34385)
-- Name: id; Type: DEFAULT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


SET search_path = administrative, pg_catalog;

--
-- TOC entry 2601 (class 0 OID 34047)
-- Dependencies: 178
-- Data for Name: allowed_to_work_at; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2768 (class 0 OID 0)
-- Dependencies: 179
-- Name: allowed_to_work_at_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('allowed_to_work_at_id_seq', 1, false);


--
-- TOC entry 2617 (class 0 OID 34089)
-- Dependencies: 194
-- Data for Name: employee; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2769 (class 0 OID 0)
-- Dependencies: 195
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('employee_id_seq', 1, false);


--
-- TOC entry 2770 (class 0 OID 0)
-- Dependencies: 217
-- Name: horario_de_atencion_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('horario_de_atencion_id_seq', 1, false);


--
-- TOC entry 2641 (class 0 OID 34159)
-- Dependencies: 218
-- Data for Name: institution; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2646 (class 0 OID 34176)
-- Dependencies: 223
-- Data for Name: manager_of_unit; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2655 (class 0 OID 34202)
-- Dependencies: 232
-- Data for Name: operation_time; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2662 (class 0 OID 34223)
-- Dependencies: 239
-- Data for Name: physical_space; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2663 (class 0 OID 34229)
-- Dependencies: 240
-- Data for Name: physical_space_assigned_to_unit; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2771 (class 0 OID 0)
-- Dependencies: 241
-- Name: physical_space_assigned_to_unit_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('physical_space_assigned_to_unit_id_seq', 1, false);


--
-- TOC entry 2772 (class 0 OID 0)
-- Dependencies: 242
-- Name: physical_space_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('physical_space_id_seq', 1, false);


--
-- TOC entry 2676 (class 0 OID 34268)
-- Dependencies: 253
-- Data for Name: resource; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2677 (class 0 OID 34274)
-- Dependencies: 254
-- Data for Name: resource_belongs_to_institution; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2773 (class 0 OID 0)
-- Dependencies: 255
-- Name: resource_belongs_to_institution_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('resource_belongs_to_institution_id_seq', 1, false);


--
-- TOC entry 2679 (class 0 OID 34280)
-- Dependencies: 256
-- Data for Name: resource_belongs_to_unit; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2774 (class 0 OID 0)
-- Dependencies: 257
-- Name: resource_belongs_to_unit_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('resource_belongs_to_unit_id_seq', 1, false);


--
-- TOC entry 2775 (class 0 OID 0)
-- Dependencies: 258
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('resource_id_seq', 1, false);


--
-- TOC entry 2639 (class 0 OID 34154)
-- Dependencies: 216
-- Data for Name: service_schedule; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2776 (class 0 OID 0)
-- Dependencies: 263
-- Name: slot_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('slot_id_seq', 1, false);


--
-- TOC entry 2692 (class 0 OID 34317)
-- Dependencies: 269
-- Data for Name: unit; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2777 (class 0 OID 0)
-- Dependencies: 270
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('unit_id_seq', 1, false);


--
-- TOC entry 2694 (class 0 OID 34322)
-- Dependencies: 271
-- Data for Name: unit_skill; Type: TABLE DATA; Schema: administrative; Owner: postgres
--



--
-- TOC entry 2778 (class 0 OID 0)
-- Dependencies: 272
-- Name: unit_skill_id_seq; Type: SEQUENCE SET; Schema: administrative; Owner: postgres
--

SELECT pg_catalog.setval('unit_skill_id_seq', 1, false);


SET search_path = general, pg_catalog;

--
-- TOC entry 2597 (class 0 OID 34037)
-- Dependencies: 174
-- Data for Name: activity_type; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2779 (class 0 OID 0)
-- Dependencies: 175
-- Name: activity_type_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('activity_type_id_seq', 1, false);


--
-- TOC entry 2599 (class 0 OID 34042)
-- Dependencies: 176
-- Data for Name: address; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2780 (class 0 OID 0)
-- Dependencies: 177
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('address_id_seq', 1, false);


--
-- TOC entry 2781 (class 0 OID 0)
-- Dependencies: 183
-- Name: appointment_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('appointment_id_seq', 1, false);


--
-- TOC entry 2615 (class 0 OID 34084)
-- Dependencies: 192
-- Data for Name: document; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2782 (class 0 OID 0)
-- Dependencies: 193
-- Name: document_id_document_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('document_id_document_seq', 1, false);


--
-- TOC entry 2605 (class 0 OID 34058)
-- Dependencies: 182
-- Data for Name: event; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2624 (class 0 OID 34108)
-- Dependencies: 201
-- Data for Name: event_guest; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2783 (class 0 OID 0)
-- Dependencies: 203
-- Name: form_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('form_id_seq', 1, false);


--
-- TOC entry 2627 (class 0 OID 34124)
-- Dependencies: 204
-- Data for Name: form_order; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2784 (class 0 OID 0)
-- Dependencies: 205
-- Name: form_order_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('form_order_id_seq', 1, false);


--
-- TOC entry 2625 (class 0 OID 34116)
-- Dependencies: 202
-- Data for Name: form_result; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2629 (class 0 OID 34129)
-- Dependencies: 206
-- Data for Name: form_result_item; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2785 (class 0 OID 0)
-- Dependencies: 207
-- Name: form_result_item_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('form_result_item_id_seq', 1, false);


--
-- TOC entry 2631 (class 0 OID 34134)
-- Dependencies: 208
-- Data for Name: form_template; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2786 (class 0 OID 0)
-- Dependencies: 209
-- Name: form_template_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('form_template_id_seq', 1, false);


--
-- TOC entry 2633 (class 0 OID 34139)
-- Dependencies: 210
-- Data for Name: form_template_item; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2787 (class 0 OID 0)
-- Dependencies: 211
-- Name: form_template_item_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('form_template_item_id_seq', 1, false);


--
-- TOC entry 2637 (class 0 OID 34149)
-- Dependencies: 214
-- Data for Name: group_of_items; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2788 (class 0 OID 0)
-- Dependencies: 215
-- Name: group_of_items_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('group_of_items_id_seq', 1, false);


--
-- TOC entry 2642 (class 0 OID 34162)
-- Dependencies: 219
-- Data for Name: item; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2789 (class 0 OID 0)
-- Dependencies: 220
-- Name: item_of_list_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('item_of_list_id_seq', 1, false);


--
-- TOC entry 2790 (class 0 OID 0)
-- Dependencies: 227
-- Name: medical_nomenclature_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('medical_nomenclature_id_seq', 1, false);


--
-- TOC entry 2649 (class 0 OID 34184)
-- Dependencies: 226
-- Data for Name: nomenclature_hierarchy; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2658 (class 0 OID 34210)
-- Dependencies: 235
-- Data for Name: person; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2791 (class 0 OID 0)
-- Dependencies: 236
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('person_id_seq', 1, false);


--
-- TOC entry 2660 (class 0 OID 34218)
-- Dependencies: 237
-- Data for Name: person_skill; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2792 (class 0 OID 0)
-- Dependencies: 238
-- Name: person_skill_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('person_skill_id_seq', 1, false);


--
-- TOC entry 2668 (class 0 OID 34242)
-- Dependencies: 245
-- Data for Name: profession; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2793 (class 0 OID 0)
-- Dependencies: 246
-- Name: profession_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('profession_id_seq', 1, false);


--
-- TOC entry 2672 (class 0 OID 34255)
-- Dependencies: 249
-- Data for Name: relationship; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2794 (class 0 OID 0)
-- Dependencies: 251
-- Name: relationship_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('relationship_id_seq', 1, false);


--
-- TOC entry 2795 (class 0 OID 0)
-- Dependencies: 252
-- Name: relationship_id_seq1; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('relationship_id_seq1', 1, false);


--
-- TOC entry 2673 (class 0 OID 34258)
-- Dependencies: 250
-- Data for Name: relationship_type; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2682 (class 0 OID 34287)
-- Dependencies: 259
-- Data for Name: roster; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2796 (class 0 OID 0)
-- Dependencies: 260
-- Name: roster_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('roster_id_seq', 1, false);


--
-- TOC entry 2684 (class 0 OID 34292)
-- Dependencies: 261
-- Data for Name: shift; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2797 (class 0 OID 0)
-- Dependencies: 262
-- Name: shift_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('shift_id_seq', 1, false);


--
-- TOC entry 2689 (class 0 OID 34306)
-- Dependencies: 266
-- Data for Name: specialization; Type: TABLE DATA; Schema: general; Owner: postgres
--



--
-- TOC entry 2798 (class 0 OID 0)
-- Dependencies: 267
-- Name: specialization_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('specialization_id_seq', 1, false);


SET search_path = health, pg_catalog;

--
-- TOC entry 2603 (class 0 OID 34053)
-- Dependencies: 180
-- Data for Name: anamnesis; Type: TABLE DATA; Schema: health; Owner: postgres
--



--
-- TOC entry 2799 (class 0 OID 0)
-- Dependencies: 181
-- Name: anamnesis_id_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('anamnesis_id_seq', 1, false);


--
-- TOC entry 2609 (class 0 OID 34069)
-- Dependencies: 186
-- Data for Name: clinic_history; Type: TABLE DATA; Schema: health; Owner: postgres
--



--
-- TOC entry 2800 (class 0 OID 0)
-- Dependencies: 187
-- Name: clinic_history_id_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('clinic_history_id_seq', 1, false);


--
-- TOC entry 2611 (class 0 OID 34074)
-- Dependencies: 188
-- Data for Name: clinic_history_summary; Type: TABLE DATA; Schema: health; Owner: postgres
--



--
-- TOC entry 2801 (class 0 OID 0)
-- Dependencies: 189
-- Name: clinic_history_summary_id_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('clinic_history_summary_id_seq', 1, false);


--
-- TOC entry 2613 (class 0 OID 34079)
-- Dependencies: 190
-- Data for Name: diagnostic; Type: TABLE DATA; Schema: health; Owner: postgres
--



--
-- TOC entry 2802 (class 0 OID 0)
-- Dependencies: 191
-- Name: diagnostic_id_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('diagnostic_id_seq', 1, false);


--
-- TOC entry 2647 (class 0 OID 34179)
-- Dependencies: 224
-- Data for Name: medical_center_clinic_history; Type: TABLE DATA; Schema: health; Owner: postgres
--



--
-- TOC entry 2803 (class 0 OID 0)
-- Dependencies: 225
-- Name: medical_center_clinic_history_id_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('medical_center_clinic_history_id_seq', 1, false);


--
-- TOC entry 2651 (class 0 OID 34189)
-- Dependencies: 228
-- Data for Name: medicine; Type: TABLE DATA; Schema: health; Owner: postgres
--



--
-- TOC entry 2804 (class 0 OID 0)
-- Dependencies: 229
-- Name: medicine_id_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('medicine_id_seq', 1, false);


--
-- TOC entry 2656 (class 0 OID 34205)
-- Dependencies: 233
-- Data for Name: patient; Type: TABLE DATA; Schema: health; Owner: postgres
--



--
-- TOC entry 2805 (class 0 OID 0)
-- Dependencies: 234
-- Name: patient_registration_id_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('patient_registration_id_seq', 1, false);


--
-- TOC entry 2666 (class 0 OID 34237)
-- Dependencies: 243
-- Data for Name: prescription; Type: TABLE DATA; Schema: health; Owner: postgres
--



--
-- TOC entry 2806 (class 0 OID 0)
-- Dependencies: 244
-- Name: prescription_id_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('prescription_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 2653 (class 0 OID 34194)
-- Dependencies: 230
-- Data for Name: next_step; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO next_step VALUES (1, 'crear pk, fk, indexes en encounter', NULL, 'done');
INSERT INTO next_step VALUES (2, 'eliminar ticket', NULL, 'done');
INSERT INTO next_step VALUES (3, 'vincular event al roster', NULL, 'done');


--
-- TOC entry 2807 (class 0 OID 0)
-- Dependencies: 231
-- Name: next_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('next_step_id_seq', 3, true);


--
-- TOC entry 2691 (class 0 OID 34314)
-- Dependencies: 268
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--



SET search_path = security, pg_catalog;

--
-- TOC entry 2607 (class 0 OID 34063)
-- Dependencies: 184
-- Data for Name: authorized_people; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2808 (class 0 OID 0)
-- Dependencies: 185
-- Name: authorized_people_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('authorized_people_id_seq', 1, false);


--
-- TOC entry 2809 (class 0 OID 0)
-- Dependencies: 197
-- Name: enabled_functionality_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('enabled_functionality_id_seq', 1, false);


--
-- TOC entry 2621 (class 0 OID 34100)
-- Dependencies: 198
-- Data for Name: enabled_module; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2622 (class 0 OID 34103)
-- Dependencies: 199
-- Data for Name: enabled_profile; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2810 (class 0 OID 0)
-- Dependencies: 200
-- Name: enabled_profile_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('enabled_profile_id_seq', 1, false);


--
-- TOC entry 2635 (class 0 OID 34144)
-- Dependencies: 212
-- Data for Name: functionality; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2619 (class 0 OID 34095)
-- Dependencies: 196
-- Data for Name: functionality_by_profile; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2811 (class 0 OID 0)
-- Dependencies: 213
-- Name: functionality_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('functionality_id_seq', 1, false);


--
-- TOC entry 2644 (class 0 OID 34167)
-- Dependencies: 221
-- Data for Name: log; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2812 (class 0 OID 0)
-- Dependencies: 222
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('log_id_seq', 1, false);


--
-- TOC entry 2670 (class 0 OID 34250)
-- Dependencies: 247
-- Data for Name: profile; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2813 (class 0 OID 0)
-- Dependencies: 248
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('profile_id_seq', 1, false);


--
-- TOC entry 2687 (class 0 OID 34300)
-- Dependencies: 264
-- Data for Name: software_module; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2814 (class 0 OID 0)
-- Dependencies: 265
-- Name: software_module_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('software_module_id_seq', 1, false);


--
-- TOC entry 2698 (class 0 OID 36439)
-- Dependencies: 275
-- Data for Name: special_functionality_by_user; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2815 (class 0 OID 0)
-- Dependencies: 276
-- Name: special_functionality_by_user_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('special_functionality_by_user_id_seq', 1, false);


--
-- TOC entry 2696 (class 0 OID 34327)
-- Dependencies: 273
-- Data for Name: user; Type: TABLE DATA; Schema: security; Owner: postgres
--



--
-- TOC entry 2816 (class 0 OID 0)
-- Dependencies: 274
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: security; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 1, false);


SET search_path = administrative, pg_catalog;

--
-- TOC entry 2250 (class 2606 OID 34399)
-- Name: pk_allowed_to_work_at; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT pk_allowed_to_work_at PRIMARY KEY (id_person, id_institution, id_document, id_unit);


--
-- TOC entry 2274 (class 2606 OID 34409)
-- Name: pk_employee; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (id_person, id_institution, id_init_document);


--
-- TOC entry 2301 (class 2606 OID 34423)
-- Name: pk_horario_de_atencion; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_schedule
    ADD CONSTRAINT pk_horario_de_atencion PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 34435)
-- Name: pk_institution; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY institution
    ADD CONSTRAINT pk_institution PRIMARY KEY (id);


--
-- TOC entry 2333 (class 2606 OID 34455)
-- Name: pk_physical_space; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY physical_space
    ADD CONSTRAINT pk_physical_space PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 34457)
-- Name: pk_physical_space_assigned_to_unit; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY physical_space_assigned_to_unit
    ADD CONSTRAINT pk_physical_space_assigned_to_unit PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 34463)
-- Name: pk_resource; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT pk_resource PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 34465)
-- Name: pk_resource_belongs_to; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT pk_resource_belongs_to PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 34467)
-- Name: pk_resource_belongs_to_unit; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT pk_resource_belongs_to_unit PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 34469)
-- Name: pk_role; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY manager_of_unit
    ADD CONSTRAINT pk_role PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 34475)
-- Name: pk_slot; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operation_time
    ADD CONSTRAINT pk_slot PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 34481)
-- Name: pk_unit; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT pk_unit PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 34483)
-- Name: pk_unit_skill; Type: CONSTRAINT; Schema: administrative; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unit_skill
    ADD CONSTRAINT pk_unit_skill PRIMARY KEY (id);


SET search_path = general, pg_catalog;

--
-- TOC entry 2289 (class 2606 OID 34391)
-- Name: form_order_pkey; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY form_order
    ADD CONSTRAINT form_order_pkey PRIMARY KEY (id);


--
-- TOC entry 2246 (class 2606 OID 34395)
-- Name: pk_activity_type; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activity_type
    ADD CONSTRAINT pk_activity_type PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 34397)
-- Name: pk_address; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT pk_address PRIMARY KEY (id);


--
-- TOC entry 2271 (class 2606 OID 34407)
-- Name: pk_document; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document
    ADD CONSTRAINT pk_document PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 34411)
-- Name: pk_event; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT pk_event PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 34413)
-- Name: pk_form_result; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY form_result
    ADD CONSTRAINT pk_form_result PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 34415)
-- Name: pk_form_result_item; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY form_result_item
    ADD CONSTRAINT pk_form_result_item PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 34417)
-- Name: pk_form_template; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY form_template
    ADD CONSTRAINT pk_form_template PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 34419)
-- Name: pk_form_template_item; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY form_template_item
    ADD CONSTRAINT pk_form_template_item PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 34421)
-- Name: pk_group_of_items; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_of_items
    ADD CONSTRAINT pk_group_of_items PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 34437)
-- Name: pk_item_of_list; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT pk_item_of_list PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 34443)
-- Name: pk_medical_nomenclature; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nomenclature_hierarchy
    ADD CONSTRAINT pk_medical_nomenclature PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 34451)
-- Name: pk_person; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT pk_person PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 34453)
-- Name: pk_person_skill; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY person_skill
    ADD CONSTRAINT pk_person_skill PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 34459)
-- Name: pk_profession; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profession
    ADD CONSTRAINT pk_profession PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 34461)
-- Name: pk_relationship; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY relationship_type
    ADD CONSTRAINT pk_relationship PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 34471)
-- Name: pk_roster; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT pk_roster PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 34473)
-- Name: pk_shift; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shift
    ADD CONSTRAINT pk_shift PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 34479)
-- Name: pk_specialization; Type: CONSTRAINT; Schema: general; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY specialization
    ADD CONSTRAINT pk_specialization PRIMARY KEY (id);


SET search_path = health, pg_catalog;

--
-- TOC entry 2252 (class 2606 OID 34387)
-- Name: anamnesis_pkey; Type: CONSTRAINT; Schema: health; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY anamnesis
    ADD CONSTRAINT anamnesis_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 34389)
-- Name: diagnostic_pkey; Type: CONSTRAINT; Schema: health; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY diagnostic
    ADD CONSTRAINT diagnostic_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 34403)
-- Name: pk_clinic_history; Type: CONSTRAINT; Schema: health; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clinic_history
    ADD CONSTRAINT pk_clinic_history PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 34405)
-- Name: pk_clinic_history_summary; Type: CONSTRAINT; Schema: health; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clinic_history_summary
    ADD CONSTRAINT pk_clinic_history_summary PRIMARY KEY (id);


--
-- TOC entry 2316 (class 2606 OID 34441)
-- Name: pk_medical_center_clinic_history; Type: CONSTRAINT; Schema: health; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medical_center_clinic_history
    ADD CONSTRAINT pk_medical_center_clinic_history PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 34445)
-- Name: pk_medicine; Type: CONSTRAINT; Schema: health; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medicine
    ADD CONSTRAINT pk_medicine PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 34449)
-- Name: pk_patient_registration; Type: CONSTRAINT; Schema: health; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT pk_patient_registration PRIMARY KEY (id_institution, id_person);


--
-- TOC entry 2337 (class 2606 OID 34487)
-- Name: prescription_pkey; Type: CONSTRAINT; Schema: health; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prescription
    ADD CONSTRAINT prescription_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2323 (class 2606 OID 34447)
-- Name: pk_next_step; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY next_step
    ADD CONSTRAINT pk_next_step PRIMARY KEY (id);


SET search_path = security, pg_catalog;

--
-- TOC entry 2281 (class 2606 OID 34393)
-- Name: id_enabled_profile; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enabled_profile
    ADD CONSTRAINT id_enabled_profile PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 34401)
-- Name: pk_authorized_people; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authorized_people
    ADD CONSTRAINT pk_authorized_people PRIMARY KEY (id_roster_owner, id_roster_assistant);


--
-- TOC entry 2277 (class 2606 OID 34425)
-- Name: pk_id_enabled_functionality; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY functionality_by_profile
    ADD CONSTRAINT pk_id_enabled_functionality PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 36443)
-- Name: pk_id_extra_functionality; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY special_functionality_by_user
    ADD CONSTRAINT pk_id_extra_functionality PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 34429)
-- Name: pk_id_functionality; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY functionality
    ADD CONSTRAINT pk_id_functionality PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 34431)
-- Name: pk_id_profile; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT pk_id_profile PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 34433)
-- Name: pk_installed_module; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enabled_module
    ADD CONSTRAINT pk_installed_module PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 34439)
-- Name: pk_log; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log
    ADD CONSTRAINT pk_log PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 34477)
-- Name: pk_software_module; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY software_module
    ADD CONSTRAINT pk_software_module PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 34485)
-- Name: pk_user; Type: CONSTRAINT; Schema: security; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


SET search_path = administrative, pg_catalog;

--
-- TOC entry 2272 (class 1259 OID 34492)
-- Name: idx_employee; Type: INDEX; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX idx_employee ON employee USING btree (id);


--
-- TOC entry 2310 (class 1259 OID 34501)
-- Name: idx_role_institution; Type: INDEX; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_role_institution ON manager_of_unit USING btree (id_institution, date_from DESC);


--
-- TOC entry 2311 (class 1259 OID 34502)
-- Name: idx_role_person; Type: INDEX; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_role_person ON manager_of_unit USING btree (id_person, date_from DESC);


--
-- TOC entry 2312 (class 1259 OID 34503)
-- Name: idx_role_unit; Type: INDEX; Schema: administrative; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_role_unit ON manager_of_unit USING btree (id_unit, date_from DESC);

ALTER TABLE manager_of_unit CLUSTER ON idx_role_unit;


SET search_path = general, pg_catalog;

--
-- TOC entry 2283 (class 1259 OID 34488)
-- Name: fki_event_guest_to_person; Type: INDEX; Schema: general; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_event_guest_to_person ON event_guest USING btree (id_invitee);


--
-- TOC entry 2253 (class 1259 OID 34489)
-- Name: fki_event_type_item; Type: INDEX; Schema: general; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_event_type_item ON event USING btree (id_type);


--
-- TOC entry 2317 (class 1259 OID 44657)
-- Name: fki_hierarchy_type; Type: INDEX; Schema: general; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_hierarchy_type ON nomenclature_hierarchy USING btree (hierarchy_type_id);


--
-- TOC entry 2254 (class 1259 OID 34494)
-- Name: idx_event_by_owner; Type: INDEX; Schema: general; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_by_owner ON event USING btree (id_owner, id_institution, yyyy, mm, dd);


--
-- TOC entry 2284 (class 1259 OID 34495)
-- Name: idx_event_guest_by_event; Type: INDEX; Schema: general; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_guest_by_event ON event_guest USING hash (id_event);


--
-- TOC entry 2285 (class 1259 OID 34496)
-- Name: idx_event_guest_by_person; Type: INDEX; Schema: general; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_guest_by_person ON event_guest USING btree (id_invitee);

ALTER TABLE event_guest CLUSTER ON idx_event_guest_by_person;


--
-- TOC entry 2255 (class 1259 OID 34497)
-- Name: idx_event_time; Type: INDEX; Schema: general; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_time ON event USING btree ("timestamp");


--
-- TOC entry 2304 (class 1259 OID 34499)
-- Name: idx_item_group; Type: INDEX; Schema: general; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_item_group ON item USING btree (id_group_of_items);

ALTER TABLE item CLUSTER ON idx_item_group;


--
-- TOC entry 2305 (class 1259 OID 34500)
-- Name: idx_item_sorted_by_priority; Type: INDEX; Schema: general; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_item_sorted_by_priority ON item USING btree (id_group_of_items, priority);


SET search_path = health, pg_catalog;

--
-- TOC entry 2268 (class 1259 OID 35119)
-- Name: fki_judgement_type; Type: INDEX; Schema: health; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_judgement_type ON diagnostic USING btree (id_type);


--
-- TOC entry 2263 (class 1259 OID 34491)
-- Name: idx_clinic_history_summary; Type: INDEX; Schema: health; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_clinic_history_summary ON clinic_history_summary USING btree (id_person);

ALTER TABLE clinic_history_summary CLUSTER ON idx_clinic_history_summary;


--
-- TOC entry 2269 (class 1259 OID 35105)
-- Name: idx_event; Type: INDEX; Schema: health; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event ON diagnostic USING btree (id_event);

ALTER TABLE diagnostic CLUSTER ON idx_event;


SET search_path = security, pg_catalog;

--
-- TOC entry 2258 (class 1259 OID 34490)
-- Name: idx_authorized_people; Type: INDEX; Schema: security; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_authorized_people ON authorized_people USING btree (id_roster_owner);


--
-- TOC entry 2282 (class 1259 OID 34493)
-- Name: idx_enabled_profile_by_user; Type: INDEX; Schema: security; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_enabled_profile_by_user ON enabled_profile USING btree (id_user);

ALTER TABLE enabled_profile CLUSTER ON idx_enabled_profile_by_user;


--
-- TOC entry 2275 (class 1259 OID 34498)
-- Name: idx_functionality_by_profile; Type: INDEX; Schema: security; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_functionality_by_profile ON functionality_by_profile USING btree (id_profile);

ALTER TABLE functionality_by_profile CLUSTER ON idx_functionality_by_profile;


SET search_path = administrative, pg_catalog;

--
-- TOC entry 2371 (class 2606 OID 34509)
-- Name: fk_allowed_to_work_at_to_document; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_document FOREIGN KEY (id_document) REFERENCES general.document(id);


--
-- TOC entry 2370 (class 2606 OID 34514)
-- Name: fk_allowed_to_work_at_to_employee; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_employee FOREIGN KEY (id_person, id_institution, id_document) REFERENCES employee(id_person, id_institution, id_init_document);


--
-- TOC entry 2369 (class 2606 OID 34519)
-- Name: fk_allowed_to_work_at_to_institution; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2368 (class 2606 OID 34524)
-- Name: fk_allowed_to_work_at_to_person; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_person FOREIGN KEY (id_person) REFERENCES general.person(id);


--
-- TOC entry 2367 (class 2606 OID 34529)
-- Name: fk_allowed_to_work_at_to_unit; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2391 (class 2606 OID 34574)
-- Name: fk_employee_to_profession; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_employee_to_profession FOREIGN KEY (id_profession) REFERENCES general.profession(id);


--
-- TOC entry 2390 (class 2606 OID 34579)
-- Name: fk_employee_to_specialization; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_employee_to_specialization FOREIGN KEY (id_specialization) REFERENCES general.specialization(id);


--
-- TOC entry 2420 (class 2606 OID 34739)
-- Name: fk_horario_de_atencion_to_slot; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY service_schedule
    ADD CONSTRAINT fk_horario_de_atencion_to_slot FOREIGN KEY (id_slot) REFERENCES operation_time(id);


--
-- TOC entry 2419 (class 2606 OID 34744)
-- Name: fk_horario_de_atencion_to_unit; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY service_schedule
    ADD CONSTRAINT fk_horario_de_atencion_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2449 (class 2606 OID 34854)
-- Name: fk_physical_space; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY physical_space
    ADD CONSTRAINT fk_physical_space FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2448 (class 2606 OID 34859)
-- Name: fk_physical_space_parent; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY physical_space
    ADD CONSTRAINT fk_physical_space_parent FOREIGN KEY (id_parent) REFERENCES physical_space(id);


--
-- TOC entry 2464 (class 2606 OID 34899)
-- Name: fk_resource_belongs_to_institution_to_entry_document; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_entry_document FOREIGN KEY (id_entry_document) REFERENCES general.document(id);


--
-- TOC entry 2463 (class 2606 OID 34904)
-- Name: fk_resource_belongs_to_institution_to_institution; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2462 (class 2606 OID 34909)
-- Name: fk_resource_belongs_to_institution_to_itself; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_itself FOREIGN KEY (id_moved_to) REFERENCES resource_belongs_to_institution(id);


--
-- TOC entry 2461 (class 2606 OID 34914)
-- Name: fk_resource_belongs_to_institution_to_reason_of_retiremen; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_reason_of_retiremen FOREIGN KEY (id_reason_of_retirement) REFERENCES general.item(id);


--
-- TOC entry 2460 (class 2606 OID 34919)
-- Name: fk_resource_belongs_to_institution_to_resource; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_resource FOREIGN KEY (id_resource) REFERENCES resource(id);


--
-- TOC entry 2459 (class 2606 OID 34924)
-- Name: fk_resource_belongs_to_institution_to_retire_document; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_retire_document FOREIGN KEY (id_retire_document) REFERENCES general.document(id);


--
-- TOC entry 2466 (class 2606 OID 34929)
-- Name: fk_resource_belongs_to_unit_to_document; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT fk_resource_belongs_to_unit_to_document FOREIGN KEY (id_document) REFERENCES general.document(id);


--
-- TOC entry 2465 (class 2606 OID 34934)
-- Name: fk_resource_belongs_to_unit_to_id_resource_belongs_to_instituti; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT fk_resource_belongs_to_unit_to_id_resource_belongs_to_instituti FOREIGN KEY (id_resource_belongs_to_institution) REFERENCES resource_belongs_to_institution(id);


--
-- TOC entry 2468 (class 2606 OID 34939)
-- Name: fk_resource_belongs_to_unit_to_type_of_assigment; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT fk_resource_belongs_to_unit_to_type_of_assigment FOREIGN KEY (id_type_of_assigment) REFERENCES general.item(id);


--
-- TOC entry 2467 (class 2606 OID 34944)
-- Name: fk_resource_belongs_to_unit_to_unit; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT fk_resource_belongs_to_unit_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2425 (class 2606 OID 34949)
-- Name: fk_role_institution; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY manager_of_unit
    ADD CONSTRAINT fk_role_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2424 (class 2606 OID 34954)
-- Name: fk_role_person; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY manager_of_unit
    ADD CONSTRAINT fk_role_person FOREIGN KEY (id_person) REFERENCES general.person(id);


--
-- TOC entry 2423 (class 2606 OID 34959)
-- Name: fk_role_unit; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY manager_of_unit
    ADD CONSTRAINT fk_role_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2431 (class 2606 OID 35019)
-- Name: fk_slot_institution; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY operation_time
    ADD CONSTRAINT fk_slot_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2430 (class 2606 OID 35024)
-- Name: fk_slot_item; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY operation_time
    ADD CONSTRAINT fk_slot_item FOREIGN KEY (id_item) REFERENCES general.item(id);


--
-- TOC entry 2484 (class 2606 OID 35039)
-- Name: fk_unit_institution; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT fk_unit_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2483 (class 2606 OID 35044)
-- Name: fk_unit_item; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT fk_unit_item FOREIGN KEY (unit_type) REFERENCES general.item(id);


--
-- TOC entry 2486 (class 2606 OID 35049)
-- Name: fk_unit_skill_to_skill_item; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY unit_skill
    ADD CONSTRAINT fk_unit_skill_to_skill_item FOREIGN KEY (id_skill) REFERENCES general.item(id);


--
-- TOC entry 2485 (class 2606 OID 35054)
-- Name: fk_unit_skill_to_unit; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY unit_skill
    ADD CONSTRAINT fk_unit_skill_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2482 (class 2606 OID 35059)
-- Name: fk_unit_unit_belong_to; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT fk_unit_unit_belong_to FOREIGN KEY (id_unit_belong_to) REFERENCES unit(id);


--
-- TOC entry 2396 (class 2606 OID 35064)
-- Name: fk_works_at_to_end_cause_item; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_end_cause_item FOREIGN KEY (id_end_cause) REFERENCES general.item(id);


--
-- TOC entry 2395 (class 2606 OID 35069)
-- Name: fk_works_at_to_end_document; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_end_document FOREIGN KEY (id_end_document) REFERENCES general.document(id);


--
-- TOC entry 2394 (class 2606 OID 35074)
-- Name: fk_works_at_to_init_document; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_init_document FOREIGN KEY (id_init_document) REFERENCES general.document(id);


--
-- TOC entry 2393 (class 2606 OID 35079)
-- Name: fk_works_at_to_institution; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2392 (class 2606 OID 35084)
-- Name: fk_works_at_to_person; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_person FOREIGN KEY (id_person) REFERENCES general.person(id);


--
-- TOC entry 2451 (class 2606 OID 35094)
-- Name: physical_space_assigned_to_unit_to_physical_space; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY physical_space_assigned_to_unit
    ADD CONSTRAINT physical_space_assigned_to_unit_to_physical_space FOREIGN KEY (id_physical_space) REFERENCES physical_space(id);


--
-- TOC entry 2450 (class 2606 OID 35099)
-- Name: physical_space_assigned_to_unit_to_unit; Type: FK CONSTRAINT; Schema: administrative; Owner: postgres
--

ALTER TABLE ONLY physical_space_assigned_to_unit
    ADD CONSTRAINT physical_space_assigned_to_unit_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


SET search_path = general, pg_catalog;

--
-- TOC entry 2366 (class 2606 OID 34504)
-- Name: fk_activity_type_to_unit; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY activity_type
    ADD CONSTRAINT fk_activity_type_to_unit FOREIGN KEY (id_unit) REFERENCES administrative.unit(id);


--
-- TOC entry 2388 (class 2606 OID 34564)
-- Name: fk_document_to_institution; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY document
    ADD CONSTRAINT fk_document_to_institution FOREIGN KEY (id_institution) REFERENCES administrative.institution(id);


--
-- TOC entry 2389 (class 2606 OID 34569)
-- Name: fk_document_to_item_type; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY document
    ADD CONSTRAINT fk_document_to_item_type FOREIGN KEY (id_type) REFERENCES item(id);


--
-- TOC entry 2374 (class 2606 OID 34609)
-- Name: fk_event_employee; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_employee FOREIGN KEY (id_owner, id_institution, id_init_document) REFERENCES administrative.employee(id_person, id_institution, id_init_document);


--
-- TOC entry 2405 (class 2606 OID 34614)
-- Name: fk_event_guest_to_event; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event_guest
    ADD CONSTRAINT fk_event_guest_to_event FOREIGN KEY (id_event) REFERENCES event(id);


--
-- TOC entry 2404 (class 2606 OID 34619)
-- Name: fk_event_guest_to_person; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event_guest
    ADD CONSTRAINT fk_event_guest_to_person FOREIGN KEY (id_invitee) REFERENCES person(id);


--
-- TOC entry 2373 (class 2606 OID 34624)
-- Name: fk_event_to_encounter_parent; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_to_encounter_parent FOREIGN KEY (id_event_parent) REFERENCES event(id);


--
-- TOC entry 2380 (class 2606 OID 34629)
-- Name: fk_event_to_item; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_to_item FOREIGN KEY (id_state) REFERENCES item(id);


--
-- TOC entry 2379 (class 2606 OID 34634)
-- Name: fk_event_to_physical_space_assigned; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_to_physical_space_assigned FOREIGN KEY (id_physical_space_assigned_to_unit) REFERENCES administrative.physical_space_assigned_to_unit(id);


--
-- TOC entry 2378 (class 2606 OID 34639)
-- Name: fk_event_to_reason_item; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_to_reason_item FOREIGN KEY (id_encounter_reason) REFERENCES item(id);


--
-- TOC entry 2377 (class 2606 OID 34644)
-- Name: fk_event_to_roster; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_to_roster FOREIGN KEY (id_roster) REFERENCES roster(id);


--
-- TOC entry 2376 (class 2606 OID 34649)
-- Name: fk_event_to_unit; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_to_unit FOREIGN KEY (id_unit) REFERENCES administrative.unit(id);


--
-- TOC entry 2375 (class 2606 OID 34654)
-- Name: fk_event_type_item; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_type_item FOREIGN KEY (id_type) REFERENCES item(id);


--
-- TOC entry 2410 (class 2606 OID 34674)
-- Name: fk_form_order_to_consultation; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_order
    ADD CONSTRAINT fk_form_order_to_consultation FOREIGN KEY (id_event) REFERENCES event(id);


--
-- TOC entry 2409 (class 2606 OID 34679)
-- Name: fk_form_order_to_form_template; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_order
    ADD CONSTRAINT fk_form_order_to_form_template FOREIGN KEY (id_form_template) REFERENCES form_template(id);


--
-- TOC entry 2412 (class 2606 OID 34684)
-- Name: fk_form_result_item_to_form_result; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_result_item
    ADD CONSTRAINT fk_form_result_item_to_form_result FOREIGN KEY (id_form_result) REFERENCES form_result(id);


--
-- TOC entry 2411 (class 2606 OID 34689)
-- Name: fk_form_result_item_to_form_template_item; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_result_item
    ADD CONSTRAINT fk_form_result_item_to_form_template_item FOREIGN KEY (id_form_template_item) REFERENCES form_template_item(id);


--
-- TOC entry 2408 (class 2606 OID 34694)
-- Name: fk_form_result_to_event; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_result
    ADD CONSTRAINT fk_form_result_to_event FOREIGN KEY (id_event) REFERENCES event(id);


--
-- TOC entry 2407 (class 2606 OID 34699)
-- Name: fk_form_result_to_form_template; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_result
    ADD CONSTRAINT fk_form_result_to_form_template FOREIGN KEY (id_form_template) REFERENCES form_template(id);


--
-- TOC entry 2406 (class 2606 OID 34704)
-- Name: fk_form_result_to_laboratorian; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_result
    ADD CONSTRAINT fk_form_result_to_laboratorian FOREIGN KEY (id_laboratorian) REFERENCES person(id);


--
-- TOC entry 2413 (class 2606 OID 34709)
-- Name: fk_form_template_id_type_of_form; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_template
    ADD CONSTRAINT fk_form_template_id_type_of_form FOREIGN KEY (id_type_of_form) REFERENCES item(id);


--
-- TOC entry 2416 (class 2606 OID 34714)
-- Name: fk_form_template_item_parent; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_template_item
    ADD CONSTRAINT fk_form_template_item_parent FOREIGN KEY (id_form_template_item_parent) REFERENCES form_template_item(id);


--
-- TOC entry 2415 (class 2606 OID 34719)
-- Name: fk_form_template_item_to_form_template; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_template_item
    ADD CONSTRAINT fk_form_template_item_to_form_template FOREIGN KEY (id_form_template) REFERENCES form_template(id);


--
-- TOC entry 2414 (class 2606 OID 34724)
-- Name: fk_form_template_item_to_item; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY form_template_item
    ADD CONSTRAINT fk_form_template_item_to_item FOREIGN KEY (id_unit) REFERENCES item(id);


--
-- TOC entry 2422 (class 2606 OID 34734)
-- Name: fk_groups_of_items; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT fk_groups_of_items FOREIGN KEY (id_group_of_items) REFERENCES group_of_items(id);


--
-- TOC entry 2429 (class 2606 OID 44652)
-- Name: fk_item_hierarchy_type; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY nomenclature_hierarchy
    ADD CONSTRAINT fk_item_hierarchy_type FOREIGN KEY (hierarchy_type_id) REFERENCES item(id);


--
-- TOC entry 2421 (class 2606 OID 34754)
-- Name: fk_item_parent; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_parent FOREIGN KEY (id_parent) REFERENCES item(id);


--
-- TOC entry 2428 (class 2606 OID 34769)
-- Name: fk_medical_nomenclature_to_itself; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY nomenclature_hierarchy
    ADD CONSTRAINT fk_medical_nomenclature_to_itself FOREIGN KEY (id_parent) REFERENCES nomenclature_hierarchy(id);


--
-- TOC entry 2445 (class 2606 OID 34784)
-- Name: fk_person_address; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_address FOREIGN KEY (id_legal_address) REFERENCES address(id);


--
-- TOC entry 2444 (class 2606 OID 34789)
-- Name: fk_person_address_detailed; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_address_detailed FOREIGN KEY (id_place_of_birth) REFERENCES address(id);


--
-- TOC entry 2443 (class 2606 OID 34794)
-- Name: fk_person_document_type; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_document_type FOREIGN KEY (id_document_type) REFERENCES item(id);


--
-- TOC entry 2442 (class 2606 OID 34799)
-- Name: fk_person_ethnic; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_ethnic FOREIGN KEY (id_ethnic) REFERENCES item(id);


--
-- TOC entry 2441 (class 2606 OID 34804)
-- Name: fk_person_father; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_father FOREIGN KEY (id_father) REFERENCES person(id);


--
-- TOC entry 2440 (class 2606 OID 34809)
-- Name: fk_person_instruction_level; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_instruction_level FOREIGN KEY (id_instruction_level) REFERENCES item(id);


--
-- TOC entry 2439 (class 2606 OID 34814)
-- Name: fk_person_marital_status; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_marital_status FOREIGN KEY (id_marital_status) REFERENCES item(id);


--
-- TOC entry 2438 (class 2606 OID 34819)
-- Name: fk_person_mother; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_mother FOREIGN KEY (id_mother) REFERENCES person(id);


--
-- TOC entry 2437 (class 2606 OID 34824)
-- Name: fk_person_occupation; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_occupation FOREIGN KEY (id_occupation) REFERENCES item(id);


--
-- TOC entry 2436 (class 2606 OID 34829)
-- Name: fk_person_profession; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_profession FOREIGN KEY (id_profession) REFERENCES profession(id);


--
-- TOC entry 2435 (class 2606 OID 34834)
-- Name: fk_person_religion; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_religion FOREIGN KEY (id_religion) REFERENCES item(id);


--
-- TOC entry 2434 (class 2606 OID 34839)
-- Name: fk_person_sex; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_sex FOREIGN KEY (id_sex) REFERENCES item(id);


--
-- TOC entry 2447 (class 2606 OID 34844)
-- Name: fk_person_skill_to_person; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person_skill
    ADD CONSTRAINT fk_person_skill_to_person FOREIGN KEY (id_person) REFERENCES person(id);


--
-- TOC entry 2446 (class 2606 OID 34849)
-- Name: fk_person_skill_to_skill_item; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY person_skill
    ADD CONSTRAINT fk_person_skill_to_skill_item FOREIGN KEY (id_skill) REFERENCES item(id);


--
-- TOC entry 2458 (class 2606 OID 34884)
-- Name: fk_relationship_related_from; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_related_from FOREIGN KEY (id_person_related_from) REFERENCES person(id);


--
-- TOC entry 2457 (class 2606 OID 34889)
-- Name: fk_relationship_related_to; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_related_to FOREIGN KEY (id_person_related_to) REFERENCES person(id);


--
-- TOC entry 2456 (class 2606 OID 34894)
-- Name: fk_relationship_type; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_type FOREIGN KEY (id_relationship_type) REFERENCES relationship_type(id);


--
-- TOC entry 2477 (class 2606 OID 34964)
-- Name: fk_roster_to_activity_type; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_activity_type FOREIGN KEY (id_activity_type) REFERENCES activity_type(id);


--
-- TOC entry 2476 (class 2606 OID 34969)
-- Name: fk_roster_to_allow_to_work_at; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_allow_to_work_at FOREIGN KEY (id_person, id_institution, id_init_document, id_unit) REFERENCES administrative.allowed_to_work_at(id_person, id_institution, id_document, id_unit);


--
-- TOC entry 2475 (class 2606 OID 34974)
-- Name: fk_roster_to_document; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_document FOREIGN KEY (id_init_document) REFERENCES document(id);


--
-- TOC entry 2474 (class 2606 OID 34979)
-- Name: fk_roster_to_institution; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_institution FOREIGN KEY (id_institution) REFERENCES administrative.institution(id);


--
-- TOC entry 2473 (class 2606 OID 34984)
-- Name: fk_roster_to_person; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_person FOREIGN KEY (id_person) REFERENCES person(id);


--
-- TOC entry 2472 (class 2606 OID 34989)
-- Name: fk_roster_to_physical_space; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_physical_space FOREIGN KEY (id_physical_location) REFERENCES administrative.physical_space_assigned_to_unit(id);


--
-- TOC entry 2471 (class 2606 OID 34994)
-- Name: fk_roster_to_shift; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_shift FOREIGN KEY (id_shift) REFERENCES shift(id);


--
-- TOC entry 2470 (class 2606 OID 34999)
-- Name: fk_roster_to_unit; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_unit FOREIGN KEY (id_unit) REFERENCES administrative.unit(id);


--
-- TOC entry 2469 (class 2606 OID 35004)
-- Name: fk_roster_to_unit_service_offered; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_unit_service_offered FOREIGN KEY (id_service_offered) REFERENCES administrative.unit(id);


--
-- TOC entry 2479 (class 2606 OID 35009)
-- Name: fk_shift_to_institution; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY shift
    ADD CONSTRAINT fk_shift_to_institution FOREIGN KEY (id_institution) REFERENCES administrative.institution(id);


--
-- TOC entry 2478 (class 2606 OID 35014)
-- Name: fk_shift_to_item; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY shift
    ADD CONSTRAINT fk_shift_to_item FOREIGN KEY (id_item) REFERENCES item(id);


--
-- TOC entry 2481 (class 2606 OID 35034)
-- Name: fk_specialization_profession; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY specialization
    ADD CONSTRAINT fk_specialization_profession FOREIGN KEY (id_profession) REFERENCES profession(id);


SET search_path = health, pg_catalog;

--
-- TOC entry 2372 (class 2606 OID 34534)
-- Name: fk_anamnesis_to_consultation; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY anamnesis
    ADD CONSTRAINT fk_anamnesis_to_consultation FOREIGN KEY (id_event) REFERENCES general.event(id);


--
-- TOC entry 2383 (class 2606 OID 34549)
-- Name: fk_clinic_history_person; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY clinic_history
    ADD CONSTRAINT fk_clinic_history_person FOREIGN KEY (id_person) REFERENCES general.person(id);


--
-- TOC entry 2384 (class 2606 OID 34554)
-- Name: fk_clinic_history_summary_to_patient; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY clinic_history_summary
    ADD CONSTRAINT fk_clinic_history_summary_to_patient FOREIGN KEY (id_institution, id_person) REFERENCES patient(id_institution, id_person);


--
-- TOC entry 2386 (class 2606 OID 35106)
-- Name: fk_diagnostic_nomenclature; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY diagnostic
    ADD CONSTRAINT fk_diagnostic_nomenclature FOREIGN KEY (id_nomenclature) REFERENCES general.nomenclature_hierarchy(id);


--
-- TOC entry 2387 (class 2606 OID 34559)
-- Name: fk_diagnostic_to_consultation; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY diagnostic
    ADD CONSTRAINT fk_diagnostic_to_consultation FOREIGN KEY (id_event) REFERENCES general.event(id);


--
-- TOC entry 2385 (class 2606 OID 35114)
-- Name: fk_judgement_type; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY diagnostic
    ADD CONSTRAINT fk_judgement_type FOREIGN KEY (id_type) REFERENCES general.item(id);


--
-- TOC entry 2427 (class 2606 OID 34759)
-- Name: fk_medical_center_clinic_history_clinic_history; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY medical_center_clinic_history
    ADD CONSTRAINT fk_medical_center_clinic_history_clinic_history FOREIGN KEY (id_clinic_history) REFERENCES clinic_history(id);


--
-- TOC entry 2426 (class 2606 OID 34764)
-- Name: fk_medical_center_clinic_history_to_medical_center; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY medical_center_clinic_history
    ADD CONSTRAINT fk_medical_center_clinic_history_to_medical_center FOREIGN KEY (id_medical_center) REFERENCES administrative.institution(id);


--
-- TOC entry 2433 (class 2606 OID 34774)
-- Name: fk_patient_registration_to_institution; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT fk_patient_registration_to_institution FOREIGN KEY (id_institution) REFERENCES administrative.institution(id);


--
-- TOC entry 2432 (class 2606 OID 34779)
-- Name: fk_patient_registration_to_person; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT fk_patient_registration_to_person FOREIGN KEY (id_person) REFERENCES general.person(id);


--
-- TOC entry 2454 (class 2606 OID 34864)
-- Name: fk_prescription_to_consultation; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY prescription
    ADD CONSTRAINT fk_prescription_to_consultation FOREIGN KEY (id_event) REFERENCES general.event(id);


--
-- TOC entry 2453 (class 2606 OID 34869)
-- Name: fk_prescription_to_item; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY prescription
    ADD CONSTRAINT fk_prescription_to_item FOREIGN KEY (id_frequency_unit) REFERENCES general.item(id);


--
-- TOC entry 2452 (class 2606 OID 34874)
-- Name: fk_prescription_to_medicine; Type: FK CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY prescription
    ADD CONSTRAINT fk_prescription_to_medicine FOREIGN KEY (id_medicine) REFERENCES medicine(id);


SET search_path = security, pg_catalog;

--
-- TOC entry 2382 (class 2606 OID 34539)
-- Name: fk_authorized_people_to_roster_assistant; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY authorized_people
    ADD CONSTRAINT fk_authorized_people_to_roster_assistant FOREIGN KEY (id_roster_assistant) REFERENCES general.roster(id);


--
-- TOC entry 2381 (class 2606 OID 34544)
-- Name: fk_authorized_people_to_roster_owner; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY authorized_people
    ADD CONSTRAINT fk_authorized_people_to_roster_owner FOREIGN KEY (id_roster_owner) REFERENCES general.roster(id);


--
-- TOC entry 2398 (class 2606 OID 34584)
-- Name: fk_enabled_functionality_to_functionality; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY functionality_by_profile
    ADD CONSTRAINT fk_enabled_functionality_to_functionality FOREIGN KEY (id_functionality) REFERENCES functionality(id);


--
-- TOC entry 2397 (class 2606 OID 34589)
-- Name: fk_enabled_functionality_to_profile; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY functionality_by_profile
    ADD CONSTRAINT fk_enabled_functionality_to_profile FOREIGN KEY (id_profile) REFERENCES profile(id);


--
-- TOC entry 2403 (class 2606 OID 34594)
-- Name: fk_enabled_profile_to_enabled_module; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY enabled_profile
    ADD CONSTRAINT fk_enabled_profile_to_enabled_module FOREIGN KEY (id_enabled_module) REFERENCES enabled_module(id);


--
-- TOC entry 2402 (class 2606 OID 34599)
-- Name: fk_enabled_profile_to_profile; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY enabled_profile
    ADD CONSTRAINT fk_enabled_profile_to_profile FOREIGN KEY (id_profile) REFERENCES profile(id);


--
-- TOC entry 2401 (class 2606 OID 34604)
-- Name: fk_enabled_profile_to_user; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY enabled_profile
    ADD CONSTRAINT fk_enabled_profile_to_user FOREIGN KEY (id_user) REFERENCES "user"(id);


--
-- TOC entry 2487 (class 2606 OID 36444)
-- Name: fk_extra_functionality_to_enabled_module; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY special_functionality_by_user
    ADD CONSTRAINT fk_extra_functionality_to_enabled_module FOREIGN KEY (id_enabled_module) REFERENCES enabled_module(id);


--
-- TOC entry 2488 (class 2606 OID 36449)
-- Name: fk_extra_functionality_to_functionality; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY special_functionality_by_user
    ADD CONSTRAINT fk_extra_functionality_to_functionality FOREIGN KEY (id_functionality) REFERENCES functionality(id);


--
-- TOC entry 2489 (class 2606 OID 36454)
-- Name: fk_extra_functionality_to_user; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY special_functionality_by_user
    ADD CONSTRAINT fk_extra_functionality_to_user FOREIGN KEY (id_user) REFERENCES "user"(id);


--
-- TOC entry 2418 (class 2606 OID 36462)
-- Name: fk_functionality_to_parent; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY functionality
    ADD CONSTRAINT fk_functionality_to_parent FOREIGN KEY (id_parent_functionality) REFERENCES functionality(id);


--
-- TOC entry 2417 (class 2606 OID 34729)
-- Name: fk_functionality_to_software_module; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY functionality
    ADD CONSTRAINT fk_functionality_to_software_module FOREIGN KEY (id_software_module) REFERENCES software_module(id);


--
-- TOC entry 2399 (class 2606 OID 34749)
-- Name: fk_installed_module_id_institution; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY enabled_module
    ADD CONSTRAINT fk_installed_module_id_institution FOREIGN KEY (id_institution) REFERENCES administrative.institution(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2455 (class 2606 OID 34879)
-- Name: fk_profile_to_software_module; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT fk_profile_to_software_module FOREIGN KEY (id_software_module) REFERENCES software_module(id);


--
-- TOC entry 2480 (class 2606 OID 35029)
-- Name: fk_software_module_parent_to_software_module; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY software_module
    ADD CONSTRAINT fk_software_module_parent_to_software_module FOREIGN KEY (id_software_module_parent) REFERENCES software_module(id);


--
-- TOC entry 2400 (class 2606 OID 35089)
-- Name: id_software_module; Type: FK CONSTRAINT; Schema: security; Owner: postgres
--

ALTER TABLE ONLY enabled_module
    ADD CONSTRAINT id_software_module FOREIGN KEY (id_software_module) REFERENCES software_module(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-11-02 09:23:34 PET

--
-- PostgreSQL database dump complete
--

