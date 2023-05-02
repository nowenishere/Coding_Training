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
    name character varying(20) NOT NULL,
    galaxy_type character varying(20),
    age_in_millions_of_years numeric(6,1),
    distance_from_earth_mill_lightyears numeric(6,1),
    number_of_stars_in_billions integer
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
    name character varying(20) NOT NULL,
    planet_id integer,
    has_atmosphere boolean,
    color text
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--


CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer,
    has_stars boolean,
    number_of_stars integer
);




ALTER TABLE public.nebula OWNER TO freecodecamp;


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--


CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--


ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;




--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--


CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    has_life boolean,
    planet_type text
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
    name character varying(20) NOT NULL,
    galaxy_id integer,
    has_planets boolean,
    nebula_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);




--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);




--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);




--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);




--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);




--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--


INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 10000.0, 2.5, 1000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 10000.0, 2.5, 1000);
INSERT INTO public.galaxy VALUES (3, 'Cartwheel', 'lenticular', NULL, 500.0, 3);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'starburst', NULL, 12.0, 30);
INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', 'spiral seyfert', NULL, 52.0, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'peculiar', NULL, 31.1, 100);




--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--


INSERT INTO public.moon VALUES (1, 'Europa', 9, false, 'grey');
INSERT INTO public.moon VALUES (2, 'Titan', 4, true, 'yellow');
INSERT INTO public.moon VALUES (3, 'Triton', 8, true, 'grey');
INSERT INTO public.moon VALUES (4, 'Io', 9, true, 'grey');
INSERT INTO public.moon VALUES (5, 'Callisto', 9, true, 'dark grey');
INSERT INTO public.moon VALUES (6, 'Amalthea', 9, false, 'red');
INSERT INTO public.moon VALUES (7, 'Jupiter I', 9, false, 'yellow');
INSERT INTO public.moon VALUES (8, 'Mimas', 4, false, 'grey');
INSERT INTO public.moon VALUES (9, 'Iapetus', 4, false, 'grey');
INSERT INTO public.moon VALUES (10, 'Thebe', 9, false, 'grey');
INSERT INTO public.moon VALUES (11, 'Metis', 9, false, 'grey');
INSERT INTO public.moon VALUES (12, 'Enceladus', 4, false, 'grey');
INSERT INTO public.moon VALUES (13, 'Ganymede', 9, false, 'grey');
INSERT INTO public.moon VALUES (14, 'Dione', 4, false, 'grey');
INSERT INTO public.moon VALUES (15, 'Tethys', 4, false, 'grey');
INSERT INTO public.moon VALUES (16, 'Himalia', 9, false, 'grey');
INSERT INTO public.moon VALUES (17, 'Elara', 9, false, 'dark grey');
INSERT INTO public.moon VALUES (18, 'Charon', 5, false, 'grey');
INSERT INTO public.moon VALUES (19, 'Oberon', 10, false, 'grey');
INSERT INTO public.moon VALUES (20, 'Titania', 10, false, 'dark drey');




--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--


INSERT INTO public.nebula VALUES (1, 'Horsehead', 1, true, 1);
INSERT INTO public.nebula VALUES (2, 'Crab', 1, true, 2);
INSERT INTO public.nebula VALUES (3, 'Cats Eye', 1, true, 1);




--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--


INSERT INTO public.planet VALUES (1, 'Proxima Centauri B', 6, false, 'earth exoplanet');
INSERT INTO public.planet VALUES (2, 'Earth', 1, true, 'terrestrial');
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 'terrestrial');
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, 'gas giant');
INSERT INTO public.planet VALUES (5, 'Pluto', 1, false, 'dwarf planet');
INSERT INTO public.planet VALUES (6, 'Mercury', 1, false, 'terrestrial');
INSERT INTO public.planet VALUES (7, 'Mars', 1, false, 'rocky');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 'ice giant');
INSERT INTO public.planet VALUES (9, 'Jupiter', 1, false, 'gas giant');
INSERT INTO public.planet VALUES (10, 'Uranus', 1, false, 'ice giant');
INSERT INTO public.planet VALUES (11, 'Electra C', 3, false, 'super earth');
INSERT INTO public.planet VALUES (12, 'Sirius A', 5, false, 'neptunian');
INSERT INTO public.planet VALUES (13, 'Rigel D', 4, false, 'terrestrial');




--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--


INSERT INTO public.star VALUES (1, 'Sol', 1, true, NULL);
INSERT INTO public.star VALUES (2, 'Crab 1', 1, false, 2);
INSERT INTO public.star VALUES (3, 'Electra', 1, false, NULL);
INSERT INTO public.star VALUES (4, 'Rigel', 1, false, NULL);
INSERT INTO public.star VALUES (5, 'Sirius', 1, false, NULL);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, true, NULL);




--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--


SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);




--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--


SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);




--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--


SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);




--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--


SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);




--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--


SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);




--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);




--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);




--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);




--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);




--
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);




--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);




--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);




--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);




--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);




--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);




--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);




--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);




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
-- Name: star star_nebula_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--


ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_nebula_id_fkey FOREIGN KEY (nebula_id) REFERENCES public.nebula(nebula_id);




--
-- PostgreSQL database dump complete
--


