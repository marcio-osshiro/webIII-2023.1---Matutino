--
-- PostgreSQL database dump
--

-- Dumped from database version 11.18 (Debian 11.18-1.pgdg100+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg100+1)

-- Started on 2023-05-04 15:36:18 -04

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

INSERT INTO public.autor VALUES (3, 'Sandra Annenberg', '1234', 'zoNVEXHl5yqbMCxBIqVkhddjaFgXPipu2igXBV7Q.png');
INSERT INTO public.autor VALUES (4, 'Willian Bonner', '2222', '9kJH7ZbDg0gNz4h0i2ECrwTGbvOzeFqmiwNTE74S.png');
INSERT INTO public.autor VALUES (5, 'Maria Julia Coutinho', '3333', 'PslizhvKciufRKP0EhdViMGz8wA66UPszgN6rhcl.png');
INSERT INTO public.autor VALUES (6, 'Roberto Cabrini', '4444', 'T19Rjrc9jaypnZYZ8Eobi7SfS2jmI2OAhUzxDGSO.png');


--
-- TOC entry 2919 (class 0 OID 29910)
-- Dependencies: 196
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoria VALUES (12, 'Economia', 'ap7TQkFU0oHacwsCOxidmfkZJHru9QcoIC1WEWVc.png');
INSERT INTO public.categoria VALUES (13, 'Esporte', 'vHDKB6aV4TjrKB8uoqThOb2fE1CMq9Gu92ZV2rhF.png');
INSERT INTO public.categoria VALUES (14, 'Saúde', '4knADlMVOKRSkvUY2dXffQiR3ICQsn3TB9ygA0DZ.jpg');
INSERT INTO public.categoria VALUES (15, 'Educação', 'kXkJ4O2XJmfvgx1UVkNWz9DcwTSDROwt67gcDpEn.jpg');
INSERT INTO public.categoria VALUES (16, 'Turismo', 'XzE8hiYytGGRVS2JhkTDM0p7HRH7Qd3o4H268FzK.jpg');


