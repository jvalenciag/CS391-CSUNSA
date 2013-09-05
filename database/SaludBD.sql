--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-09-04 09:47:54 PET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 263 (class 3079 OID 11679)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 263
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 16386)
-- Dependencies: 6
-- Name: activity_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activity_type (
    id integer NOT NULL,
    id_unit integer,
    acronym character varying(4),
    description character varying(64),
    priority integer,
    enabled boolean
);


ALTER TABLE public.activity_type OWNER TO postgres;

--
-- TOC entry 162 (class 1259 OID 16389)
-- Dependencies: 161 6
-- Name: activity_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_type_id_seq OWNER TO postgres;

--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 162
-- Name: activity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activity_type_id_seq OWNED BY activity_type.id;


--
-- TOC entry 163 (class 1259 OID 16391)
-- Dependencies: 6
-- Name: address; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE address (
    id integer NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 164 (class 1259 OID 16394)
-- Dependencies: 163 6
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- TOC entry 2603 (class 0 OID 0)
-- Dependencies: 164
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE address_id_seq OWNED BY address.id;


--
-- TOC entry 165 (class 1259 OID 16396)
-- Dependencies: 2202 6
-- Name: allowed_to_work_at; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE allowed_to_work_at (
    id integer NOT NULL,
    id_person integer NOT NULL,
    id_institution integer NOT NULL,
    id_document integer NOT NULL,
    id_unit integer NOT NULL,
    starting_date date,
    end_date date,
    enabled boolean DEFAULT true
);


ALTER TABLE public.allowed_to_work_at OWNER TO postgres;

--
-- TOC entry 2604 (class 0 OID 0)
-- Dependencies: 165
-- Name: COLUMN allowed_to_work_at.end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN allowed_to_work_at.end_date IS 'TODO: Asignar fecha muy al futuro';


--
-- TOC entry 166 (class 1259 OID 16400)
-- Dependencies: 6 165
-- Name: allowed_to_work_at_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE allowed_to_work_at_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.allowed_to_work_at_id_seq OWNER TO postgres;

--
-- TOC entry 2605 (class 0 OID 0)
-- Dependencies: 166
-- Name: allowed_to_work_at_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE allowed_to_work_at_id_seq OWNED BY allowed_to_work_at.id;


--
-- TOC entry 167 (class 1259 OID 16402)
-- Dependencies: 6
-- Name: anamnesis; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE anamnesis (
    id integer NOT NULL,
    id_encounter_physician_patient integer
);


ALTER TABLE public.anamnesis OWNER TO postgres;

--
-- TOC entry 168 (class 1259 OID 16405)
-- Dependencies: 167 6
-- Name: anamnesis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE anamnesis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anamnesis_id_seq OWNER TO postgres;

--
-- TOC entry 2606 (class 0 OID 0)
-- Dependencies: 168
-- Name: anamnesis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE anamnesis_id_seq OWNED BY anamnesis.id;


--
-- TOC entry 169 (class 1259 OID 16407)
-- Dependencies: 6
-- Name: encounter_physician_patient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE encounter_physician_patient (
    id integer NOT NULL,
    starting_time timestamp without time zone,
    end_time timestamp without time zone,
    id_physician integer NOT NULL,
    id_institution integer NOT NULL,
    id_init_document integer NOT NULL,
    id_person integer NOT NULL,
    id_unit integer NOT NULL,
    id_physical_space_assigned_to_unit integer NOT NULL,
    dd smallint NOT NULL,
    mm smallint NOT NULL,
    yyyy integer NOT NULL,
    id_state integer NOT NULL,
    sequence smallint NOT NULL,
    id_roster integer,
    id_encounter_parent integer,
    id_encounter_reason integer
);


ALTER TABLE public.encounter_physician_patient OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16410)
-- Dependencies: 169 6
-- Name: appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_id_seq OWNER TO postgres;

--
-- TOC entry 2607 (class 0 OID 0)
-- Dependencies: 170
-- Name: appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE appointment_id_seq OWNED BY encounter_physician_patient.id;


--
-- TOC entry 171 (class 1259 OID 16412)
-- Dependencies: 2206 6
-- Name: authorized_people; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authorized_people (
    id integer NOT NULL,
    id_roster_owner integer NOT NULL,
    id_roster_assistant integer NOT NULL,
    ts timestamp without time zone,
    principal boolean DEFAULT false
);


ALTER TABLE public.authorized_people OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16416)
-- Dependencies: 171 6
-- Name: authorized_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE authorized_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authorized_people_id_seq OWNER TO postgres;

--
-- TOC entry 2608 (class 0 OID 0)
-- Dependencies: 172
-- Name: authorized_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE authorized_people_id_seq OWNED BY authorized_people.id;


--
-- TOC entry 173 (class 1259 OID 16418)
-- Dependencies: 6
-- Name: clinic_history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clinic_history (
    id integer NOT NULL,
    id_persona integer
);


ALTER TABLE public.clinic_history OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16421)
-- Dependencies: 173 6
-- Name: clinic_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clinic_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clinic_history_id_seq OWNER TO postgres;

--
-- TOC entry 2609 (class 0 OID 0)
-- Dependencies: 174
-- Name: clinic_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clinic_history_id_seq OWNED BY clinic_history.id;


--
-- TOC entry 175 (class 1259 OID 16423)
-- Dependencies: 6
-- Name: clinic_history_summary; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clinic_history_summary (
    id integer NOT NULL,
    id_institution integer,
    id_person integer
);


ALTER TABLE public.clinic_history_summary OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16426)
-- Dependencies: 175 6
-- Name: clinic_history_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clinic_history_summary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clinic_history_summary_id_seq OWNER TO postgres;

--
-- TOC entry 2610 (class 0 OID 0)
-- Dependencies: 176
-- Name: clinic_history_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clinic_history_summary_id_seq OWNED BY clinic_history_summary.id;


--
-- TOC entry 177 (class 1259 OID 16428)
-- Dependencies: 6
-- Name: diagnostic; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE diagnostic (
    id integer NOT NULL,
    id_encounter_physician_patient integer
);


ALTER TABLE public.diagnostic OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16431)
-- Dependencies: 177 6
-- Name: diagnostic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE diagnostic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diagnostic_id_seq OWNER TO postgres;

--
-- TOC entry 2611 (class 0 OID 0)
-- Dependencies: 178
-- Name: diagnostic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE diagnostic_id_seq OWNED BY diagnostic.id;


--
-- TOC entry 179 (class 1259 OID 16433)
-- Dependencies: 6
-- Name: document; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document (
    id integer NOT NULL,
    id_type integer,
    number character varying(32),
    id_institution integer,
    issued date
);


ALTER TABLE public.document OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16436)
-- Dependencies: 6 179
-- Name: document_id_document_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE document_id_document_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_id_document_seq OWNER TO postgres;

--
-- TOC entry 2612 (class 0 OID 0)
-- Dependencies: 180
-- Name: document_id_document_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE document_id_document_seq OWNED BY document.id;


--
-- TOC entry 181 (class 1259 OID 16438)
-- Dependencies: 2212 6
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee (
    id integer NOT NULL,
    id_person integer NOT NULL,
    id_profession integer,
    id_institution integer NOT NULL,
    starting_date date NOT NULL,
    id_init_document integer NOT NULL,
    id_end_cause integer,
    end_date date,
    id_end_document integer,
    active boolean DEFAULT false,
    id_specialization integer,
    id_position integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 2613 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN employee.id_profession; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN employee.id_profession IS 'profesion por la cual se le contrata';


--
-- TOC entry 182 (class 1259 OID 16442)
-- Dependencies: 6 181
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- TOC entry 2614 (class 0 OID 0)
-- Dependencies: 182
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employee_id_seq OWNED BY employee.id;


--
-- TOC entry 183 (class 1259 OID 16444)
-- Dependencies: 6
-- Name: functionality_by_profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE functionality_by_profile (
    id integer NOT NULL,
    id_functionality integer NOT NULL,
    id_profile integer NOT NULL
);


ALTER TABLE public.functionality_by_profile OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16447)
-- Dependencies: 183 6
-- Name: enabled_functionality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enabled_functionality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enabled_functionality_id_seq OWNER TO postgres;

--
-- TOC entry 2615 (class 0 OID 0)
-- Dependencies: 184
-- Name: enabled_functionality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enabled_functionality_id_seq OWNED BY functionality_by_profile.id;


--
-- TOC entry 185 (class 1259 OID 16449)
-- Dependencies: 6
-- Name: enabled_module; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enabled_module (
    id bigint NOT NULL,
    description character varying(64) NOT NULL,
    id_institution bigint NOT NULL,
    id_software_module bigint NOT NULL,
    validity boolean NOT NULL
);


ALTER TABLE public.enabled_module OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16452)
-- Dependencies: 6
-- Name: enabled_profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enabled_profile (
    id integer NOT NULL,
    id_profile integer NOT NULL,
    id_enabled_module integer NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE public.enabled_profile OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16455)
-- Dependencies: 6 186
-- Name: enabled_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enabled_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enabled_profile_id_seq OWNER TO postgres;

--
-- TOC entry 2616 (class 0 OID 0)
-- Dependencies: 187
-- Name: enabled_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enabled_profile_id_seq OWNED BY enabled_profile.id;


--
-- TOC entry 188 (class 1259 OID 16457)
-- Dependencies: 6
-- Name: exam_result; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exam_result (
    id integer NOT NULL,
    id_exam_template integer,
    id_laboratorian integer,
    date_of_order date,
    id_encounter_physician_patient integer,
    description text
);


ALTER TABLE public.exam_result OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16463)
-- Dependencies: 6 188
-- Name: exam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_id_seq OWNER TO postgres;

--
-- TOC entry 2617 (class 0 OID 0)
-- Dependencies: 189
-- Name: exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exam_id_seq OWNED BY exam_result.id;


--
-- TOC entry 190 (class 1259 OID 16465)
-- Dependencies: 6
-- Name: exam_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exam_order (
    id integer NOT NULL,
    id_encounter_physician_patient integer NOT NULL,
    id_exam_template integer NOT NULL,
    time_of_order timestamp without time zone,
    scheduled_time timestamp without time zone
);


ALTER TABLE public.exam_order OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16468)
-- Dependencies: 190 6
-- Name: exam_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exam_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_order_id_seq OWNER TO postgres;

--
-- TOC entry 2618 (class 0 OID 0)
-- Dependencies: 191
-- Name: exam_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exam_order_id_seq OWNED BY exam_order.id;


--
-- TOC entry 192 (class 1259 OID 16470)
-- Dependencies: 6
-- Name: exam_result_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exam_result_item (
    id integer NOT NULL,
    id_exam_result integer,
    value double precision,
    id_exam_template_item integer,
    date date
);


ALTER TABLE public.exam_result_item OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16473)
-- Dependencies: 6 192
-- Name: exam_result_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exam_result_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_result_item_id_seq OWNER TO postgres;

--
-- TOC entry 2619 (class 0 OID 0)
-- Dependencies: 193
-- Name: exam_result_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exam_result_item_id_seq OWNED BY exam_result_item.id;


--
-- TOC entry 194 (class 1259 OID 16475)
-- Dependencies: 6
-- Name: exam_template; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exam_template (
    id integer NOT NULL,
    name character varying(32),
    id_type_of_exam integer
);


ALTER TABLE public.exam_template OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16478)
-- Dependencies: 6 194
-- Name: exam_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exam_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_template_id_seq OWNER TO postgres;

--
-- TOC entry 2620 (class 0 OID 0)
-- Dependencies: 195
-- Name: exam_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exam_template_id_seq OWNED BY exam_template.id;


--
-- TOC entry 196 (class 1259 OID 16480)
-- Dependencies: 6
-- Name: exam_template_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exam_template_item (
    id integer NOT NULL,
    name character varying(32),
    id_unit integer,
    id_exam_template integer NOT NULL,
    priority smallint,
    id_exam_template_item_parent integer
);


