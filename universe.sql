--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    description text,
    age_in_mil_yrs integer,
    distance_from_earth numeric(17,3),
    is_real boolean NOT NULL,
    visible boolean,
    age_in_lil_yrs integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    description text,
    age_in_mil_yrs integer,
    age_in_lil_yrs integer,
    is_habitable boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric(17,3),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_type character varying NOT NULL,
    description text,
    age_in_mil_yrs integer,
    age_in_lil_yrs integer,
    distance_from_earth numeric(17,3),
    is_habitable boolean NOT NULL,
    is_spherical boolean,
    name character varying(50),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_type character varying(50) NOT NULL,
    description text,
    age_in_mil_yrs integer,
    distance_from_earth numeric(17,3),
    is_habitable boolean NOT NULL,
    is_spherical boolean,
    age_in_lil_yrs integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(50),
    sun_type character varying(50),
    description text,
    age_in_mil_yrs integer,
    age_in_lil_yrs integer,
    is_habitable boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric(17,3)
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Paulie', 'paulietype', 'thisistestscript', 5, 25874.560, false, false, 7);
INSERT INTO public.galaxy VALUES (2, 'ipsutype', 'ipsutype', 'this is another test script', 5, 35874.560, false, false, 8);
INSERT INTO public.galaxy VALUES (3, 'alpha', 'alphatype', 'this is just another test script', 6, 74874.560, false, false, 9);
INSERT INTO public.galaxy VALUES (4, 'beta', 'betatype', 'this is just again another test script', 9, 785874.560, false, false, 11);
INSERT INTO public.galaxy VALUES (5, 'theta', 'tethatype', 'this is just again another little test script', 9, 1055874.560, false, false, 13);
INSERT INTO public.galaxy VALUES (6, 'zetha', 'zethatype', 'this is just a test script', 4, 1023874.560, false, false, 14);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon_1', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (2, 'moon_2', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (3, 'moon_3', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (4, 'moon_4', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (5, 'moon_5', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (6, 'moon_6', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (7, 'moon_7', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (8, 'moon_8', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (9, 'moon_9', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (10, 'moon_10', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (11, 'moon_11', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (12, 'moon_12', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (13, 'moon_13', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (14, 'moon_14', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (15, 'moon_15', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (16, 'moon_16', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (17, 'moon_17', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (18, 'moon_18', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (19, 'moon_19', 'this is a test script', 10, 55, false, false, 785412.254, NULL);
INSERT INTO public.moon VALUES (20, 'moon_20', 'this is a test script', 10, 55, false, false, 785412.254, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'star', 'this is test script', 78954, 854258, 7895423.580, false, false, 'planet1', NULL);
INSERT INTO public.planet VALUES (2, 'star_1', 'this is test script', 78954, 854258, 7895423.580, false, false, 'planet2', NULL);
INSERT INTO public.planet VALUES (3, 'star_2', 'this is test script', 78954, 854258, 7895423.580, false, false, 'planet3', NULL);
INSERT INTO public.planet VALUES (4, 'star_3', 'this is test script', 78954, 854258, 7895423.580, false, false, 'planet4', NULL);
INSERT INTO public.planet VALUES (5, 'star_4', 'this is a test script', 78954, 854258, 7895423.000, false, false, 'planet5', NULL);
INSERT INTO public.planet VALUES (6, 'star_5', 'this is a test script', 78954, 854258, 7895423.000, false, false, 'planet6', NULL);
INSERT INTO public.planet VALUES (7, 'star_6', 'this is a test script', 78954, 854258, 7895423.000, false, false, 'planet7', NULL);
INSERT INTO public.planet VALUES (8, 'star_7', 'this is a test script', 78954, 854258, 7895423.000, false, false, 'planet8', NULL);
INSERT INTO public.planet VALUES (9, 'star_8', 'this is a test script', 78954, 854258, 7895423.000, false, false, 'planet9', NULL);
INSERT INTO public.planet VALUES (10, 'star_9', 'this is a test script', 78954, 854258, 7895423.000, false, false, 'planet10', NULL);
INSERT INTO public.planet VALUES (11, 'star_10', 'this is a test script', 78954, 854258, 7895423.000, false, false, 'planet11', NULL);
INSERT INTO public.planet VALUES (12, 'star_11', 'this is a test script', 78954, 854258, 7895423.000, false, false, 'planet12', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'alpha', 'alphatype', 'this is a test script', 7, 478954.257, false, false, 78, NULL);
INSERT INTO public.star VALUES (4, 'beta', 'betatype', 'this is a test script', 8, 4784784.257, false, false, 88, NULL);
INSERT INTO public.star VALUES (5, 'zera', 'zeratype', 'this is a test script', 7, 477854.257, false, false, 78, NULL);
INSERT INTO public.star VALUES (6, 'lora', 'loratype', 'this is a test script', 7, 478854.257, false, false, 99, NULL);
INSERT INTO public.star VALUES (7, 'biga', 'bigatype', 'this is a test script', 6, 897854.257, false, false, 94, NULL);
INSERT INTO public.star VALUES (8, 'zero', 'zerotype', 'this is a test script', 7, 7854254.257, false, false, 92, NULL);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'sun_1', 'sun_1_type', 'this is test script', 4587953, 4587956, false, false, 874.000);
INSERT INTO public.sun VALUES (2, 'sun_2', 'sun_2_type', 'this is test script', 4587953, 4587956, false, false, 874.000);
INSERT INTO public.sun VALUES (3, 'sun_3', 'sun_3_type', 'this is test script', 4587953, 4587956, false, false, 874.000);
INSERT INTO public.sun VALUES (4, 'sun_4', 'sun_4_type', 'this is test script', 4587953, 4587956, false, false, 874.000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 4, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: sun sun_sun_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_sun_name_key UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
