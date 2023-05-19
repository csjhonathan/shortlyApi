--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: bloom; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS bloom WITH SCHEMA public;


--
-- Name: EXTENSION bloom; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION bloom IS 'bloom access method - signature file based index';


--
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: intagg; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intagg WITH SCHEMA public;


--
-- Name: EXTENSION intagg; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION intagg IS 'integer aggregator and enumerator (obsolete)';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: isn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS isn WITH SCHEMA public;


--
-- Name: EXTENSION isn; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION isn IS 'data types for international product numbering standards';


--
-- Name: lo; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS lo WITH SCHEMA public;


--
-- Name: EXTENSION lo; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION lo IS 'Large Object maintenance';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: pg_buffercache; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_buffercache WITH SCHEMA public;


--
-- Name: EXTENSION pg_buffercache; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_buffercache IS 'examine the shared buffer cache';


--
-- Name: pg_prewarm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_prewarm WITH SCHEMA public;


--
-- Name: EXTENSION pg_prewarm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_prewarm IS 'prewarm relation data';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "shortUrl" character varying,
    url text NOT NULL,
    "creatorId" integer,
    access integer DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 'hMVIm2soHgAdwNRzptUJ9', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 5, '2023-05-18 00:00:00');
INSERT INTO public.urls VALUES (4, 'ZEr5CPUkQVEHtkbxLn6sO', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-18 00:00:00');
INSERT INTO public.urls VALUES (5, 'B2xHv31ZJKTPDoQvBns_D', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (6, 'MyAPy-p6Ne9YCDHzJQw4a', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (7, 'Yb8hipQg0xbr8je9hnOjG', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (8, 'bxLMKWj9OHXqVYxt5ueX4', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (9, '13FdCGryMznD9fy0g8j0-', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (10, 'ygRUo09bzYSxQkZ8PZ6au', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (11, 'vYhPbVJM8tMRHpur2Wbae', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (12, 'qlhy0YHGXdlmasCx7_a_I', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (13, 'CN_t1R73qfG3u_Ns2kiCc', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (14, 'krb5_gJWOkSsnsBLKFgc3', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (16, 'X4KdRNyI2AwnuPXrLG4A9', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 7, 0, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (2, 'wnEajoFdHfToC1OyC7pSn', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 3, '2023-05-18 00:00:00');
INSERT INTO public.urls VALUES (17, 'ZPbNdYYzC42E1_UL8Mb-6', 'https://www.notion.so/Projeto-17-Shortly-API-967da70cdff540ea95a22cb934a59482', 6, 1, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (19, 'qrFVbNAgvSynaGIoeZTrI', 'https://br.shein.com/SHEIN-Belle-Cold-Shoulder-Plicated-Split-Thigh-Chiffon-Bridesmaid-Dress-p-12531238-cat-3091.html?src_identifier=st%3D2%60sc%3Dmadrinha%20verde%60sr%3D0%60ps%3D1&src_module=search&src_tab_page_id=page_goods_detail1684407177541&mallCode=1', 6, 1, '2023-05-19 00:00:00');
INSERT INTO public.urls VALUES (18, '2DQXCcK3obqd3MZknPKj-', 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 6, 6, '2023-05-19 00:00:00');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (2, 'João', 'joao@driven.com.br', '$2b$10$z.RMEnaKinyo90yheGtSlOXq35FUf/UaeizltosoNdUFQ4.iFtcMi', '2023-05-18 00:00:00');
INSERT INTO public.users VALUES (6, 'Jhon', 'jhon@driven.com.br', '$2b$10$by2G4RaZm6e80LBzceKjCO7uHanMfiG7ayeKK5tzjcF/wr/.L6PgS', '2023-05-18 00:00:00');
INSERT INTO public.users VALUES (7, 'Jhonathan', 'jhonathan@driven.com.br', '$2b$10$D50IS2JmUHoGuRebejyMmu4JNNZGbHQExpvRCnKRw0GLMaztLzsU2', '2023-05-18 00:00:00');


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 19, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: urls urls_creatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