ALTER TABLE public.exam_template_item OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16483)
-- Dependencies: 6 196
-- Name: exam_template_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exam_template_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_template_item_id_seq OWNER TO postgres;

--
-- TOC entry 2621 (class 0 OID 0)
-- Dependencies: 197
-- Name: exam_template_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exam_template_item_id_seq OWNED BY exam_template_item.id;


--
-- TOC entry 198 (class 1259 OID 16485)
-- Dependencies: 6
-- Name: extra_functionality; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE extra_functionality (
    id integer NOT NULL,
    id_functionality integer,
    id_enabled_module integer NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE public.extra_functionality OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16488)
-- Dependencies: 198 6
-- Name: extra_functionality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE extra_functionality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_functionality_id_seq OWNER TO postgres;

--
-- TOC entry 2622 (class 0 OID 0)
-- Dependencies: 199
-- Name: extra_functionality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE extra_functionality_id_seq OWNED BY extra_functionality.id;


--
-- TOC entry 200 (class 1259 OID 16490)
-- Dependencies: 6
-- Name: functionality; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE functionality (
    id integer NOT NULL,
    description character varying(128) NOT NULL,
    id_software_module integer NOT NULL
);


ALTER TABLE public.functionality OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16493)
-- Dependencies: 6 200
-- Name: functionality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE functionality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.functionality_id_seq OWNER TO postgres;

--
-- TOC entry 2623 (class 0 OID 0)
-- Dependencies: 201
-- Name: functionality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE functionality_id_seq OWNED BY functionality.id;


--
-- TOC entry 202 (class 1259 OID 16495)
-- Dependencies: 6
-- Name: group_of_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE group_of_items (
    id integer NOT NULL,
    description character varying(32)
);


ALTER TABLE public.group_of_items OWNER TO postgres;

--
-- TOC entry 2624 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE group_of_items; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE group_of_items IS 'Tipo de Documento
    Oficio
    Resolución
Etnia';


--
-- TOC entry 2625 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN group_of_items.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN group_of_items.description IS 'TODO: it must be fixed length (32)';


--
-- TOC entry 203 (class 1259 OID 16498)
-- Dependencies: 6 202
-- Name: group_of_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_of_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_of_items_id_seq OWNER TO postgres;

--
-- TOC entry 2626 (class 0 OID 0)
-- Dependencies: 203
-- Name: group_of_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE group_of_items_id_seq OWNED BY group_of_items.id;


--
-- TOC entry 204 (class 1259 OID 16500)
-- Dependencies: 6
-- Name: service_schedule; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service_schedule (
    id integer NOT NULL,
    id_slot integer,
    id_unit integer
);


ALTER TABLE public.service_schedule OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16503)
-- Dependencies: 204 6
-- Name: horario_de_atencion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE horario_de_atencion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horario_de_atencion_id_seq OWNER TO postgres;

--
-- TOC entry 2627 (class 0 OID 0)
-- Dependencies: 205
-- Name: horario_de_atencion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE horario_de_atencion_id_seq OWNED BY service_schedule.id;


--
-- TOC entry 206 (class 1259 OID 16505)
-- Dependencies: 6
-- Name: institution; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE institution (
    id integer NOT NULL,
    name character varying(100),
    "RUC" character(11),
    "WebPage" character varying(120)
);


ALTER TABLE public.institution OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16508)
-- Dependencies: 6
-- Name: item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item (
    id integer NOT NULL,
    id_group_of_items integer,
    description character varying(32),
    priority integer,
    id_parent integer
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16511)
-- Dependencies: 207 6
-- Name: item_of_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE item_of_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_of_list_id_seq OWNER TO postgres;

--
-- TOC entry 2628 (class 0 OID 0)
-- Dependencies: 208
-- Name: item_of_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE item_of_list_id_seq OWNED BY item.id;


--
-- TOC entry 209 (class 1259 OID 16513)
-- Dependencies: 2226 6
-- Name: log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE log (
    id bigint NOT NULL,
    id_assigned_profile bigint NOT NULL,
    id_user bigint,
    id_institution bigint NOT NULL,
    functionality character varying NOT NULL,
    date timestamp with time zone NOT NULL,
    source_device character varying(32) NOT NULL,
    version integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.log OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16520)
-- Dependencies: 209 6
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_seq OWNER TO postgres;

--
-- TOC entry 2629 (class 0 OID 0)
-- Dependencies: 210
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE log_id_seq OWNED BY log.id;


--
-- TOC entry 211 (class 1259 OID 16522)
-- Dependencies: 6
-- Name: manager_of_unit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE manager_of_unit (
    id integer NOT NULL,
    date_from date,
    date_to date,
    id_person integer,
    id_unit integer,
    id_institution integer
);


ALTER TABLE public.manager_of_unit OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16525)
-- Dependencies: 6
-- Name: medical_center_clinic_history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medical_center_clinic_history (
    id integer NOT NULL,
    id_medical_center integer,
    id_clinic_history integer,
    registration_date date
);


ALTER TABLE public.medical_center_clinic_history OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16528)
-- Dependencies: 212 6
-- Name: medical_center_clinic_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medical_center_clinic_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_center_clinic_history_id_seq OWNER TO postgres;

--
-- TOC entry 2630 (class 0 OID 0)
-- Dependencies: 213
-- Name: medical_center_clinic_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medical_center_clinic_history_id_seq OWNED BY medical_center_clinic_history.id;


--
-- TOC entry 214 (class 1259 OID 16530)
-- Dependencies: 6
-- Name: medical_nomenclature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medical_nomenclature (
    id integer NOT NULL,
    id_parent integer,
    parent_code character varying(8),
    code character varying(5),
    description character varying(107)
);


ALTER TABLE public.medical_nomenclature OWNER TO postgres;

--
-- TOC entry 2631 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN medical_nomenclature.parent_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN medical_nomenclature.parent_code IS 'i.e. A00';


--
-- TOC entry 2632 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN medical_nomenclature.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN medical_nomenclature.code IS '.65';


--
-- TOC entry 215 (class 1259 OID 16533)
-- Dependencies: 214 6
-- Name: medical_nomenclature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medical_nomenclature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_nomenclature_id_seq OWNER TO postgres;

--
-- TOC entry 2633 (class 0 OID 0)
-- Dependencies: 215
-- Name: medical_nomenclature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medical_nomenclature_id_seq OWNED BY medical_nomenclature.id;


--
-- TOC entry 216 (class 1259 OID 16535)
-- Dependencies: 6
-- Name: medicine; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medicine (
    id integer NOT NULL,
    name character varying(64)
);


ALTER TABLE public.medicine OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16538)
-- Dependencies: 216 6
-- Name: medicine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medicine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicine_id_seq OWNER TO postgres;

--
-- TOC entry 2634 (class 0 OID 0)
-- Dependencies: 217
-- Name: medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medicine_id_seq OWNED BY medicine.id;


--
-- TOC entry 218 (class 1259 OID 16540)
-- Dependencies: 6
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
-- TOC entry 219 (class 1259 OID 16546)
-- Dependencies: 6 218
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
-- TOC entry 2635 (class 0 OID 0)
-- Dependencies: 219
-- Name: next_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE next_step_id_seq OWNED BY next_step.id;


--
-- TOC entry 220 (class 1259 OID 16548)
-- Dependencies: 6
-- Name: operation_time; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.operation_time OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16551)
-- Dependencies: 6
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE patient (
    id integer NOT NULL,
    id_institution integer NOT NULL,
    id_person integer NOT NULL,
    date_of_registration timestamp without time zone
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16554)
-- Dependencies: 6 221
-- Name: patient_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE patient_registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_registration_id_seq OWNER TO postgres;

--
-- TOC entry 2636 (class 0 OID 0)
-- Dependencies: 222
-- Name: patient_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE patient_registration_id_seq OWNED BY patient.id;


--
-- TOC entry 223 (class 1259 OID 16556)
-- Dependencies: 6
-- Name: person; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE person (
    id integer NOT NULL,
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


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 2637 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN person.date_of_birth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN person.date_of_birth IS 'Date of Birth';


--
-- TOC entry 2638 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN person."Id_citizenship"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN person."Id_citizenship" IS 'country';


--
-- TOC entry 2639 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN person.id_legal_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN person.id_legal_address IS 'departamento, provincia, distrito, 
calle, mz, Urb, etc';


--
-- TOC entry 2640 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN person.id_place_of_birth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN person.id_place_of_birth IS 'solo hasta distrito';


--
-- TOC entry 224 (class 1259 OID 16562)
-- Dependencies: 6
-- Name: person_skill; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE person_skill (
    id integer NOT NULL,
    id_person integer,
    id_skill integer
);


ALTER TABLE public.person_skill OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16565)
-- Dependencies: 6 224
-- Name: person_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE person_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_skill_id_seq OWNER TO postgres;

--
-- TOC entry 2641 (class 0 OID 0)
-- Dependencies: 225
-- Name: person_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE person_skill_id_seq OWNED BY person_skill.id;


--
-- TOC entry 226 (class 1259 OID 16567)
-- Dependencies: 223 6
-- Name: persona_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_id_seq OWNER TO postgres;

--
-- TOC entry 2642 (class 0 OID 0)
-- Dependencies: 226
-- Name: persona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_id_seq OWNED BY person.id;


--
-- TOC entry 227 (class 1259 OID 16569)
-- Dependencies: 6
-- Name: physical_space; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE physical_space (
    id integer NOT NULL,
    name character varying(64),
    description character varying,
    id_parent integer,
    id_institution integer
);


ALTER TABLE public.physical_space OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16575)
-- Dependencies: 2237 6
-- Name: physical_space_assigned_to_unit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE physical_space_assigned_to_unit (
    id integer NOT NULL,
    id_physical_space integer,
    id_unit integer,
    starting_date timestamp without time zone,
    end_date timestamp without time zone,
    enabled boolean DEFAULT false
);


ALTER TABLE public.physical_space_assigned_to_unit OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16579)
-- Dependencies: 228 6
-- Name: physical_space_assigned_to_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE physical_space_assigned_to_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physical_space_assigned_to_unit_id_seq OWNER TO postgres;

--
-- TOC entry 2643 (class 0 OID 0)
-- Dependencies: 229
-- Name: physical_space_assigned_to_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE physical_space_assigned_to_unit_id_seq OWNED BY physical_space_assigned_to_unit.id;


--
-- TOC entry 230 (class 1259 OID 16581)
-- Dependencies: 6 227
-- Name: physical_space_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE physical_space_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physical_space_id_seq OWNER TO postgres;

--
-- TOC entry 2644 (class 0 OID 0)
-- Dependencies: 230
-- Name: physical_space_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE physical_space_id_seq OWNED BY physical_space.id;


--
-- TOC entry 231 (class 1259 OID 16583)
-- Dependencies: 6
-- Name: prescription; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE prescription (
    id integer NOT NULL,
    id_encounter_physician_patient integer,
    id_medicine integer,
    amount integer,
    frequency integer,
    id_frequency_unit integer,
    expiration timestamp without time zone NOT NULL
);


ALTER TABLE public.prescription OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16586)
-- Dependencies: 231 6
-- Name: prescription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prescription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescription_id_seq OWNER TO postgres;

--
-- TOC entry 2645 (class 0 OID 0)
-- Dependencies: 232
-- Name: prescription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prescription_id_seq OWNED BY prescription.id;


--
-- TOC entry 233 (class 1259 OID 16588)
-- Dependencies: 6
-- Name: profession; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profession (
    id integer NOT NULL,
    description character varying
);


ALTER TABLE public.profession OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16594)
-- Dependencies: 233 6
-- Name: profession_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profession_id_seq OWNER TO postgres;

--
-- TOC entry 2646 (class 0 OID 0)
-- Dependencies: 234
-- Name: profession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE profession_id_seq OWNED BY profession.id;


