--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    affiliation character varying(100) NOT NULL,
    email character varying(255)
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(4,1),
    mass integer,
    diameter integer,
    type character varying(255) NOT NULL,
    galaxy_uuid character varying(100)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(4,1) NOT NULL,
    mass integer,
    diameter integer,
    moon_serial_number character varying(100),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(4,1),
    mass integer,
    radius integer,
    type character varying(50) NOT NULL,
    planet_code character varying(100),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255),
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(4,1),
    mass integer NOT NULL,
    radius integer,
    spectral_type character varying(50) NOT NULL,
    star_identifier character varying(100),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (4, 'John Smith', 'Space Research Institute', 'john@example.com');
INSERT INTO public.astronomer VALUES (5, 'Alice Johnson', 'Galactic Observatory', 'alice@example.com');
INSERT INTO public.astronomer VALUES (6, 'Michael Wilson', 'Stellar Research Center', 'michael@example.com');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System', true, true, 999.0, 500000000, 100000, 'Spiral', '123e4567-e89b-12d3-a456-426614174000');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest spiral galaxy to the Milky Way', false, true, 995.0, 700000000, 150000, 'Spiral', '223e4567-e89b-12d3-a456-426614174000');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'The third-largest galaxy in the Local Group', false, true, 990.0, 300000000, 90000, 'Spiral', '323e4567-e89b-12d3-a456-426614174000');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'A spiral galaxy in the constellation Virgo', false, true, 290.0, 800000000, 50000, 'Spiral', '423e4567-e89b-12d3-a456-426614174000');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A classic spiral galaxy in the constellation Canes Venatici', false, true, 370.0, 700000000, 40000, 'Spiral', '523e4567-e89b-12d3-a456-426614174000');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A supergiant elliptical galaxy in the constellation Virgo', false, true, 550.0, 900000000, 200000, 'Elliptical', '623e4567-e89b-12d3-a456-426614174000');
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', false, true, 163.0, 300000000, 14000, 'Irregular', '723e4567-e89b-12d3-a456-426614174000');
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 'A dwarf galaxy near the Large Magellanic Cloud', false, true, 200.0, 150000000, 7000, 'Irregular', '823e4567-e89b-12d3-a456-426614174000');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'Luna', 'The Earth''s natural satellite', false, true, 384.0, 7, 3474, 'ABC123', 1);
INSERT INTO public.moon VALUES (5, 'Phobos', 'The larger and closer moon of Mars', false, true, 938.0, 1, 22, 'DEF456', 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon of Jupiter', false, true, 628.0, 15, 5262, 'GHI789', 3);
INSERT INTO public.moon VALUES (48, 'Luna', 'The Earth''s only natural satellite', false, true, 384.0, 734, 3474, 'DEF123', 1);
INSERT INTO public.moon VALUES (49, 'Europa', 'The smallest of the four Galilean moons orbiting Jupiter', false, true, 628.0, 480, 3121, 'GHI456', 5);
INSERT INTO public.moon VALUES (50, 'Titan', 'The largest moon of Saturn and the second-largest natural satellite in the Solar System', false, true, 125.0, 1345, 5150, 'JKL789', 3);
INSERT INTO public.moon VALUES (51, 'Ganymede', 'The largest moon of Jupiter and in the Solar System', false, true, 107.0, 1482, 5262, 'MNO101', 5);
INSERT INTO public.moon VALUES (52, 'Callisto', 'The second-largest moon of Jupiter, after Ganymede', false, true, 114.0, 1076, 4800, 'PQR111', 5);
INSERT INTO public.moon VALUES (53, 'Io', 'The innermost of the four Galilean moons of Jupiter', false, true, 421.0, 893, 3643, 'STU121', 5);
INSERT INTO public.moon VALUES (54, 'Enceladus', 'A small moon of Saturn known for its active geysers', false, true, 238.0, 108, 252, 'VWX131', 3);
INSERT INTO public.moon VALUES (55, 'Triton', 'The largest moon of Neptune', false, true, 354.0, 2140, 2700, 'YZA141', 10);
INSERT INTO public.moon VALUES (56, 'Larissa', 'A moon of Neptune', false, true, 940.0, 22, 97, 'BCD151', 11);
INSERT INTO public.moon VALUES (57, 'Miranda', 'A small and icy moon of Uranus', false, true, 130.0, 65, 470, 'CDE161', 12);
INSERT INTO public.moon VALUES (58, 'Charon', 'The largest moon of the dwarf planet Pluto', false, true, 195.0, 1590, 1212, 'EFG171', 6);
INSERT INTO public.moon VALUES (59, 'Phobos', 'The larger and innermost of Mars''s two moons', false, true, 937.0, 105, 22, 'FGH181', 2);
INSERT INTO public.moon VALUES (60, 'Deimos', 'The smaller and outermost of Mars''s two moons', false, true, 234.0, 22, 12, 'GHI191', 2);
INSERT INTO public.moon VALUES (61, 'Tethys', 'A moon of Saturn', false, true, 294.0, 617, 1062, 'HIJ201', 3);
INSERT INTO public.moon VALUES (62, 'Dione', 'A moon of Saturn', false, true, 377.0, 1102, 1120, 'IJK211', 3);
INSERT INTO public.moon VALUES (63, 'Rhea', 'The second-largest moon of Saturn', false, true, 527.0, 2309, 1528, 'JKL221', 3);
INSERT INTO public.moon VALUES (64, 'Iapetus', 'A moon of Saturn', false, true, 356.0, 1800, 1436, 'KLM231', 3);
INSERT INTO public.moon VALUES (65, 'Mimas', 'A moon of Saturn', false, true, 186.0, 380, 396, 'LMN241', 3);
INSERT INTO public.moon VALUES (66, 'Hyperion', 'A moon of Saturn', false, true, 148.0, 56, 270, 'MNO251', 3);
INSERT INTO public.moon VALUES (67, 'Phoebe', 'A moon of Saturn', false, true, 129.0, 828, 220, 'NOP261', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System', false, true, 77.0, 330, 2439, 'Terrestrial', 'ABC123', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun', false, true, 38.0, 4860, 6052, 'Terrestrial', 'DEF456', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun', true, true, 0.0, 5972, 6371, 'Terrestrial', 'GHI789', 1);
INSERT INTO public.planet VALUES (5, 'Mars', 'The fourth planet from the Sun', false, true, 225.0, 641, 3389, 'Terrestrial', 'DEF123', 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'The fifth planet from the Sun and the largest in the Solar System', false, true, 365.0, 1898600, 69911, 'Gas Giant', 'GHI456', 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 'The sixth planet from the Sun and the second-largest in the Solar System', false, true, 746.0, 568460, 58232, 'Gas Giant', 'JKL789', 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'The seventh planet from the Sun', false, true, 154.0, 86832, 25362, 'Ice Giant', 'MNO101', 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 'The eighth and farthest planet from the Sun', false, true, 253.0, 102430, 24622, 'Ice Giant', 'PQR111', 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'The first Earth-size exoplanet discovered within the habitable zone of another star', true, true, NULL, NULL, NULL, 'Terrestrial', 'STU121', 5);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'An exoplanet that orbits the solar analog star HD 209458 in the constellation Pegasus', false, true, NULL, NULL, NULL, 'Gas Giant', 'VWX131', 5);
INSERT INTO public.planet VALUES (12, 'PSR B1257+12 c', 'An exoplanet orbiting the pulsar PSR B1257+12', false, true, NULL, NULL, NULL, 'Terrestrial', 'YZA141', 6);
INSERT INTO public.planet VALUES (13, 'Gliese 581g', 'An exoplanet orbiting the red dwarf star Gliese 581', true, true, NULL, NULL, NULL, 'Terrestrial', 'BCD151', 6);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1d', 'An exoplanet orbiting the ultra-cool dwarf star TRAPPIST-1', true, true, NULL, NULL, NULL, 'Terrestrial', 'CDE161', 7);
INSERT INTO public.planet VALUES (15, 'WASP-12b', 'A hot Jupiter exoplanet orbiting the star WASP-12', false, true, NULL, NULL, NULL, 'Gas Giant', 'EFG171', 7);
INSERT INTO public.planet VALUES (16, '51 Pegasi b', 'The first exoplanet discovered orbiting a Sun-like star', false, true, NULL, NULL, NULL, 'Gas Giant', 'FGH181', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System', false, true, 0.0, 1989000, 696340, 'G2V', 'ABC123', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest star to the Solar System', false, true, 4.2, 0, 0, 'M5.5', 'DEF456', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky', false, true, 8.6, 2, 2, 'A1V', 'GHI789', 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant star in the constellation Orion', false, true, 643.0, 15, 1200, 'M1-2Ia-Iab', '456ABC', 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'The primary star of the Alpha Centauri star system', false, true, 4.4, 1, 1, 'G2V', '789DEF', 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 'The secondary star of the Alpha Centauri star system', false, true, 4.4, 1, 1, 'K1V', '101GHI', 2);
INSERT INTO public.star VALUES (7, 'Vega', 'The brightest star in the constellation Lyra', false, true, 25.0, 2, 2, 'A0V', '111JKL', 3);
INSERT INTO public.star VALUES (8, 'Arcturus', 'A red giant star in the constellation Boötes', false, true, 36.7, 1, 25, 'K1.5IIIFe-', '121MNO', 3);
INSERT INTO public.star VALUES (9, 'Rigel', 'The brightest star in the constellation Orion', false, true, 772.0, 21, 70, 'B8Ia', '131PQR', 4);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 6, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 67, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 16, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 9, true);


--
-- Name: astronomer astronomer_email_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_email_key UNIQUE (email);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


--
-- Name: galaxy galaxy_galaxy_uuid_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_uuid_key UNIQUE (galaxy_uuid);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_serial_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_serial_number_key UNIQUE (moon_serial_number);


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
-- Name: planet planet_planet_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_code_key UNIQUE (planet_code);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_identifier_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_identifier_key UNIQUE (star_identifier);


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

