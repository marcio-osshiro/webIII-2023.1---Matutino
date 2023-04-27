--
-- PostgreSQL database dump
--

-- Dumped from database version 11.18 (Debian 11.18-1.pgdg100+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg100+1)

-- Started on 2023-04-27 10:13:46 -04

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
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 201 (class 1259 OID 29936)
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    id integer NOT NULL,
    nome character varying(100),
    cpf character varying(100),
    figura character varying(50)
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 29934)
-- Name: autor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autor_id_seq OWNER TO postgres;

--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 200
-- Name: autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autor_id_seq OWNED BY public.autor.id;


--
-- TOC entry 196 (class 1259 OID 29910)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    descricao character varying(100),
    figura character varying(50)
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 29913)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO postgres;

--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 197
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 198 (class 1259 OID 29915)
-- Name: noticia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.noticia (
    id integer NOT NULL,
    titulo character varying(100),
    texto text,
    data date,
    categoria_id integer NOT NULL,
    autor_id integer,
    figura character varying(50)
);


ALTER TABLE public.noticia OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 29921)
-- Name: noticia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.noticia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.noticia_id_seq OWNER TO postgres;

--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 199
-- Name: noticia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.noticia_id_seq OWNED BY public.noticia.id;


--
-- TOC entry 2790 (class 2604 OID 29939)
-- Name: autor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor ALTER COLUMN id SET DEFAULT nextval('public.autor_id_seq'::regclass);


--
-- TOC entry 2788 (class 2604 OID 29923)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 2789 (class 2604 OID 29924)
-- Name: noticia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.noticia ALTER COLUMN id SET DEFAULT nextval('public.noticia_id_seq'::regclass);


--
-- TOC entry 2924 (class 0 OID 29936)
-- Dependencies: 201
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autor VALUES (1, 'Glória Maria', '123', 'vozfXhfNf1bOV3nh6VbMyRte76qkhPog22c2Gxs2.jpg');


--
-- TOC entry 2919 (class 0 OID 29910)
-- Dependencies: 196
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoria VALUES (3, 'Economia', NULL);
INSERT INTO public.categoria VALUES (7, 'Eventos', NULL);
INSERT INTO public.categoria VALUES (1, 'Atualidades e Eventos', NULL);
INSERT INTO public.categoria VALUES (2, 'Esporte e Saúde', NULL);
INSERT INTO public.categoria VALUES (8, 'teste 30/03', 'LGsMkM9xaW8gkDEJDZdHwyQZvWtNFqFlEP7Gjfgw.jpg');
INSERT INTO public.categoria VALUES (11, 'teste', 'GCbwv5pzm1vUgFjF1MOYqxU24q8QkM2zesVVEYay.png');


--
-- TOC entry 2921 (class 0 OID 29915)
-- Dependencies: 198
-- Data for Name: noticia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.noticia VALUES (6, 'sabado letivo', 'este sábado, 04 de Março, será um sábado letivo da segunda feira.', '2023-03-02', 3, 1, NULL);
INSERT INTO public.noticia VALUES (5, 'noticia de 02 de março', 'noticia de 02 de março', '2023-03-02', 7, 1, NULL);
INSERT INTO public.noticia VALUES (7, 'Flamento perde de Novo', 'Após uma serie de derrotas, o flamengo perde mais uma final, desta vez foi para o Vasco.', '2023-03-09', 2, 1, NULL);
INSERT INTO public.noticia VALUES (8, 'Sexta-Feira Santa', 'Amanhã, 07 de Abril de 2023, é feriado de Sexta-Feira Santa. Não haverá portanto aulas no IFMS. Boas Páscoa a todos.', '2023-04-06', 1, 1, NULL);
INSERT INTO public.noticia VALUES (2, 'Terremoto na Turquia', 'Um grande terremoto aconteceu na região da Turquia e Siria. Varios países estão se mobilizando para ajudar no resgate dos feridos', '2023-02-01', 7, 1, 'QRoeKu7iDl2atQWzNiaYJNX7w4xFmLPFXGMuo5m7.png');
INSERT INTO public.noticia VALUES (1, 'Carnaval começa semana que vem', 'Após a pandemia, Carnaval volta em 2023. Várias cidades estão se preparando para receber os foliões. RJ, SP, Bahia, Pernambuco promete Carnaval voltando com tudo', '2023-02-16', 1, 1, 'wsZdhhSyxvRcDAtxI3IH62scoLnDENvqxLQyTG0d.jpg');


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 200
-- Name: autor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_id_seq', 2, true);


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 197
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 11, true);


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 199
-- Name: noticia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.noticia_id_seq', 8, true);


--
-- TOC entry 2796 (class 2606 OID 29941)
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 29926)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 29928)
-- Name: noticia noticia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.noticia
    ADD CONSTRAINT noticia_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 29929)
-- Name: noticia fk_noticia_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.noticia
    ADD CONSTRAINT fk_noticia_categoria FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) NOT VALID;


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-04-27 10:13:46 -04

--
-- PostgreSQL database dump complete
--