--
-- TOC entry 235 (class 1259 OID 16596)
-- Dependencies: 6
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profile (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    id_software_module integer NOT NULL
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16599)
-- Dependencies: 6 235
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_id_seq OWNER TO postgres;

--
-- TOC entry 2647 (class 0 OID 0)
-- Dependencies: 236
-- Name: profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE profile_id_seq OWNED BY profile.id;


--
-- TOC entry 237 (class 1259 OID 16601)
-- Dependencies: 6
-- Name: relationship; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE relationship (
    id integer NOT NULL,
    id_relationship_type integer,
    id_person_related_from integer,
    id_person_related_to integer
);


ALTER TABLE public.relationship OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16604)
-- Dependencies: 6
-- Name: relationship_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE relationship_type (
    id integer NOT NULL,
    description character varying
);


ALTER TABLE public.relationship_type OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16610)
-- Dependencies: 238 6
-- Name: relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE relationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationship_id_seq OWNER TO postgres;

--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 239
-- Name: relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE relationship_id_seq OWNED BY relationship_type.id;


--
-- TOC entry 240 (class 1259 OID 16612)
-- Dependencies: 237 6
-- Name: relationship_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE relationship_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationship_id_seq1 OWNER TO postgres;

--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 240
-- Name: relationship_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE relationship_id_seq1 OWNED BY relationship.id;


--
-- TOC entry 241 (class 1259 OID 16614)
-- Dependencies: 6
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource (
    id integer NOT NULL,
    id_sbn integer,
    id_sequential_number integer,
    features character varying
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16620)
-- Dependencies: 2245 6
-- Name: resource_belongs_to_institution; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.resource_belongs_to_institution OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16624)
-- Dependencies: 6 242
-- Name: resource_belongs_to_institution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_belongs_to_institution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_belongs_to_institution_id_seq OWNER TO postgres;

--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 243
-- Name: resource_belongs_to_institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resource_belongs_to_institution_id_seq OWNED BY resource_belongs_to_institution.id;


--
-- TOC entry 244 (class 1259 OID 16626)
-- Dependencies: 6
-- Name: resource_belongs_to_unit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.resource_belongs_to_unit OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16629)
-- Dependencies: 6 244
-- Name: resource_belongs_to_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_belongs_to_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_belongs_to_unit_id_seq OWNER TO postgres;

--
-- TOC entry 2651 (class 0 OID 0)
-- Dependencies: 245
-- Name: resource_belongs_to_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resource_belongs_to_unit_id_seq OWNED BY resource_belongs_to_unit.id;


--
-- TOC entry 246 (class 1259 OID 16631)
-- Dependencies: 6 241
-- Name: resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_id_seq OWNER TO postgres;

--
-- TOC entry 2652 (class 0 OID 0)
-- Dependencies: 246
-- Name: resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resource_id_seq OWNED BY resource.id;


--
-- TOC entry 247 (class 1259 OID 16633)
-- Dependencies: 6
-- Name: roster; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roster (
    id integer NOT NULL,
    id_person integer,
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


ALTER TABLE public.roster OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16636)
-- Dependencies: 6 247
-- Name: roster_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roster_id_seq OWNER TO postgres;

--
-- TOC entry 2653 (class 0 OID 0)
-- Dependencies: 248
-- Name: roster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roster_id_seq OWNED BY roster.id;


--
-- TOC entry 249 (class 1259 OID 16638)
-- Dependencies: 2249 6
-- Name: shift; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shift (
    id integer NOT NULL,
    id_institution integer,
    id_item integer,
    starting_time timestamp without time zone,
    end_time timestamp without time zone,
    enabled boolean DEFAULT false
);


ALTER TABLE public.shift OWNER TO postgres;

--
-- TOC entry 2654 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE shift; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE shift IS 'turnos disponibles';


--
-- TOC entry 250 (class 1259 OID 16642)
-- Dependencies: 249 6
-- Name: shift_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shift_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shift_id_seq OWNER TO postgres;

--
-- TOC entry 2655 (class 0 OID 0)
-- Dependencies: 250
-- Name: shift_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shift_id_seq OWNED BY shift.id;


--
-- TOC entry 251 (class 1259 OID 16644)
-- Dependencies: 220 6
-- Name: slot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE slot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slot_id_seq OWNER TO postgres;

--
-- TOC entry 2656 (class 0 OID 0)
-- Dependencies: 251
-- Name: slot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE slot_id_seq OWNED BY operation_time.id;


--
-- TOC entry 252 (class 1259 OID 16646)
-- Dependencies: 2251 6
-- Name: software_module; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.software_module OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16650)
-- Dependencies: 252 6
-- Name: software_module_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE software_module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.software_module_id_seq OWNER TO postgres;

--
-- TOC entry 2657 (class 0 OID 0)
-- Dependencies: 253
-- Name: software_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE software_module_id_seq OWNED BY software_module.id;


--
-- TOC entry 254 (class 1259 OID 16652)
-- Dependencies: 6
-- Name: specialization; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE specialization (
    id integer NOT NULL,
    description character varying,
    id_profession integer
);


ALTER TABLE public.specialization OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16658)
-- Dependencies: 254 6
-- Name: specialization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE specialization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialization_id_seq OWNER TO postgres;

--
-- TOC entry 2658 (class 0 OID 0)
-- Dependencies: 255
-- Name: specialization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE specialization_id_seq OWNED BY specialization.id;


--
-- TOC entry 256 (class 1259 OID 16660)
-- Dependencies: 6
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE supplier (
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 16663)
-- Dependencies: 6
-- Name: unit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unit (
    id integer NOT NULL,
    name character varying(50),
    unit_type integer,
    id_unit_belong_to integer,
    id_institution integer
);


ALTER TABLE public.unit OWNER TO postgres;

--
-- TOC entry 2659 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN unit.unit_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN unit.unit_type IS 'Adminsitrativo, Asistencial, ...';


--
-- TOC entry 258 (class 1259 OID 16666)
-- Dependencies: 257 6
-- Name: unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_id_seq OWNER TO postgres;

--
-- TOC entry 2660 (class 0 OID 0)
-- Dependencies: 258
-- Name: unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unit_id_seq OWNED BY unit.id;


--
-- TOC entry 259 (class 1259 OID 16668)
-- Dependencies: 6
-- Name: unit_skill; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unit_skill (
    id integer NOT NULL,
    id_unit integer,
    id_skill integer
);


ALTER TABLE public.unit_skill OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 16671)
-- Dependencies: 259 6
-- Name: unit_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unit_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_skill_id_seq OWNER TO postgres;

--
-- TOC entry 2661 (class 0 OID 0)
-- Dependencies: 260
-- Name: unit_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unit_skill_id_seq OWNED BY unit_skill.id;


--
-- TOC entry 261 (class 1259 OID 16673)
-- Dependencies: 2256 2257 6
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 16681)
-- Dependencies: 261 6
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 2662 (class 0 OID 0)
-- Dependencies: 262
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 2200 (class 2604 OID 16683)
-- Dependencies: 162 161
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_type ALTER COLUMN id SET DEFAULT nextval('activity_type_id_seq'::regclass);


--
-- TOC entry 2201 (class 2604 OID 16684)
-- Dependencies: 164 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- TOC entry 2203 (class 2604 OID 16685)
-- Dependencies: 166 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at ALTER COLUMN id SET DEFAULT nextval('allowed_to_work_at_id_seq'::regclass);


--
-- TOC entry 2204 (class 2604 OID 16686)
-- Dependencies: 168 167
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anamnesis ALTER COLUMN id SET DEFAULT nextval('anamnesis_id_seq'::regclass);


--
-- TOC entry 2207 (class 2604 OID 16687)
-- Dependencies: 172 171
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authorized_people ALTER COLUMN id SET DEFAULT nextval('authorized_people_id_seq'::regclass);


--
-- TOC entry 2208 (class 2604 OID 16688)
-- Dependencies: 174 173
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clinic_history ALTER COLUMN id SET DEFAULT nextval('clinic_history_id_seq'::regclass);


--
-- TOC entry 2209 (class 2604 OID 16689)
-- Dependencies: 176 175
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clinic_history_summary ALTER COLUMN id SET DEFAULT nextval('clinic_history_summary_id_seq'::regclass);


--
-- TOC entry 2210 (class 2604 OID 16690)
-- Dependencies: 178 177
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY diagnostic ALTER COLUMN id SET DEFAULT nextval('diagnostic_id_seq'::regclass);


--
-- TOC entry 2211 (class 2604 OID 16691)
-- Dependencies: 180 179
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document ALTER COLUMN id SET DEFAULT nextval('document_id_document_seq'::regclass);


--
-- TOC entry 2213 (class 2604 OID 16692)
-- Dependencies: 182 181
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee ALTER COLUMN id SET DEFAULT nextval('employee_id_seq'::regclass);


--
-- TOC entry 2215 (class 2604 OID 16693)
-- Dependencies: 187 186
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enabled_profile ALTER COLUMN id SET DEFAULT nextval('enabled_profile_id_seq'::regclass);


--
-- TOC entry 2205 (class 2604 OID 16694)
-- Dependencies: 170 169
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY encounter_physician_patient ALTER COLUMN id SET DEFAULT nextval('appointment_id_seq'::regclass);


--
-- TOC entry 2217 (class 2604 OID 16695)
-- Dependencies: 191 190
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_order ALTER COLUMN id SET DEFAULT nextval('exam_order_id_seq'::regclass);


--
-- TOC entry 2216 (class 2604 OID 16696)
-- Dependencies: 189 188
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_result ALTER COLUMN id SET DEFAULT nextval('exam_id_seq'::regclass);


--
-- TOC entry 2218 (class 2604 OID 16697)
-- Dependencies: 193 192
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_result_item ALTER COLUMN id SET DEFAULT nextval('exam_result_item_id_seq'::regclass);


--
-- TOC entry 2219 (class 2604 OID 16698)
-- Dependencies: 195 194
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_template ALTER COLUMN id SET DEFAULT nextval('exam_template_id_seq'::regclass);


--
-- TOC entry 2220 (class 2604 OID 16699)
-- Dependencies: 197 196
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_template_item ALTER COLUMN id SET DEFAULT nextval('exam_template_item_id_seq'::regclass);


--
-- TOC entry 2221 (class 2604 OID 16700)
-- Dependencies: 199 198
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY extra_functionality ALTER COLUMN id SET DEFAULT nextval('extra_functionality_id_seq'::regclass);


--
-- TOC entry 2222 (class 2604 OID 16701)
-- Dependencies: 201 200
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY functionality ALTER COLUMN id SET DEFAULT nextval('functionality_id_seq'::regclass);


--
-- TOC entry 2214 (class 2604 OID 16702)
-- Dependencies: 184 183
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY functionality_by_profile ALTER COLUMN id SET DEFAULT nextval('enabled_functionality_id_seq'::regclass);