--
-- TOC entry 2921 (class 0 OID 29915)
-- Dependencies: 198
-- Data for Name: noticia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.noticia VALUES (9, 'Molestiae est consequuntur deleniti ducimus sunt.', 'Ut mollitia voluptatum sint voluptas. Vitae placeat labore amet et. At aut maxime impedit qui dolor. Ad non nisi quo harum. Vel praesentium beatae consequatur perferendis.', '2017-09-19', 13, 5, 'dc52bfc2f53dbe69ffb8ea7c6181992d.png');
INSERT INTO public.noticia VALUES (10, 'Veniam nam accusantium consequatur provident modi labore sint facere.', 'Veniam laudantium eum et sed illum. Enim omnis consequuntur minima dolorum ut minus. Ipsam corporis dolorem doloribus aut veniam ipsam odio commodi.', '2021-01-01', 14, 6, 'b01eae5e744f06e80332ee2b5c47817d.png');
INSERT INTO public.noticia VALUES (11, 'Ipsam aut impedit error expedita.', 'Nihil eos necessitatibus dolor ipsa. Nam numquam facilis et laudantium. Rem ducimus quia cum modi qui et in. Deserunt quod necessitatibus at.', '2008-04-11', 14, 6, '1a1fd492001595583fa0fa14b9196f51.png');
INSERT INTO public.noticia VALUES (12, 'Libero officiis illo ad voluptatum quaerat facere cumque.', 'Quidem sint distinctio quis voluptatum nemo. Quia ut recusandae quaerat ipsum nam optio aut. Tenetur sit rerum quae. Culpa temporibus reiciendis asperiores eum neque dolor.', '1988-06-05', 13, 3, '4eddcbdfc400a4da35d923d4a6233d82.png');
INSERT INTO public.noticia VALUES (13, 'Sint at nemo nulla occaecati unde est.', 'Sint fugit recusandae cupiditate repellendus in sint eligendi. Nam quibusdam saepe ut in ut. Ut consequatur fugit cumque et. Voluptatem beatae natus recusandae esse sed consequuntur qui.', '2000-08-05', 12, 5, '32a3c0e05e8a17881faf40b081530913.png');
INSERT INTO public.noticia VALUES (14, 'Similique iste dolores et voluptatum.', 'A nisi ad accusamus id et dolorem eius suscipit. Accusantium doloremque et sed autem hic. Doloremque est quo modi dolore natus non. Quae aut quidem neque officiis fugiat.', '1976-08-08', 14, 4, '6423fa226feb6d2410733e9422a29f84.png');
INSERT INTO public.noticia VALUES (15, 'Cupiditate sunt doloribus perspiciatis magni accusamus et aut et.', 'Expedita possimus quis eos alias et ut. Et praesentium magnam provident dolorem non. Sunt architecto distinctio eveniet eligendi saepe porro ea doloremque.', '2020-06-02', 14, 5, '5fb302c63d1307db6276025239eb2d15.png');
INSERT INTO public.noticia VALUES (16, 'Ut omnis quia aliquid consequatur cumque nisi accusantium quia.', 'Maxime ab velit omnis qui. Velit totam et a. Rerum earum et repellat et laboriosam. Animi excepturi quod voluptatem aliquam voluptatem voluptates pariatur.', '1976-10-23', 16, 6, '6093e7a72a37d39f010877181d10cc49.png');
INSERT INTO public.noticia VALUES (17, 'Mollitia non quod nam laborum illum officia omnis sunt.', 'Occaecati nemo provident minima ipsa placeat. Hic rerum fugiat sapiente soluta. Qui maxime minima neque aliquam et.', '1991-09-26', 16, 5, '72a575d1aa9416ffb93605da49302b78.png');
INSERT INTO public.noticia VALUES (18, 'Ea iusto dolorem repudiandae ea distinctio commodi praesentium.', 'Et facilis et explicabo suscipit. Sapiente hic enim vel ut accusantium ut a. Cupiditate in repellendus non.', '1999-07-18', 13, 4, '13d524be6f19a7eca6d556e0931e5b5f.png');
INSERT INTO public.noticia VALUES (19, 'Fuga hic et est est.', 'Expedita consequatur eligendi ipsum quod necessitatibus at. Illo et totam quae. Ullam mollitia id nisi ratione est ad. Sunt incidunt labore nihil est fugiat.', '2021-07-03', 15, 5, 'd2d8067272390cdf93bb0fef1f606de4.png');
INSERT INTO public.noticia VALUES (20, 'Et itaque velit sit commodi fugit.', 'Commodi deleniti expedita sint qui et pariatur totam. Veniam et ea tempora delectus. Eum qui assumenda nemo doloribus in. Et itaque veniam minus atque et omnis aliquid.', '1978-05-18', 12, 3, '410ea1653f800633bcc3547fdf17b38b.png');
INSERT INTO public.noticia VALUES (21, 'Fugiat ut nemo perspiciatis nihil neque distinctio.', 'Blanditiis quis tempora architecto modi commodi et. Aperiam facilis dolorem aut at expedita rerum. Est est aliquam sed aut deleniti non ut nemo.', '2007-12-04', 14, 6, '869c2a3c37e5efd700f35fe9646ec936.png');
INSERT INTO public.noticia VALUES (22, 'Ut aliquid nemo consequatur vel ratione.', 'Maxime omnis commodi deserunt explicabo. Commodi unde maiores neque dolores ipsam officia natus. Qui molestiae et dolorem odio. Qui maiores omnis ut quia sed laboriosam.', '1988-02-09', 14, 3, '52ff68859ec3993825eb6829f6b7824f.png');
INSERT INTO public.noticia VALUES (23, 'Qui quis tempore voluptatem.', 'Quia sunt magnam eos voluptates. Eaque magni non dolor voluptatem. Voluptatum ea atque sunt unde est molestiae. Aspernatur rem est fugit corrupti qui voluptatibus. Rem pariatur iste ut alias nam.', '1984-04-14', 16, 4, '09ad9a8ddf5cac8e9b87984ed658fddf.png');
INSERT INTO public.noticia VALUES (24, 'Facere veritatis veniam error ut.', 'Beatae dolorum similique eius laudantium. Quam doloribus est quibusdam ea. Atque at magnam culpa perferendis.', '1984-09-04', 16, 4, 'cd88891b8ced67e25bc1a9801c694a77.png');
INSERT INTO public.noticia VALUES (25, 'Et dolore ipsa qui eos saepe enim quis et.', 'Quae perferendis numquam facere dolore ab fuga quia. Harum qui voluptas minima quasi nihil a.', '2023-01-16', 12, 5, '9473cd7e4d35acd5c92b5c15accb7841.png');
INSERT INTO public.noticia VALUES (26, 'Quibusdam laborum sequi amet rerum laudantium quidem voluptatem.', 'Veritatis incidunt quas tempore ipsam accusantium corporis quam nostrum. Est et et nostrum perferendis.', '1975-06-28', 13, 5, '4ed536314e4d564bc8ee6759bde28db5.png');
INSERT INTO public.noticia VALUES (27, 'Iure impedit eos ad quia nostrum reprehenderit vero.', 'Quis aut sit sit distinctio vitae iste quis. Est nemo error eius eos amet expedita. Ea accusantium commodi in vero quia. Ut qui maxime soluta autem id at omnis.', '1985-02-18', 16, 4, '4efbcaae68d8d68dca12d40d06c26750.png');
INSERT INTO public.noticia VALUES (28, 'Quis aut vel ad tempora et sunt possimus.', 'Officia et earum eaque beatae in facilis. Et eos qui consequatur ut consequatur. Vitae consequuntur sunt pariatur quaerat. Ut sapiente atque exercitationem adipisci.', '2023-01-28', 14, 5, '7bf6c366f439c1dc5104dccda0ff4883.png');
INSERT INTO public.noticia VALUES (29, 'Enim non ab porro ullam delectus explicabo explicabo repellat.', 'Accusantium culpa architecto enim sit excepturi aliquid consectetur sed. Dicta dolore tempore quaerat minima. Sunt nobis accusantium qui id itaque.', '2015-08-08', 12, 4, '974a95f63fdaa4e1fed275e22b4cce3f.png');


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 200
-- Name: autor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_id_seq', 6, true);


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 197
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 16, true);


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 199
-- Name: noticia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.noticia_id_seq', 29, true);


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


-- Completed on 2023-05-04 15:36:18 -04

--
-- PostgreSQL database dump complete
--

