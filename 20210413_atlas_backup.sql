--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 13.2

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
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: destinations; Type: TABLE; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

CREATE TABLE public.destinations (
    id bigint NOT NULL,
    longitude numeric NOT NULL,
    latitude numeric NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    spinner_friendly boolean DEFAULT false NOT NULL,
    lake boolean DEFAULT false NOT NULL,
    less_than_one_hour boolean DEFAULT false NOT NULL,
    one_to_three_hours boolean DEFAULT false NOT NULL,
    greater_than_three_hours boolean DEFAULT false NOT NULL,
    car_friendly boolean DEFAULT false NOT NULL,
    hike_in boolean DEFAULT false NOT NULL,
    allows_dogs boolean DEFAULT false NOT NULL,
    dogs_off_leash boolean DEFAULT false NOT NULL,
    season_spring boolean DEFAULT false NOT NULL,
    season_summer boolean DEFAULT false NOT NULL,
    season_fall boolean DEFAULT false NOT NULL,
    season_winter boolean DEFAULT false NOT NULL,
    car_camp boolean DEFAULT false NOT NULL,
    backpack_camp boolean DEFAULT false NOT NULL,
    fee boolean DEFAULT false NOT NULL,
    ice_fishing boolean DEFAULT false NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.destinations OWNER TO "ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user";

--
-- Name: destinations_id_seq; Type: SEQUENCE; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

CREATE SEQUENCE public.destinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.destinations_id_seq OWNER TO "ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user";

--
-- Name: destinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

ALTER SEQUENCE public.destinations_id_seq OWNED BY public.destinations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO "ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user";

--
-- Name: destinations id; Type: DEFAULT; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

ALTER TABLE ONLY public.destinations ALTER COLUMN id SET DEFAULT nextval('public.destinations_id_seq'::regclass);


--
-- Data for Name: destinations; Type: TABLE DATA; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

COPY public.destinations (id, longitude, latitude, name, description, spinner_friendly, lake, less_than_one_hour, one_to_three_hours, greater_than_three_hours, car_friendly, hike_in, allows_dogs, dogs_off_leash, season_spring, season_summer, season_fall, season_winter, car_camp, backpack_camp, fee, ice_fishing, inserted_at, updated_at) FROM stdin;
1	-105.6929	39.8763	Heart Lake	Rumors of big Cutties, probably early in season. ~ 2.5 hr hike. Latest notes: 20190909	t	t	t	f	f	t	t	t	t	t	t	t	f	f	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
2	-105.6896	39.8714	Rogers Lake	Good sized Cutties, ~2.5 hr hike. Latest notes: 20190909	t	t	t	f	f	t	t	t	t	t	t	t	f	f	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
3	-105.425722	40.191833	Dry St Vrain Creek	40 min hike, few people	t	f	f	t	f	f	t	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
4	-105.6869	40.6042	Browns Lake	Off trail hike, not exclusive camping	t	t	f	t	t	f	t	t	t	f	t	t	f	f	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
5	-106.6294	39.4946	Nolan Lake	3 mile hike, pretty chill camping	t	t	f	f	t	t	t	t	t	f	t	t	f	f	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
6	-105.952313	40.147219	Willow Creek Reservoir	State park, ice fishing	t	t	f	t	f	t	f	t	f	t	t	t	t	t	f	t	t	2021-03-05 01:18:37	2021-03-05 01:18:37
7	-105.754959	40.112731	Arapahoe Creek	Feeder creek to L Granby. Few but big trout	t	f	f	t	f	t	f	t	t	f	t	t	f	t	f	t	f	2021-03-05 01:18:37	2021-03-05 01:18:37
8	-105.744032	40.105752	Monarch Lake	Alpine lake, upstream of L Granby. Supposedly big trout. SUP friendly	t	t	f	t	f	t	f	t	f	f	t	t	f	t	f	t	f	2021-03-05 01:18:37	2021-03-05 01:18:37
9	-105.661813	39.976251	Jasper Lake	Indian Peaks backpack/fish	t	t	t	f	f	f	t	t	t	f	t	t	f	f	t	t	f	2021-03-05 01:18:37	2021-03-05 01:18:37
10	-105.616318	39.94901	Lost Lake	Quick hike, lots of people	t	t	t	f	f	t	t	t	f	t	t	t	t	t	t	t	t	2021-03-05 01:18:37	2021-03-05 01:18:37
11	-105.605364	39.953427	Middle Boulder Creek	Quick car camp/fishing	f	f	t	f	f	f	t	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
12	-105.604523	40.068575	South St Vrain Creek	Feeder stream, full of brookies. Get it early in the season.	f	f	t	f	f	t	t	t	t	f	t	t	f	f	f	t	f	2021-03-05 01:18:37	2021-03-05 01:18:37
13	-105.578156	40.011311	Rainbow Lakes	Quick hike, some pople	t	t	t	f	f	t	t	t	t	f	t	t	f	f	t	t	f	2021-03-05 01:18:37	2021-03-05 01:18:37
14	-105.524471	40.130052	Middle St Vrain Creek	Only have to walk to first meadow, fish back. Latest notes: 20190824	f	f	t	f	f	t	t	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
15	-105.475222	40.380333	Big Thompson	\N	t	f	t	f	f	t	f	f	f	t	t	t	t	f	f	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
16	-105.361226	39.018824	South Platte @ Happy Meadows CG	2 hr Hike from trailhead to good fishing	t	f	f	t	f	t	t	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
17	-105.368076	39.06463	South Platte Downstream of CG	Hour-ish hike, big drop down the canyon	t	f	f	t	f	f	t	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
18	-105.389796	38.95719	11 Mile Canyon	Lots of people. Dont have to drive all the way back in. Camp In NF land nearby	t	f	f	t	f	t	f	t	f	t	t	t	t	t	f	t	f	2021-03-05 01:18:37	2021-03-05 01:18:37
19	-105.809379	39.036274	Badger Basin SWA	South Platte cattleland. Big fish. Bring bug spray. Multiple parking spots	t	f	f	t	f	t	f	t	t	t	t	t	t	f	f	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
20	-105.8663	39.0814	Tomahawk SWA Parking 01	South Platte btwn Hartsel & Fairplay. Priority. Walk downstream, then drop down ridge. Downstream is stocked	t	f	f	t	f	t	f	t	t	t	t	t	t	f	f	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
21	-105.865	39.0923	Tomahawk SWA Parking 02	South Platte btwn Hartsel & Fairplay	t	f	f	t	f	t	f	t	t	t	t	t	t	f	f	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
22	-105.8508	39.0797	Tomahawk SWA Parking 03	South Platte btwn Hartsel & Fairplay	t	f	f	t	f	t	f	t	t	t	t	t	t	f	f	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
23	-105.8474	39.0807	Tomahawk SWA Parking 04	South Platte btwn Hartsel & Fairplay	t	f	f	t	f	t	f	t	t	t	t	t	t	f	f	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
24	-105.4027	40.87936	North Fork Poudre River	Entrance, Need to 4x4 back into trailhead	t	f	f	t	f	f	t	t	t	t	t	t	f	f	f	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
25	-105.5612	40.8901	Cherokee Park	Long drive for one day. Latest notes: 20190825	t	f	f	t	f	f	t	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
26	-105.57883	40.86323	Creedmore Lakes	Went 20200525. Small-ish trout, a good amount of people	t	t	f	t	f	f	t	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
27	-105.661811	40.54268	Emmaline Lake	Easy Hike for first half, camping, then harder hike to lake	t	t	f	t	f	t	t	t	t	f	t	t	f	f	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
28	-105.584462	40.576429	Emmaline Lake Trailhead	Easy Hike for first half, camping, then harder hike to lake	t	t	f	t	f	t	t	t	t	f	t	t	f	f	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
29	-105.6735	39.9214	Forest Lakes	Access off Rollins Pass Road for shorter hike	t	t	f	t	f	t	t	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
30	-105.6753	39.8975	Crater Lakes	\N	t	t	f	t	f	t	t	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
31	-107.0907	39.8999	South Fork Derby Creek	Along trail/road to Mackinaw Lake. Road is a bit of a beast.	f	f	f	f	t	f	t	t	t	f	t	t	f	f	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
32	-106.145433	39.539468	Officers Gulch	Ice fishing/ quick trout fishing	t	t	f	t	f	t	f	t	f	t	t	t	t	f	f	f	t	2021-03-05 01:18:37	2021-03-05 01:18:37
33	-106.329387	39.081412	Twin Lakes	Ice fishing, lake trout, tough to find	t	t	f	t	f	t	f	t	f	t	t	t	t	f	f	f	t	2021-03-05 01:18:37	2021-03-05 01:18:37
34	-106.3752	39.269565	Tourquise Lake	Ice Fishing, lake trout on the backside if you wanna hike it	t	t	f	t	f	t	f	t	f	t	t	t	t	f	f	f	t	2021-03-05 01:18:37	2021-03-05 01:18:37
35	-105.904914	38.98422	Antero Reservoir	Ice Fishing, flat basin, can be tough to fish	t	t	f	t	f	t	f	t	f	t	t	t	t	f	f	f	t	2021-03-05 01:18:37	2021-03-05 01:18:37
36	-105.610304	39.230195	Tarryall Reservoir	Ice Fishing keep to weedline right off landings	t	t	f	t	f	t	f	t	f	t	t	t	t	f	f	f	t	2021-03-05 01:18:37	2021-03-05 01:18:37
37	-105.46596	40.47742	Dunraven Trailhead	North Fork of Big Thompson	t	f	t	f	f	t	t	t	t	f	t	t	f	f	t	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
38	-106.862455	40.499072	Steamboat - North Town	Some big holes at entrance and upstream. Latest notes: 20190829	t	f	f	t	f	t	f	t	f	f	t	t	f	f	f	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
39	-106.828921	40.460783	Steamboat - South Town	Fish the bend and the riffles upstream. Latest notes: 20190829	t	f	f	t	f	t	f	t	f	f	t	t	f	f	f	f	f	2021-03-05 01:18:37	2021-03-05 01:18:37
40	-106.805942	40.299686	Sarvis Creek SWA	Water downstream, as soon as it is public off road. Latest notes: 20190829	t	f	f	t	f	t	f	t	f	f	t	t	f	t	f	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
41	-106.654085	40.454108	Lost Lake	Got into big Cutties. Latest notes: 20190829	t	t	f	t	f	f	t	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
42	-105.442028	40.12425	Ceran St Vrain	Trail along river, few fishermen	t	f	t	f	f	t	t	t	t	f	t	t	f	f	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
43	-105.387056	40.27975	West Fork Little Thompson River	Tailwater of Button Rock Reservoir	t	f	t	f	f	t	t	t	f	t	t	t	t	f	f	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
44	-105.6841	40.5802	Comanche Lake	Bings kids caught lunkers on 9/29/19 with salmon eggs. Cuts and Browns	t	t	f	t	f	f	t	t	t	f	t	t	f	f	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
45	-105.3271	39.631809	Evergreen Lake	Ice fishing, havent tried yet	t	t	f	t	f	t	f	t	t	t	t	t	t	f	f	f	t	2021-03-05 01:18:38	2021-03-05 01:18:38
46	-105.862119	39.454122	Jefferson Lake	Lakers, Ice fishing	t	t	f	t	f	t	f	t	t	t	t	t	t	f	t	f	t	2021-03-05 01:18:38	2021-03-05 01:18:38
47	-105.3713457	39.9374013	Gross Reservoir - East side	Hike-to fishing, havent actaully fished it yet	t	t	t	f	f	t	t	t	t	t	t	t	t	f	t	f	t	2021-03-05 01:18:38	2021-03-05 01:18:38
48	-105.3691022	39.9485766	Gross Reservoir - West side	Hike-to fishing, havent actaully fished it yet	t	t	t	f	f	t	t	t	t	t	t	t	t	f	t	f	t	2021-03-05 01:18:38	2021-03-05 01:18:38
49	-105.344104	39.941808	South Boulder Creek - Gross Res	Short hike, some people	f	f	t	f	f	t	t	t	f	t	t	t	t	f	f	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
50	-105.7507	39.3057	Tarryall River. Public Access. Gorge	Small chunk of public access. Paved parking. Fish the gorge. 	t	f	f	t	f	t	f	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
51	-105.6586	39.2528	Tarryall River SWA	Water access N or Reservoir	t	f	f	t	f	t	f	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
52	-105.6261	39.2374	Terryall River N Gate Access	Look for green gate	t	f	f	t	f	t	f	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
53	-105.6202	39.2365	Terryall River S Gate Access	Look for green gate	t	f	f	t	f	t	f	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
54	-105.5535	39.1981	Terryall River, Public Access. N of fish resort	Ute Trailhead. Upstream of Fishing Camp, big fish potential	t	f	f	t	f	t	f	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
55	-105.5201	39.1739	Terryall River, Public Access. Corner of Public	Small block of public to acces, follow and stay inside fences	t	f	f	t	f	t	f	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
56	-105.4801	39.1475	Terryall River, Public Access	Park off forest road. Can also pay to park in Twin Eagles CG	t	f	f	t	f	t	f	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
57	-105.4635	39.1334	Terryall River, Public Access	Park off forest road. Can also pay to park in Twin Eagles CG	t	f	f	t	f	t	f	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
58	-105.4517	39.1241	4X4 Terryall River Access. FR 204	Roughly 3/4 mile down the Forest Road	t	f	f	t	f	f	f	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
59	-105.176708	40.183374	Pella Crossing	From shore/SUP fishing. Go during week, earlier in the seaon	t	t	t	f	f	t	f	t	f	t	t	t	t	f	f	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
60	-105.132042	40.386514	Boedecker Lake	Close to Loveland, crappies at east end in the spring? 	t	t	t	f	f	t	f	t	f	t	t	t	t	f	f	f	t	2021-03-05 01:18:38	2021-03-05 01:18:38
62	-105.5056	39.2993	North Fork Lost Creek	Backpacking fishing access. Tons of brookies	t	f	f	t	f	t	t	t	t	t	t	t	f	f	t	f	t	2021-03-05 01:18:38	2021-03-05 01:18:38
63	-105.7386	39.0179	Badger Basin SWA Access	Confluence of lots of water	t	f	f	t	f	t	t	t	t	t	t	t	f	f	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
64	-105.7091	39.0087	Badger Basin SWA Access	\N	t	f	f	t	f	t	t	t	t	t	t	t	f	f	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
65	-105.5063	39.2839	Lost Creek - Fish all along the road	\N	t	f	f	t	f	t	t	t	t	t	t	t	f	f	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
66	-106.0561	39.0817	Rough and Tumbling Creek	Alpine plains headwaters - have not fished yet	t	f	f	t	f	t	t	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
67	-106.003728	39.221925	The Beach - Fairplay	South Platte and Westerman Ditch dump into the res, good dumb fish	t	f	f	t	f	t	f	t	f	t	t	t	t	t	f	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
68	-105.353986	39.026353	Wildcat Canyon - South Platte	2.2 Mile hike in (~75 mins) Good fishing just about everywhere	t	f	f	t	f	t	t	t	t	t	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
69	-106.8665	40.7355	Elk River	https://thecatchandthehatch.com/3-of-colorados-best-kept-fly-fishing-secrets/ Mid July thru fall	t	f	f	f	t	t	f	t	f	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
70	-106.414537	38.803688	Lost Lake - Cottonwood Pass	1.2 mile hike in. Fishing in Backcountry Book. 6-16" Cutts	t	t	f	t	f	t	t	t	t	f	t	t	t	f	t	f	t	2021-03-05 01:18:38	2021-03-05 01:18:38
71	-107.0447	40.1607	Allen Basin Reservoir	Rainbows	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
72	-107.287	40.0474	Anderson Reservoir	Can freeze out. Stocked with Cutts/ Fishing is best early, before lilly pads take over	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
73	-107.5498	39.9652	Bailey Lake	12" Brookies. Tigers	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
74	-107.6474	39.9771	Big Beaver Reservoir	Stocked Rainbows and Cutts. Produces Lunkers	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
75	-107.2802	40.0156	Big Fish Creek	Brookies. Rainbows. Cutts	t	f	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
76	-107.2896	39.9896	Big Fish Lake	12" Brookies. Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
77	-107.2212	39.9922	Coffin Lake	Stubborn Cutts. ~16"	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
78	-107.2396	39.9966	Crescent Lake	Many 5-7" Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
79	-107.0559	40.1728	Crosho Lake	Greyling and Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
80	-107.2289	40.0677	Deep Lake	12" Brookies	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
81	-107.22	40.0669	East Lost Lake	~16" Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
82	-107.3713	39.9964	Guthrie Lake	Not stocked regularily. Brookies and Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
83	-107.2093	39.99	Little Trappers Lake	Swampy shore, bring waders	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
84	-107.4167	39.9777	Marvine Creek	\N	t	f	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
85	-107.3743	39.9402	Marvine Lake	Willow Choked Shorelines. 10-12" Brookies. Bigger Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
86	-107.3471	39.9789	Mary Loch Lake	Brookies and Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
87	-107.2039	40.0288	McGuinnis Lake	Brookies and Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
88	-107.3396	40.0271	Mirror Lake	Small Brookies. Tigers	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
89	-107.4179	39.9539	Murphy Lake	Stocked with Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
90	-107.2383	40.0125	N Fork White River	Plenty of Brookies, Rainbows, Cutts	t	f	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
91	-107.5236	39.9276	Peltier Lake	Brookies	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
92	-107.3826	39.9499	Pine Isle Lake	Best fish early, still snow around banks. 12-13" Rainbows	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
93	-107.6946	39.9501	Public Access White River	\N	t	f	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
94	-107.3896	39.9525	Ruby Lake	16" Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
95	-107.3658	40.0405	Sable Lake	12-15" Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
96	-107.3341	40.034	Shamrock Lake	Smaller Brookies	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
97	-107.2114	40.0342	Skinny Fish Lake	Bigger Brookies, need SUP or float to get to them	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
98	-107.7056	39.948	Sleepy Cat Ponds & River Access	\N	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
99	-107.4091	39.963	Slide Lake	Brookies. Rainbows. Some Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
100	-107.545	39.9658	Swede Lake	Brookies. Tiger. Recently Stocked with Cuts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
101	-107.2299	39.9799	Trappers Lake	Fish North End (shallower) 13-15" Nearly Pure Strain Colorado River Cutts. 15" Brookies	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
102	-107.2085	40.0401	Upper Skinny Fish Lake	Cutts	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
103	-107.2366	40.073	West Lost Lake	Stubborn 12-15" Brookies	t	t	f	f	t	t	f	t	t	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
104	-106.896955	40.582234	Christina SWA - Elk River	https://cpw.state.co.us/learn/Maps/ChristinaSWA_geo.pdf look into access of the south portion	t	f	f	f	t	t	f	t	f	f	t	t	f	t	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
105	-106.995159	40.84148	Hans Peak Lake	Fee area, good fish, check adventure notes for specs	t	t	f	f	t	t	f	t	f	t	t	t	t	t	f	t	t	2021-03-05 01:18:38	2021-03-05 01:18:38
106	-106.888617	40.791189	Pearl Lake State Park	State Park, only fished one evening	t	t	f	f	t	t	f	t	f	t	t	t	t	t	f	t	t	2021-03-05 01:18:38	2021-03-05 01:18:38
107	-107.85963	38.77112	Gunnison River Spot 01	Fished on 20201010, tough day, but holds fish. On the cusp of too burly for car.	t	f	f	f	t	t	f	t	t	t	t	t	f	t	f	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
108	-107.88021	38.76632	Gunnision River Spot 02	Saw when fishing other spots, looked solid. 6+ fisherman in afternoon.	t	f	f	f	t	t	f	t	t	t	t	t	f	t	f	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
109	-107.85490	38.77201	Gunnison River Spot 03	Just saw from arial maps, seemed promising	t	f	f	f	t	t	f	t	t	t	t	t	f	t	f	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
110	-107.85342	38.77771	Gunnison River Spot 04	Just saw from arial maps, seemed promising	t	f	f	f	t	t	f	t	t	t	t	t	f	t	f	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
111	-106.174212	39.414071	Clinton Gulch Dam Reservoir	Rumors of nice cutts. If ice fishing, go early in the season, before the snow makes travel tough.	t	t	f	t	f	t	f	t	t	t	t	t	f	f	f	f	t	2021-03-05 01:18:38	2021-03-05 01:18:38
112	-105.36513	39.317011	Wellinton Lake (Private)	Private lake, catch/release. Fees for access and parking	t	t	f	t	f	t	f	t	f	t	t	t	t	t	t	t	t	2021-03-05 01:18:38	2021-03-05 01:18:38
113	-105.39038	39.496283	Davis Pond (Staunton State Park)	Small pond, < 1 mile hike in. Quiet ice fishing	t	t	f	t	f	t	f	t	f	t	t	t	t	t	t	t	t	2021-03-05 01:18:38	2021-03-05 01:18:38
114	-105.517344	38.937268	Eleven Mile Reservoir - Marina Area	Good ice fishing in 2019, off northern campgrounds of east shore.	t	t	f	t	f	t	f	t	f	t	t	t	t	t	t	t	t	2021-03-05 01:18:38	2021-03-05 01:18:38
115	-105.563907	38.947531	Eleven Mile Reservoir - Marina Area	Eleven Mile Reservoir - Marina Area,Good ice fishing early in 2019	t	t	f	t	f	t	f	t	f	t	t	t	t	t	t	t	t	2021-03-05 01:18:38	2021-03-05 01:18:38
116	-105.201564	40.061532	Twin Lakes - Boulder	Only heard of it, have not been	t	t	t	f	f	t	f	t	t	t	t	t	t	f	t	f	t	2021-03-05 01:18:38	2021-03-05 01:18:38
117	-106.100286	39.385325	Blue Lakes	Saw on map, have not been. No ice fishing, no winter maintenance to lake	t	t	f	t	f	t	f	t	f	t	t	t	f	f	t	f	f	2021-03-05 01:18:38	2021-03-05 01:18:38
61	-105.3504	40.76702	Lone Pine Creek	Small creek above Poudre Canyon - have not fished yet	f	f	f	t	f	t	t	t	t	t	t	t	f	f	t	f	f	2021-03-05 01:18:38	2021-03-06 04:07:10
119	-106.770942	38.725357	Taylor River @ Altmont	Havent fished. Only saw it on the map, looks interesting.	t	f	f	f	t	t	f	t	f	f	t	t	f	t	f	f	f	2021-03-06 04:11:05	2021-03-06 04:11:24
120	-106.294124	40.766410	Diamond J SWA	Havent fished, only saw on map, looked interesting\r\nhttps://cpw.state.co.us/learn/Maps/DiamondJSWA_geo.pdf	t	f	f	t	f	t	f	t	t	t	t	t	f	t	f	f	f	2021-03-06 04:14:43	2021-03-06 04:14:43
121	-106.705051	42.561702	Grey Reef	Hot spot for spawning rainbows in the spring (March/April)	f	t	f	f	t	t	f	f	f	t	f	f	f	f	f	f	f	2021-03-13 00:06:15	2021-03-13 00:06:15
122	-106.510209	39.988133	Pumphouse	Heard its a good spot in the spring, have yet to confirm	t	f	f	t	f	t	f	t	t	t	t	t	f	t	f	t	f	2021-03-24 00:58:33	2021-03-24 00:58:33
123	-104.993808	40.165382	Blue Huron Reservoir @ St Vrain State Park	Heard some online chatter that its a good spot in the sring	t	t	t	f	f	t	f	t	f	t	f	f	f	f	f	t	f	2021-03-26 19:32:58	2021-03-26 19:32:58
124	-105.170985	40.636354	Watson Lake SWA	Probably best spring/summer. No river access. https://cpw.state.co.us/swa/Watson%20Lake%20SWA	t	t	t	f	f	t	f	t	f	t	t	t	f	f	f	f	f	2021-03-26 19:36:16	2021-03-26 19:36:16
125	-105.402610	40.879314	North Fork Poudre @ Cherokee Park	Gate opens May 1, can drive back to the parking area with truck	t	f	f	t	f	f	f	t	t	t	t	t	f	t	t	f	f	2021-03-27 15:50:58	2021-03-27 15:50:58
126	-105.095977	40.604382	Poudre River @ Shields Access	Good spring spot	t	f	t	f	f	t	f	t	f	t	t	t	f	f	f	f	f	2021-03-27 15:56:00	2021-03-27 15:56:00
127	-106.938725	39.653408	Eagle River @ Gypsom Ponds	SWA, Dogs NOT allowed March 15 - June 15. Plenty of holes to fish. See 20210402 report.	t	f	f	t	f	t	f	t	f	t	t	t	f	t	f	f	f	2021-04-05 15:19:18	2021-04-05 15:19:18
128	-106.978671	39.655150	Eagle River @ Nation Forest Land	Another option, dog friendly all the time. See report from 20210402	t	f	f	t	f	t	f	t	t	t	t	t	f	t	f	f	f	2021-04-05 15:22:25	2021-04-05 15:22:25
130	-105.714681	38.367585	Arkansas River @ Canyon Trading Post	A lot of rocks and structure. Rebecca hooked into two last time. Water was a bit high, 375 cfs	t	f	f	t	f	t	f	t	t	t	t	t	f	t	f	t	f	2021-04-11 21:49:07	2021-04-11 21:49:07
129	-105.522755	38.447391	Arkansas River @ Pinnacle Rock	Didnt have a lot of success the first time 20210410, seemed to be moving pretty fast (375 cfs)	t	f	f	t	f	t	f	t	t	t	t	t	f	t	f	f	f	2021-04-11 21:46:04	2021-04-11 21:49:22
131	-106.488414	40.003429	Colorado River @ Gore Canyon	Look for sunny spots when fishing. This left turn is ~1.5 miles, told it was a good starting point. Suggested to fish mid to late April.	t	f	f	t	f	t	t	t	t	t	t	t	f	t	f	t	f	2021-04-11 22:02:22	2021-04-11 22:02:22
132	-104.709466	38.264635	Arkansas Tailwater	Good winter spot, heard you could fish dries in ~Feb. Dog status unknown.\r\nhttps://cpw.state.co.us/placestogo/parks/LakePueblo/Documents/ValcoPondsMap.pdf.	f	f	f	t	f	t	f	f	f	t	f	f	t	f	f	t	f	2021-04-11 22:06:12	2021-04-11 22:06:12
133	-105.3226	39.9557	Boulder Creek @ Ethel Harrold TH	Roughly 1 mile walk-in access. Was told to go there mid spring (Late March into April)	f	f	t	f	f	t	t	t	f	t	t	f	f	f	f	f	f	2021-04-11 22:19:52	2021-04-11 22:19:52
134	-106.850673	40.493543	Yampa River @ Steamboat	Open all through town. Good starting early April, all through fall, water levels pending	f	f	f	f	t	t	f	t	f	t	t	t	f	t	f	f	f	2021-04-13 13:43:44	2021-04-13 13:43:44
135	-106.824671	40.288798	Yampa River Tailwater	They close the road in the winter, hike/bike/skin access only. Also good in SWA downriver	f	f	f	f	t	t	f	t	f	t	t	t	t	f	f	f	f	2021-04-13 14:19:00	2021-04-13 14:19:00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

COPY public.schema_migrations (version, inserted_at) FROM stdin;
20200915175644	2021-03-05 01:18:05
20200921165952	2021-03-05 01:18:05
\.


--
-- Name: destinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

SELECT pg_catalog.setval('public.destinations_id_seq', 135, true);


--
-- Name: destinations destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO "ec9f8fd3-3d97-4f80-8ab0-06bc2ca2c652-user";


--
-- PostgreSQL database dump complete
--