--
-- TOC entry 2223 (class 2604 OID 16703)
-- Dependencies: 203 202
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_of_items ALTER COLUMN id SET DEFAULT nextval('group_of_items_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 16704)
-- Dependencies: 208 207
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item ALTER COLUMN id SET DEFAULT nextval('item_of_list_id_seq'::regclass);


--
-- TOC entry 2227 (class 2604 OID 16705)
-- Dependencies: 210 209
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log ALTER COLUMN id SET DEFAULT nextval('log_id_seq'::regclass);


--
-- TOC entry 2228 (class 2604 OID 16706)
-- Dependencies: 213 212
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medical_center_clinic_history ALTER COLUMN id SET DEFAULT nextval('medical_center_clinic_history_id_seq'::regclass);


--
-- TOC entry 2229 (class 2604 OID 16707)
-- Dependencies: 215 214
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medical_nomenclature ALTER COLUMN id SET DEFAULT nextval('medical_nomenclature_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 16708)
-- Dependencies: 217 216
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicine ALTER COLUMN id SET DEFAULT nextval('medicine_id_seq'::regclass);


--
-- TOC entry 2231 (class 2604 OID 16709)
-- Dependencies: 219 218
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY next_step ALTER COLUMN id SET DEFAULT nextval('next_step_id_seq'::regclass);


--
-- TOC entry 2232 (class 2604 OID 16710)
-- Dependencies: 251 220
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operation_time ALTER COLUMN id SET DEFAULT nextval('slot_id_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 16711)
-- Dependencies: 222 221
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient ALTER COLUMN id SET DEFAULT nextval('patient_registration_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 16712)
-- Dependencies: 226 223
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('persona_id_seq'::regclass);


--
-- TOC entry 2235 (class 2604 OID 16713)
-- Dependencies: 225 224
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_skill ALTER COLUMN id SET DEFAULT nextval('person_skill_id_seq'::regclass);


--
-- TOC entry 2236 (class 2604 OID 16714)
-- Dependencies: 230 227
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY physical_space ALTER COLUMN id SET DEFAULT nextval('physical_space_id_seq'::regclass);


--
-- TOC entry 2238 (class 2604 OID 16715)
-- Dependencies: 229 228
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY physical_space_assigned_to_unit ALTER COLUMN id SET DEFAULT nextval('physical_space_assigned_to_unit_id_seq'::regclass);


--
-- TOC entry 2239 (class 2604 OID 16716)
-- Dependencies: 232 231
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prescription ALTER COLUMN id SET DEFAULT nextval('prescription_id_seq'::regclass);


--
-- TOC entry 2240 (class 2604 OID 16717)
-- Dependencies: 234 233
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profession ALTER COLUMN id SET DEFAULT nextval('profession_id_seq'::regclass);


--
-- TOC entry 2241 (class 2604 OID 16718)
-- Dependencies: 236 235
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profile ALTER COLUMN id SET DEFAULT nextval('profile_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 16719)
-- Dependencies: 240 237
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relationship ALTER COLUMN id SET DEFAULT nextval('relationship_id_seq1'::regclass);


--
-- TOC entry 2243 (class 2604 OID 16720)
-- Dependencies: 239 238
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relationship_type ALTER COLUMN id SET DEFAULT nextval('relationship_id_seq'::regclass);


--
-- TOC entry 2244 (class 2604 OID 16721)
-- Dependencies: 246 241
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource ALTER COLUMN id SET DEFAULT nextval('resource_id_seq'::regclass);


--
-- TOC entry 2246 (class 2604 OID 16722)
-- Dependencies: 243 242
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution ALTER COLUMN id SET DEFAULT nextval('resource_belongs_to_institution_id_seq'::regclass);


--
-- TOC entry 2247 (class 2604 OID 16723)
-- Dependencies: 245 244
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit ALTER COLUMN id SET DEFAULT nextval('resource_belongs_to_unit_id_seq'::regclass);


--
-- TOC entry 2248 (class 2604 OID 16724)
-- Dependencies: 248 247
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster ALTER COLUMN id SET DEFAULT nextval('roster_id_seq'::regclass);


--
-- TOC entry 2224 (class 2604 OID 16725)
-- Dependencies: 205 204
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_schedule ALTER COLUMN id SET DEFAULT nextval('horario_de_atencion_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 16726)
-- Dependencies: 250 249
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shift ALTER COLUMN id SET DEFAULT nextval('shift_id_seq'::regclass);


--
-- TOC entry 2252 (class 2604 OID 16727)
-- Dependencies: 253 252
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY software_module ALTER COLUMN id SET DEFAULT nextval('software_module_id_seq'::regclass);


--
-- TOC entry 2253 (class 2604 OID 16728)
-- Dependencies: 255 254
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialization ALTER COLUMN id SET DEFAULT nextval('specialization_id_seq'::regclass);


--
-- TOC entry 2254 (class 2604 OID 16729)
-- Dependencies: 258 257
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unit ALTER COLUMN id SET DEFAULT nextval('unit_id_seq'::regclass);


--
-- TOC entry 2255 (class 2604 OID 16730)
-- Dependencies: 260 259
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unit_skill ALTER COLUMN id SET DEFAULT nextval('unit_skill_id_seq'::regclass);


--
-- TOC entry 2258 (class 2604 OID 16731)
-- Dependencies: 262 261
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2492 (class 0 OID 16386)
-- Dependencies: 161 2594
-- Data for Name: activity_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2663 (class 0 OID 0)
-- Dependencies: 162
-- Name: activity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activity_type_id_seq', 1, false);


--
-- TOC entry 2494 (class 0 OID 16391)
-- Dependencies: 163 2594
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2664 (class 0 OID 0)
-- Dependencies: 164
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('address_id_seq', 1, false);


--
-- TOC entry 2496 (class 0 OID 16396)
-- Dependencies: 165 2594
-- Data for Name: allowed_to_work_at; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2665 (class 0 OID 0)
-- Dependencies: 166
-- Name: allowed_to_work_at_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('allowed_to_work_at_id_seq', 1, false);


--
-- TOC entry 2498 (class 0 OID 16402)
-- Dependencies: 167 2594
-- Data for Name: anamnesis; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2666 (class 0 OID 0)
-- Dependencies: 168
-- Name: anamnesis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('anamnesis_id_seq', 1, false);


--
-- TOC entry 2667 (class 0 OID 0)
-- Dependencies: 170
-- Name: appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('appointment_id_seq', 1, false);


--
-- TOC entry 2502 (class 0 OID 16412)
-- Dependencies: 171 2594
-- Data for Name: authorized_people; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2668 (class 0 OID 0)
-- Dependencies: 172
-- Name: authorized_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('authorized_people_id_seq', 1, false);


--
-- TOC entry 2504 (class 0 OID 16418)
-- Dependencies: 173 2594
-- Data for Name: clinic_history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2669 (class 0 OID 0)
-- Dependencies: 174
-- Name: clinic_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clinic_history_id_seq', 1, false);


--
-- TOC entry 2506 (class 0 OID 16423)
-- Dependencies: 175 2594
-- Data for Name: clinic_history_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2670 (class 0 OID 0)
-- Dependencies: 176
-- Name: clinic_history_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clinic_history_summary_id_seq', 1, false);


--
-- TOC entry 2508 (class 0 OID 16428)
-- Dependencies: 177 2594
-- Data for Name: diagnostic; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2671 (class 0 OID 0)
-- Dependencies: 178
-- Name: diagnostic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('diagnostic_id_seq', 1, false);


--
-- TOC entry 2510 (class 0 OID 16433)
-- Dependencies: 179 2594
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2672 (class 0 OID 0)
-- Dependencies: 180
-- Name: document_id_document_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('document_id_document_seq', 1, false);


--
-- TOC entry 2512 (class 0 OID 16438)
-- Dependencies: 181 2594
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2673 (class 0 OID 0)
-- Dependencies: 182
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employee_id_seq', 1, false);


--
-- TOC entry 2674 (class 0 OID 0)
-- Dependencies: 184
-- Name: enabled_functionality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enabled_functionality_id_seq', 1, false);


--
-- TOC entry 2516 (class 0 OID 16449)
-- Dependencies: 185 2594
-- Data for Name: enabled_module; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2517 (class 0 OID 16452)
-- Dependencies: 186 2594
-- Data for Name: enabled_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2675 (class 0 OID 0)
-- Dependencies: 187
-- Name: enabled_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enabled_profile_id_seq', 1, false);


--
-- TOC entry 2500 (class 0 OID 16407)
-- Dependencies: 169 2594
-- Data for Name: encounter_physician_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2676 (class 0 OID 0)
-- Dependencies: 189
-- Name: exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('exam_id_seq', 1, false);


--
-- TOC entry 2521 (class 0 OID 16465)
-- Dependencies: 190 2594
-- Data for Name: exam_order; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2677 (class 0 OID 0)
-- Dependencies: 191
-- Name: exam_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('exam_order_id_seq', 1, false);


--
-- TOC entry 2519 (class 0 OID 16457)
-- Dependencies: 188 2594
-- Data for Name: exam_result; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2523 (class 0 OID 16470)
-- Dependencies: 192 2594
-- Data for Name: exam_result_item; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2678 (class 0 OID 0)
-- Dependencies: 193
-- Name: exam_result_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('exam_result_item_id_seq', 1, false);


--
-- TOC entry 2525 (class 0 OID 16475)
-- Dependencies: 194 2594
-- Data for Name: exam_template; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2679 (class 0 OID 0)
-- Dependencies: 195
-- Name: exam_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('exam_template_id_seq', 1, false);


--
-- TOC entry 2527 (class 0 OID 16480)
-- Dependencies: 196 2594
-- Data for Name: exam_template_item; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 197
-- Name: exam_template_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('exam_template_item_id_seq', 1, false);


--
-- TOC entry 2529 (class 0 OID 16485)
-- Dependencies: 198 2594
-- Data for Name: extra_functionality; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 199
-- Name: extra_functionality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('extra_functionality_id_seq', 1, false);


--
-- TOC entry 2531 (class 0 OID 16490)
-- Dependencies: 200 2594
-- Data for Name: functionality; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2514 (class 0 OID 16444)
-- Dependencies: 183 2594
-- Data for Name: functionality_by_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 201
-- Name: functionality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('functionality_id_seq', 1, false);


--
-- TOC entry 2533 (class 0 OID 16495)
-- Dependencies: 202 2594
-- Data for Name: group_of_items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2683 (class 0 OID 0)
-- Dependencies: 203
-- Name: group_of_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_of_items_id_seq', 1, false);


--
-- TOC entry 2684 (class 0 OID 0)
-- Dependencies: 205
-- Name: horario_de_atencion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('horario_de_atencion_id_seq', 1, false);


--
-- TOC entry 2537 (class 0 OID 16505)
-- Dependencies: 206 2594
-- Data for Name: institution; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2538 (class 0 OID 16508)
-- Dependencies: 207 2594
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 208
-- Name: item_of_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('item_of_list_id_seq', 1, false);


--
-- TOC entry 2540 (class 0 OID 16513)
-- Dependencies: 209 2594
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 210
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('log_id_seq', 1, false);


--
-- TOC entry 2542 (class 0 OID 16522)
-- Dependencies: 211 2594
-- Data for Name: manager_of_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2543 (class 0 OID 16525)
-- Dependencies: 212 2594
-- Data for Name: medical_center_clinic_history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 213
-- Name: medical_center_clinic_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medical_center_clinic_history_id_seq', 1, false);


--
-- TOC entry 2545 (class 0 OID 16530)
-- Dependencies: 214 2594
-- Data for Name: medical_nomenclature; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 215
-- Name: medical_nomenclature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medical_nomenclature_id_seq', 1, false);


--
-- TOC entry 2547 (class 0 OID 16535)
-- Dependencies: 216 2594
-- Data for Name: medicine; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 217
-- Name: medicine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medicine_id_seq', 1, false);


--
-- TOC entry 2549 (class 0 OID 16540)
-- Dependencies: 218 2594
-- Data for Name: next_step; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO next_step (id, prescription, ts, status) VALUES (1, 'crear pk, fk, indexes en encounter', NULL, 'done');
INSERT INTO next_step (id, prescription, ts, status) VALUES (2, 'eliminar ticket', NULL, 'done');
INSERT INTO next_step (id, prescription, ts, status) VALUES (3, 'vincular encounter_physician_patient al roster', NULL, 'done');


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 219
-- Name: next_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('next_step_id_seq', 3, true);


--
-- TOC entry 2551 (class 0 OID 16548)
-- Dependencies: 220 2594
-- Data for Name: operation_time; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2552 (class 0 OID 16551)
-- Dependencies: 221 2594
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 222
-- Name: patient_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('patient_registration_id_seq', 1, false);


--
-- TOC entry 2554 (class 0 OID 16556)
-- Dependencies: 223 2594
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2555 (class 0 OID 16562)
-- Dependencies: 224 2594
-- Data for Name: person_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 225
-- Name: person_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('person_skill_id_seq', 1, false);


--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 226
-- Name: persona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_id_seq', 1, false);


--
-- TOC entry 2558 (class 0 OID 16569)
-- Dependencies: 227 2594
-- Data for Name: physical_space; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2559 (class 0 OID 16575)
-- Dependencies: 228 2594
-- Data for Name: physical_space_assigned_to_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 229
-- Name: physical_space_assigned_to_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('physical_space_assigned_to_unit_id_seq', 1, false);


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 230
-- Name: physical_space_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('physical_space_id_seq', 1, false);


--
-- TOC entry 2562 (class 0 OID 16583)
-- Dependencies: 231 2594
-- Data for Name: prescription; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 232
-- Name: prescription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prescription_id_seq', 1, false);


--
-- TOC entry 2564 (class 0 OID 16588)
-- Dependencies: 233 2594
-- Data for Name: profession; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 234
-- Name: profession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profession_id_seq', 1, false);


--
-- TOC entry 2566 (class 0 OID 16596)
-- Dependencies: 235 2594
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 236
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profile_id_seq', 1, false);


--
-- TOC entry 2568 (class 0 OID 16601)
-- Dependencies: 237 2594
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2699 (class 0 OID 0)
-- Dependencies: 239
-- Name: relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('relationship_id_seq', 1, false);


--
-- TOC entry 2700 (class 0 OID 0)
-- Dependencies: 240
-- Name: relationship_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('relationship_id_seq1', 1, false);


--
-- TOC entry 2569 (class 0 OID 16604)
-- Dependencies: 238 2594
-- Data for Name: relationship_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2572 (class 0 OID 16614)
-- Dependencies: 241 2594
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2573 (class 0 OID 16620)
-- Dependencies: 242 2594
-- Data for Name: resource_belongs_to_institution; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2701 (class 0 OID 0)
-- Dependencies: 243
-- Name: resource_belongs_to_institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_belongs_to_institution_id_seq', 1, false);


--
-- TOC entry 2575 (class 0 OID 16626)
-- Dependencies: 244 2594
-- Data for Name: resource_belongs_to_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2702 (class 0 OID 0)
-- Dependencies: 245
-- Name: resource_belongs_to_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_belongs_to_unit_id_seq', 1, false);


--
-- TOC entry 2703 (class 0 OID 0)
-- Dependencies: 246
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_id_seq', 1, false);


--
-- TOC entry 2578 (class 0 OID 16633)
-- Dependencies: 247 2594
-- Data for Name: roster; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2704 (class 0 OID 0)
-- Dependencies: 248
-- Name: roster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roster_id_seq', 1, false);


--
-- TOC entry 2535 (class 0 OID 16500)
-- Dependencies: 204 2594
-- Data for Name: service_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2580 (class 0 OID 16638)
-- Dependencies: 249 2594
-- Data for Name: shift; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 250
-- Name: shift_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shift_id_seq', 1, false);


--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 251
-- Name: slot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('slot_id_seq', 1, false);


--
-- TOC entry 2583 (class 0 OID 16646)
-- Dependencies: 252 2594
-- Data for Name: software_module; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 253
-- Name: software_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('software_module_id_seq', 1, false);


--
-- TOC entry 2585 (class 0 OID 16652)
-- Dependencies: 254 2594
-- Data for Name: specialization; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 255
-- Name: specialization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('specialization_id_seq', 1, false);


--
-- TOC entry 2587 (class 0 OID 16660)
-- Dependencies: 256 2594
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2588 (class 0 OID 16663)
-- Dependencies: 257 2594
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 258
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unit_id_seq', 1, false);


--
-- TOC entry 2590 (class 0 OID 16668)
-- Dependencies: 259 2594
-- Data for Name: unit_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2710 (class 0 OID 0)
-- Dependencies: 260
-- Name: unit_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unit_skill_id_seq', 1, false);


--
-- TOC entry 2592 (class 0 OID 16673)
-- Dependencies: 261 2594
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2711 (class 0 OID 0)
-- Dependencies: 262
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 1, false);


--
-- TOC entry 2266 (class 2606 OID 16733)
-- Dependencies: 167 167 2595
-- Name: anamnesis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY anamnesis
    ADD CONSTRAINT anamnesis_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 16735)
-- Dependencies: 177 177 2595
-- Name: diagnostic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY diagnostic
    ADD CONSTRAINT diagnostic_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 16737)
-- Dependencies: 190 190 2595
-- Name: exam_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exam_order
    ADD CONSTRAINT exam_order_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 16739)
-- Dependencies: 186 186 2595
-- Name: id_enabled_profile; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enabled_profile
    ADD CONSTRAINT id_enabled_profile PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 16741)
-- Dependencies: 161 161 2595
-- Name: pk_activity_type; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activity_type
    ADD CONSTRAINT pk_activity_type PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 16743)
-- Dependencies: 163 163 2595
-- Name: pk_address; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT pk_address PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 16745)
-- Dependencies: 165 165 165 165 165 2595
-- Name: pk_allowed_to_work_at; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT pk_allowed_to_work_at PRIMARY KEY (id_person, id_institution, id_document, id_unit);


--
-- TOC entry 2274 (class 2606 OID 16747)
-- Dependencies: 171 171 171 2595
-- Name: pk_authorized_people; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authorized_people
    ADD CONSTRAINT pk_authorized_people PRIMARY KEY (id_roster_owner, id_roster_assistant);


--
-- TOC entry 2276 (class 2606 OID 16749)
-- Dependencies: 173 173 2595
-- Name: pk_clinic_history; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clinic_history
    ADD CONSTRAINT pk_clinic_history PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 16751)
-- Dependencies: 175 175 2595
-- Name: pk_clinic_history_summary; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clinic_history_summary
    ADD CONSTRAINT pk_clinic_history_summary PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 16753)
-- Dependencies: 179 179 2595
-- Name: pk_document; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document
    ADD CONSTRAINT pk_document PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 16755)
-- Dependencies: 181 181 181 181 2595
-- Name: pk_employee; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (id_person, id_institution, id_init_document);


--
-- TOC entry 2271 (class 2606 OID 16757)
-- Dependencies: 169 169 2595
-- Name: pk_encounter_physician_patient; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY encounter_physician_patient
    ADD CONSTRAINT pk_encounter_physician_patient PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 16759)
-- Dependencies: 188 188 2595
-- Name: pk_exam_result; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exam_result
    ADD CONSTRAINT pk_exam_result PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 16761)
-- Dependencies: 192 192 2595
-- Name: pk_exam_result_item; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exam_result_item
    ADD CONSTRAINT pk_exam_result_item PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 16763)
-- Dependencies: 194 194 2595
-- Name: pk_exam_template; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exam_template
    ADD CONSTRAINT pk_exam_template PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 16765)
-- Dependencies: 196 196 2595
-- Name: pk_exam_template_item; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exam_template_item
    ADD CONSTRAINT pk_exam_template_item PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 16767)
-- Dependencies: 202 202 2595
-- Name: pk_group_of_items; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_of_items
    ADD CONSTRAINT pk_group_of_items PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 16769)
-- Dependencies: 204 204 2595
-- Name: pk_horario_de_atencion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_schedule
    ADD CONSTRAINT pk_horario_de_atencion PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 16771)
-- Dependencies: 183 183 2595
-- Name: pk_id_enabled_functionality; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY functionality_by_profile
    ADD CONSTRAINT pk_id_enabled_functionality PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 16773)
-- Dependencies: 198 198 2595
-- Name: pk_id_extra_functionality; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY extra_functionality
    ADD CONSTRAINT pk_id_extra_functionality PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 16775)
-- Dependencies: 200 200 2595
-- Name: pk_id_functionality; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY functionality
    ADD CONSTRAINT pk_id_functionality PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 16777)
-- Dependencies: 235 235 2595
-- Name: pk_id_profile; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT pk_id_profile PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 16779)
-- Dependencies: 185 185 2595
-- Name: pk_installed_module; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enabled_module
    ADD CONSTRAINT pk_installed_module PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 16781)
-- Dependencies: 206 206 2595
-- Name: pk_institution; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY institution
    ADD CONSTRAINT pk_institution PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 16783)
-- Dependencies: 207 207 2595
-- Name: pk_item_of_list; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT pk_item_of_list PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 16785)
-- Dependencies: 209 209 2595
-- Name: pk_log; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY log
    ADD CONSTRAINT pk_log PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 16787)
-- Dependencies: 212 212 2595
-- Name: pk_medical_center_clinic_history; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medical_center_clinic_history
    ADD CONSTRAINT pk_medical_center_clinic_history PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 16789)
-- Dependencies: 214 214 2595
-- Name: pk_medical_nomenclature; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medical_nomenclature
    ADD CONSTRAINT pk_medical_nomenclature PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 16791)
-- Dependencies: 216 216 2595
-- Name: pk_medicine; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medicine
    ADD CONSTRAINT pk_medicine PRIMARY KEY (id);


--
-- TOC entry 2333 (class 2606 OID 16793)
-- Dependencies: 218 218 2595
-- Name: pk_next_step; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY next_step
    ADD CONSTRAINT pk_next_step PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 16795)
-- Dependencies: 221 221 221 2595
-- Name: pk_patient_registration; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT pk_patient_registration PRIMARY KEY (id_institution, id_person);


--
-- TOC entry 2339 (class 2606 OID 16797)
-- Dependencies: 223 223 2595
-- Name: pk_person; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT pk_person PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 16799)
-- Dependencies: 224 224 2595
-- Name: pk_person_skill; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY person_skill
    ADD CONSTRAINT pk_person_skill PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 16801)
-- Dependencies: 227 227 2595
-- Name: pk_physical_space; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY physical_space
    ADD CONSTRAINT pk_physical_space PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 16803)
-- Dependencies: 228 228 2595
-- Name: pk_physical_space_assigned_to_unit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY physical_space_assigned_to_unit
    ADD CONSTRAINT pk_physical_space_assigned_to_unit PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 16805)
-- Dependencies: 233 233 2595
-- Name: pk_profession; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profession
    ADD CONSTRAINT pk_profession PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 16807)
-- Dependencies: 238 238 2595
-- Name: pk_relationship; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY relationship_type
    ADD CONSTRAINT pk_relationship PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 16809)
-- Dependencies: 241 241 2595
-- Name: pk_resource; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT pk_resource PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 16811)
-- Dependencies: 242 242 2595
-- Name: pk_resource_belongs_to; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT pk_resource_belongs_to PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 16813)
-- Dependencies: 244 244 2595
-- Name: pk_resource_belongs_to_unit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT pk_resource_belongs_to_unit PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 16815)
-- Dependencies: 211 211 2595
-- Name: pk_role; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY manager_of_unit
    ADD CONSTRAINT pk_role PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 16817)
-- Dependencies: 247 247 2595
-- Name: pk_roster; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT pk_roster PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 16819)
-- Dependencies: 249 249 2595
-- Name: pk_shift; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shift
    ADD CONSTRAINT pk_shift PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 16821)
-- Dependencies: 220 220 2595
-- Name: pk_slot; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operation_time
    ADD CONSTRAINT pk_slot PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 16823)
-- Dependencies: 252 252 2595
-- Name: pk_software_module; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY software_module
    ADD CONSTRAINT pk_software_module PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 16825)
-- Dependencies: 254 254 2595
-- Name: pk_specialization; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY specialization
    ADD CONSTRAINT pk_specialization PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 16827)
-- Dependencies: 257 257 2595
-- Name: pk_unit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT pk_unit PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 16829)
-- Dependencies: 259 259 2595
-- Name: pk_unit_skill; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unit_skill
    ADD CONSTRAINT pk_unit_skill PRIMARY KEY (id);


--
-- TOC entry 2373 (class 2606 OID 16831)
-- Dependencies: 261 261 2595
-- Name: pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 16833)
-- Dependencies: 231 231 2595
-- Name: prescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prescription
    ADD CONSTRAINT prescription_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 1259 OID 16834)
-- Dependencies: 171 2595
-- Name: idx_authorized_people; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_authorized_people ON authorized_people USING btree (id_roster_owner);


--
-- TOC entry 2277 (class 1259 OID 16835)
-- Dependencies: 175 2595
-- Name: idx_clinic_history_summary; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_clinic_history_summary ON clinic_history_summary USING btree (id_person);

ALTER TABLE clinic_history_summary CLUSTER ON idx_clinic_history_summary;


--
-- TOC entry 2284 (class 1259 OID 16836)
-- Dependencies: 181 2595
-- Name: idx_employee; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX idx_employee ON employee USING btree (id);


--
-- TOC entry 2294 (class 1259 OID 16837)
-- Dependencies: 186 2595
-- Name: idx_enabled_profile_by_user; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_enabled_profile_by_user ON enabled_profile USING btree (id_user);

ALTER TABLE enabled_profile CLUSTER ON idx_enabled_profile_by_user;


--
-- TOC entry 2267 (class 1259 OID 16838)
-- Dependencies: 169 169 169 169 169 2595
-- Name: idx_encounter_physician_patient_by_patient; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_encounter_physician_patient_by_patient ON encounter_physician_patient USING btree (id_person, id_institution, yyyy, mm, dd);


--
-- TOC entry 2268 (class 1259 OID 16839)
-- Dependencies: 169 169 169 169 2595
-- Name: idx_encounter_physician_patient_by_person; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_encounter_physician_patient_by_person ON encounter_physician_patient USING btree (id_person, yyyy, mm, dd);

ALTER TABLE encounter_physician_patient CLUSTER ON idx_encounter_physician_patient_by_person;


--
-- TOC entry 2269 (class 1259 OID 16840)
-- Dependencies: 169 169 169 169 169 169 2595
-- Name: idx_encounter_physician_patient_by_physician; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_encounter_physician_patient_by_physician ON encounter_physician_patient USING btree (id_physician, id_institution, yyyy, mm, dd, sequence);


--
-- TOC entry 2287 (class 1259 OID 16841)
-- Dependencies: 183 2595
-- Name: idx_functionality_by_profile; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_functionality_by_profile ON functionality_by_profile USING btree (id_profile);

ALTER TABLE functionality_by_profile CLUSTER ON idx_functionality_by_profile;


--
-- TOC entry 2315 (class 1259 OID 16842)
-- Dependencies: 207 2595
-- Name: idx_item_group; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_item_group ON item USING btree (id_group_of_items);

ALTER TABLE item CLUSTER ON idx_item_group;


--
-- TOC entry 2316 (class 1259 OID 16843)
-- Dependencies: 207 207 2595
-- Name: idx_item_sorted_by_priority; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_item_sorted_by_priority ON item USING btree (id_group_of_items, priority);


--
-- TOC entry 2321 (class 1259 OID 16844)
-- Dependencies: 211 211 2595
-- Name: idx_role_institution; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_role_institution ON manager_of_unit USING btree (id_institution, date_from DESC);


--
-- TOC entry 2322 (class 1259 OID 16845)
-- Dependencies: 211 211 2595
-- Name: idx_role_person; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_role_person ON manager_of_unit USING btree (id_person, date_from DESC);


--
-- TOC entry 2323 (class 1259 OID 16846)
-- Dependencies: 211 211 2595
-- Name: idx_role_unit; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_role_unit ON manager_of_unit USING btree (id_unit, date_from DESC);

ALTER TABLE manager_of_unit CLUSTER ON idx_role_unit;


--
-- TOC entry 2374 (class 2606 OID 16847)
-- Dependencies: 257 161 2368 2595
-- Name: fk_activity_type_to_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_type
    ADD CONSTRAINT fk_activity_type_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2375 (class 2606 OID 16852)
-- Dependencies: 2282 165 179 2595
-- Name: fk_allowed_to_work_at_to_document; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_document FOREIGN KEY (id_document) REFERENCES document(id);


--
-- TOC entry 2376 (class 2606 OID 16857)
-- Dependencies: 165 181 181 181 2285 165 165 2595
-- Name: fk_allowed_to_work_at_to_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_employee FOREIGN KEY (id_person, id_institution, id_document) REFERENCES employee(id_person, id_institution, id_init_document);


--
-- TOC entry 2377 (class 2606 OID 16862)
-- Dependencies: 2313 165 206 2595
-- Name: fk_allowed_to_work_at_to_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2378 (class 2606 OID 16867)
-- Dependencies: 2338 165 223 2595
-- Name: fk_allowed_to_work_at_to_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_person FOREIGN KEY (id_person) REFERENCES person(id);


--
-- TOC entry 2379 (class 2606 OID 16872)
-- Dependencies: 2368 165 257 2595
-- Name: fk_allowed_to_work_at_to_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY allowed_to_work_at
    ADD CONSTRAINT fk_allowed_to_work_at_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2380 (class 2606 OID 16877)
-- Dependencies: 167 169 2270 2595
-- Name: fk_anamnesis_to_consultation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anamnesis
    ADD CONSTRAINT fk_anamnesis_to_consultation FOREIGN KEY (id_encounter_physician_patient) REFERENCES encounter_physician_patient(id);


--
-- TOC entry 2389 (class 2606 OID 16882)
-- Dependencies: 2360 171 247 2595
-- Name: fk_authorized_people_to_roster_assistant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authorized_people
    ADD CONSTRAINT fk_authorized_people_to_roster_assistant FOREIGN KEY (id_roster_assistant) REFERENCES roster(id);


--
-- TOC entry 2390 (class 2606 OID 16887)
-- Dependencies: 171 2360 247 2595
-- Name: fk_authorized_people_to_roster_owner; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authorized_people
    ADD CONSTRAINT fk_authorized_people_to_roster_owner FOREIGN KEY (id_roster_owner) REFERENCES roster(id);


--
-- TOC entry 2391 (class 2606 OID 16892)
-- Dependencies: 223 2338 173 2595
-- Name: fk_clinic_history_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clinic_history
    ADD CONSTRAINT fk_clinic_history_person FOREIGN KEY (id_persona) REFERENCES person(id);


--
-- TOC entry 2392 (class 2606 OID 16897)
-- Dependencies: 221 221 2336 175 175 2595
-- Name: fk_clinic_history_summary_to_patient; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clinic_history_summary
    ADD CONSTRAINT fk_clinic_history_summary_to_patient FOREIGN KEY (id_institution, id_person) REFERENCES patient(id_institution, id_person);


--
-- TOC entry 2393 (class 2606 OID 16902)
-- Dependencies: 2270 177 169 2595
-- Name: fk_diagnostic_to_consultation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY diagnostic
    ADD CONSTRAINT fk_diagnostic_to_consultation FOREIGN KEY (id_encounter_physician_patient) REFERENCES encounter_physician_patient(id);


--
-- TOC entry 2394 (class 2606 OID 16907)
-- Dependencies: 2313 179 206 2595
-- Name: fk_document_to_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document
    ADD CONSTRAINT fk_document_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2395 (class 2606 OID 16912)
-- Dependencies: 179 207 2317 2595
-- Name: fk_document_to_item_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document
    ADD CONSTRAINT fk_document_to_item_type FOREIGN KEY (id_type) REFERENCES item(id);


--
-- TOC entry 2396 (class 2606 OID 16917)
-- Dependencies: 2348 181 233 2595
-- Name: fk_employee_to_profession; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_employee_to_profession FOREIGN KEY (id_profession) REFERENCES profession(id);


--
-- TOC entry 2397 (class 2606 OID 16922)
-- Dependencies: 2366 254 181 2595
-- Name: fk_employee_to_specialization; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_employee_to_specialization FOREIGN KEY (id_specialization) REFERENCES specialization(id);


--
-- TOC entry 2403 (class 2606 OID 16927)
-- Dependencies: 2307 183 200 2595
-- Name: fk_enabled_functionality_to_functionality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY functionality_by_profile
    ADD CONSTRAINT fk_enabled_functionality_to_functionality FOREIGN KEY (id_functionality) REFERENCES functionality(id);


--
-- TOC entry 2404 (class 2606 OID 16932)
-- Dependencies: 2350 183 235 2595
-- Name: fk_enabled_functionality_to_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY functionality_by_profile
    ADD CONSTRAINT fk_enabled_functionality_to_profile FOREIGN KEY (id_profile) REFERENCES profile(id);


--
-- TOC entry 2407 (class 2606 OID 16937)
-- Dependencies: 2290 186 185 2595
-- Name: fk_enabled_profile_to_enabled_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enabled_profile
    ADD CONSTRAINT fk_enabled_profile_to_enabled_module FOREIGN KEY (id_enabled_module) REFERENCES enabled_module(id);


--
-- TOC entry 2408 (class 2606 OID 16942)
-- Dependencies: 2350 186 235 2595
-- Name: fk_enabled_profile_to_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enabled_profile
    ADD CONSTRAINT fk_enabled_profile_to_profile FOREIGN KEY (id_profile) REFERENCES profile(id);


--
-- TOC entry 2409 (class 2606 OID 16947)
-- Dependencies: 186 261 2372 2595
-- Name: fk_enabled_profile_to_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enabled_profile
    ADD CONSTRAINT fk_enabled_profile_to_user FOREIGN KEY (id_user) REFERENCES "user"(id);


--
-- TOC entry 2381 (class 2606 OID 16952)
-- Dependencies: 169 169 169 181 181 181 2285 2595
-- Name: fk_encounter_physician_patient_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY encounter_physician_patient
    ADD CONSTRAINT fk_encounter_physician_patient_employee FOREIGN KEY (id_physician, id_institution, id_init_document) REFERENCES employee(id_person, id_institution, id_init_document);


--
-- TOC entry 2382 (class 2606 OID 16957)
-- Dependencies: 169 2270 169 2595
-- Name: fk_encounter_physician_patient_to_encounter_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY encounter_physician_patient
    ADD CONSTRAINT fk_encounter_physician_patient_to_encounter_parent FOREIGN KEY (id_encounter_parent) REFERENCES encounter_physician_patient(id);


--
-- TOC entry 2383 (class 2606 OID 16962)
-- Dependencies: 207 2317 169 2595
-- Name: fk_encounter_physician_patient_to_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY encounter_physician_patient
    ADD CONSTRAINT fk_encounter_physician_patient_to_item FOREIGN KEY (id_state) REFERENCES item(id);


--
-- TOC entry 2384 (class 2606 OID 16967)
-- Dependencies: 221 221 2336 169 169 2595
-- Name: fk_encounter_physician_patient_to_patient; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY encounter_physician_patient
    ADD CONSTRAINT fk_encounter_physician_patient_to_patient FOREIGN KEY (id_institution, id_person) REFERENCES patient(id_institution, id_person);


--
-- TOC entry 2385 (class 2606 OID 16972)
-- Dependencies: 2344 169 228 2595
-- Name: fk_encounter_physician_patient_to_physical_space_assigned; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY encounter_physician_patient
    ADD CONSTRAINT fk_encounter_physician_patient_to_physical_space_assigned FOREIGN KEY (id_physical_space_assigned_to_unit) REFERENCES physical_space_assigned_to_unit(id);


--
-- TOC entry 2386 (class 2606 OID 16977)
-- Dependencies: 2317 169 207 2595
-- Name: fk_encounter_physician_patient_to_reason_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY encounter_physician_patient
    ADD CONSTRAINT fk_encounter_physician_patient_to_reason_item FOREIGN KEY (id_encounter_reason) REFERENCES item(id);


--
-- TOC entry 2387 (class 2606 OID 16982)
-- Dependencies: 2360 169 247 2595
-- Name: fk_encounter_physician_patient_to_roster; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY encounter_physician_patient
    ADD CONSTRAINT fk_encounter_physician_patient_to_roster FOREIGN KEY (id_roster) REFERENCES roster(id);


--
-- TOC entry 2388 (class 2606 OID 16987)
-- Dependencies: 2368 169 257 2595
-- Name: fk_encounter_physician_patient_to_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY encounter_physician_patient
    ADD CONSTRAINT fk_encounter_physician_patient_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2413 (class 2606 OID 16992)
-- Dependencies: 2270 190 169 2595
-- Name: fk_exam_order_to_consultation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_order
    ADD CONSTRAINT fk_exam_order_to_consultation FOREIGN KEY (id_encounter_physician_patient) REFERENCES encounter_physician_patient(id);


--
-- TOC entry 2414 (class 2606 OID 16997)
-- Dependencies: 2301 190 194 2595
-- Name: fk_exam_order_to_exam_template; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_order
    ADD CONSTRAINT fk_exam_order_to_exam_template FOREIGN KEY (id_exam_template) REFERENCES exam_template(id);


--
-- TOC entry 2415 (class 2606 OID 17002)
-- Dependencies: 2295 192 188 2595
-- Name: fk_exam_result_item_to_exam_result; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_result_item
    ADD CONSTRAINT fk_exam_result_item_to_exam_result FOREIGN KEY (id_exam_result) REFERENCES exam_result(id);


--
-- TOC entry 2416 (class 2606 OID 17007)
-- Dependencies: 192 196 2303 2595
-- Name: fk_exam_result_item_to_exam_template_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_result_item
    ADD CONSTRAINT fk_exam_result_item_to_exam_template_item FOREIGN KEY (id_exam_template_item) REFERENCES exam_template_item(id);


--
-- TOC entry 2410 (class 2606 OID 17012)
-- Dependencies: 188 169 2270 2595
-- Name: fk_exam_result_to_encounter_physician_patient; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_result
    ADD CONSTRAINT fk_exam_result_to_encounter_physician_patient FOREIGN KEY (id_encounter_physician_patient) REFERENCES encounter_physician_patient(id);


--
-- TOC entry 2411 (class 2606 OID 17017)
-- Dependencies: 2301 188 194 2595
-- Name: fk_exam_result_to_exam_template; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_result
    ADD CONSTRAINT fk_exam_result_to_exam_template FOREIGN KEY (id_exam_template) REFERENCES exam_template(id);


--
-- TOC entry 2412 (class 2606 OID 17022)
-- Dependencies: 2338 223 188 2595
-- Name: fk_exam_result_to_laboratorian; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_result
    ADD CONSTRAINT fk_exam_result_to_laboratorian FOREIGN KEY (id_laboratorian) REFERENCES person(id);


--
-- TOC entry 2417 (class 2606 OID 17027)
-- Dependencies: 2317 194 207 2595
-- Name: fk_exam_template_id_type_of_exam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_template
    ADD CONSTRAINT fk_exam_template_id_type_of_exam FOREIGN KEY (id_type_of_exam) REFERENCES item(id);


--
-- TOC entry 2418 (class 2606 OID 17032)
-- Dependencies: 196 196 2303 2595
-- Name: fk_exam_template_item_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_template_item
    ADD CONSTRAINT fk_exam_template_item_parent FOREIGN KEY (id_exam_template_item_parent) REFERENCES exam_template_item(id);


--
-- TOC entry 2419 (class 2606 OID 17037)
-- Dependencies: 194 196 2301 2595
-- Name: fk_exam_template_item_to_exam_template; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_template_item
    ADD CONSTRAINT fk_exam_template_item_to_exam_template FOREIGN KEY (id_exam_template) REFERENCES exam_template(id);


--
-- TOC entry 2420 (class 2606 OID 17042)
-- Dependencies: 196 207 2317 2595
-- Name: fk_exam_template_item_to_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exam_template_item
    ADD CONSTRAINT fk_exam_template_item_to_item FOREIGN KEY (id_unit) REFERENCES item(id);


--
-- TOC entry 2421 (class 2606 OID 17047)
-- Dependencies: 198 185 2290 2595
-- Name: fk_extra_functionality_to_enabled_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY extra_functionality
    ADD CONSTRAINT fk_extra_functionality_to_enabled_module FOREIGN KEY (id_enabled_module) REFERENCES enabled_module(id);


--
-- TOC entry 2422 (class 2606 OID 17052)
-- Dependencies: 198 200 2307 2595
-- Name: fk_extra_functionality_to_functionality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY extra_functionality
    ADD CONSTRAINT fk_extra_functionality_to_functionality FOREIGN KEY (id_functionality) REFERENCES functionality(id);


--
-- TOC entry 2423 (class 2606 OID 17057)
-- Dependencies: 198 261 2372 2595
-- Name: fk_extra_functionality_to_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY extra_functionality
    ADD CONSTRAINT fk_extra_functionality_to_user FOREIGN KEY (id_user) REFERENCES "user"(id);


--
-- TOC entry 2424 (class 2606 OID 17062)
-- Dependencies: 200 252 2364 2595
-- Name: fk_functionality_to_software_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY functionality
    ADD CONSTRAINT fk_functionality_to_software_module FOREIGN KEY (id_software_module) REFERENCES software_module(id);


--
-- TOC entry 2427 (class 2606 OID 17067)
-- Dependencies: 207 202 2309 2595
-- Name: fk_groups_of_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT fk_groups_of_items FOREIGN KEY (id_group_of_items) REFERENCES group_of_items(id);


--
-- TOC entry 2425 (class 2606 OID 17072)
-- Dependencies: 204 220 2334 2595
-- Name: fk_horario_de_atencion_to_slot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_schedule
    ADD CONSTRAINT fk_horario_de_atencion_to_slot FOREIGN KEY (id_slot) REFERENCES operation_time(id);


--
-- TOC entry 2426 (class 2606 OID 17077)
-- Dependencies: 204 257 2368 2595
-- Name: fk_horario_de_atencion_to_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_schedule
    ADD CONSTRAINT fk_horario_de_atencion_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2405 (class 2606 OID 17082)
-- Dependencies: 185 206 2313 2595
-- Name: fk_installed_module_id_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enabled_module
    ADD CONSTRAINT fk_installed_module_id_institution FOREIGN KEY (id_institution) REFERENCES institution(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2428 (class 2606 OID 17087)
-- Dependencies: 207 207 2317 2595
-- Name: fk_item_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_parent FOREIGN KEY (id_parent) REFERENCES item(id);


--
-- TOC entry 2432 (class 2606 OID 17092)
-- Dependencies: 212 173 2275 2595
-- Name: fk_medical_center_clinic_history_clinic_history; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medical_center_clinic_history
    ADD CONSTRAINT fk_medical_center_clinic_history_clinic_history FOREIGN KEY (id_clinic_history) REFERENCES clinic_history(id);


--
-- TOC entry 2433 (class 2606 OID 17097)
-- Dependencies: 212 206 2313 2595
-- Name: fk_medical_center_clinic_history_to_medical_center; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medical_center_clinic_history
    ADD CONSTRAINT fk_medical_center_clinic_history_to_medical_center FOREIGN KEY (id_medical_center) REFERENCES institution(id);


--
-- TOC entry 2434 (class 2606 OID 17102)
-- Dependencies: 214 214 2328 2595
-- Name: fk_medical_nomenclature_to_itself; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medical_nomenclature
    ADD CONSTRAINT fk_medical_nomenclature_to_itself FOREIGN KEY (id_parent) REFERENCES medical_nomenclature(id);


--
-- TOC entry 2437 (class 2606 OID 17107)
-- Dependencies: 221 206 2313 2595
-- Name: fk_patient_registration_to_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT fk_patient_registration_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2438 (class 2606 OID 17112)
-- Dependencies: 221 223 2338 2595
-- Name: fk_patient_registration_to_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT fk_patient_registration_to_person FOREIGN KEY (id_person) REFERENCES person(id);


--
-- TOC entry 2439 (class 2606 OID 17117)
-- Dependencies: 223 163 2261 2595
-- Name: fk_person_address; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_address FOREIGN KEY (id_legal_address) REFERENCES address(id);


--
-- TOC entry 2440 (class 2606 OID 17122)
-- Dependencies: 223 163 2261 2595
-- Name: fk_person_address_detailed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_address_detailed FOREIGN KEY (id_place_of_birth) REFERENCES address(id);


--
-- TOC entry 2441 (class 2606 OID 17127)
-- Dependencies: 223 207 2317 2595
-- Name: fk_person_document_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_document_type FOREIGN KEY (id_document_type) REFERENCES item(id);


--
-- TOC entry 2442 (class 2606 OID 17132)
-- Dependencies: 223 207 2317 2595
-- Name: fk_person_ethnic; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_ethnic FOREIGN KEY (id_ethnic) REFERENCES item(id);


--
-- TOC entry 2443 (class 2606 OID 17137)
-- Dependencies: 223 223 2338 2595
-- Name: fk_person_father; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_father FOREIGN KEY (id_father) REFERENCES person(id);


--
-- TOC entry 2444 (class 2606 OID 17142)
-- Dependencies: 223 207 2317 2595
-- Name: fk_person_instruction_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_instruction_level FOREIGN KEY (id_instruction_level) REFERENCES item(id);


--
-- TOC entry 2445 (class 2606 OID 17147)
-- Dependencies: 223 207 2317 2595
-- Name: fk_person_marital_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_marital_status FOREIGN KEY (id_marital_status) REFERENCES item(id);


--
-- TOC entry 2446 (class 2606 OID 17152)
-- Dependencies: 223 223 2338 2595
-- Name: fk_person_mother; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_mother FOREIGN KEY (id_mother) REFERENCES person(id);


--
-- TOC entry 2447 (class 2606 OID 17157)
-- Dependencies: 223 207 2317 2595
-- Name: fk_person_occupation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_occupation FOREIGN KEY (id_occupation) REFERENCES item(id);


--
-- TOC entry 2448 (class 2606 OID 17162)
-- Dependencies: 223 233 2348 2595
-- Name: fk_person_profession; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_profession FOREIGN KEY (id_profession) REFERENCES profession(id);


--
-- TOC entry 2449 (class 2606 OID 17167)
-- Dependencies: 223 207 2317 2595
-- Name: fk_person_religion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_religion FOREIGN KEY (id_religion) REFERENCES item(id);


--
-- TOC entry 2450 (class 2606 OID 17172)
-- Dependencies: 223 207 2317 2595
-- Name: fk_person_sex; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_sex FOREIGN KEY (id_sex) REFERENCES item(id);


--
-- TOC entry 2451 (class 2606 OID 17177)
-- Dependencies: 224 223 2338 2595
-- Name: fk_person_skill_to_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_skill
    ADD CONSTRAINT fk_person_skill_to_person FOREIGN KEY (id_person) REFERENCES person(id);


--
-- TOC entry 2452 (class 2606 OID 17182)
-- Dependencies: 224 207 2317 2595
-- Name: fk_person_skill_to_skill_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_skill
    ADD CONSTRAINT fk_person_skill_to_skill_item FOREIGN KEY (id_skill) REFERENCES item(id);


--
-- TOC entry 2453 (class 2606 OID 17187)
-- Dependencies: 227 206 2313 2595
-- Name: fk_physical_space; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY physical_space
    ADD CONSTRAINT fk_physical_space FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2454 (class 2606 OID 17192)
-- Dependencies: 227 227 2342 2595
-- Name: fk_physical_space_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY physical_space
    ADD CONSTRAINT fk_physical_space_parent FOREIGN KEY (id_parent) REFERENCES physical_space(id);


--
-- TOC entry 2457 (class 2606 OID 17197)
-- Dependencies: 231 169 2270 2595
-- Name: fk_prescription_to_consultation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prescription
    ADD CONSTRAINT fk_prescription_to_consultation FOREIGN KEY (id_encounter_physician_patient) REFERENCES encounter_physician_patient(id);


--
-- TOC entry 2458 (class 2606 OID 17202)
-- Dependencies: 231 207 2317 2595
-- Name: fk_prescription_to_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prescription
    ADD CONSTRAINT fk_prescription_to_item FOREIGN KEY (id_frequency_unit) REFERENCES item(id);


--
-- TOC entry 2459 (class 2606 OID 17207)
-- Dependencies: 231 216 2330 2595
-- Name: fk_prescription_to_medicine; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prescription
    ADD CONSTRAINT fk_prescription_to_medicine FOREIGN KEY (id_medicine) REFERENCES medicine(id);


--
-- TOC entry 2460 (class 2606 OID 17212)
-- Dependencies: 235 252 2364 2595
-- Name: fk_profile_to_software_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT fk_profile_to_software_module FOREIGN KEY (id_software_module) REFERENCES software_module(id);


--
-- TOC entry 2461 (class 2606 OID 17217)
-- Dependencies: 237 223 2338 2595
-- Name: fk_relationship_related_from; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_related_from FOREIGN KEY (id_person_related_from) REFERENCES person(id);


--
-- TOC entry 2462 (class 2606 OID 17222)
-- Dependencies: 237 223 2338 2595
-- Name: fk_relationship_related_to; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_related_to FOREIGN KEY (id_person_related_to) REFERENCES person(id);


--
-- TOC entry 2463 (class 2606 OID 17227)
-- Dependencies: 237 238 2352 2595
-- Name: fk_relationship_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_type FOREIGN KEY (id_relationship_type) REFERENCES relationship_type(id);


--
-- TOC entry 2464 (class 2606 OID 17232)
-- Dependencies: 242 179 2282 2595
-- Name: fk_resource_belongs_to_institution_to_entry_document; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_entry_document FOREIGN KEY (id_entry_document) REFERENCES document(id);


--
-- TOC entry 2465 (class 2606 OID 17237)
-- Dependencies: 242 206 2313 2595
-- Name: fk_resource_belongs_to_institution_to_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2466 (class 2606 OID 17242)
-- Dependencies: 242 242 2356 2595
-- Name: fk_resource_belongs_to_institution_to_itself; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_itself FOREIGN KEY (id_moved_to) REFERENCES resource_belongs_to_institution(id);


--
-- TOC entry 2467 (class 2606 OID 17247)
-- Dependencies: 242 207 2317 2595
-- Name: fk_resource_belongs_to_institution_to_reason_of_retiremen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_reason_of_retiremen FOREIGN KEY (id_reason_of_retirement) REFERENCES item(id);


--
-- TOC entry 2468 (class 2606 OID 17252)
-- Dependencies: 241 242 2354 2595
-- Name: fk_resource_belongs_to_institution_to_resource; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_resource FOREIGN KEY (id_resource) REFERENCES resource(id);


--
-- TOC entry 2469 (class 2606 OID 17257)
-- Dependencies: 179 242 2282 2595
-- Name: fk_resource_belongs_to_institution_to_retire_document; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_institution
    ADD CONSTRAINT fk_resource_belongs_to_institution_to_retire_document FOREIGN KEY (id_retire_document) REFERENCES document(id);


--
-- TOC entry 2470 (class 2606 OID 17262)
-- Dependencies: 244 179 2282 2595
-- Name: fk_resource_belongs_to_unit_to_document; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT fk_resource_belongs_to_unit_to_document FOREIGN KEY (id_document) REFERENCES document(id);


--
-- TOC entry 2471 (class 2606 OID 17267)
-- Dependencies: 244 242 2356 2595
-- Name: fk_resource_belongs_to_unit_to_id_resource_belongs_to_instituti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT fk_resource_belongs_to_unit_to_id_resource_belongs_to_instituti FOREIGN KEY (id_resource_belongs_to_institution) REFERENCES resource_belongs_to_institution(id);


--
-- TOC entry 2472 (class 2606 OID 17272)
-- Dependencies: 2317 207 244 2595
-- Name: fk_resource_belongs_to_unit_to_type_of_assigment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT fk_resource_belongs_to_unit_to_type_of_assigment FOREIGN KEY (id_type_of_assigment) REFERENCES item(id);


--
-- TOC entry 2473 (class 2606 OID 17277)
-- Dependencies: 257 2368 244 2595
-- Name: fk_resource_belongs_to_unit_to_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_belongs_to_unit
    ADD CONSTRAINT fk_resource_belongs_to_unit_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2429 (class 2606 OID 17282)
-- Dependencies: 2313 211 206 2595
-- Name: fk_role_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manager_of_unit
    ADD CONSTRAINT fk_role_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2430 (class 2606 OID 17287)
-- Dependencies: 223 211 2338 2595
-- Name: fk_role_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manager_of_unit
    ADD CONSTRAINT fk_role_person FOREIGN KEY (id_person) REFERENCES person(id);


--
-- TOC entry 2431 (class 2606 OID 17292)
-- Dependencies: 257 2368 211 2595
-- Name: fk_role_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manager_of_unit
    ADD CONSTRAINT fk_role_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2474 (class 2606 OID 17297)
-- Dependencies: 161 247 2259 2595
-- Name: fk_roster_to_activity_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_activity_type FOREIGN KEY (id_activity_type) REFERENCES activity_type(id);


--
-- TOC entry 2475 (class 2606 OID 17302)
-- Dependencies: 247 165 165 165 165 2263 247 247 247 2595
-- Name: fk_roster_to_allow_to_work_at; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_allow_to_work_at FOREIGN KEY (id_person, id_institution, id_init_document, id_unit) REFERENCES allowed_to_work_at(id_person, id_institution, id_document, id_unit);


--
-- TOC entry 2476 (class 2606 OID 17307)
-- Dependencies: 247 2282 179 2595
-- Name: fk_roster_to_document; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_document FOREIGN KEY (id_init_document) REFERENCES document(id);


--
-- TOC entry 2477 (class 2606 OID 17312)
-- Dependencies: 2313 206 247 2595
-- Name: fk_roster_to_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2478 (class 2606 OID 17317)
-- Dependencies: 2338 247 223 2595
-- Name: fk_roster_to_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_person FOREIGN KEY (id_person) REFERENCES person(id);


--
-- TOC entry 2479 (class 2606 OID 17322)
-- Dependencies: 247 228 2344 2595
-- Name: fk_roster_to_physical_space; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_physical_space FOREIGN KEY (id_physical_location) REFERENCES physical_space_assigned_to_unit(id);


--
-- TOC entry 2480 (class 2606 OID 17327)
-- Dependencies: 249 247 2362 2595
-- Name: fk_roster_to_shift; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_shift FOREIGN KEY (id_shift) REFERENCES shift(id);


--
-- TOC entry 2481 (class 2606 OID 17332)
-- Dependencies: 2368 257 247 2595
-- Name: fk_roster_to_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2482 (class 2606 OID 17337)
-- Dependencies: 257 247 2368 2595
-- Name: fk_roster_to_unit_service_offered; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster
    ADD CONSTRAINT fk_roster_to_unit_service_offered FOREIGN KEY (id_service_offered) REFERENCES unit(id);


--
-- TOC entry 2483 (class 2606 OID 17342)
-- Dependencies: 249 2313 206 2595
-- Name: fk_shift_to_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shift
    ADD CONSTRAINT fk_shift_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2484 (class 2606 OID 17347)
-- Dependencies: 249 207 2317 2595
-- Name: fk_shift_to_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shift
    ADD CONSTRAINT fk_shift_to_item FOREIGN KEY (id_item) REFERENCES item(id);


--
-- TOC entry 2435 (class 2606 OID 17352)
-- Dependencies: 206 2313 220 2595
-- Name: fk_slot_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operation_time
    ADD CONSTRAINT fk_slot_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2436 (class 2606 OID 17357)
-- Dependencies: 2317 207 220 2595
-- Name: fk_slot_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operation_time
    ADD CONSTRAINT fk_slot_item FOREIGN KEY (id_item) REFERENCES item(id);


--
-- TOC entry 2485 (class 2606 OID 17362)
-- Dependencies: 252 252 2364 2595
-- Name: fk_software_module_parent_to_software_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY software_module
    ADD CONSTRAINT fk_software_module_parent_to_software_module FOREIGN KEY (id_software_module_parent) REFERENCES software_module(id);


--
-- TOC entry 2486 (class 2606 OID 17367)
-- Dependencies: 2348 233 254 2595
-- Name: fk_specialization_profession; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specialization
    ADD CONSTRAINT fk_specialization_profession FOREIGN KEY (id_profession) REFERENCES profession(id);


--
-- TOC entry 2487 (class 2606 OID 17372)
-- Dependencies: 2313 257 206 2595
-- Name: fk_unit_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT fk_unit_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2488 (class 2606 OID 17377)
-- Dependencies: 257 207 2317 2595
-- Name: fk_unit_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT fk_unit_item FOREIGN KEY (unit_type) REFERENCES item(id);


--
-- TOC entry 2490 (class 2606 OID 17382)
-- Dependencies: 207 259 2317 2595
-- Name: fk_unit_skill_to_skill_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unit_skill
    ADD CONSTRAINT fk_unit_skill_to_skill_item FOREIGN KEY (id_skill) REFERENCES item(id);


--
-- TOC entry 2491 (class 2606 OID 17387)
-- Dependencies: 259 257 2368 2595
-- Name: fk_unit_skill_to_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unit_skill
    ADD CONSTRAINT fk_unit_skill_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2489 (class 2606 OID 17392)
-- Dependencies: 2368 257 257 2595
-- Name: fk_unit_unit_belong_to; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unit
    ADD CONSTRAINT fk_unit_unit_belong_to FOREIGN KEY (id_unit_belong_to) REFERENCES unit(id);


--
-- TOC entry 2398 (class 2606 OID 17397)
-- Dependencies: 2317 207 181 2595
-- Name: fk_works_at_to_end_cause_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_end_cause_item FOREIGN KEY (id_end_cause) REFERENCES item(id);


--
-- TOC entry 2399 (class 2606 OID 17402)
-- Dependencies: 181 2282 179 2595
-- Name: fk_works_at_to_end_document; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_end_document FOREIGN KEY (id_end_document) REFERENCES document(id);


--
-- TOC entry 2400 (class 2606 OID 17407)
-- Dependencies: 181 2282 179 2595
-- Name: fk_works_at_to_init_document; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_init_document FOREIGN KEY (id_init_document) REFERENCES document(id);


--
-- TOC entry 2401 (class 2606 OID 17412)
-- Dependencies: 181 206 2313 2595
-- Name: fk_works_at_to_institution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_institution FOREIGN KEY (id_institution) REFERENCES institution(id);


--
-- TOC entry 2402 (class 2606 OID 17417)
-- Dependencies: 223 2338 181 2595
-- Name: fk_works_at_to_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_works_at_to_person FOREIGN KEY (id_person) REFERENCES person(id);


--
-- TOC entry 2406 (class 2606 OID 17422)
-- Dependencies: 2364 185 252 2595
-- Name: id_software_module; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enabled_module
    ADD CONSTRAINT id_software_module FOREIGN KEY (id_software_module) REFERENCES software_module(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2455 (class 2606 OID 17427)
-- Dependencies: 2342 228 227 2595
-- Name: physical_space_assigned_to_unit_to_physical_space; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY physical_space_assigned_to_unit
    ADD CONSTRAINT physical_space_assigned_to_unit_to_physical_space FOREIGN KEY (id_physical_space) REFERENCES physical_space(id);


--
-- TOC entry 2456 (class 2606 OID 17432)
-- Dependencies: 228 257 2368 2595
-- Name: physical_space_assigned_to_unit_to_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY physical_space_assigned_to_unit
    ADD CONSTRAINT physical_space_assigned_to_unit_to_unit FOREIGN KEY (id_unit) REFERENCES unit(id);


--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-09-04 09:47:55 PET

--
-- PostgreSQL database dump complete
--

