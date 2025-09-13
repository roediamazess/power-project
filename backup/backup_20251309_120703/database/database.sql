--
-- PostgreSQL database dump
--

\restrict oZeJ3MDbU9Rn5EPbJ5nNxfhevCggkHPnz6RxizG6k1Kvy6qAjiO7ADMqUqVAjJw

-- Dumped from database version 14.19
-- Dumped by pg_dump version 14.19

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
-- Name: activities; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.activities (
    id bigint NOT NULL,
    project_id character varying(255),
    no integer NOT NULL,
    information_date date NOT NULL,
    user_position character varying(255) NOT NULL,
    department character varying(255) NOT NULL,
    application character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    description text NOT NULL,
    action_solution text,
    due_date date,
    status character varying(255) DEFAULT 'Open'::character varying NOT NULL,
    cnc_number character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT activities_application_check CHECK (((application)::text = ANY ((ARRAY['Power FO'::character varying, 'My POS'::character varying, 'My MGR'::character varying, 'Power AR'::character varying, 'Power INV'::character varying, 'Power AP'::character varying, 'Power GL'::character varying, 'Keylock'::character varying, 'PABX'::character varying, 'DIM'::character varying, 'Dynamic Room Rate'::character varying, 'Channel Manager'::character varying, 'PB1'::character varying, 'Power SIGN'::character varying, 'Multi Properties'::character varying, 'Scanner ID'::character varying, 'IPOS'::character varying, 'Power Runner'::character varying, 'Power RA'::character varying, 'Power ME'::character varying, 'ECOS'::character varying, 'Cloud WS'::character varying, 'Power GO'::character varying, 'Dashpad'::character varying, 'IPTV'::character varying, 'HSIA'::character varying, 'SGI'::character varying, 'Guest Survey'::character varying, 'Loyalty Management'::character varying, 'AccPac'::character varying, 'GL Consolidation'::character varying, 'Self Check In'::character varying, 'Check In Desk'::character varying, 'Others'::character varying])::text[]))),
    CONSTRAINT activities_department_check CHECK (((department)::text = ANY ((ARRAY['Food & Beverage'::character varying, 'Kitchen'::character varying, 'Room Division'::character varying, 'Front Office'::character varying, 'Housekeeping'::character varying, 'Engineering'::character varying, 'Sales & Marketing'::character varying, 'IT / EDP'::character varying, 'Accounting'::character varying, 'Executive Office'::character varying])::text[]))),
    CONSTRAINT activities_status_check CHECK (((status)::text = ANY ((ARRAY['Open'::character varying, 'On Progress'::character varying, 'Need Requirement'::character varying, 'Done'::character varying])::text[]))),
    CONSTRAINT activities_type_check CHECK (((type)::text = ANY ((ARRAY['Setup'::character varying, 'Question'::character varying, 'Issue'::character varying, 'Report Issue'::character varying, 'Report Request'::character varying, 'Feature Request'::character varying])::text[])))
);


ALTER TABLE public.activities OWNER TO "user";

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO "user";

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO "user";

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO "user";

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO "user";

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO "user";

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO "user";

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO "user";

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO "user";

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO "user";

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO "user";

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO "user";

--
-- Name: power_project_tables; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.power_project_tables (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.power_project_tables OWNER TO "user";

--
-- Name: power_project_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.power_project_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.power_project_tables_id_seq OWNER TO "user";

--
-- Name: power_project_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.power_project_tables_id_seq OWNED BY public.power_project_tables.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO "user";

--
-- Name: telescope_entries; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.telescope_entries (
    sequence bigint NOT NULL,
    uuid uuid NOT NULL,
    batch_id uuid NOT NULL,
    family_hash character varying(255),
    should_display_on_index boolean DEFAULT true NOT NULL,
    type character varying(20) NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.telescope_entries OWNER TO "user";

--
-- Name: telescope_entries_sequence_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.telescope_entries_sequence_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telescope_entries_sequence_seq OWNER TO "user";

--
-- Name: telescope_entries_sequence_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.telescope_entries_sequence_seq OWNED BY public.telescope_entries.sequence;


--
-- Name: telescope_entries_tags; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.telescope_entries_tags (
    entry_uuid uuid NOT NULL,
    tag character varying(255) NOT NULL
);


ALTER TABLE public.telescope_entries_tags OWNER TO "user";

--
-- Name: telescope_monitoring; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.telescope_monitoring (
    tag character varying(255) NOT NULL
);


ALTER TABLE public.telescope_monitoring OWNER TO "user";

--
-- Name: time_boxings; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.time_boxings (
    id bigint NOT NULL,
    project_id character varying(255) DEFAULT ''::character varying NOT NULL,
    no integer NOT NULL,
    information_date date NOT NULL,
    user_position character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    description text NOT NULL,
    action_solution text,
    due_date date,
    status character varying(255) DEFAULT 'Open'::character varying NOT NULL,
    cnc_number character varying(255) DEFAULT ''::character varying,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id bigint,
    CONSTRAINT time_boxings_status_check CHECK (((status)::text = ANY ((ARRAY['Brain Dump'::character varying, 'Priority List'::character varying, 'Time Boxing'::character varying, 'Completed'::character varying, 'Cancel'::character varying])::text[]))),
    CONSTRAINT time_boxings_type_check CHECK (((type)::text = ANY ((ARRAY['General'::character varying, 'Submission Maintenance'::character varying, 'Update to Management'::character varying, 'Update to Team Bali'::character varying, 'Project Preparation'::character varying, 'Work Order'::character varying, 'Team Meeting'::character varying, 'Hotel Meeting'::character varying, 'Green Plan'::character varying, 'Others Project'::character varying])::text[])))
);


ALTER TABLE public.time_boxings OWNER TO "user";

--
-- Name: time_boxings_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.time_boxings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_boxings_id_seq OWNER TO "user";

--
-- Name: time_boxings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.time_boxings_id_seq OWNED BY public.time_boxings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    display_name character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    tier character varying(255) NOT NULL,
    user_role character varying(255) NOT NULL,
    start_work date,
    birthday date,
    role character varying(255) DEFAULT 'User'::character varying NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['Administrator'::character varying, 'Management'::character varying, 'Admin Officer'::character varying, 'User'::character varying, 'Client'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: power_project_tables id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.power_project_tables ALTER COLUMN id SET DEFAULT nextval('public.power_project_tables_id_seq'::regclass);


--
-- Name: telescope_entries sequence; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.telescope_entries ALTER COLUMN sequence SET DEFAULT nextval('public.telescope_entries_sequence_seq'::regclass);


--
-- Name: time_boxings id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.time_boxings ALTER COLUMN id SET DEFAULT nextval('public.time_boxings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.activities (id, project_id, no, information_date, user_position, department, application, type, description, action_solution, due_date, status, cnc_number, created_at, updated_at) FROM stdin;
3	\N	3	2024-09-08	Mike Johnson - IT Manager	Engineering	Power INV	Setup	Configure inventory management system for new warehouse location	Setting up warehouse locations, item categories, and stock management parameters	2024-09-20	Open	\N	2025-09-12 00:51:31	2025-09-12 00:51:31
4	\N	4	2024-09-07	Sarah Wilson - Business Analyst	Sales & Marketing	Power AR	Report Request	Need monthly sales performance report with trend analysis	Created new report template with dynamic date ranges and export functionality	2024-09-18	Need Requirement	\N	2025-09-12 00:51:31	2025-09-12 00:51:31
5	\N	5	2024-09-06	David Brown - Network Administrator	IT / EDP	IPTV	Question	IPTV streaming quality issues in executive offices	Upgraded network infrastructure and optimized streaming parameters	2024-09-14	Done	\N	2025-09-12 00:51:31	2025-09-12 00:51:31
6	\N	6	2024-09-05	Lisa Chen - Accounting Manager	Accounting	Power GL	Feature Request	Add multi-currency support for international transactions	Implemented currency conversion module with real-time exchange rates	2024-09-25	On Progress	\N	2025-09-12 00:51:31	2025-09-12 00:51:31
7	\N	7	2024-09-04	Robert Taylor - Housekeeping Supervisor	Housekeeping	Power ME	Setup	Configure maintenance scheduling system for equipment tracking	Set up preventive maintenance schedules and notification system	2024-09-22	Open	\N	2025-09-12 00:51:31	2025-09-12 00:51:31
8	\N	8	2024-09-03	Maria Garcia - Front Desk Manager	Front Office	Check In Desk	Issue	Guest check-in process taking too long during peak hours	Optimized check-in workflow and added express check-in option	2024-09-16	Done	\N	2025-09-12 00:51:31	2025-09-12 00:51:31
9	PROJ-009	9	2025-09-11	Manager Dong	IT / EDP	Power FO	Setup	New activity - please update details	Test Datavase	\N	Need Requirement	\N	2025-09-12 01:24:35	2025-09-12 01:25:06
2	\N	2	2024-09-09	Jane Smith - System Analyst	Front Office	My POS	Report Issue	POS system not calculating taxes correctly for service charges	Fixed tax calculation algorithm in payment processing module	2024-09-12	On Progress	\N	2025-09-12 00:51:31	2025-09-12 11:11:46
1	\N	1	2024-09-10	John Doe - Software Developer	IT / EDP	Power FO	Feature Request	Implement new dashboard with real-time analytics and KPI monitoring	Added new API endpoints and updated frontend components with Chart.js integration	2024-09-15	Need Requirement	\N	2025-09-12 00:51:31	2025-09-12 11:11:52
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_09_09_090254_create_telescope_entries_table	1
5	2025_09_10_115029_create_power_project_tables	1
6	2025_09_10_154258_restructure_users_table	1
7	2025_09_11_000647_create_activities_table	1
8	2025_09_11_114357_make_start_work_and_birthday_nullable_in_users_table	1
9	2025_09_11_122820_remove_activity_id_from_activities_table	1
10	2025_09_11_123700_make_project_id_nullable_in_activities_table	1
12	2025_09_12_101533_create_time_boxings_table	2
13	2025_09_12_140501_update_time_boxings_type_check	3
14	2025_09_12_140601_update_time_boxings_status_check	4
15	2025_09_12_140701_drop_department_application_from_time_boxings	5
16	2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults	6
17	2025_09_12_235210_update_time_boxings_type_md_to_management	7
18	2025_09_13_105241_add_user_id_to_time_boxings_table	8
19	2025_09_13_105733_add_role_to_users_table	9
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: power_project_tables; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.power_project_tables (id, name, description, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: telescope_entries; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.telescope_entries (sequence, uuid, batch_id, family_hash, should_display_on_index, type, content, created_at) FROM stdin;
1	9fda99dc-6bbf-4c15-ba0f-6d5e463f7629	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"47.55","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 00:38:50
2	9fda99dc-820c-4d25-95b9-3e81a150c138	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"migrations\\" (\\"id\\" serial not null primary key, \\"migration\\" varchar(255) not null, \\"batch\\" integer not null)","time":"22.59","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"2963df77c76042b1f5901942b4fcfbf3","hostname":"0609fffe774b"}	2025-09-12 00:38:50
3	9fda99dc-846f-4aae-a3e3-a0d3f349fa23	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"2.17","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 00:38:50
4	9fda99dc-8a43-49c5-a9d2-f9f97db13161	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"2.73","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 00:38:50
5	9fda99dc-8c84-4436-9615-fa30798ffd42	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"0.94","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 00:38:50
6	9fda99dc-aed6-468f-b70a-e881468a9d7d	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"1.73","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"0609fffe774b"}	2025-09-12 00:38:50
7	9fda99dc-b7b1-4fa3-b0d6-5b26bfe034e8	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"users\\" (\\"id\\" bigserial not null primary key, \\"name\\" varchar(255) not null, \\"email\\" varchar(255) not null, \\"email_verified_at\\" timestamp(0) without time zone null, \\"password\\" varchar(255) not null, \\"remember_token\\" varchar(100) null, \\"created_at\\" timestamp(0) without time zone null, \\"updated_at\\" timestamp(0) without time zone null)","time":"13.36","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000000_create_users_table.php","line":14,"hash":"a9967097db44dc37f283d0b38f8c9313","hostname":"0609fffe774b"}	2025-09-12 00:38:50
8	9fda99dc-b9c6-4b9b-a370-e7a62d266357	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" add constraint \\"users_email_unique\\" unique (\\"email\\")","time":"4.90","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000000_create_users_table.php","line":14,"hash":"a7941bc5211747d9f6bba27e7cd40aa3","hostname":"0609fffe774b"}	2025-09-12 00:38:50
9	9fda99dc-bcd5-4515-8139-ed61d2ab3da3	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"password_reset_tokens\\" (\\"email\\" varchar(255) not null, \\"token\\" varchar(255) not null, \\"created_at\\" timestamp(0) without time zone null)","time":"7.15","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000000_create_users_table.php","line":24,"hash":"e8e5c5ce0dbec55ccd257c47e89ecaec","hostname":"0609fffe774b"}	2025-09-12 00:38:50
10	9fda99dc-bf36-42b5-a82c-8cead91f0bbb	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"password_reset_tokens\\" add primary key (\\"email\\")","time":"5.69","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000000_create_users_table.php","line":24,"hash":"5b90b60c4becc7731fc855c5fa63972a","hostname":"0609fffe774b"}	2025-09-12 00:38:50
11	9fda99dc-c1a4-42fe-b846-034abf9bb019	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"sessions\\" (\\"id\\" varchar(255) not null, \\"user_id\\" bigint null, \\"ip_address\\" varchar(45) null, \\"user_agent\\" text null, \\"payload\\" text not null, \\"last_activity\\" integer not null)","time":"5.34","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000000_create_users_table.php","line":30,"hash":"8308816771d6a380fb3a4b72e22f4dac","hostname":"0609fffe774b"}	2025-09-12 00:38:50
12	9fda99dc-c3c1-4fe2-83ab-ca0225d809ae	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"sessions\\" add primary key (\\"id\\")","time":"4.97","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000000_create_users_table.php","line":30,"hash":"632707dbc81193dc6466cf3ab7a3062b","hostname":"0609fffe774b"}	2025-09-12 00:38:50
13	9fda99dc-c5cf-47ca-8646-29095eb1e48d	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create index \\"sessions_user_id_index\\" on \\"sessions\\" (\\"user_id\\")","time":"4.96","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000000_create_users_table.php","line":30,"hash":"2542eec4d80cc182d87c3cf7cab44922","hostname":"0609fffe774b"}	2025-09-12 00:38:50
14	9fda99dc-c7c2-4f19-944a-e49161875304	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create index \\"sessions_last_activity_index\\" on \\"sessions\\" (\\"last_activity\\")","time":"4.70","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000000_create_users_table.php","line":30,"hash":"d92496b4297ffd699cf298b9aeae6950","hostname":"0609fffe774b"}	2025-09-12 00:38:50
15	9fda99dc-ca91-4db0-b2b8-9587a7c73200	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('0001_01_01_000000_create_users_table', 1)","time":"3.53","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
16	9fda99dc-ce84-4322-bd05-ea44a1dd21d7	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"cache\\" (\\"key\\" varchar(255) not null, \\"value\\" text not null, \\"expiration\\" integer not null)","time":"5.49","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000001_create_cache_table.php","line":14,"hash":"7f67485c05da39282f5a9cfc42f22833","hostname":"0609fffe774b"}	2025-09-12 00:38:50
17	9fda99dc-d0cf-4023-af5a-3655b6b63f6d	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"cache\\" add primary key (\\"key\\")","time":"5.51","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000001_create_cache_table.php","line":14,"hash":"787fdee5d41b50e0ddaee677c8df71ca","hostname":"0609fffe774b"}	2025-09-12 00:38:50
18	9fda99dc-d377-4a07-acc9-304bd336720a	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"cache_locks\\" (\\"key\\" varchar(255) not null, \\"owner\\" varchar(255) not null, \\"expiration\\" integer not null)","time":"6.17","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000001_create_cache_table.php","line":20,"hash":"63ace63c4220a580aa733330af30f704","hostname":"0609fffe774b"}	2025-09-12 00:38:50
66	9fda9cde-3ecb-481b-8a12-1c08fcc967e4	9fda9cde-5d91-4174-9a1b-4499534cd13b	\N	t	event	{"name":"cache:clearing","payload":[null,[]],"listeners":[],"broadcast":false,"hostname":"0609fffe774b"}	2025-09-12 00:47:14
19	9fda99dc-d5c6-4775-88c5-9e74c74802d9	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"cache_locks\\" add primary key (\\"key\\")","time":"5.53","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000001_create_cache_table.php","line":20,"hash":"e725542fe13520a67e943bdf87887548","hostname":"0609fffe774b"}	2025-09-12 00:38:50
20	9fda99dc-d83c-41b6-9b93-4f3d00e5f532	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('0001_01_01_000001_create_cache_table', 1)","time":"2.75","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
21	9fda99dc-df8c-45f9-a232-d369085bfe00	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"jobs\\" (\\"id\\" bigserial not null primary key, \\"queue\\" varchar(255) not null, \\"payload\\" text not null, \\"attempts\\" smallint not null, \\"reserved_at\\" integer null, \\"available_at\\" integer not null, \\"created_at\\" integer not null)","time":"12.55","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000002_create_jobs_table.php","line":14,"hash":"b7729da8aa116863fe7f3af77c646f6b","hostname":"0609fffe774b"}	2025-09-12 00:38:50
22	9fda99dc-e1b3-4c0f-b714-879d5844839b	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create index \\"jobs_queue_index\\" on \\"jobs\\" (\\"queue\\")","time":"5.20","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000002_create_jobs_table.php","line":14,"hash":"7b59ef50d4ab2d8cfe94adaf49d887a6","hostname":"0609fffe774b"}	2025-09-12 00:38:50
23	9fda99dc-e4b5-4f8d-8d4b-f03ca80caafb	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"job_batches\\" (\\"id\\" varchar(255) not null, \\"name\\" varchar(255) not null, \\"total_jobs\\" integer not null, \\"pending_jobs\\" integer not null, \\"failed_jobs\\" integer not null, \\"failed_job_ids\\" text not null, \\"options\\" text null, \\"cancelled_at\\" integer null, \\"created_at\\" integer not null, \\"finished_at\\" integer null)","time":"7.19","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000002_create_jobs_table.php","line":24,"hash":"66e646f400ac2669f2ff0b0d511530a3","hostname":"0609fffe774b"}	2025-09-12 00:38:50
24	9fda99dc-e70d-4a5f-833a-9c8e1e26a674	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"job_batches\\" add primary key (\\"id\\")","time":"5.63","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000002_create_jobs_table.php","line":24,"hash":"ac41bc33ab9059ed28a4db56836e8c2a","hostname":"0609fffe774b"}	2025-09-12 00:38:50
25	9fda99dc-ec35-4b64-9858-4145704dd0c6	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"failed_jobs\\" (\\"id\\" bigserial not null primary key, \\"uuid\\" varchar(255) not null, \\"connection\\" text not null, \\"queue\\" text not null, \\"payload\\" text not null, \\"exception\\" text not null, \\"failed_at\\" timestamp(0) without time zone not null default CURRENT_TIMESTAMP)","time":"12.14","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000002_create_jobs_table.php","line":37,"hash":"8f6b859463c56bf902459b69488562c2","hostname":"0609fffe774b"}	2025-09-12 00:38:50
26	9fda99dc-ee70-40ba-888a-7b8bc670af2d	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"failed_jobs\\" add constraint \\"failed_jobs_uuid_unique\\" unique (\\"uuid\\")","time":"5.38","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/0001_01_01_000002_create_jobs_table.php","line":37,"hash":"55995ef416af2079ea79dbfbd676c79f","hostname":"0609fffe774b"}	2025-09-12 00:38:50
27	9fda99dc-f079-4d20-8bb3-8c2ed5db0e6a	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('0001_01_01_000002_create_jobs_table', 1)","time":"2.26","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
28	9fda99dc-f72a-4618-a032-1a6fba97256c	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"telescope_entries\\" (\\"sequence\\" bigserial not null primary key, \\"uuid\\" uuid not null, \\"batch_id\\" uuid not null, \\"family_hash\\" varchar(255) null, \\"should_display_on_index\\" boolean not null default '1', \\"type\\" varchar(20) not null, \\"content\\" text not null, \\"created_at\\" timestamp(0) without time zone null)","time":"10.80","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":24,"hash":"b406db2c2f873cdd4e80585f223cfdf9","hostname":"0609fffe774b"}	2025-09-12 00:38:50
29	9fda99dc-f9b1-48d9-965f-57991f9bb906	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"telescope_entries\\" add constraint \\"telescope_entries_uuid_unique\\" unique (\\"uuid\\")","time":"6.13","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":24,"hash":"65516b962cdccf5d313657a083ce8e23","hostname":"0609fffe774b"}	2025-09-12 00:38:50
30	9fda99dc-fba7-45df-a4ad-71dd3e2c2f17	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create index \\"telescope_entries_batch_id_index\\" on \\"telescope_entries\\" (\\"batch_id\\")","time":"4.71","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":24,"hash":"e10b43e84e03625fedc71f28fb117fcd","hostname":"0609fffe774b"}	2025-09-12 00:38:50
31	9fda99dc-fd63-4158-ada1-9bbeff82efe1	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create index \\"telescope_entries_family_hash_index\\" on \\"telescope_entries\\" (\\"family_hash\\")","time":"4.15","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":24,"hash":"83054e6de7da4fc398165e89e56e6579","hostname":"0609fffe774b"}	2025-09-12 00:38:50
32	9fda99dd-0045-470e-8cbc-a0ea85152697	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create index \\"telescope_entries_created_at_index\\" on \\"telescope_entries\\" (\\"created_at\\")","time":"7.05","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":24,"hash":"480c085033a759f5759c64439988b7ad","hostname":"0609fffe774b"}	2025-09-12 00:38:50
33	9fda99dd-0259-4e90-bc0c-5c46654430eb	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create index \\"telescope_entries_type_should_display_on_index_index\\" on \\"telescope_entries\\" (\\"type\\", \\"should_display_on_index\\")","time":"4.96","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":24,"hash":"2dde9b32f7ec3cbde8e7233229f9e72a","hostname":"0609fffe774b"}	2025-09-12 00:38:50
34	9fda99dd-033b-4f98-9005-097516d03eb3	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"telescope_entries_tags\\" (\\"entry_uuid\\" uuid not null, \\"tag\\" varchar(255) not null)","time":"1.58","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":41,"hash":"84423770c386428de619551ca156a52b","hostname":"0609fffe774b"}	2025-09-12 00:38:50
67	9fda9cde-47b4-4a10-bb32-1597d042b858	9fda9cde-5d91-4174-9a1b-4499534cd13b	\N	t	redis	{"connection":"cache","command":"flushdb ","time":"2.19","hostname":"0609fffe774b"}	2025-09-12 00:47:14
68	9fda9cde-4da8-4d2a-b587-3b44f5e5a2cd	9fda9cde-5d91-4174-9a1b-4499534cd13b	\N	t	event	{"name":"cache:cleared","payload":[null,[]],"listeners":[],"broadcast":false,"hostname":"0609fffe774b"}	2025-09-12 00:47:15
35	9fda99dd-05a3-474f-b585-890912f056e2	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"telescope_entries_tags\\" add primary key (\\"entry_uuid\\", \\"tag\\")","time":"5.78","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":41,"hash":"d121bf7f5eac3400def591e1ebce7439","hostname":"0609fffe774b"}	2025-09-12 00:38:50
36	9fda99dd-07b0-4362-a0d2-dc5c1dc80ca7	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create index \\"telescope_entries_tags_tag_index\\" on \\"telescope_entries_tags\\" (\\"tag\\")","time":"4.87","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":41,"hash":"fb3cf587edc205c8c419d474ea351a78","hostname":"0609fffe774b"}	2025-09-12 00:38:50
37	9fda99dd-0993-46da-86c4-a60ddd347bae	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"telescope_entries_tags\\" add constraint \\"telescope_entries_tags_entry_uuid_foreign\\" foreign key (\\"entry_uuid\\") references \\"telescope_entries\\" (\\"uuid\\") on delete cascade","time":"4.52","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":41,"hash":"84715bebe24deb92d4af7a4800fc4a2b","hostname":"0609fffe774b"}	2025-09-12 00:38:50
38	9fda99dd-0a58-4902-9c12-61c1fb800221	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"telescope_monitoring\\" (\\"tag\\" varchar(255) not null)","time":"1.55","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":54,"hash":"ae42f8fdcbfbd265b65572f79934d1ae","hostname":"0609fffe774b"}	2025-09-12 00:38:50
39	9fda99dd-0ca3-40e2-ac84-a7895407294c	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"telescope_monitoring\\" add primary key (\\"tag\\")","time":"5.50","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_09_090254_create_telescope_entries_table.php","line":54,"hash":"27b4fa17d400b8ca9300968e559f8b58","hostname":"0609fffe774b"}	2025-09-12 00:38:50
40	9fda99dd-0e7e-44d3-8e54-442dbc355ce6	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_09_090254_create_telescope_entries_table', 1)","time":"2.22","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
41	9fda99dd-153a-4eba-a211-06336888b1bb	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"power_project_tables\\" (\\"id\\" bigserial not null primary key, \\"name\\" varchar(255) not null, \\"description\\" text null, \\"status\\" varchar(255) not null default 'active', \\"created_at\\" timestamp(0) without time zone null, \\"updated_at\\" timestamp(0) without time zone null)","time":"12.24","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_10_115029_create_power_project_tables.php","line":14,"hash":"1ff96c7fbc5b514744b1a221c41c2cc5","hostname":"0609fffe774b"}	2025-09-12 00:38:50
42	9fda99dd-1712-4264-9209-9322f8dddae6	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_10_115029_create_power_project_tables', 1)","time":"2.35","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
43	9fda99dd-1a7c-417d-9de9-1bce5b3a0fc8	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" drop column \\"name\\", drop column \\"email_verified_at\\", drop column \\"remember_token\\"","time":"2.42","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_10_154258_restructure_users_table.php","line":14,"hash":"d745143124966e160295a5835cbbbb0a","hostname":"0609fffe774b"}	2025-09-12 00:38:50
44	9fda99dd-1b16-45e4-9b4b-3100935f0f92	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" add column \\"display_name\\" varchar(255) not null","time":"1.22","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_10_154258_restructure_users_table.php","line":14,"hash":"f62326837dd87adc147f87c9b4311e9b","hostname":"0609fffe774b"}	2025-09-12 00:38:50
45	9fda99dd-1ba9-48ae-958a-364d8c72e7aa	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" add column \\"full_name\\" varchar(255) not null","time":"1.13","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_10_154258_restructure_users_table.php","line":14,"hash":"b75f443ddafb1d50f9ac2eb5c5f55202","hostname":"0609fffe774b"}	2025-09-12 00:38:50
46	9fda99dd-1c2a-4873-b58e-bcda53e03166	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" add column \\"tier\\" varchar(255) not null","time":"1.00","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_10_154258_restructure_users_table.php","line":14,"hash":"17d57c1f897b76ebf5179c16a535abd9","hostname":"0609fffe774b"}	2025-09-12 00:38:50
47	9fda99dd-1ca5-44a1-ab67-0c67afdfbaf0	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" add column \\"user_role\\" varchar(255) not null","time":"0.92","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_10_154258_restructure_users_table.php","line":14,"hash":"d4bc7b939c978b093f1b806b51a0b3ac","hostname":"0609fffe774b"}	2025-09-12 00:38:50
48	9fda99dd-1d50-4d16-b072-baedbcd099bb	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" add column \\"start_work\\" date not null","time":"1.35","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_10_154258_restructure_users_table.php","line":14,"hash":"1e33c1402cb3bd4675a6bebf204b9654","hostname":"0609fffe774b"}	2025-09-12 00:38:50
49	9fda99dd-1e14-43f4-a0c5-a85ad99573c8	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" add column \\"birthday\\" date not null","time":"1.46","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_10_154258_restructure_users_table.php","line":14,"hash":"f2edc6628a620c23556bcb2e2a959f7b","hostname":"0609fffe774b"}	2025-09-12 00:38:50
50	9fda99dd-206a-4d4e-9563-879501e2a2d7	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_10_154258_restructure_users_table', 1)","time":"2.85","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
69	9fda9cde-5b67-422c-815d-a8eced164436	9fda9cde-5d91-4174-9a1b-4499534cd13b	\N	t	command	{"command":"cache:clear","exit_code":0,"arguments":{"command":"cache:clear","store":null},"options":{"tags":null,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 00:47:15
70	9fda9ce4-1dda-45dd-8488-dc5d3dbc39c9	9fda9ce4-2115-4ce4-91e6-a67b6283e34f	\N	t	command	{"command":"route:clear","exit_code":0,"arguments":{"command":"route:clear"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 00:47:18
120	9fdb1b69-dcf7-43c1-b698-115c8d7e19ef	9fdb1b69-e0b8-4025-98c5-09199d3ee11d	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:41:05
51	9fda99dd-293f-4102-ae27-cadaf9d9a7c1	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"activities\\" (\\"id\\" bigserial not null primary key, \\"activity_id\\" varchar(255) not null, \\"project_id\\" varchar(255) not null, \\"no\\" integer not null, \\"information_date\\" date not null, \\"user_position\\" varchar(255) not null, \\"department\\" varchar(255) check (\\"department\\" in ('Food & Beverage', 'Kitchen', 'Room Division', 'Front Office', 'Housekeeping', 'Engineering', 'Sales & Marketing', 'IT \\/ EDP', 'Accounting', 'Executive Office')) not null, \\"application\\" varchar(255) check (\\"application\\" in ('Power FO', 'My POS', 'My MGR', 'Power AR', 'Power INV', 'Power AP', 'Power GL', 'Keylock', 'PABX', 'DIM', 'Dynamic Room Rate', 'Channel Manager', 'PB1', 'Power SIGN', 'Multi Properties', 'Scanner ID', 'IPOS', 'Power Runner', 'Power RA', 'Power ME', 'ECOS', 'Cloud WS', 'Power GO', 'Dashpad', 'IPTV', 'HSIA', 'SGI', 'Guest Survey', 'Loyalty Management', 'AccPac', 'GL Consolidation', 'Self Check In', 'Check In Desk', 'Others')) not null, \\"type\\" varchar(255) check (\\"type\\" in ('Setup', 'Question', 'Issue', 'Report Issue', 'Report Request', 'Feature Request')) not null, \\"description\\" text not null, \\"action_solution\\" text null, \\"due_date\\" date null, \\"status\\" varchar(255) check (\\"status\\" in ('Open', 'On Progress', 'Need Requirement', 'Done')) not null default 'Open', \\"cnc_number\\" varchar(255) null, \\"created_at\\" timestamp(0) without time zone null, \\"updated_at\\" timestamp(0) without time zone null)","time":"15.91","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_11_000647_create_activities_table.php","line":14,"hash":"b3eeee378de52600512a1679df2700a0","hostname":"0609fffe774b"}	2025-09-12 00:38:50
52	9fda99dd-2b61-4e5a-8996-8de7c5909ce0	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"activities\\" add constraint \\"activities_activity_id_unique\\" unique (\\"activity_id\\")","time":"5.04","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_11_000647_create_activities_table.php","line":14,"hash":"780bbf190d93bfc5441f054b4f4989a5","hostname":"0609fffe774b"}	2025-09-12 00:38:50
53	9fda99dd-2daf-4c57-ad0e-64c79bdc7b57	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_11_000647_create_activities_table', 1)","time":"2.48","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
54	9fda99dd-30ad-4862-b15f-f8efe9a0ca58	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" alter column \\"start_work\\" type date, alter column \\"start_work\\" drop not null, alter column \\"start_work\\" drop default, alter column \\"start_work\\" drop identity if exists","time":"1.98","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_11_114357_make_start_work_and_birthday_nullable_in_users_table.php","line":14,"hash":"a37a3867eb193cdddaff87e8ba4a4b46","hostname":"0609fffe774b"}	2025-09-12 00:38:50
55	9fda99dd-315a-4390-83a5-eb498a6300fe	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" alter column \\"birthday\\" type date, alter column \\"birthday\\" drop not null, alter column \\"birthday\\" drop default, alter column \\"birthday\\" drop identity if exists","time":"1.41","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_11_114357_make_start_work_and_birthday_nullable_in_users_table.php","line":14,"hash":"687245edc3360396d3d64cd7b3c3338f","hostname":"0609fffe774b"}	2025-09-12 00:38:50
56	9fda99dd-31da-419b-bb9b-5594a0cfae33	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"comment on column \\"users\\".\\"start_work\\" is NULL","time":"0.90","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_11_114357_make_start_work_and_birthday_nullable_in_users_table.php","line":14,"hash":"c0f6c1c56d35a206ad806ac6ac6cf70c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
57	9fda99dd-3267-429d-9e89-56c89698d8a7	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"comment on column \\"users\\".\\"birthday\\" is NULL","time":"0.97","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_11_114357_make_start_work_and_birthday_nullable_in_users_table.php","line":14,"hash":"6bc352bc014e084d3c9f4666bf783b83","hostname":"0609fffe774b"}	2025-09-12 00:38:50
58	9fda99dd-347b-4d44-8ac7-4b4b3e3824e9	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_11_114357_make_start_work_and_birthday_nullable_in_users_table', 1)","time":"2.40","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
59	9fda99dd-37f0-40f6-8557-ccbf5d36e71c	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"activities\\" drop column \\"activity_id\\"","time":"2.62","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_11_122820_remove_activity_id_from_activities_table.php","line":14,"hash":"240257bc22b68704e12637364c20303e","hostname":"0609fffe774b"}	2025-09-12 00:38:50
60	9fda99dd-3a63-4646-bd0b-e6c4bc222116	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_11_122820_remove_activity_id_from_activities_table', 1)","time":"2.93","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:50
61	9fda99dd-3da4-4dfb-9240-51d4ba61acb1	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"activities\\" alter column \\"project_id\\" type varchar(255), alter column \\"project_id\\" drop not null, alter column \\"project_id\\" drop default, alter column \\"project_id\\" drop identity if exists","time":"2.15","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_11_123700_make_project_id_nullable_in_activities_table.php","line":14,"hash":"cdb511d1b03a0b4b64295dbf708fdee1","hostname":"0609fffe774b"}	2025-09-12 00:38:51
62	9fda99dd-3e17-49be-a4f1-a57538531307	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"comment on column \\"activities\\".\\"project_id\\" is NULL","time":"0.83","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_11_123700_make_project_id_nullable_in_activities_table.php","line":14,"hash":"225dd961bad4f021b404d707bf1747dc","hostname":"0609fffe774b"}	2025-09-12 00:38:51
63	9fda99dd-405e-4e86-a195-65200ce869e7	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_11_123700_make_project_id_nullable_in_activities_table', 1)","time":"2.93","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 00:38:51
64	9fda99dd-40f7-4570-beb7-d1e8017ccf02	9fda99dd-422f-4050-bee8-951939c3912d	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":false,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 00:38:51
65	9fda9a27-40b9-4880-94c2-447d2e0fc144	9fda9a27-4441-41ba-95a2-5327b0e93e7a	\N	t	command	{"command":"config:clear","exit_code":0,"arguments":{"command":"config:clear"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 00:39:39
72	9fda9e5e-d468-4b77-8739-713036a9e1fa	9fda9e5e-fa91-46ab-8eba-e95eaa33aefc	\N	t	command	{"command":"tinker","exit_code":1,"arguments":{"command":"tinker","include":[]},"options":{"execute":"\\n\\\\ = new App\\\\Models\\\\User();\\n\\\\->name = 'Admin User';\\n\\\\->email = 'admin@example.com';\\n\\\\->password = bcrypt('password123');\\n\\\\->save();\\necho 'User created with ID: ' . \\\\->id;\\n","help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 00:51:27
73	9fda9e65-e2d6-4626-a2c0-871c713b7a99	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"users\\" (\\"display_name\\", \\"full_name\\", \\"email\\", \\"password\\", \\"tier\\", \\"user_role\\", \\"start_work\\", \\"birthday\\", \\"created_at\\", \\"updated_at\\") values ('Komeng', 'Rudianto', 'pms@powerpro.id', 'y$dxBRnS8\\/FUSmoc2KFBPmj.7OoVJW0inQhFyAv6Q54RKQukPbAbiRW', 'Premium', 'Administrator', '2024-01-01 00:00:00', '1990-01-01 00:00:00', '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"17.92","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/UserSeeder.php","line":57,"hash":"662bb09b014a2a3d35a79b44d422c2da","hostname":"0609fffe774b"}	2025-09-12 00:51:31
74	9fda9e65-e559-4001-bc63-866925ba1069	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\User:1","hostname":"0609fffe774b"}	2025-09-12 00:51:31
75	9fda9e65-ea11-420c-b181-82b0b4a0a80e	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"users\\" (\\"display_name\\", \\"full_name\\", \\"email\\", \\"password\\", \\"tier\\", \\"user_role\\", \\"start_work\\", \\"birthday\\", \\"created_at\\", \\"updated_at\\") values ('Admin', 'Administrator User', 'admin@powerpro.cloud', 'y$SXSK7CCZYadHSdcoupDsg.TZvufMfGrpzHBWQBt\\/YQX3gX203VXuK', 'Premium', 'Administrator', '2024-01-01 00:00:00', '1990-01-01 00:00:00', '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"2.94","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/UserSeeder.php","line":57,"hash":"662bb09b014a2a3d35a79b44d422c2da","hostname":"0609fffe774b"}	2025-09-12 00:51:31
76	9fda9e65-ea25-4e7d-9e55-7a42f06575b1	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\User:2","hostname":"0609fffe774b"}	2025-09-12 00:51:31
77	9fda9e65-eb4b-4bfd-9f64-633755b7d195	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"users\\" (\\"display_name\\", \\"full_name\\", \\"email\\", \\"password\\", \\"tier\\", \\"user_role\\", \\"start_work\\", \\"birthday\\", \\"created_at\\", \\"updated_at\\") values ('Manager', 'Manager User', 'manager@powerpro.cloud', 'y$MVSRTXvmwJKUYFOtqly55eKkZWfMBzmQeRkhrGiFx\\/ZBwz0pKpEgG', 'Standard', 'Manager', '2024-02-01 00:00:00', '1985-05-15 00:00:00', '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"2.39","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/UserSeeder.php","line":57,"hash":"662bb09b014a2a3d35a79b44d422c2da","hostname":"0609fffe774b"}	2025-09-12 00:51:31
78	9fda9e65-eb67-4ac4-a53b-e621e2e22b59	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\User:3","hostname":"0609fffe774b"}	2025-09-12 00:51:31
79	9fda9e65-f49f-4fb0-a588-8904fb9c93d0	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"activities\\" (\\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"updated_at\\", \\"created_at\\") values (null, 1, '2024-09-10 00:00:00', 'John Doe - Software Developer', 'IT \\/ EDP', 'Power FO', 'Feature Request', 'Implement new dashboard with real-time analytics and KPI monitoring', 'Added new API endpoints and updated frontend components with Chart.js integration', '2024-09-15 00:00:00', 'Done', null, '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"4.51","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/ActivitySeeder.php","line":132,"hash":"51c18a5b3cedb3e3031fe6302f042cbe","hostname":"0609fffe774b"}	2025-09-12 00:51:31
80	9fda9e65-f4b4-4ea9-b262-987b3662cf96	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\Activity:1","hostname":"0609fffe774b"}	2025-09-12 00:51:31
81	9fda9e65-f616-4aa6-a750-24b845d226ab	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"activities\\" (\\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"updated_at\\", \\"created_at\\") values (null, 2, '2024-09-09 00:00:00', 'Jane Smith - System Analyst', 'Front Office', 'My POS', 'Issue', 'POS system not calculating taxes correctly for service charges', 'Fixed tax calculation algorithm in payment processing module', '2024-09-12 00:00:00', 'On Progress', null, '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"2.95","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/ActivitySeeder.php","line":132,"hash":"51c18a5b3cedb3e3031fe6302f042cbe","hostname":"0609fffe774b"}	2025-09-12 00:51:31
82	9fda9e65-f62e-4e9c-ab66-0d5f01d1be9c	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\Activity:2","hostname":"0609fffe774b"}	2025-09-12 00:51:31
83	9fda9e65-f773-4dac-b111-9f35c456be54	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"activities\\" (\\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"updated_at\\", \\"created_at\\") values (null, 3, '2024-09-08 00:00:00', 'Mike Johnson - IT Manager', 'Engineering', 'Power INV', 'Setup', 'Configure inventory management system for new warehouse location', 'Setting up warehouse locations, item categories, and stock management parameters', '2024-09-20 00:00:00', 'Open', null, '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"2.58","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/ActivitySeeder.php","line":132,"hash":"51c18a5b3cedb3e3031fe6302f042cbe","hostname":"0609fffe774b"}	2025-09-12 00:51:31
84	9fda9e65-f7a2-4d44-afe3-934f8a761b15	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\Activity:3","hostname":"0609fffe774b"}	2025-09-12 00:51:31
97	9fdaa5c9-66a3-470a-b303-68df9b6f801d	9fdaa5c9-8c37-4fc6-9c1f-42086f3ab9a2	\N	t	command	{"command":"tinker","exit_code":1,"arguments":{"command":"tinker","include":[]},"options":{"execute":"\\n\\\\ = App\\\\Models\\\\User::where('email', 'pms@powerpro.id')->first();\\nif (\\\\) {\\n    \\\\->password = bcrypt('Bismillah');\\n    \\\\->save();\\n    echo 'Password updated successfully for ' . \\\\->email;\\n} else {\\n    echo 'User not found';\\n}\\n","help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 01:12:11
85	9fda9e65-f8e0-4fb8-a659-66f6919dce38	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"activities\\" (\\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"updated_at\\", \\"created_at\\") values (null, 4, '2024-09-07 00:00:00', 'Sarah Wilson - Business Analyst', 'Sales & Marketing', 'Power AR', 'Report Request', 'Need monthly sales performance report with trend analysis', 'Created new report template with dynamic date ranges and export functionality', '2024-09-18 00:00:00', 'Need Requirement', null, '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"2.52","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/ActivitySeeder.php","line":132,"hash":"51c18a5b3cedb3e3031fe6302f042cbe","hostname":"0609fffe774b"}	2025-09-12 00:51:31
86	9fda9e65-f8f4-42ba-adcb-60437ff96b7f	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\Activity:4","hostname":"0609fffe774b"}	2025-09-12 00:51:31
87	9fda9e65-fa6a-4349-b430-c7d190ec6bea	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"activities\\" (\\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"updated_at\\", \\"created_at\\") values (null, 5, '2024-09-06 00:00:00', 'David Brown - Network Administrator', 'IT \\/ EDP', 'IPTV', 'Question', 'IPTV streaming quality issues in executive offices', 'Upgraded network infrastructure and optimized streaming parameters', '2024-09-14 00:00:00', 'Done', null, '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"3.19","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/ActivitySeeder.php","line":132,"hash":"51c18a5b3cedb3e3031fe6302f042cbe","hostname":"0609fffe774b"}	2025-09-12 00:51:31
88	9fda9e65-fa81-4662-a7be-db88834bd459	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\Activity:5","hostname":"0609fffe774b"}	2025-09-12 00:51:31
89	9fda9e65-fbfe-4db6-832f-bf8bad44016e	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"activities\\" (\\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"updated_at\\", \\"created_at\\") values (null, 6, '2024-09-05 00:00:00', 'Lisa Chen - Accounting Manager', 'Accounting', 'Power GL', 'Feature Request', 'Add multi-currency support for international transactions', 'Implemented currency conversion module with real-time exchange rates', '2024-09-25 00:00:00', 'On Progress', null, '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"3.09","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/ActivitySeeder.php","line":132,"hash":"51c18a5b3cedb3e3031fe6302f042cbe","hostname":"0609fffe774b"}	2025-09-12 00:51:31
90	9fda9e65-fc1a-42cb-87c8-db5faacbe311	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\Activity:6","hostname":"0609fffe774b"}	2025-09-12 00:51:31
91	9fda9e65-fd59-4863-91e5-6a46bb17b66d	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"activities\\" (\\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"updated_at\\", \\"created_at\\") values (null, 7, '2024-09-04 00:00:00', 'Robert Taylor - Housekeeping Supervisor', 'Housekeeping', 'Power ME', 'Setup', 'Configure maintenance scheduling system for equipment tracking', 'Set up preventive maintenance schedules and notification system', '2024-09-22 00:00:00', 'Open', null, '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"2.64","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/ActivitySeeder.php","line":132,"hash":"51c18a5b3cedb3e3031fe6302f042cbe","hostname":"0609fffe774b"}	2025-09-12 00:51:31
92	9fda9e65-fd6d-4fbe-b9bd-efb8b6513c7f	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\Activity:7","hostname":"0609fffe774b"}	2025-09-12 00:51:31
93	9fda9e65-fef6-4d7c-9dfb-0c7a95149b5b	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"activities\\" (\\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"updated_at\\", \\"created_at\\") values (null, 8, '2024-09-03 00:00:00', 'Maria Garcia - Front Desk Manager', 'Front Office', 'Check In Desk', 'Issue', 'Guest check-in process taking too long during peak hours', 'Optimized check-in workflow and added express check-in option', '2024-09-16 00:00:00', 'Done', null, '2025-09-12 00:51:31', '2025-09-12 00:51:31') returning \\"id\\"","time":"3.34","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/ActivitySeeder.php","line":132,"hash":"51c18a5b3cedb3e3031fe6302f042cbe","hostname":"0609fffe774b"}	2025-09-12 00:51:31
94	9fda9e65-ff0b-4bbb-9880-f9d09588d5c0	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	model	{"action":"created","model":"App\\\\Models\\\\Activity:8","hostname":"0609fffe774b"}	2025-09-12 00:51:31
95	9fda9e65-ffc4-4065-b6cb-e81c98210798	9fda9e66-012a-4f77-96dd-abeaf7622571	\N	t	command	{"command":"db:seed","exit_code":0,"arguments":{"command":"db:seed","class":null},"options":{"class":"Database\\\\Seeders\\\\DatabaseSeeder","database":null,"force":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 00:51:31
71	9fda9e5e-ec46-425a-9808-199e290859b1	9fda9e5e-fa91-46ab-8eba-e95eaa33aefc	0891ca4289b14370d5b4c81cbd961038	f	exception	{"class":"Psy\\\\Exception\\\\ParseErrorException","file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Exception\\/ParseErrorException.php","line":44,"message":"PHP Parse error: Syntax error, unexpected T_NS_SEPARATOR on line 2","context":null,"trace":[{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":306},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":240},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":852},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":881},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":1390},{"file":"\\/var\\/www\\/vendor\\/laravel\\/tinker\\/src\\/Console\\/TinkerCommand.php","line":76},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":696},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":213},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Command\\/Command.php","line":318},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":182},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":1110},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":359},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":194},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php","line":198},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php","line":1235},{"file":"\\/var\\/www\\/artisan","line":13}],"line_preview":{"35":"    }","36":"","37":"    \\/**","38":"     * Create a ParseErrorException from a PhpParser Error.","39":"     *","40":"     * @param \\\\PhpParser\\\\Error $e","41":"     *\\/","42":"    public static function fromParseError(\\\\PhpParser\\\\Error $e): self","43":"    {","44":"        return new self($e->getRawMessage(), $e->getAttributes());","45":"    }","46":"}","47":""},"hostname":"0609fffe774b","occurrences":1}	2025-09-12 00:51:27
98	9fdaa654-c28c-40bb-a9bc-35eba47472ce	9fdaa654-cee2-4710-ae45-4b785fb45027	\N	t	command	{"command":"make:command","exit_code":0,"arguments":{"command":"make:command","name":"UpdatePassword"},"options":{"force":false,"command":null,"test":false,"pest":false,"phpunit":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 01:13:42
99	9fdaa6a7-61b4-44f9-a04f-1877441cbefb	9fdaa6a7-645f-46ee-9593-d3f6032a96fa	\N	t	command	{"command":"route:list","exit_code":0,"arguments":{"command":"route:list"},"options":{"json":false,"method":null,"action":null,"name":null,"domain":null,"path":null,"except-path":null,"reverse":false,"sort":"uri","except-vendor":false,"only-vendor":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 01:14:36
100	9fdb1b45-2270-4c1f-906b-60ea41790688	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	redis	{"connection":"default","command":"get powerprorlLCAewaux4qnOXE59jAIzOlUb2swsma9h8krBZJ","time":"0.12","hostname":"0609fffe774b"}	2025-09-12 06:40:41
101	9fdb1b45-2843-470a-b006-b2c82b5576c9	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	cache	{"type":"missed","key":"rlLCAewaux4qnOXE59jAIzOlUb2swsma9h8krBZJ","hostname":"0609fffe774b"}	2025-09-12 06:40:41
102	9fdb1b45-2df4-4479-89e0-eaaa07a1c318	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	view	{"name":"dashboard.index","path":"\\/resources\\/views\\/dashboard\\/index.blade.php","data":[],"hostname":"0609fffe774b"}	2025-09-12 06:40:41
103	9fdb1b45-3529-4401-ac4f-a5581448c70b	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	view	{"name":"layout.layout","path":"\\/resources\\/views\\/layout\\/layout.blade.php","data":["title","subTitle","script"],"hostname":"0609fffe774b"}	2025-09-12 06:40:41
104	9fdb1b45-52b2-4a8c-bdb0-4b97bb095631	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	view	{"name":"components.head","path":"\\/resources\\/views\\/components\\/head.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 06:40:41
105	9fdb1b45-5774-4849-816e-17739b1e834d	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	view	{"name":"components.horizontal-nav","path":"\\/resources\\/views\\/components\\/horizontal-nav.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 06:40:41
106	9fdb1b45-67df-47ed-8eb5-1b04228d30f6	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	view	{"name":"components.navbar","path":"\\/resources\\/views\\/components\\/navbar.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 06:40:41
107	9fdb1b45-6cfa-416c-ba25-71bdc2b232bb	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	view	{"name":"components.breadcrumb","path":"\\/resources\\/views\\/components\\/breadcrumb.blade.php","data":["title","subTitle","attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 06:40:41
108	9fdb1b45-7278-4ce3-9fed-5632ab9d8310	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	view	{"name":"components.footer","path":"\\/resources\\/views\\/components\\/footer.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 06:40:41
109	9fdb1b45-77ad-449f-b186-1cedcfc9e41a	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	view	{"name":"components.script","path":"\\/resources\\/views\\/components\\/script.blade.php","data":["script","attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 06:40:41
110	9fdb1b45-7eae-4ec3-bdd9-7f2abdade325	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	redis	{"connection":"default","command":"setex powerprorlLCAewaux4qnOXE59jAIzOlUb2swsma9h8krBZJ 7200 s:179:\\"a:3:{s:6:\\"_token\\";s:40:\\"CXEN2NsHVsAqMlMz4mzwH5Ri8eMaG9GU5anMSxp6\\";s:9:\\"_previous\\";a:1:{s:3:\\"url\\";s:21:\\"https:\\/\\/192.168.0.196\\";}s:6:\\"_flash\\";a:2:{s:3:\\"old\\";a:0:{}s:3:\\"new\\";a:0:{}}}\\";","time":"4.88","hostname":"0609fffe774b"}	2025-09-12 06:40:41
111	9fdb1b45-7ec4-4f1d-8e50-481662c3c675	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	cache	{"type":"set","key":"rlLCAewaux4qnOXE59jAIzOlUb2swsma9h8krBZJ","value":"a:3:{s:6:\\"_token\\";s:40:\\"CXEN2NsHVsAqMlMz4mzwH5Ri8eMaG9GU5anMSxp6\\";s:9:\\"_previous\\";a:1:{s:3:\\"url\\";s:21:\\"https:\\/\\/192.168.0.196\\";}s:6:\\"_flash\\";a:2:{s:3:\\"old\\";a:0:{}s:3:\\"new\\";a:0:{}}}","expiration":7200,"hostname":"0609fffe774b"}	2025-09-12 06:40:41
112	9fdb1b45-7f15-4d0f-8b4b-f2f4b60c5c25	9fdb1b45-7fb6-4dc9-8380-42504c4309d7	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/","method":"GET","controller_action":"App\\\\Http\\\\Controllers\\\\DashboardController@index","middleware":["web"],"headers":{"host":"192.168.0.196","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":{"_token":"CXEN2NsHVsAqMlMz4mzwH5Ri8eMaG9GU5anMSxp6","_previous":{"url":"https:\\/\\/192.168.0.196"},"_flash":{"old":[],"new":[]}},"response_headers":{"content-type":"text\\/html; charset=UTF-8","cache-control":"no-cache, private","date":"Thu, 11 Sep 2025 23:40:41 GMT","set-cookie":"XSRF-TOKEN=eyJpdiI6IkFhc3VCZk5oUVpwWVI3dVcwNVdXV2c9PSIsInZhbHVlIjoiUXNVS3FNVTBGWUZsTzVrbzF4cDNYck5ORzBVNitTTFlPUkhuaFdwa0tQUjUrS25OYXN6U2V4cVJwSk1lKzl0bjF0RG1kUmplODJVRzJEWjNyaGpyUkNXU1NBRTRMV1R4STIvZW5ZM2FJTkhyOUZIdVFNakQyUTdaR0N2UmN5S3MiLCJtYWMiOiJjMWIwNDg0MmQ0NzExMjMxMzJhZmU4ZTI2NmQ2MTFmNTRlNjZiNGJjNTE0NjBkZGM4YzgzYzVlZDc0MzE2MzY0IiwidGFnIjoiIn0%3D; expires=Fri, 12 Sep 2025 01:40:41 GMT; Max-Age=7200; path=\\/; domain=localhost; samesite=lax, powerpro_session=eyJpdiI6IjZDd0NidVpoZnd3Nk5DR1dFckgzWWc9PSIsInZhbHVlIjoiem5PSFU4ekJ2VWlvdmtZUDFUTXd5VnpoeXNsY2YzV2lzNS9zMG5EZUhidmI4cGxxL2xmUzYvYS80eGhkVEJsSWliTC9WQjhCbzE0c3pINEY5RUVEUGRvNHZUTVJnLzd5TC9mcHhYSjVkQ1NoN0hnd0ZOQ1B5TFpUaVAybDhVRk4iLCJtYWMiOiJmNTk4YmQ2ZjE1OWY2MDllOWZhYzExNTk0MTE0Yjk2ZGY5NzRjYzkyNDRlOGMzZmFkY2NlNGVjMzIyZWYwYTE2IiwidGFnIjoiIn0%3D; expires=Fri, 12 Sep 2025 01:40:41 GMT; Max-Age=7200; path=\\/; domain=localhost; httponly; samesite=lax"},"response_status":200,"response":{"view":"\\/var\\/www\\/resources\\/views\\/dashboard\\/index.blade.php","data":[]},"duration":499,"memory":4,"hostname":"0609fffe774b"}	2025-09-12 06:40:41
113	9fdb1b5f-f14b-4e28-89eb-a74789ab1803	9fdb1b5f-fd6c-4100-99b1-bacbdb299587	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:40:59
114	9fdb1b5f-f8e3-41fa-a16c-4ae70fa85bc4	9fdb1b5f-fd6c-4100-99b1-bacbdb299587	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:40:59
115	9fdb1b5f-fcfa-4324-a837-26090230d1bb	9fdb1b5f-fd6c-4100-99b1-bacbdb299587	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/HNAP1","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"192.168.0.196","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Thu, 11 Sep 2025 23:40:59 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":196,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 06:40:59
116	9fdb1b64-f800-481f-b5f8-e7f2e8a24da9	9fdb1b65-0430-49aa-a70b-c67e4f516dcf	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:41:02
117	9fdb1b64-ffd2-431a-8fdc-3c9276850a76	9fdb1b65-0430-49aa-a70b-c67e4f516dcf	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:41:02
118	9fdb1b65-03bd-492f-8af6-1efefd279176	9fdb1b65-0430-49aa-a70b-c67e4f516dcf	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/cgi\\/get.cgi?cmd=home_login","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"192.168.0.196","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; WOW64; Trident\\/7.0; rv:11.0) like Gecko","accept-encoding":"deflate, gzip","accept":"*\\/*"},"payload":{"cmd":"home_login"},"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Thu, 11 Sep 2025 23:41:02 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":145,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 06:41:02
119	9fdb1b69-d765-43a0-9b2d-adea71f2ad49	9fdb1b69-e0b8-4025-98c5-09199d3ee11d	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:41:05
121	9fdb1b69-e05d-4644-a3d3-15d0ad9547b9	9fdb1b69-e0b8-4025-98c5-09199d3ee11d	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/bmlinks\\/ddf.xml","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"192.168.0.196","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Thu, 11 Sep 2025 23:41:05 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":131,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 06:41:05
122	9fdb1b6a-0eb6-448e-bbea-d0a5353e49e3	9fdb1b6a-1867-426e-8b64-0214c2eacb9b	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:41:05
123	9fdb1b6a-149c-4b4b-b802-6798dab49bb7	9fdb1b6a-1867-426e-8b64-0214c2eacb9b	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:41:05
124	9fdb1b6a-17f3-4ba4-ade2-f16c1946640c	9fdb1b6a-1867-426e-8b64-0214c2eacb9b	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/upnp\\/BasicDevice.xml","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"192.168.0.196","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Thu, 11 Sep 2025 23:41:05 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":132,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 06:41:05
125	9fdb1b6a-3dd0-4eea-9e91-58440924de5e	9fdb1b6a-44ca-4e5a-80ba-1466367b1502	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:41:06
126	9fdb1b6a-4262-42ad-8682-a63d18ec889a	9fdb1b6a-44ca-4e5a-80ba-1466367b1502	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 06:41:06
127	9fdb1b6a-446d-469d-ad9b-fb433e56bdb7	9fdb1b6a-44ca-4e5a-80ba-1466367b1502	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/boaform\\/formPing","method":"POST","controller_action":null,"middleware":[],"headers":{"host":"192.168.0.196","content-type":"application\\/x-www-form-urlencoded","content-length":"105","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":{"pingAddr":"\\"1.1.1.1 `ping -c 1 -s 41 192.168.0.196`\\"","wanif":"65535","submit-url":"\\/ping.asp","postSecurityFlag":"2564"},"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Thu, 11 Sep 2025 23:41:06 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":94,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 06:41:06
128	9fdb681c-cf22-4aad-b745-e93036266f88	9fdb681c-ddb5-4e12-bcfe-c10a9e69e7ef	\N	t	command	{"command":"make:model","exit_code":0,"arguments":{"command":"make:model","name":"TimeBoxing"},"options":{"all":false,"controller":false,"factory":false,"force":false,"migration":true,"morph-pivot":false,"policy":false,"seed":false,"pivot":false,"resource":false,"api":false,"requests":false,"test":false,"pest":false,"phpunit":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 10:15:33
129	9fdb6845-8f81-4ff2-aecd-05f4b30abb5c	9fdb6845-94cb-4ecb-a364-6d7a96f06b17	\N	t	command	{"command":"make:controller","exit_code":0,"arguments":{"command":"make:controller","name":"TimeBoxingController"},"options":{"api":false,"type":null,"force":false,"invokable":false,"model":null,"parent":null,"resource":true,"requests":false,"singleton":false,"creatable":false,"test":false,"pest":false,"phpunit":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 10:16:00
130	9fdb69fc-1571-4128-9edb-b5727f40ef24	9fdb69fc-6668-4e3c-a563-affa8ce7f444	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"30.69","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 10:20:47
131	9fdb69fc-1c71-479e-9cfa-7792692daa9e	9fdb69fc-6668-4e3c-a563-affa8ce7f444	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"2.63","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 10:20:47
132	9fdb69fc-24e7-4f7b-9f6f-b5fb632a7110	9fdb69fc-6668-4e3c-a563-affa8ce7f444	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"6.02","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 10:20:47
133	9fdb69fc-2811-4ec8-8cff-fbdd2eb31054	9fdb69fc-6668-4e3c-a563-affa8ce7f444	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.38","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 10:20:47
134	9fdb69fc-2ff2-4794-b4f1-bec98acaaefd	9fdb69fc-6668-4e3c-a563-affa8ce7f444	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"2.05","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"0609fffe774b"}	2025-09-12 10:20:47
135	9fdb69fc-592b-426e-b92a-9652660904f4	9fdb69fc-6668-4e3c-a563-affa8ce7f444	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"time_boxings\\" (\\"id\\" bigserial not null primary key, \\"title\\" varchar(255) not null, \\"description\\" text null, \\"duration_minutes\\" integer not null, \\"start_time\\" timestamp(0) without time zone null, \\"end_time\\" timestamp(0) without time zone null, \\"status\\" varchar(255) check (\\"status\\" in ('planned', 'in_progress', 'completed', 'cancelled')) not null default 'planned', \\"priority\\" varchar(255) not null default 'medium', \\"category\\" varchar(255) null, \\"notes\\" text null, \\"created_at\\" timestamp(0) without time zone null, \\"updated_at\\" timestamp(0) without time zone null)","time":"46.76","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_101533_create_time_boxings_table.php","line":14,"hash":"cae7a901b9cee1d816e8450a2ea7cb5b","hostname":"0609fffe774b"}	2025-09-12 10:20:47
136	9fdb69fc-640d-4865-bf42-68d297fbb9ef	9fdb69fc-6668-4e3c-a563-affa8ce7f444	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_12_101533_create_time_boxings_table', 2)","time":"3.79","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 10:20:48
137	9fdb69fc-6521-4983-b0b4-424a83a73701	9fdb69fc-6668-4e3c-a563-affa8ce7f444	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":false,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 10:20:48
138	9fdb6b4e-8cad-4c97-899d-803a5417ddbe	9fdb6b4e-930f-4a20-badf-7a010f517166	\N	t	command	{"command":"make:seeder","exit_code":0,"arguments":{"command":"make:seeder","name":"TimeBoxingSeeder"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 10:24:29
139	9fdb6b66-7d54-49e2-959b-60f50f2da2c0	9fdb6b66-8c1b-4237-a94e-055c99d66da4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"time_boxings\\" (\\"title\\", \\"description\\", \\"duration_minutes\\", \\"start_time\\", \\"end_time\\", \\"status\\", \\"priority\\", \\"category\\", \\"notes\\", \\"created_at\\", \\"updated_at\\") values ('Morning Work Session', 'Focus on completing the quarterly report and preparing presentation slides for the team meeting.', 25, '2025-09-12 11:24:45', '2025-09-12 11:49:45', 'planned', 'high', 'Work', 'Use Pomodoro technique - 25 minutes focused work, 5 minutes break.', '2025-09-12 10:24:45', '2025-09-12 10:24:45') returning \\"id\\"","time":"28.38","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/TimeBoxingSeeder.php","line":60,"hash":"1839f8455c791c73696cb5cdd4439475","hostname":"0609fffe774b"}	2025-09-12 10:24:45
140	9fdb6b66-8225-47b9-91bc-eb5f4653eea7	9fdb6b66-8c1b-4237-a94e-055c99d66da4	\N	t	model	{"action":"created","model":"App\\\\Models\\\\TimeBoxing:1","hostname":"0609fffe774b"}	2025-09-12 10:24:45
141	9fdb6b66-8824-4c49-9c28-c5ab2440cba8	9fdb6b66-8c1b-4237-a94e-055c99d66da4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"time_boxings\\" (\\"title\\", \\"description\\", \\"duration_minutes\\", \\"start_time\\", \\"end_time\\", \\"status\\", \\"priority\\", \\"category\\", \\"notes\\", \\"created_at\\", \\"updated_at\\") values ('Learning Laravel Framework', 'Study Laravel documentation and practice building a simple CRUD application.', 45, '2025-09-12 13:24:45', '2025-09-12 14:09:45', 'in_progress', 'medium', 'Learning', 'Focus on understanding Eloquent ORM and Blade templating.', '2025-09-12 09:24:45', '2025-09-12 09:54:45') returning \\"id\\"","time":"3.27","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/TimeBoxingSeeder.php","line":60,"hash":"1839f8455c791c73696cb5cdd4439475","hostname":"0609fffe774b"}	2025-09-12 10:24:45
142	9fdb6b66-883e-43a6-b17c-077b3b6abe5d	9fdb6b66-8c1b-4237-a94e-055c99d66da4	\N	t	model	{"action":"created","model":"App\\\\Models\\\\TimeBoxing:2","hostname":"0609fffe774b"}	2025-09-12 10:24:45
143	9fdb6b66-8a1a-499e-aab5-5039d57bbb32	9fdb6b66-8c1b-4237-a94e-055c99d66da4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"time_boxings\\" (\\"title\\", \\"description\\", \\"duration_minutes\\", \\"start_time\\", \\"end_time\\", \\"status\\", \\"priority\\", \\"category\\", \\"notes\\", \\"created_at\\", \\"updated_at\\") values ('Exercise & Fitness', 'Complete a 30-minute workout session including cardio and strength training.', 30, '2025-09-12 08:24:45', '2025-09-12 08:54:45', 'completed', 'medium', 'Health', 'Great session! Completed all planned exercises. Next session: focus on upper body.', '2025-09-12 07:24:45', '2025-09-12 08:54:45') returning \\"id\\"","time":"3.84","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/TimeBoxingSeeder.php","line":60,"hash":"1839f8455c791c73696cb5cdd4439475","hostname":"0609fffe774b"}	2025-09-12 10:24:45
144	9fdb6b66-8a39-4fb4-9a5a-14f315358873	9fdb6b66-8c1b-4237-a94e-055c99d66da4	\N	t	model	{"action":"created","model":"App\\\\Models\\\\TimeBoxing:3","hostname":"0609fffe774b"}	2025-09-12 10:24:45
145	9fdb6b66-8aab-4fcd-acba-4aedf81e7366	9fdb6b66-8c1b-4237-a94e-055c99d66da4	\N	t	command	{"command":"db:seed","exit_code":0,"arguments":{"command":"db:seed","class":null},"options":{"class":"TimeBoxingSeeder","database":null,"force":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 10:24:45
146	9fdb757f-65ca-451c-a7fa-57d7b22e741a	9fdb757f-acbb-4172-9935-60aa529d5719	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"25.73","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 10:52:59
147	9fdb757f-6bb4-43d5-8c65-7eba161c6e27	9fdb757f-acbb-4172-9935-60aa529d5719	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"2.55","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 10:52:59
148	9fdb757f-72cb-4d0c-8738-fd450fada2ff	9fdb757f-acbb-4172-9935-60aa529d5719	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"4.02","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 10:52:59
149	9fdb757f-75f3-434d-be1d-5785a6f0bcf4	9fdb757f-acbb-4172-9935-60aa529d5719	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.37","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 10:52:59
150	9fdb757f-7efc-438b-a6f0-462cf88e81f6	9fdb757f-acbb-4172-9935-60aa529d5719	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"1.75","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"0609fffe774b"}	2025-09-12 10:52:59
151	9fdb757f-9df0-4af7-9b5a-349fc4721653	9fdb757f-acbb-4172-9935-60aa529d5719	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"create table \\"time_boxings\\" (\\"id\\" bigserial not null primary key, \\"timeboxing_id\\" varchar(255) not null, \\"project_id\\" varchar(255) not null, \\"no\\" integer not null, \\"information_date\\" date not null, \\"user_position\\" varchar(255) not null, \\"department\\" varchar(255) check (\\"department\\" in ('Food & Beverage', 'Kitchen', 'Room Division', 'Front Office', 'Housekeeping', 'Engineering', 'Sales & Marketing', 'IT \\/ EDP', 'Accounting', 'Executive Office')) not null, \\"application\\" varchar(255) check (\\"application\\" in ('Power FO', 'My POS', 'My MGR', 'Power AR', 'Power INV', 'Power AP', 'Power GL', 'Keylock', 'PABX', 'DIM', 'Dynamic Room Rate', 'Channel Manager', 'PB1', 'Power SIGN', 'Multi Properties', 'Scanner ID', 'IPOS', 'Power Runner', 'Power RA', 'Power ME', 'ECOS', 'Cloud WS', 'Power GO', 'Dashpad', 'IPTV', 'HSIA', 'SGI', 'Guest Survey', 'Loyalty Management', 'AccPac', 'GL Consolidation', 'Self Check In', 'Check In Desk', 'Others')) not null, \\"type\\" varchar(255) check (\\"type\\" in ('Setup', 'Question', 'Issue', 'Report Issue', 'Report Request', 'Feature Request')) not null, \\"description\\" text not null, \\"action_solution\\" text null, \\"due_date\\" date null, \\"status\\" varchar(255) check (\\"status\\" in ('Open', 'On Progress', 'Need Requirement', 'Done')) not null default 'Open', \\"cnc_number\\" varchar(255) null, \\"created_at\\" timestamp(0) without time zone null, \\"updated_at\\" timestamp(0) without time zone null)","time":"43.80","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_101533_create_time_boxings_table.php","line":14,"hash":"7f40b74ee9b224f076bea75903e03f9e","hostname":"0609fffe774b"}	2025-09-12 10:52:59
152	9fdb757f-a168-4dae-92af-4258ceb83074	9fdb757f-acbb-4172-9935-60aa529d5719	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"time_boxings\\" add constraint \\"time_boxings_timeboxing_id_unique\\" unique (\\"timeboxing_id\\")","time":"8.30","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_101533_create_time_boxings_table.php","line":14,"hash":"6d1b90dcf75abde64836387d4b4fc616","hostname":"0609fffe774b"}	2025-09-12 10:52:59
153	9fdb757f-aaa4-4530-81d6-d655396d22db	9fdb757f-acbb-4172-9935-60aa529d5719	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_12_101533_create_time_boxings_table', 2)","time":"4.21","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 10:52:59
154	9fdb757f-ab79-4b55-9f62-31d491d99f74	9fdb757f-acbb-4172-9935-60aa529d5719	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":false,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 10:52:59
155	9fdb75ad-eb68-403e-a6bd-c6e0fef58c09	9fdb75ad-f5f9-406b-8872-decd9e161cc0	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"time_boxings\\" (\\"timeboxing_id\\", \\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"created_at\\", \\"updated_at\\") values ('TB001', 'PRJ001', 1, '2025-09-12 00:00:00', 'Project Manager', 'IT \\/ EDP', 'Power FO', 'Setup', 'Setup time boxing system for project management and productivity tracking', 'Configure time tracking tools and establish time boxing protocols', '2025-09-19 00:00:00', 'Open', 'CNC001', '2025-09-12 10:53:29', '2025-09-12 10:53:29') returning \\"id\\"","time":"36.15","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/TimeBoxingSeeder.php","line":72,"hash":"56b2d740518464f0ae6bae4260f07c7c","hostname":"0609fffe774b"}	2025-09-12 10:53:29
156	9fdb75ad-eeec-406f-9f41-f48c2cb99292	9fdb75ad-f5f9-406b-8872-decd9e161cc0	\N	t	model	{"action":"created","model":"App\\\\Models\\\\TimeBoxing:1","hostname":"0609fffe774b"}	2025-09-12 10:53:29
157	9fdb75ad-f2ff-447e-9840-d36041b79853	9fdb75ad-f5f9-406b-8872-decd9e161cc0	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"time_boxings\\" (\\"timeboxing_id\\", \\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"created_at\\", \\"updated_at\\") values ('TB002', 'PRJ002', 2, '2025-09-12 00:00:00', 'Developer', 'IT \\/ EDP', 'Power AR', 'Issue', 'Implement time boxing features in the application', 'Develop time tracking components and integrate with existing system', '2025-09-26 00:00:00', 'On Progress', 'CNC002', '2025-09-12 09:53:29', '2025-09-12 10:23:29') returning \\"id\\"","time":"3.78","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/TimeBoxingSeeder.php","line":72,"hash":"56b2d740518464f0ae6bae4260f07c7c","hostname":"0609fffe774b"}	2025-09-12 10:53:29
158	9fdb75ad-f31c-4e78-8a64-607dd558a056	9fdb75ad-f5f9-406b-8872-decd9e161cc0	\N	t	model	{"action":"created","model":"App\\\\Models\\\\TimeBoxing:2","hostname":"0609fffe774b"}	2025-09-12 10:53:29
159	9fdb75ad-f49b-4ab9-b0c2-6f7ca2d786ca	9fdb75ad-f5f9-406b-8872-decd9e161cc0	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"time_boxings\\" (\\"timeboxing_id\\", \\"project_id\\", \\"no\\", \\"information_date\\", \\"user_position\\", \\"department\\", \\"application\\", \\"type\\", \\"description\\", \\"action_solution\\", \\"due_date\\", \\"status\\", \\"cnc_number\\", \\"created_at\\", \\"updated_at\\") values ('TB003', 'PRJ003', 3, '2025-09-12 00:00:00', 'Analyst', 'Sales & Marketing', 'Power INV', 'Feature Request', 'Add time boxing analytics and reporting features', 'Create dashboard for time boxing metrics and generate reports', '2025-10-03 00:00:00', 'Done', 'CNC003', '2025-09-12 07:53:29', '2025-09-12 09:23:29') returning \\"id\\"","time":"2.96","slow":false,"file":"\\/var\\/www\\/database\\/seeders\\/TimeBoxingSeeder.php","line":72,"hash":"56b2d740518464f0ae6bae4260f07c7c","hostname":"0609fffe774b"}	2025-09-12 10:53:29
160	9fdb75ad-f4b1-435d-9960-8491ba10d894	9fdb75ad-f5f9-406b-8872-decd9e161cc0	\N	t	model	{"action":"created","model":"App\\\\Models\\\\TimeBoxing:3","hostname":"0609fffe774b"}	2025-09-12 10:53:29
161	9fdb75ad-f511-481d-b6e6-fa4e86b10363	9fdb75ad-f5f9-406b-8872-decd9e161cc0	\N	t	command	{"command":"db:seed","exit_code":0,"arguments":{"command":"db:seed","class":null},"options":{"class":"TimeBoxingSeeder","database":null,"force":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 10:53:29
96	9fdaa5c9-8039-4e8b-a933-43c95c441fd0	9fdaa5c9-8c37-4fc6-9c1f-42086f3ab9a2	0891ca4289b14370d5b4c81cbd961038	f	exception	{"class":"Psy\\\\Exception\\\\ParseErrorException","file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Exception\\/ParseErrorException.php","line":44,"message":"PHP Parse error: Syntax error, unexpected T_NS_SEPARATOR on line 2","context":null,"trace":[{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":306},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":240},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":852},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":881},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":1390},{"file":"\\/var\\/www\\/vendor\\/laravel\\/tinker\\/src\\/Console\\/TinkerCommand.php","line":76},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":696},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":213},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Command\\/Command.php","line":318},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":182},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":1110},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":359},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":194},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php","line":198},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php","line":1235},{"file":"\\/var\\/www\\/artisan","line":13}],"line_preview":{"35":"    }","36":"","37":"    \\/**","38":"     * Create a ParseErrorException from a PhpParser Error.","39":"     *","40":"     * @param \\\\PhpParser\\\\Error $e","41":"     *\\/","42":"    public static function fromParseError(\\\\PhpParser\\\\Error $e): self","43":"    {","44":"        return new self($e->getRawMessage(), $e->getAttributes());","45":"    }","46":"}","47":""},"hostname":"0609fffe774b","occurrences":2}	2025-09-12 01:12:11
163	9fdba95a-b2b2-4964-bc56-1da1011c6fcf	9fdba95a-db3a-4d78-9a6b-baaa823d50cc	\N	t	command	{"command":"tinker","exit_code":1,"arguments":{"command":"tinker","include":[]},"options":{"execute":"echo 'Time Boxing count: ' . App\\\\Models\\\\TimeBoxing::count(); App\\\\Models\\\\TimeBoxing::all()->each(function(\\\\) { echo \\\\->timeboxing_id . ' - ' . \\\\->description . PHP_EOL; });","help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 13:17:59
164	9fdba961-c36c-454e-ac36-ba4ef5da21a3	9fdba961-c7f6-44e5-83a5-93f6a32a60ac	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select count(*) as aggregate from \\"time_boxings\\"","time":"16.84","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"be86b9a89acb5998baba2d868bc61a4f","hostname":"0609fffe774b"}	2025-09-12 13:18:04
165	9fdba961-c701-4031-9188-6732402d14a3	9fdba961-c7f6-44e5-83a5-93f6a32a60ac	\N	t	command	{"command":"tinker","exit_code":0,"arguments":{"command":"tinker","include":[]},"options":{"execute":"echo App\\\\Models\\\\TimeBoxing::count();","help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 13:18:04
166	9fdbb0d7-097c-49fc-a174-72e653088f93	9fdbb0d7-14ed-4d65-bd0c-5481195b98c8	\N	t	command	{"command":"route:clear","exit_code":0,"arguments":{"command":"route:clear"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 13:38:55
167	9fdbb0df-40e6-462a-876f-e4d70f66810a	9fdbb0df-4488-406b-a74d-5d0a936bc194	\N	t	command	{"command":"route:list","exit_code":0,"arguments":{"command":"route:list"},"options":{"json":false,"method":null,"action":null,"name":null,"domain":null,"path":null,"except-path":null,"reverse":false,"sort":"uri","except-vendor":false,"only-vendor":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 13:39:00
168	9fdbb12f-4fb9-4922-81bb-9562cc83575a	9fdbb12f-531f-4194-9a13-1a6435588773	\N	t	command	{"command":"route:clear","exit_code":0,"arguments":{"command":"route:clear"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 13:39:53
169	9fdbcf72-2ba5-4412-a2f2-f93c8ec63760	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	redis	{"connection":"default","command":"get powerproORQvkZNZ23vQYFNAnemXZbhl82xQDZ94EYMzpYCW","time":"0.20","hostname":"0609fffe774b"}	2025-09-12 15:04:30
170	9fdbcf72-35a5-49c6-b15c-1f3d6973e530	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	cache	{"type":"missed","key":"ORQvkZNZ23vQYFNAnemXZbhl82xQDZ94EYMzpYCW","hostname":"0609fffe774b"}	2025-09-12 15:04:30
171	9fdbcf72-40cf-4470-8305-8beb92408d7a	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	view	{"name":"dashboard.index","path":"\\/resources\\/views\\/dashboard\\/index.blade.php","data":[],"hostname":"0609fffe774b"}	2025-09-12 15:04:30
172	9fdbcf72-53ae-441f-9670-dcd6884b6e0e	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	view	{"name":"layout.layout","path":"\\/resources\\/views\\/layout\\/layout.blade.php","data":["title","subTitle","script"],"hostname":"0609fffe774b"}	2025-09-12 15:04:30
173	9fdbcf72-6e30-4569-9b46-6769bac0ca1e	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	view	{"name":"components.head","path":"\\/resources\\/views\\/components\\/head.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 15:04:30
174	9fdbcf72-77e4-4869-be40-7f902756b7d6	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	view	{"name":"components.horizontal-nav","path":"\\/resources\\/views\\/components\\/horizontal-nav.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 15:04:30
175	9fdbcf72-7f02-4c42-8672-1c54fdb4d9d7	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	view	{"name":"components.navbar","path":"\\/resources\\/views\\/components\\/navbar.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 15:04:30
176	9fdbcf72-86aa-499a-82d5-1d155d18e273	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	view	{"name":"components.breadcrumb","path":"\\/resources\\/views\\/components\\/breadcrumb.blade.php","data":["title","subTitle","attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 15:04:30
177	9fdbcf72-903c-48da-84b5-dc253d0c195b	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	view	{"name":"components.footer","path":"\\/resources\\/views\\/components\\/footer.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 15:04:30
178	9fdbcf72-9633-4ad3-9d1e-067fdb3fb438	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	view	{"name":"components.script","path":"\\/resources\\/views\\/components\\/script.blade.php","data":["script","attributes","slot","__laravel_slots"],"hostname":"0609fffe774b"}	2025-09-12 15:04:30
179	9fdbcf72-9c8b-45c0-9fd2-8c8121d17760	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	redis	{"connection":"default","command":"setex powerproORQvkZNZ23vQYFNAnemXZbhl82xQDZ94EYMzpYCW 7200 s:178:\\"a:3:{s:6:\\"_token\\";s:40:\\"hQOf5KmvGrY68IAXpbhk3UGT9WkZ0R8JCSR1cy0c\\";s:9:\\"_previous\\";a:1:{s:3:\\"url\\";s:20:\\"https:\\/\\/172.27.112.1\\";}s:6:\\"_flash\\";a:2:{s:3:\\"old\\";a:0:{}s:3:\\"new\\";a:0:{}}}\\";","time":"1.54","hostname":"0609fffe774b"}	2025-09-12 15:04:30
180	9fdbcf72-9cb1-4052-96c9-d8729d87fcf1	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	cache	{"type":"set","key":"ORQvkZNZ23vQYFNAnemXZbhl82xQDZ94EYMzpYCW","value":"a:3:{s:6:\\"_token\\";s:40:\\"hQOf5KmvGrY68IAXpbhk3UGT9WkZ0R8JCSR1cy0c\\";s:9:\\"_previous\\";a:1:{s:3:\\"url\\";s:20:\\"https:\\/\\/172.27.112.1\\";}s:6:\\"_flash\\";a:2:{s:3:\\"old\\";a:0:{}s:3:\\"new\\";a:0:{}}}","expiration":7200,"hostname":"0609fffe774b"}	2025-09-12 15:04:30
181	9fdbcf72-9d26-4a62-b7f8-59373c7af79a	9fdbcf72-9e11-4a9c-8a80-785a184f4a24	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/","method":"GET","controller_action":"App\\\\Http\\\\Controllers\\\\DashboardController@index","middleware":["web"],"headers":{"host":"172.27.112.1","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":{"_token":"hQOf5KmvGrY68IAXpbhk3UGT9WkZ0R8JCSR1cy0c","_previous":{"url":"https:\\/\\/172.27.112.1"},"_flash":{"old":[],"new":[]}},"response_headers":{"content-type":"text\\/html; charset=UTF-8","cache-control":"no-cache, private","date":"Fri, 12 Sep 2025 08:04:30 GMT","set-cookie":"XSRF-TOKEN=eyJpdiI6ImVWT2N3TUU2WFBhbGZiR2kyRm9yQ0E9PSIsInZhbHVlIjoieERsOHVubEt6dUdSOU5vSGlNZ1VLalhaOVc2QXRxaFZ3QVVJQ1NqaTZTQ3ZGeFdKZ1VqRHVqb29OS0FYZUhaNEdITlNTSU1seEtuRThZcnNIRU43VkVkbkt5YXJXS3UrRkpQVVE4NHFJR1lzakNWSkw1QVhpOXBCOTFtRUhJRFYiLCJtYWMiOiI2NTQyYmE0MjA5MTViODAzYWU5OThkZWM5ZDMyM2U5Y2MyNDI1ZDFmYzg1OTkyMDczZTNkMWU3NDA1OThmZjZlIiwidGFnIjoiIn0%3D; expires=Fri, 12 Sep 2025 10:04:30 GMT; Max-Age=7200; path=\\/; domain=localhost; samesite=lax, powerpro_session=eyJpdiI6IjE2Z3hUemh4VmY1WEF5Q0NYQW5mL3c9PSIsInZhbHVlIjoiNW5iTkF2dmxZSGRLWEQ1elZqdUlsK2ZkaGhBU25kZStIUlZ4RGNqTGVZNmlmVm1WUGtqQlpDMVBzUHVUbEdEVWs3TXo5bE8yOVhzcWtIL3hFZDNLWUt4QS9Qa0V0dS9ndUZlZXRDemZ1QU54dDRYaTJFMnBpc2xNV20wWjB2RysiLCJtYWMiOiJiOWJiZTllNWFjNjY5MmNhNjBiZDk3Y2U0ZjUyY2Y5MDFmZWQzYjZkOTljM2MwZTYwNmQ4ZWI1YjBmZDUzMmRjIiwidGFnIjoiIn0%3D; expires=Fri, 12 Sep 2025 10:04:30 GMT; Max-Age=7200; path=\\/; domain=localhost; httponly; samesite=lax"},"response_status":200,"response":{"view":"\\/var\\/www\\/resources\\/views\\/dashboard\\/index.blade.php","data":[]},"duration":514,"memory":4,"hostname":"0609fffe774b"}	2025-09-12 15:04:30
182	9fdbcf8f-858f-49a2-9424-8e32969e03df	9fdbcf8f-9e89-4b03-8fd5-8ab96e6b8bce	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:49
183	9fdbcf8f-94c7-487d-8fae-37c7e0a525df	9fdbcf8f-9e89-4b03-8fd5-8ab96e6b8bce	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:49
184	9fdbcf8f-9db1-4436-8e51-14c4d4127e7f	9fdbcf8f-9e89-4b03-8fd5-8ab96e6b8bce	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/HNAP1","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Fri, 12 Sep 2025 08:04:49 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":275,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 15:04:49
185	9fdbcf95-db11-451f-856e-23cfa3828bbe	9fdbcf95-f3a9-44da-a0cb-7038628b2a90	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:53
186	9fdbcf95-e97f-4408-a465-66bd8f2bd7d0	9fdbcf95-f3a9-44da-a0cb-7038628b2a90	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:53
187	9fdbcf95-f311-4eb4-a6d3-f2d3de1c9b04	9fdbcf95-f3a9-44da-a0cb-7038628b2a90	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/cgi\\/get.cgi?cmd=home_login","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; WOW64; Trident\\/7.0; rv:11.0) like Gecko","accept-encoding":"deflate, gzip","accept":"*\\/*"},"payload":{"cmd":"home_login"},"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Fri, 12 Sep 2025 08:04:53 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":280,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 15:04:53
188	9fdbcf9b-ba2f-4b75-b36c-7b0139b02419	9fdbcf9b-cc7b-4f61-afa1-20f2bd7f7ad3	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:57
189	9fdbcf9b-c5bd-42d3-a401-b4ee0861772b	9fdbcf9b-cc7b-4f61-afa1-20f2bd7f7ad3	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:57
190	9fdbcf9b-cbc9-4c74-91ce-7dc76015dad1	9fdbcf9b-cc7b-4f61-afa1-20f2bd7f7ad3	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/bmlinks\\/ddf.xml","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Fri, 12 Sep 2025 08:04:57 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":249,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 15:04:57
191	9fdbcf9c-5266-48bb-a0bf-02c9e099cdb8	9fdbcf9c-65c8-440d-aa92-0f9152ed0224	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:57
192	9fdbcf9c-5ec8-4180-99f9-2e77d5bb840e	9fdbcf9c-65c8-440d-aa92-0f9152ed0224	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:57
193	9fdbcf9c-6542-4bac-b511-c773f8b57d00	9fdbcf9c-65c8-440d-aa92-0f9152ed0224	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/upnp\\/BasicDevice.xml","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Fri, 12 Sep 2025 08:04:57 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":366,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 15:04:57
194	9fdbcf9c-ca12-47dd-a3a0-961ba13bb1c0	9fdbcf9c-dd7c-43da-9edc-a10b2821dc30	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:58
195	9fdbcf9c-d583-4c18-951d-b88be7b4f2d9	9fdbcf9c-dd7c-43da-9edc-a10b2821dc30	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:58
196	9fdbcf9c-dcc5-4654-aa1b-35a0d550df5b	9fdbcf9c-dd7c-43da-9edc-a10b2821dc30	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/boaform\\/formPing","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Fri, 12 Sep 2025 08:04:58 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":264,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 15:04:58
197	9fdbcf9e-344b-45b4-af9f-a870509fd82f	9fdbcf9e-4990-478f-a6af-11ad9f2d8bd7	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:59
198	9fdbcf9e-41b6-45d1-9651-65bae42ee04f	9fdbcf9e-4990-478f-a6af-11ad9f2d8bd7	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"0609fffe774b"}	2025-09-12 15:04:59
199	9fdbcf9e-48cc-46da-abb4-9b1f106d5a03	9fdbcf9e-4990-478f-a6af-11ad9f2d8bd7	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/boaform\\/admin\\/formPing","method":"POST","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","content-type":"application\\/x-www-form-urlencoded","content-length":"111","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":{"target_addr":";ping -c 1 -s 41 172.27.112.1 ; echo AV-HNS-SCAN-PROBE","waninf":"1_INTERNET_R_VID_"},"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Fri, 12 Sep 2025 08:04:59 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":272,"memory":2,"hostname":"0609fffe774b"}	2025-09-12 15:04:59
201	9fdbd4e8-8d69-4d75-a308-bcf5c01233d9	9fdbd4e9-0712-4a8d-bd24-22d935c6e52a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"31.32","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 15:19:46
202	9fdbd4e8-975c-4a51-9db3-4c5dba96d644	9fdbd4e9-0712-4a8d-bd24-22d935c6e52a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"2.16","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 15:19:46
203	9fdbd4e8-a26d-4c04-99ea-1469d0cb5b93	9fdbd4e9-0712-4a8d-bd24-22d935c6e52a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"5.32","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 15:19:46
204	9fdbd4e8-a5cc-46bc-af1f-ba7e7fdbb451	9fdbd4e9-0712-4a8d-bd24-22d935c6e52a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.51","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 15:19:46
205	9fdbd4e8-ad51-4a43-aa8b-c69e2aa94530	9fdbd4e9-0712-4a8d-bd24-22d935c6e52a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"2.01","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"0609fffe774b"}	2025-09-12 15:19:46
206	9fdbd4e8-d1c2-4270-bcfd-2a31b3912d40	9fdbd4e9-0712-4a8d-bd24-22d935c6e52a	\N	t	command	{"command":"migrate","exit_code":1,"arguments":{"command":"migrate"},"options":{"database":null,"force":true,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 15:19:46
207	9fdbd51d-b475-436e-a172-e2872c8a9e78	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"44.85","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 15:20:21
208	9fdbd51d-bfed-4ebf-83b8-946983c1a5fb	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"2.94","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 15:20:21
209	9fdbd51d-ce9a-4e4c-90d7-ed1599d5af55	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"6.15","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 15:20:21
210	9fdbd51d-d34d-439d-a64d-0cf82b47d69b	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.96","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 15:20:21
211	9fdbd51d-e85a-4de1-885c-06eb285cb4d9	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"29.35","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"0609fffe774b"}	2025-09-12 15:20:21
212	9fdbd51e-0303-4f76-860c-fe7be1f8105f	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_type_check","time":"23.93","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140501_update_time_boxings_type_check.php","line":10,"hash":"1923636d0a4b8010819675133417bee6","hostname":"0609fffe774b"}	2025-09-12 15:20:21
213	9fdbd51e-04bc-4681-b5f7-7808244b321f	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"UPDATE time_boxings SET type = 'General' WHERE type NOT IN (\\r\\n            'General',\\r\\n            'Submission Maintenance',\\r\\n            'Update to MD',\\r\\n            'Update to Team Bali',\\r\\n            'Project Preparation',\\r\\n            'Work Order',\\r\\n            'Team Meeting',\\r\\n            'Hotel Meeting',\\r\\n            'Green Plan',\\r\\n            'Others Project'\\r\\n        )","time":"3.95","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140501_update_time_boxings_type_check.php","line":13,"hash":"1641c7f1fa1e51b29be525e51dad660d","hostname":"0609fffe774b"}	2025-09-12 15:20:21
214	9fdbd51e-071f-471a-833d-b97c2f194b98	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"ALTER TABLE time_boxings ADD CONSTRAINT time_boxings_type_check CHECK (type IN (\\r\\n            'General',\\r\\n            'Submission Maintenance',\\r\\n            'Update to MD',\\r\\n            'Update to Team Bali',\\r\\n            'Project Preparation',\\r\\n            'Work Order',\\r\\n            'Team Meeting',\\r\\n            'Hotel Meeting',\\r\\n            'Green Plan',\\r\\n            'Others Project'\\r\\n        ))","time":"5.68","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140501_update_time_boxings_type_check.php","line":27,"hash":"ed17996e0b5c28056bcb238b42b376c9","hostname":"0609fffe774b"}	2025-09-12 15:20:21
215	9fdbd51e-1003-453a-b3c7-31c59c3422d7	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_12_140501_update_time_boxings_type_check', 3)","time":"5.48","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 15:20:21
216	9fdbd51e-10f6-4426-89ff-5b5e14aa38bd	9fdbd51e-1249-42d5-a5c7-8e79c822ee99	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":true,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 15:20:21
217	9fdbd67a-4596-4a24-8ec2-0f7b76a3486c	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"20.96","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 15:24:09
218	9fdbd67a-499f-4b12-8e63-2e7677f21c9b	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"1.63","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 15:24:09
219	9fdbd67a-504f-4e8a-889b-eb22873452cb	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"4.82","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 15:24:09
220	9fdbd67a-5372-4e3b-b8a2-6424c8b844d7	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.13","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 15:24:09
221	9fdbd67a-5a97-47f6-bd5a-8056b2c4a512	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"1.61","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"0609fffe774b"}	2025-09-12 15:24:09
222	9fdbd67a-66de-4d53-9643-47062c253f34	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_status_check","time":"4.96","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140601_update_time_boxings_status_check.php","line":10,"hash":"0f6a91776b41cd05c474e46cfe3257bf","hostname":"0609fffe774b"}	2025-09-12 15:24:10
223	9fdbd67a-686c-410b-bd5a-03cf9e3b7979	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"UPDATE time_boxings SET status = 'Brain Dump' WHERE status NOT IN (\\r\\n            'Brain Dump', 'Priority List', 'Time Boxing', 'Completed', 'Cancel'\\r\\n        )","time":"3.59","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140601_update_time_boxings_status_check.php","line":13,"hash":"297b5701a96c5fd115b266bdcd1fe8db","hostname":"0609fffe774b"}	2025-09-12 15:24:10
224	9fdbd67a-6964-4daa-b860-dce92734ff2f	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"UPDATE time_boxings SET status = 'Brain Dump' WHERE status = 'Open'","time":"2.02","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140601_update_time_boxings_status_check.php","line":16,"hash":"8aa7c48a938294bf3476cd6578dff39b","hostname":"0609fffe774b"}	2025-09-12 15:24:10
225	9fdbd67a-6a20-4d60-95e0-b6e09a3dffc8	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"UPDATE time_boxings SET status = 'Time Boxing' WHERE status = 'On Progress'","time":"1.37","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140601_update_time_boxings_status_check.php","line":17,"hash":"18877cd796019e5ede67e4fabc651a3e","hostname":"0609fffe774b"}	2025-09-12 15:24:10
226	9fdbd67a-6abf-4c26-9e15-8adfa8cdefcf	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"UPDATE time_boxings SET status = 'Priority List' WHERE status = 'Need Requirement'","time":"1.12","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140601_update_time_boxings_status_check.php","line":18,"hash":"ce49b49e35aba8d38ec9a0e1e60992f5","hostname":"0609fffe774b"}	2025-09-12 15:24:10
227	9fdbd67a-6b3e-4f08-9f03-3c6aec1d8686	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"UPDATE time_boxings SET status = 'Completed' WHERE status = 'Done'","time":"0.87","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140601_update_time_boxings_status_check.php","line":19,"hash":"70daf7d5feee924442003d84691bcd75","hostname":"0609fffe774b"}	2025-09-12 15:24:10
228	9fdbd67a-6ccf-46a0-ab85-eb58550bf8bb	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"ALTER TABLE time_boxings ADD CONSTRAINT time_boxings_status_check CHECK (status IN (\\r\\n            'Brain Dump', 'Priority List', 'Time Boxing', 'Completed', 'Cancel'\\r\\n        ))","time":"3.64","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140601_update_time_boxings_status_check.php","line":22,"hash":"49727876e8bce1760fbf7e75bfa5b7f4","hostname":"0609fffe774b"}	2025-09-12 15:24:10
229	9fdbd67a-778e-4f55-ad03-28e1e6d1dcbe	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_12_140601_update_time_boxings_status_check', 4)","time":"3.72","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 15:24:10
230	9fdbd67a-782e-4ba0-8e3d-174a8b65b0ed	9fdbd67a-7949-4edb-9db0-94636cbb74e5	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":true,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 15:24:10
231	9fdbd797-885e-4f23-b760-4432188b4a60	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"26.25","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 15:27:16
232	9fdbd797-8db4-45c8-89be-b8d108dd9485	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"1.99","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 15:27:16
233	9fdbd797-9c9f-481b-9618-002ca58cc570	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"5.83","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 15:27:16
234	9fdbd797-a068-4698-9876-27563ce98b68	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.71","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 15:27:16
235	9fdbd797-a86d-4157-9051-46437a5c337a	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"2.43","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"0609fffe774b"}	2025-09-12 15:27:16
236	9fdbd797-c39f-4e32-bd12-e52f0d98a3f1	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select a.attname as name, t.typname as type_name, format_type(a.atttypid, a.atttypmod) as type, (select tc.collcollate from pg_catalog.pg_collation tc where tc.oid = a.attcollation) as collation, not a.attnotnull as nullable, (select pg_get_expr(adbin, adrelid) from pg_attrdef where c.oid = pg_attrdef.adrelid and pg_attrdef.adnum = a.attnum) as default, a.attgenerated as generated, col_description(c.oid, a.attnum) as comment from pg_attribute a, pg_class c, pg_type t, pg_namespace n where c.relname = 'time_boxings' and n.nspname = 'public' and a.attnum > 0 and a.attrelid = c.oid and a.atttypid = t.oid and n.oid = c.relnamespace order by a.attnum","time":"15.47","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140701_drop_department_application_from_time_boxings.php","line":12,"hash":"aca6bbca4d6aac39a912879cda54e748","hostname":"0609fffe774b"}	2025-09-12 15:27:17
237	9fdbd797-c632-458c-a153-6454ea2cdc5e	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select a.attname as name, t.typname as type_name, format_type(a.atttypid, a.atttypmod) as type, (select tc.collcollate from pg_catalog.pg_collation tc where tc.oid = a.attcollation) as collation, not a.attnotnull as nullable, (select pg_get_expr(adbin, adrelid) from pg_attrdef where c.oid = pg_attrdef.adrelid and pg_attrdef.adnum = a.attnum) as default, a.attgenerated as generated, col_description(c.oid, a.attnum) as comment from pg_attribute a, pg_class c, pg_type t, pg_namespace n where c.relname = 'time_boxings' and n.nspname = 'public' and a.attnum > 0 and a.attrelid = c.oid and a.atttypid = t.oid and n.oid = c.relnamespace order by a.attnum","time":"4.28","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140701_drop_department_application_from_time_boxings.php","line":15,"hash":"aca6bbca4d6aac39a912879cda54e748","hostname":"0609fffe774b"}	2025-09-12 15:27:17
238	9fdbd797-c970-4815-bc58-b7e358e37443	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"time_boxings\\" drop column \\"department\\"","time":"7.69","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140701_drop_department_application_from_time_boxings.php","line":11,"hash":"1fc74dbd69887cd3f12e191b956649f4","hostname":"0609fffe774b"}	2025-09-12 15:27:17
239	9fdbd797-ca6f-41b6-b621-99122dd05f97	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"time_boxings\\" drop column \\"application\\"","time":"1.89","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140701_drop_department_application_from_time_boxings.php","line":11,"hash":"0d365b08a5c883ed245a8893f28ff364","hostname":"0609fffe774b"}	2025-09-12 15:27:17
240	9fdbd797-d02e-46f1-bbce-d5948c14757b	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_12_140701_drop_department_application_from_time_boxings', 5)","time":"4.89","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 15:27:17
241	9fdbd797-d109-46d6-8f12-03a98e6aa88a	9fdbd797-d2e4-4139-918d-edac037dcb86	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":true,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 15:27:17
242	9fdc0055-cee4-4b48-94f4-d3b88fad27f6	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"41.88","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 17:21:12
243	9fdc0055-d8be-4bbf-8c7f-64a57014873e	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"2.00","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"0609fffe774b"}	2025-09-12 17:21:12
244	9fdc0055-e0bd-4026-87f6-469d141f1ccc	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"5.18","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 17:21:12
245	9fdc0055-e334-490e-99ef-06c4689dc514	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.08","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"0609fffe774b"}	2025-09-12 17:21:12
246	9fdc0055-e8e0-4946-aaa1-665adde48b85	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"1.38","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"0609fffe774b"}	2025-09-12 17:21:12
247	9fdc0055-ff35-4243-bdc5-6bb871f7267c	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select a.attname as name, t.typname as type_name, format_type(a.atttypid, a.atttypmod) as type, (select tc.collcollate from pg_catalog.pg_collation tc where tc.oid = a.attcollation) as collation, not a.attnotnull as nullable, (select pg_get_expr(adbin, adrelid) from pg_attrdef where c.oid = pg_attrdef.adrelid and pg_attrdef.adnum = a.attnum) as default, a.attgenerated as generated, col_description(c.oid, a.attnum) as comment from pg_attribute a, pg_class c, pg_type t, pg_namespace n where c.relname = 'time_boxings' and n.nspname = 'public' and a.attnum > 0 and a.attrelid = c.oid and a.atttypid = t.oid and n.oid = c.relnamespace order by a.attnum","time":"9.92","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults.php","line":12,"hash":"aca6bbca4d6aac39a912879cda54e748","hostname":"0609fffe774b"}	2025-09-12 17:21:12
248	9fdc0056-032d-4fdb-bb91-a4d99d5270b8	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_timeboxing_id_unique","time":"8.62","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults.php","line":14,"hash":"508b4744c7f2a6ce22019f5b488d5bfa","hostname":"0609fffe774b"}	2025-09-12 17:21:12
249	9fdc0056-0629-49ab-9e15-1649c0948d35	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"time_boxings\\" drop column \\"timeboxing_id\\"","time":"2.66","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults.php","line":15,"hash":"ab81f2dda37a5b95db82818d9d117941","hostname":"0609fffe774b"}	2025-09-12 17:21:12
250	9fdc0056-0777-43eb-aac0-197fe438a118	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select a.attname as name, t.typname as type_name, format_type(a.atttypid, a.atttypmod) as type, (select tc.collcollate from pg_catalog.pg_collation tc where tc.oid = a.attcollation) as collation, not a.attnotnull as nullable, (select pg_get_expr(adbin, adrelid) from pg_attrdef where c.oid = pg_attrdef.adrelid and pg_attrdef.adnum = a.attnum) as default, a.attgenerated as generated, col_description(c.oid, a.attnum) as comment from pg_attribute a, pg_class c, pg_type t, pg_namespace n where c.relname = 'time_boxings' and n.nspname = 'public' and a.attnum > 0 and a.attrelid = c.oid and a.atttypid = t.oid and n.oid = c.relnamespace order by a.attnum","time":"2.83","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults.php","line":22,"hash":"aca6bbca4d6aac39a912879cda54e748","hostname":"0609fffe774b"}	2025-09-12 17:21:12
251	9fdc0056-08de-402d-bdc8-e2e4f5cd0649	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select a.attname as name, t.typname as type_name, format_type(a.atttypid, a.atttypmod) as type, (select tc.collcollate from pg_catalog.pg_collation tc where tc.oid = a.attcollation) as collation, not a.attnotnull as nullable, (select pg_get_expr(adbin, adrelid) from pg_attrdef where c.oid = pg_attrdef.adrelid and pg_attrdef.adnum = a.attnum) as default, a.attgenerated as generated, col_description(c.oid, a.attnum) as comment from pg_attribute a, pg_class c, pg_type t, pg_namespace n where c.relname = 'time_boxings' and n.nspname = 'public' and a.attnum > 0 and a.attrelid = c.oid and a.atttypid = t.oid and n.oid = c.relnamespace order by a.attnum","time":"2.37","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults.php","line":25,"hash":"aca6bbca4d6aac39a912879cda54e748","hostname":"0609fffe774b"}	2025-09-12 17:21:12
252	9fdc0056-0c4d-49f6-b24b-d566676365e7	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"time_boxings\\" alter column \\"project_id\\" type varchar(255), alter column \\"project_id\\" set not null, alter column \\"project_id\\" set default '', alter column \\"project_id\\" drop identity if exists","time":"8.23","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults.php","line":21,"hash":"d9129a7585a38a7bc563f59125b7c239","hostname":"0609fffe774b"}	2025-09-12 17:21:12
253	9fdc0056-0d1e-4830-8a86-6bf134f4ab12	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"time_boxings\\" alter column \\"cnc_number\\" type varchar(255), alter column \\"cnc_number\\" drop not null, alter column \\"cnc_number\\" set default '', alter column \\"cnc_number\\" drop identity if exists","time":"1.81","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults.php","line":21,"hash":"c37f8a22ebf11b2b80a5377562609900","hostname":"0609fffe774b"}	2025-09-12 17:21:12
254	9fdc0056-0ddc-4914-9370-d9b54b74d1d2	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"comment on column \\"time_boxings\\".\\"project_id\\" is NULL","time":"1.59","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults.php","line":21,"hash":"a67590c194d0ce13bf9fc1cda5fa6abb","hostname":"0609fffe774b"}	2025-09-12 17:21:12
255	9fdc0056-0e56-4937-810f-c11f2d96f25f	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"comment on column \\"time_boxings\\".\\"cnc_number\\" is NULL","time":"0.93","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults.php","line":21,"hash":"f5e53c5b01cdb5c56aa23059713c120b","hostname":"0609fffe774b"}	2025-09-12 17:21:12
256	9fdc0056-1766-40f5-823a-223e3450b3c3	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_12_140801_update_time_boxings_drop_tbid_set_defaults', 6)","time":"3.36","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"0609fffe774b"}	2025-09-12 17:21:12
257	9fdc0056-18ed-4f33-b4d0-d589fed42b8c	9fdc0056-1b4e-46b0-8950-03386a242be4	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":true,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 17:21:12
258	9fdc6a9e-ed02-4b2d-b125-c476bf106de7	9fdc6a9f-07c9-4a50-aeca-c248ef0a5563	\N	t	event	{"name":"cache:clearing","payload":[null,[]],"listeners":[],"broadcast":false,"hostname":"0609fffe774b"}	2025-09-12 22:18:24
259	9fdc6a9e-f551-47fd-bd60-f358e5d13d42	9fdc6a9f-07c9-4a50-aeca-c248ef0a5563	\N	t	redis	{"connection":"cache","command":"flushdb ","time":"1.84","hostname":"0609fffe774b"}	2025-09-12 22:18:24
260	9fdc6a9e-fa2b-488e-ab30-cf28aa2e0798	9fdc6a9f-07c9-4a50-aeca-c248ef0a5563	\N	t	event	{"name":"cache:cleared","payload":[null,[]],"listeners":[],"broadcast":false,"hostname":"0609fffe774b"}	2025-09-12 22:18:24
261	9fdc6a9f-06c8-459d-8015-54a574ad4b03	9fdc6a9f-07c9-4a50-aeca-c248ef0a5563	\N	t	command	{"command":"cache:clear","exit_code":0,"arguments":{"command":"cache:clear","store":null},"options":{"tags":null,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 22:18:24
262	9fdc6aa3-6f9b-405e-a00d-2a64cbc73aea	9fdc6aa3-72d6-4ed6-ab27-fdb11e2c3c7f	\N	t	command	{"command":"view:clear","exit_code":0,"arguments":{"command":"view:clear"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 22:18:27
263	9fdc6aa8-363e-4def-a121-c73b4a18aedc	9fdc6aa8-3949-428c-919d-acbfb910e1d4	\N	t	command	{"command":"config:clear","exit_code":0,"arguments":{"command":"config:clear"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 22:18:30
162	9fdba95a-ce73-464e-af8d-47ac8bb19360	9fdba95a-db3a-4d78-9a6b-baaa823d50cc	0891ca4289b14370d5b4c81cbd961038	f	exception	{"class":"Psy\\\\Exception\\\\ParseErrorException","file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Exception\\/ParseErrorException.php","line":44,"message":"PHP Parse error: Syntax error, unexpected T_NS_SEPARATOR, expecting T_VARIABLE on line 1","context":null,"trace":[{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":306},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":240},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":852},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":881},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":1390},{"file":"\\/var\\/www\\/vendor\\/laravel\\/tinker\\/src\\/Console\\/TinkerCommand.php","line":76},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":696},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":213},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Command\\/Command.php","line":318},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":182},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":1110},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":359},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":194},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php","line":198},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php","line":1235},{"file":"\\/var\\/www\\/artisan","line":13}],"line_preview":{"35":"    }","36":"","37":"    \\/**","38":"     * Create a ParseErrorException from a PhpParser Error.","39":"     *","40":"     * @param \\\\PhpParser\\\\Error $e","41":"     *\\/","42":"    public static function fromParseError(\\\\PhpParser\\\\Error $e): self","43":"    {","44":"        return new self($e->getRawMessage(), $e->getAttributes());","45":"    }","46":"}","47":""},"hostname":"0609fffe774b","occurrences":3}	2025-09-12 13:17:59
265	9fdc6b3c-551a-4e9f-95ac-d1bb483ce612	9fdc6b3c-6f4e-4b14-84f8-da5eb2eb5add	\N	t	command	{"command":"tinker","exit_code":1,"arguments":{"command":"tinker","include":[]},"options":{"execute":"echo 'Time Boxing data:'; App\\\\Models\\\\TimeBoxing::all(['id', 'status'])->each(function(\\\\) { echo 'ID: ' . \\\\->id . ' - Status: ' . \\\\->status . PHP_EOL; });","help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"0609fffe774b"}	2025-09-12 22:20:07
266	9fdc8be9-6efe-4741-ac08-42e6feebea1a	9fdc8be9-7a56-4350-ae1a-7600019a77e7	\N	t	command	{"command":"tinker","exit_code":0,"arguments":{"command":"tinker","include":[]},"options":{"execute":"DB::table('time_boxings')->where('type', 'Update to MD')->update(['type' => 'Update to Management']); echo 'Updated ' . DB::table('time_boxings')->where('type', 'Update to Management')->count() . ' records';","help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"bd5f6484fb22"}	2025-09-12 23:51:29
267	9fdc8c28-d533-48b8-b889-6d1f4b0be7df	9fdc8c28-def6-4be7-ba07-90e2b8733668	\N	t	command	{"command":"make:migration","exit_code":0,"arguments":{"command":"make:migration","name":"update_time_boxings_type_md_to_management"},"options":{"create":null,"table":"time_boxings","path":null,"realpath":false,"fullpath":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"bd5f6484fb22"}	2025-09-12 23:52:11
268	9fdc8c4f-ba9c-41b2-a457-dc3b03b18764	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"30.43","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
269	9fdc8c4f-c002-4196-ac56-0227cb463436	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"2.05","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
270	9fdc8c4f-c8b9-4b2c-b607-8e712a958352	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"6.97","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
271	9fdc8c4f-caf3-4646-9eb2-bfc762267c35	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.14","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
272	9fdc8c4f-d17c-4a75-b248-974cd7cf420f	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"4.35","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
273	9fdc8c4f-e616-4cf0-899a-9f162ba65a20	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_type_check","time":"15.90","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_235210_update_time_boxings_type_md_to_management.php","line":14,"hash":"1923636d0a4b8010819675133417bee6","hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
274	9fdc8c4f-e77d-49e4-a2a4-b9249435b3e4	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"UPDATE time_boxings SET type = 'Update to Management' WHERE type = 'Update to MD'","time":"3.15","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_235210_update_time_boxings_type_md_to_management.php","line":17,"hash":"4f082a0a9b67682766851eaa625e6584","hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
275	9fdc8c4f-ec29-446c-8bce-c97c4b99aa8f	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"ALTER TABLE time_boxings ADD CONSTRAINT time_boxings_type_check CHECK (type IN (\\n            'General',\\n            'Submission Maintenance',\\n            'Update to Management',\\n            'Update to Team Bali',\\n            'Project Preparation',\\n            'Work Order',\\n            'Team Meeting',\\n            'Hotel Meeting',\\n            'Green Plan',\\n            'Others Project'\\n        ))","time":"11.51","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_235210_update_time_boxings_type_md_to_management.php","line":20,"hash":"d3de1b8ac43f17c10ff2ae75d6b33033","hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
276	9fdc8c4f-f392-4bac-b4b3-60158c19219e	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_12_235210_update_time_boxings_type_md_to_management', 7)","time":"4.78","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
277	9fdc8c4f-f4a9-4e29-b19d-fd6948f2304a	9fdc8c4f-f6ae-471a-a836-41f85a510547	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":false,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"bd5f6484fb22"}	2025-09-12 23:52:36
278	9fdd5093-5978-4056-a437-605fae300c15	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	redis	{"connection":"default","command":"get powerproxdx5w5X5j33JlDPrPeYzBLHMj9nF3FLpLaXryGHv","time":"1.24","hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
279	9fdd5093-67fc-4006-9ee1-0cf51fed0b0a	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	cache	{"type":"missed","key":"xdx5w5X5j33JlDPrPeYzBLHMj9nF3FLpLaXryGHv","hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
280	9fdd5093-7546-4063-a67a-6fa4851ee698	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	view	{"name":"dashboard.index","path":"\\/resources\\/views\\/dashboard\\/index.blade.php","data":[],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
281	9fdd5093-81eb-4219-831e-d589c48b3b76	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	view	{"name":"layout.layout","path":"\\/resources\\/views\\/layout\\/layout.blade.php","data":["title","subTitle","script"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
282	9fdd5093-8c5b-4898-bf58-777433a28548	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	view	{"name":"components.head","path":"\\/resources\\/views\\/components\\/head.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
283	9fdd5093-9736-469e-9344-ae61f217bdc0	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	view	{"name":"components.horizontal-nav","path":"\\/resources\\/views\\/components\\/horizontal-nav.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
284	9fdd5093-a1c8-4cd0-be4d-b7ca76e12072	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	view	{"name":"components.navbar","path":"\\/resources\\/views\\/components\\/navbar.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
285	9fdd5093-aae4-4ba7-8c68-e45795cd34fc	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	view	{"name":"components.breadcrumb","path":"\\/resources\\/views\\/components\\/breadcrumb.blade.php","data":["title","subTitle","attributes","slot","__laravel_slots"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
286	9fdd5093-b4d2-4c72-b78c-914c1527d464	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	view	{"name":"components.footer","path":"\\/resources\\/views\\/components\\/footer.blade.php","data":["attributes","slot","__laravel_slots"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
287	9fdd5093-bedb-4388-a60d-c189cdb979b1	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	view	{"name":"components.script","path":"\\/resources\\/views\\/components\\/script.blade.php","data":["script","attributes","slot","__laravel_slots"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
288	9fdd5093-cb34-425d-bf88-6d030dc95ad3	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	redis	{"connection":"default","command":"setex powerproxdx5w5X5j33JlDPrPeYzBLHMj9nF3FLpLaXryGHv 7200 s:178:\\"a:3:{s:6:\\"_token\\";s:40:\\"4P8HzJehq2qrf7Cim5lCj6KGqqSlnRBXdco2566I\\";s:9:\\"_previous\\";a:1:{s:3:\\"url\\";s:20:\\"https:\\/\\/172.27.112.1\\";}s:6:\\"_flash\\";a:2:{s:3:\\"old\\";a:0:{}s:3:\\"new\\";a:0:{}}}\\";","time":"4.81","hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
289	9fdd5093-cb67-44d3-bd66-fe90b91b6da8	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	cache	{"type":"set","key":"xdx5w5X5j33JlDPrPeYzBLHMj9nF3FLpLaXryGHv","value":"a:3:{s:6:\\"_token\\";s:40:\\"4P8HzJehq2qrf7Cim5lCj6KGqqSlnRBXdco2566I\\";s:9:\\"_previous\\";a:1:{s:3:\\"url\\";s:20:\\"https:\\/\\/172.27.112.1\\";}s:6:\\"_flash\\";a:2:{s:3:\\"old\\";a:0:{}s:3:\\"new\\";a:0:{}}}","expiration":7200,"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
317	9fdd787e-b24b-4356-b854-6deb243ffd65	9fdd787e-dbb9-4846-b793-c7a1bf6e2505	\N	t	command	{"command":"migrate","exit_code":1,"arguments":{"command":"migrate"},"options":{"database":null,"force":false,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 10:53:01
290	9fdd5093-cdc3-46c7-ad4a-2b167c5955de	9fdd5093-cf1a-4515-b70f-f07a5251e0a1	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/","method":"GET","controller_action":"App\\\\Http\\\\Controllers\\\\DashboardController@index","middleware":["web"],"headers":{"host":"172.27.112.1","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":{"_token":"4P8HzJehq2qrf7Cim5lCj6KGqqSlnRBXdco2566I","_previous":{"url":"https:\\/\\/172.27.112.1"},"_flash":{"old":[],"new":[]}},"response_headers":{"content-type":"text\\/html; charset=UTF-8","cache-control":"no-cache, private","date":"Sat, 13 Sep 2025 02:01:24 GMT","set-cookie":"XSRF-TOKEN=eyJpdiI6IkJ0VUZzZjMzVHpmbDBnc3I5M2JtcVE9PSIsInZhbHVlIjoibmxUQU9pV1VBRkgwRFhRZGlYTEtrM0g3dElzR2RCNndMVkN5czh5czZBUitkay9pejNBYXNlZ0JyOElHU0EwS1hFTFE4N2hnRGJBbC9wNnF6Sm9iYlM4aGhaWUk3QTNuZUgyOW1YNG90OTN3emlqVmF6R1Y3UmtYajlSVGZoMUIiLCJtYWMiOiI0YWMwMjExODMxNTI3MGU1ZjY3OGMyNmJkZDcwZjBlNTNjNDcyZDZhNTk5MmFkOTBhNDEzOTUwMDM1Y2JiODY2IiwidGFnIjoiIn0%3D; expires=Sat, 13 Sep 2025 04:01:24 GMT; Max-Age=7200; path=\\/; domain=localhost; samesite=lax, powerpro_session=eyJpdiI6Ik5mWUdTU0MrajRuWUQwOU5ieTVZR2c9PSIsInZhbHVlIjoieERrU0FnZ01HakVteVczTEVoZ2xVWUZxWmpEOTM1aTg4MTgvOVR2eWdZMmw3K1BIQkNBUTA2bW5velZ3WHVMN0E5V2dOcXZqRG1Hc05oWXZZc0NaVUY1YXZ5VU1GQXFYZVlqOXJhZVM1VkQxQVVINVE2eVpTQVpBY3AzYkpMbkEiLCJtYWMiOiIyYzIyNjBlZmE4M2ViMjU2MTA0MTE0NDM5NGRjYmM2MmUwYWFmOGFiYjc1MjY0NTRlN2Y0NjM0YTAxMjUyOWFkIiwidGFnIjoiIn0%3D; expires=Sat, 13 Sep 2025 04:01:24 GMT; Max-Age=7200; path=\\/; domain=localhost; httponly; samesite=lax"},"response_status":200,"response":{"view":"\\/var\\/www\\/resources\\/views\\/dashboard\\/index.blade.php","data":[]},"duration":1050,"memory":4,"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:24
291	9fdd50ae-c7d8-4bdb-bdea-6fec22afd5a2	9fdd50ae-ef7c-472c-8571-f712166a7354	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:42
292	9fdd50ae-e25e-4133-ae3d-176bb484cbb9	9fdd50ae-ef7c-472c-8571-f712166a7354	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:42
293	9fdd50ae-ee91-4996-8dcd-4d5297efe383	9fdd50ae-ef7c-472c-8571-f712166a7354	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/HNAP1","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Sat, 13 Sep 2025 02:01:42 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":525,"memory":4,"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:42
294	9fdd50c0-b3d0-482a-a303-af5f274f3ab2	9fdd50c0-ceab-428d-9d8f-02c3edb30a60	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:53
295	9fdd50c0-c476-4a2d-9d39-31e2b390c2c3	9fdd50c0-ceab-428d-9d8f-02c3edb30a60	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:53
296	9fdd50c0-ce07-47ae-8dc2-4b9379d84281	9fdd50c0-ceab-428d-9d8f-02c3edb30a60	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/cgi\\/get.cgi?cmd=home_login","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; WOW64; Trident\\/7.0; rv:11.0) like Gecko","accept-encoding":"deflate, gzip","accept":"*\\/*"},"payload":{"cmd":"home_login"},"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Sat, 13 Sep 2025 02:01:53 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":331,"memory":2,"hostname":"cf7b40d5de6b"}	2025-09-13 09:01:54
297	9fdd50d4-24cd-4b40-a565-900252f483df	9fdd50d4-3655-4072-a6d6-a15376c51033	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:02:06
298	9fdd50d4-2fc6-427b-ab36-64d28b22d89b	9fdd50d4-3655-4072-a6d6-a15376c51033	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:02:06
299	9fdd50d4-3541-4c77-824c-4a00236c120c	9fdd50d4-3655-4072-a6d6-a15376c51033	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/bmlinks\\/ddf.xml","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Sat, 13 Sep 2025 02:02:06 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":497,"memory":2,"hostname":"cf7b40d5de6b"}	2025-09-13 09:02:06
300	9fdd50d4-8e3b-49c3-a321-1678d6365910	9fdd50d4-9bdd-4b6a-962a-f4ee8e72d85c	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:02:06
301	9fdd50d4-967b-4c99-ab16-38379e076471	9fdd50d4-9bdd-4b6a-962a-f4ee8e72d85c	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:02:06
302	9fdd50d4-9b71-44d0-8963-fcbf5c32a37b	9fdd50d4-9bdd-4b6a-962a-f4ee8e72d85c	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/upnp\\/BasicDevice.xml","method":"GET","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":[],"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Sat, 13 Sep 2025 02:02:06 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":244,"memory":2,"hostname":"cf7b40d5de6b"}	2025-09-13 09:02:06
303	9fdd50d4-e20f-4c28-b203-fd168f16e2b6	9fdd50d4-ef26-446b-ae7e-b011a3bf6584	\N	t	view	{"name":"errors::404","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/404.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:02:07
304	9fdd50d4-ea23-46b6-9ca7-df5cdfb4c4be	9fdd50d4-ef26-446b-ae7e-b011a3bf6584	\N	t	view	{"name":"errors::minimal","path":"\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Exceptions\\/views\\/minimal.blade.php","data":["exception"],"hostname":"cf7b40d5de6b"}	2025-09-13 09:02:07
305	9fdd50d4-ee85-4af5-8077-a4bf9733200d	9fdd50d4-ef26-446b-ae7e-b011a3bf6584	\N	t	request	{"ip_address":"172.18.0.1","uri":"\\/boaform\\/admin\\/formTracert","method":"POST","controller_action":null,"middleware":[],"headers":{"host":"172.27.112.1","content-type":"application\\/x-www-form-urlencoded","content-length":"20","accept-encoding":"deflate, gzip","accept":"*\\/*","user-agent":"Norton Antivirus"},"payload":{"target_addr":null,"waninf":null},"session":[],"response_headers":{"cache-control":"no-cache, private","date":"Sat, 13 Sep 2025 02:02:07 GMT","content-type":"text\\/html; charset=UTF-8"},"response_status":404,"response":"HTML Response","duration":183,"memory":2,"hostname":"cf7b40d5de6b"}	2025-09-13 09:02:07
318	9fdd7886-634c-4bb1-9560-baa53a225751	9fdd7886-82b9-4972-9368-fb21e74c9c95	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"6.92","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:06
306	9fdd7665-756f-452a-83ad-945583c854b7	9fdd7665-7da7-4dee-9913-4d40c8650995	2e9cd19f3a57eb29dd85534f564b1fe2	t	exception	{"class":"LogicException","file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/AbstractRouteCollection.php","line":248,"message":"Unable to prepare route [componentspage\\/imageupload] for serialization. Another route has already been assigned name [imageUpload].","context":null,"trace":[{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/AbstractRouteCollection.php","line":209},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/RouteCollection.php","line":246},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/AbstractRouteCollection.php","line":193},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/AbstractRouteCollection.php","line":164},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/RouteCacheCommand.php","line":109},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/RouteCacheCommand.php","line":68},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":696},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":213},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Command\\/Command.php","line":318},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":182},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":1110},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":359},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":194},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php","line":198},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php","line":1235},{"file":"\\/var\\/www\\/artisan","line":13}],"line_preview":{"239":"        ) {","240":"            $name = null;","241":"        }","242":"","243":"        if (! $name) {","244":"            $route->name($this->generateRouteName());","245":"","246":"            $this->add($route);","247":"        } elseif (! is_null($symfonyRoutes->get($name))) {","248":"            throw new LogicException(\\"Unable to prepare route [{$route->uri}] for serialization. Another route has already been assigned name [{$name}].\\");","249":"        }","250":"","251":"        $symfonyRoutes->add($route->getName(), $route->toSymfonyRoute());","252":"","253":"        return $symfonyRoutes;","254":"    }","255":"","256":"    \\/**","257":"     * Get a randomly generated route name.","258":"     *"},"hostname":"cf7b40d5de6b","occurrences":1}	2025-09-13 10:47:09
307	9fdd7665-54a8-44f5-a049-2635e5df6f1e	9fdd7665-7da7-4dee-9913-4d40c8650995	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select * from \\"cache\\" where \\"key\\" in ('powerprotelescope:pause-recording')","time":"0.67","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"ed00c61f6e39f39d1c95fcd55959be2d","hostname":"cf7b40d5de6b"}	2025-09-13 10:47:09
308	9fdd7665-6ba7-4a22-9a1d-2293f2d9ed4c	9fdd7665-7da7-4dee-9913-4d40c8650995	\N	t	command	{"command":"route:cache","exit_code":1,"arguments":{"command":"route:cache"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 10:47:09
309	9fdd766a-abf9-460f-8c08-c9b8bb7b1074	9fdd766a-af11-4f74-b305-21d0a5c5b5ab	\N	t	command	{"command":"view:clear","exit_code":0,"arguments":{"command":"view:clear"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 10:47:12
310	9fdd785f-84a4-42b1-b638-81448b1c9d1f	9fdd785f-92bc-4ecb-97f8-ce95caa1b050	\N	t	command	{"command":"make:migration","exit_code":0,"arguments":{"command":"make:migration","name":"add_user_id_to_time_boxings_table"},"options":{"create":null,"table":"time_boxings","path":null,"realpath":false,"fullpath":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 10:52:41
200	9fdbd4e8-f1d1-4ce0-b3d8-ec5668d7c404	9fdbd4e9-0712-4a8d-bd24-22d935c6e52a	1c94a6c3667ae236a991189295f2abf6	f	exception	{"class":"Illuminate\\\\Database\\\\QueryException","file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php","line":825,"message":"SQLSTATE[23514]: Check violation: 7 ERROR:  new row for relation \\"time_boxings\\" violates check constraint \\"time_boxings_type_check\\"\\nDETAIL:  Failing row contains (18, TB006, PROJ-006, 6, 2025-10-12, Staff, IT \\/ EDP, Power FO, General, New activity - please update details, null, 2025-12-15, Need Requirement, null, 2025-09-12 13:42:55, 2025-09-12 14:58:43). (Connection: pgsql, SQL: UPDATE time_boxings SET type = 'General' WHERE type NOT IN (\\r\\n            'General',\\r\\n            'Submission Maintenance',\\r\\n            'Update to MD',\\r\\n            'Update to Team Bali',\\r\\n            'Project Preparation',\\r\\n            'Work Order',\\r\\n            'Team Meeting',\\r\\n            'Hotel Meeting',\\r\\n            'Green Plan',\\r\\n            'Others Project'\\r\\n        ))","context":null,"trace":[{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php","line":779},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php","line":560},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/DatabaseManager.php","line":495},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Support\\/Facades\\/Facade.php","line":361},{"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_12_140501_update_time_boxings_type_check.php","line":10},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":507},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":432},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Concerns\\/ManagesTransactions.php","line":32},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":440},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":244},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/View\\/Components\\/Task.php","line":40},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":798},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":244},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":211},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":138},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Migrations\\/MigrateCommand.php","line":117},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":658},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Migrations\\/MigrateCommand.php","line":110},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Migrations\\/MigrateCommand.php","line":89},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":696},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":213},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Command\\/Command.php","line":318},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":182},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":1110},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":359},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":194},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php","line":198},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php","line":1235},{"file":"\\/var\\/www\\/artisan","line":13}],"line_preview":{"816":"        \\/\\/ message to include the bindings with SQL, which will make this exception a","817":"        \\/\\/ lot more helpful to the developer instead of just the database's errors.","818":"        catch (Exception $e) {","819":"            if ($this->isUniqueConstraintError($e)) {","820":"                throw new UniqueConstraintViolationException(","821":"                    $this->getName(), $query, $this->prepareBindings($bindings), $e","822":"                );","823":"            }","824":"","825":"            throw new QueryException(","826":"                $this->getName(), $query, $this->prepareBindings($bindings), $e","827":"            );","828":"        }","829":"    }","830":"","831":"    \\/**","832":"     * Determine if the given database exception was caused by a unique constraint violation.","833":"     *","834":"     * @param  \\\\Exception  $exception","835":"     * @return bool"},"hostname":"0609fffe774b","occurrences":1}	2025-09-12 15:19:46
311	9fdd787e-cc16-44f8-b3c1-1a73875155ba	9fdd787e-dbb9-4846-b793-c7a1bf6e2505	1c94a6c3667ae236a991189295f2abf6	t	exception	{"class":"Illuminate\\\\Database\\\\QueryException","file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php","line":825,"message":"SQLSTATE[23502]: Not null violation: 7 ERROR:  column \\"user_id\\" of relation \\"time_boxings\\" contains null values (Connection: pgsql, SQL: alter table \\"time_boxings\\" add column \\"user_id\\" bigint not null)","context":null,"trace":[{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php","line":779},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Connection.php","line":560},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Schema\\/Blueprint.php","line":118},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Schema\\/Builder.php","line":564},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Schema\\/Builder.php","line":406},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Support\\/Facades\\/Facade.php","line":361},{"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_13_010547_add_user_id_to_time_boxings_table.php","line":14},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":507},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":432},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Concerns\\/ManagesTransactions.php","line":32},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":440},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":244},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/View\\/Components\\/Task.php","line":40},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":798},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":244},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":211},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":138},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Migrations\\/MigrateCommand.php","line":117},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Migrations\\/Migrator.php","line":658},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Migrations\\/MigrateCommand.php","line":110},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Database\\/Console\\/Migrations\\/MigrateCommand.php","line":89},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":696},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":213},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Command\\/Command.php","line":318},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":182},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":1110},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":359},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":194},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php","line":198},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php","line":1235},{"file":"\\/var\\/www\\/artisan","line":13}],"line_preview":{"816":"        \\/\\/ message to include the bindings with SQL, which will make this exception a","817":"        \\/\\/ lot more helpful to the developer instead of just the database's errors.","818":"        catch (Exception $e) {","819":"            if ($this->isUniqueConstraintError($e)) {","820":"                throw new UniqueConstraintViolationException(","821":"                    $this->getName(), $query, $this->prepareBindings($bindings), $e","822":"                );","823":"            }","824":"","825":"            throw new QueryException(","826":"                $this->getName(), $query, $this->prepareBindings($bindings), $e","827":"            );","828":"        }","829":"    }","830":"","831":"    \\/**","832":"     * Determine if the given database exception was caused by a unique constraint violation.","833":"     *","834":"     * @param  \\\\Exception  $exception","835":"     * @return bool"},"hostname":"cf7b40d5de6b","occurrences":2}	2025-09-13 10:53:01
312	9fdd787e-7ab2-4fdf-9f5c-6aa7a860eb2c	9fdd787e-dbb9-4846-b793-c7a1bf6e2505	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"2.86","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:01
313	9fdd787e-7ecf-4aa6-b7c3-6702a488e916	9fdd787e-dbb9-4846-b793-c7a1bf6e2505	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"2.90","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:01
314	9fdd787e-80b1-40de-a5dd-2bbbf9795998	9fdd787e-dbb9-4846-b793-c7a1bf6e2505	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"3.81","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:01
315	9fdd787e-83a0-42a6-952c-51289e77cec9	9fdd787e-dbb9-4846-b793-c7a1bf6e2505	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.27","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:01
316	9fdd787e-8f3b-45c8-9e50-4e8483119782	9fdd787e-dbb9-4846-b793-c7a1bf6e2505	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"1.89","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:01
319	9fdd7886-6972-43bf-9b57-6784e038d51c	9fdd7886-82b9-4972-9368-fb21e74c9c95	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"4.16","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:06
320	9fdd7886-6a20-47f8-95f6-1b97beb8a6ae	9fdd7886-82b9-4972-9368-fb21e74c9c95	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"batch\\", \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.20","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"1b6c8ec237e77c97928a842aa3b464d4","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:06
321	9fdd7886-819e-4f3c-8883-ce81fd066f7f	9fdd7886-82b9-4972-9368-fb21e74c9c95	\N	t	command	{"command":"migrate:status","exit_code":0,"arguments":{"command":"migrate:status"},"options":{"database":null,"pending":false,"path":[],"realpath":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 10:53:06
322	9fdd7897-b5a0-4256-93f5-44bd40dc8883	9fdd7897-f387-45cc-922c-256f6d73096a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"4.02","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:17
323	9fdd7897-bb19-4df3-8b56-a6a25b626f99	9fdd7897-f387-45cc-922c-256f6d73096a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"1.73","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:17
324	9fdd7897-bc2a-4c4c-80f5-d7504eeb6c80	9fdd7897-f387-45cc-922c-256f6d73096a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"2.31","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:17
325	9fdd7897-bf0c-4795-8bb6-ce26fba27b93	9fdd7897-f387-45cc-922c-256f6d73096a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"1.57","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:17
326	9fdd7897-c5dc-4609-adcd-2458dc874db5	9fdd7897-f387-45cc-922c-256f6d73096a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"1.98","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:18
327	9fdd7897-d2cf-41d5-ad29-bedd8d891f52	9fdd7897-f387-45cc-922c-256f6d73096a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"time_boxings\\" add column \\"user_id\\" bigint null","time":"2.43","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_13_105241_add_user_id_to_time_boxings_table.php","line":14,"hash":"c436243493dc340615876a4fde03d788","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:18
328	9fdd7897-df81-4606-838a-f0ca4966d77f	9fdd7897-f387-45cc-922c-256f6d73096a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"time_boxings\\" add constraint \\"time_boxings_user_id_foreign\\" foreign key (\\"user_id\\") references \\"users\\" (\\"id\\") on delete cascade","time":"32.02","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_13_105241_add_user_id_to_time_boxings_table.php","line":14,"hash":"a30a5596cea6352c8dd5cbc87b0aecba","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:18
329	9fdd7897-f15e-469a-b87d-4af780c60f09	9fdd7897-f387-45cc-922c-256f6d73096a	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_13_105241_add_user_id_to_time_boxings_table', 8)","time":"4.51","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"cf7b40d5de6b"}	2025-09-13 10:53:18
330	9fdd7897-f23d-4fe6-b7f7-fb2464394fe0	9fdd7897-f387-45cc-922c-256f6d73096a	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":false,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 10:53:18
331	9fdd7a1d-ecef-440c-9210-4c0b06ecff6b	9fdd7a1d-f46d-4f53-b706-fa68ae170ce3	\N	t	command	{"command":"make:migration","exit_code":0,"arguments":{"command":"make:migration","name":"add_role_to_users_table"},"options":{"create":null,"table":"users","path":null,"realpath":false,"fullpath":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 10:57:33
332	9fdd7a3b-3cb7-4cdb-9d73-2c19ad998157	9fdd7a3b-73fe-4b38-8f1a-98f51677ddb3	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"3.48","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"cf7b40d5de6b"}	2025-09-13 10:57:52
333	9fdd7a3b-401d-49c3-9179-c79899892611	9fdd7a3b-73fe-4b38-8f1a-98f51677ddb3	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select exists (select 1 from pg_class c, pg_namespace n where n.nspname = 'public' and c.relname = 'migrations' and c.relkind in ('r', 'p') and n.oid = c.relnamespace)","time":"1.56","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"7988c9c8692d965656b065ee2b0fdbca","hostname":"cf7b40d5de6b"}	2025-09-13 10:57:52
334	9fdd7a3b-417c-47fc-8fd3-d1e4d62d9dcc	9fdd7a3b-73fe-4b38-8f1a-98f51677ddb3	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"3.05","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"cf7b40d5de6b"}	2025-09-13 10:57:52
335	9fdd7a3b-450c-4fcb-b824-9087e2677d21	9fdd7a3b-73fe-4b38-8f1a-98f51677ddb3	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select \\"migration\\" from \\"migrations\\" order by \\"batch\\" asc, \\"migration\\" asc","time":"0.99","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"84af29f5c40ba2eeda76663cdfcee4df","hostname":"cf7b40d5de6b"}	2025-09-13 10:57:52
336	9fdd7a3b-4cc6-4d77-a108-84a4d568b6e5	9fdd7a3b-73fe-4b38-8f1a-98f51677ddb3	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"select max(\\"batch\\") as aggregate from \\"migrations\\"","time":"3.09","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"891c93593b7807a7dfc0848070936947","hostname":"cf7b40d5de6b"}	2025-09-13 10:57:52
337	9fdd7a3b-6099-4413-a5b9-a6f5442d7bda	9fdd7a3b-73fe-4b38-8f1a-98f51677ddb3	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"alter table \\"users\\" add column \\"role\\" varchar(255) check (\\"role\\" in ('Administrator', 'Management', 'Admin Officer', 'User', 'Client')) not null default 'User'","time":"21.77","slow":false,"file":"\\/var\\/www\\/database\\/migrations\\/2025_09_13_105733_add_role_to_users_table.php","line":14,"hash":"56d393150886749b89ac7def8ad2ba0e","hostname":"cf7b40d5de6b"}	2025-09-13 10:57:53
338	9fdd7a3b-7289-4e3f-95c0-4585fb519c09	9fdd7a3b-73fe-4b38-8f1a-98f51677ddb3	\N	t	query	{"connection":"pgsql","driver":"pgsql","bindings":[],"sql":"insert into \\"migrations\\" (\\"migration\\", \\"batch\\") values ('2025_09_13_105733_add_role_to_users_table', 9)","time":"3.06","slow":false,"file":"\\/var\\/www\\/artisan","line":13,"hash":"09c22f830d52d80cc99fe8c1b1acc44c","hostname":"cf7b40d5de6b"}	2025-09-13 10:57:53
339	9fdd7a3b-730f-4e10-a90e-5b586cfe7e3d	9fdd7a3b-73fe-4b38-8f1a-98f51677ddb3	\N	t	command	{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":false,"path":[],"realpath":false,"schema-path":null,"pretend":false,"seed":false,"seeder":null,"step":false,"graceful":false,"isolated":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 10:57:53
340	9fdd7a6b-95cf-4a9a-af05-c11351084093	9fdd7a6b-9aa5-4dc6-a30a-1b7d7718343b	\N	t	command	{"command":"make:controller","exit_code":0,"arguments":{"command":"make:controller","name":"RoleController"},"options":{"api":false,"type":null,"force":false,"invokable":false,"model":null,"parent":null,"resource":true,"requests":false,"singleton":false,"creatable":false,"test":false,"pest":false,"phpunit":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 10:58:24
341	9fdd8101-bc00-4998-b31a-85eb03885a55	9fdd8101-c0e8-4e65-ab58-12d6540dacab	\N	t	command	{"command":"route:list","exit_code":0,"arguments":{"command":"route:list"},"options":{"json":false,"method":null,"action":null,"name":null,"domain":null,"path":null,"except-path":null,"reverse":false,"sort":"uri","except-vendor":false,"only-vendor":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 11:16:49
342	9fdd8182-2dd7-45b7-b8f3-575eb2063929	9fdd8182-3241-4991-b3cd-a4a29ac4de8c	\N	t	command	{"command":"route:list","exit_code":0,"arguments":{"command":"route:list"},"options":{"json":false,"method":null,"action":null,"name":null,"domain":null,"path":null,"except-path":null,"reverse":false,"sort":"uri","except-vendor":false,"only-vendor":false,"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 11:18:13
343	9fdd819a-ab75-4079-b333-99c962df40c6	9fdd819a-b110-4d2e-a0e4-dcc5b63bcb05	\N	t	command	{"command":"route:clear","exit_code":0,"arguments":{"command":"route:clear"},"options":{"help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 11:18:29
264	9fdc6b3c-6475-4536-ad6b-c67354319dce	9fdc6b3c-6f4e-4b14-84f8-da5eb2eb5add	0891ca4289b14370d5b4c81cbd961038	f	exception	{"class":"Psy\\\\Exception\\\\ParseErrorException","file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Exception\\/ParseErrorException.php","line":44,"message":"PHP Parse error: Syntax error, unexpected T_NS_SEPARATOR, expecting T_VARIABLE on line 1","context":null,"trace":[{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":306},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":240},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":852},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":881},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":1390},{"file":"\\/var\\/www\\/vendor\\/laravel\\/tinker\\/src\\/Console\\/TinkerCommand.php","line":76},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":696},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":213},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Command\\/Command.php","line":318},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":182},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":1110},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":359},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":194},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php","line":198},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php","line":1235},{"file":"\\/var\\/www\\/artisan","line":13}],"line_preview":{"35":"    }","36":"","37":"    \\/**","38":"     * Create a ParseErrorException from a PhpParser Error.","39":"     *","40":"     * @param \\\\PhpParser\\\\Error $e","41":"     *\\/","42":"    public static function fromParseError(\\\\PhpParser\\\\Error $e): self","43":"    {","44":"        return new self($e->getRawMessage(), $e->getAttributes());","45":"    }","46":"}","47":""},"hostname":"0609fffe774b","occurrences":4}	2025-09-12 22:20:07
344	9fdd831f-17b2-425a-a23a-6cfdf2725dcd	9fdd831f-21ea-4a1b-a4b8-7aa766134ccd	0891ca4289b14370d5b4c81cbd961038	t	exception	{"class":"Psy\\\\Exception\\\\ParseErrorException","file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Exception\\/ParseErrorException.php","line":44,"message":"PHP Parse error: Syntax error, unexpected T_NS_SEPARATOR on line 1","context":null,"trace":[{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":306},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/CodeCleaner.php","line":240},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":852},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":881},{"file":"\\/var\\/www\\/vendor\\/psy\\/psysh\\/src\\/Shell.php","line":1390},{"file":"\\/var\\/www\\/vendor\\/laravel\\/tinker\\/src\\/Console\\/TinkerCommand.php","line":76},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":36},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php","line":43},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":95},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php","line":35},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php","line":696},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":213},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Command\\/Command.php","line":318},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Console\\/Command.php","line":182},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":1110},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":359},{"file":"\\/var\\/www\\/vendor\\/symfony\\/console\\/Application.php","line":194},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Console\\/Kernel.php","line":198},{"file":"\\/var\\/www\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Application.php","line":1235},{"file":"\\/var\\/www\\/artisan","line":13}],"line_preview":{"35":"    }","36":"","37":"    \\/**","38":"     * Create a ParseErrorException from a PhpParser Error.","39":"     *","40":"     * @param \\\\PhpParser\\\\Error $e","41":"     *\\/","42":"    public static function fromParseError(\\\\PhpParser\\\\Error $e): self","43":"    {","44":"        return new self($e->getRawMessage(), $e->getAttributes());","45":"    }","46":"}","47":""},"hostname":"cf7b40d5de6b","occurrences":5}	2025-09-13 11:22:44
345	9fdd831f-042b-4e56-8682-5c371e547b22	9fdd831f-21ea-4a1b-a4b8-7aa766134ccd	\N	t	command	{"command":"tinker","exit_code":1,"arguments":{"command":"tinker","include":[]},"options":{"execute":"echo 'Testing role management...'; try { \\\\ = App\\\\Models\\\\User::all(); echo 'Found ' . \\\\->count() . ' users'; } catch (Exception \\\\) { echo 'Error: ' . \\\\->getMessage(); }","help":false,"silent":false,"quiet":false,"verbose":false,"version":false,"ansi":null,"no-interaction":false,"env":null},"hostname":"cf7b40d5de6b"}	2025-09-13 11:22:44
\.


--
-- Data for Name: telescope_entries_tags; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.telescope_entries_tags (entry_uuid, tag) FROM stdin;
9fda9e65-e559-4001-bc63-866925ba1069	App\\Models\\User:1
9fda9e65-ea25-4e7d-9e55-7a42f06575b1	App\\Models\\User:2
9fda9e65-eb67-4ac4-a53b-e621e2e22b59	App\\Models\\User:3
9fda9e65-f4b4-4ea9-b262-987b3662cf96	App\\Models\\Activity:1
9fda9e65-f62e-4e9c-ab66-0d5f01d1be9c	App\\Models\\Activity:2
9fda9e65-f7a2-4d44-afe3-934f8a761b15	App\\Models\\Activity:3
9fda9e65-f8f4-42ba-adcb-60437ff96b7f	App\\Models\\Activity:4
9fda9e65-fa81-4662-a7be-db88834bd459	App\\Models\\Activity:5
9fda9e65-fc1a-42cb-87c8-db5faacbe311	App\\Models\\Activity:6
9fda9e65-fd6d-4fbe-b9bd-efb8b6513c7f	App\\Models\\Activity:7
9fda9e65-ff0b-4bbb-9880-f9d09588d5c0	App\\Models\\Activity:8
9fdb6b66-8225-47b9-91bc-eb5f4653eea7	App\\Models\\TimeBoxing:1
9fdb6b66-883e-43a6-b17c-077b3b6abe5d	App\\Models\\TimeBoxing:2
9fdb6b66-8a39-4fb4-9a5a-14f315358873	App\\Models\\TimeBoxing:3
9fdb75ad-eeec-406f-9f41-f48c2cb99292	App\\Models\\TimeBoxing:1
9fdb75ad-f31c-4e78-8a64-607dd558a056	App\\Models\\TimeBoxing:2
9fdb75ad-f4b1-435d-9960-8491ba10d894	App\\Models\\TimeBoxing:3
\.


--
-- Data for Name: telescope_monitoring; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.telescope_monitoring (tag) FROM stdin;
\.


--
-- Data for Name: time_boxings; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.time_boxings (id, project_id, no, information_date, user_position, type, description, action_solution, due_date, status, cnc_number, created_at, updated_at, user_id) FROM stdin;
16	PROJ-005	5	2025-09-12	Mantul lur	Work Order	Oke, saya update detail	sss	2025-09-13	Priority List	\N	2025-09-12 13:40:45	2025-09-13 11:15:58	1
3	PRJ003	3	2025-09-15	Analyst	Update to Team Bali	Add time boxing analytics and reporting featuresss	Create dashboard for time boxing metrics and generate reports	2025-10-03	Priority List	CNC003	2025-09-12 07:53:29	2025-09-12 17:43:34	1
15	PROJ-004	4	2025-09-12	Staffss	General	New TB	qweqweqwe	2026-10-15	Brain Dump	\N	2025-09-12 13:40:10	2025-09-12 17:43:43	1
24	PROJ-008	8	2025-09-12	Staff	General	New activity - please update details	asd	\N	Priority List	\N	2025-09-12 15:09:32	2025-09-12 19:45:56	1
23	PROJ-007	7	2025-09-12	Staff	Others Project	New activity - please update details	zzz	2025-09-15	Cancel	\N	2025-09-12 15:06:52	2025-09-12 19:46:44	1
2	PRJ002	2	2025-09-13	Manager	Project Preparation	sssImplement time boxing features in the applicationsssasdd	Develop time tracking components and integrate with existing system	2025-09-15	Time Boxing	CNC002	2025-09-12 09:53:29	2025-09-12 23:39:28	1
1	PRJ001	1	2025-09-14	Project Manager	Update to Management	Test Updatesss	Configure time tracking tools and establish time boxing protocols	2025-09-15	Completed	CNC001	2025-09-12 10:53:29	2025-09-13 00:25:22	1
18	PROJ-006	6	2025-10-12	Staff	General	New activity - please update details	zzz	2025-12-15	Brain Dump	\N	2025-09-12 13:42:55	2025-09-13 11:14:47	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, email, password, created_at, updated_at, display_name, full_name, tier, user_role, start_work, birthday, role) FROM stdin;
2	admin@powerpro.cloud	$2y$12$SXSK7CCZYadHSdcoupDsg.TZvufMfGrpzHBWQBt/YQX3gX203VXuK	2025-09-12 00:51:31	2025-09-12 00:51:31	Admin	Administrator User	Premium	Administrator	2024-01-01	1990-01-01	User
3	manager@powerpro.cloud	$2y$12$MVSRTXvmwJKUYFOtqly55eKkZWfMBzmQeRkhrGiFx/ZBwz0pKpEgG	2025-09-12 00:51:31	2025-09-12 00:51:31	Manager	Manager User	Standard	Manager	2024-02-01	1985-05-15	User
1	pms@powerpro.id	$2y$12$vQcdG518lswLyJgsLNMpsO41gtDJtssq0OReUetInsxt/pPd39uUS	2025-09-12 00:51:31	2025-09-12 22:16:18	Komeng	Rudianto	Tier 3	Administrator	2024-01-01	1990-01-01	User
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.activities_id_seq', 9, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.migrations_id_seq', 19, true);


--
-- Name: power_project_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.power_project_tables_id_seq', 1, false);


--
-- Name: telescope_entries_sequence_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.telescope_entries_sequence_seq', 345, true);


--
-- Name: time_boxings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.time_boxings_id_seq', 26, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: power_project_tables power_project_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.power_project_tables
    ADD CONSTRAINT power_project_tables_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: telescope_entries telescope_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.telescope_entries
    ADD CONSTRAINT telescope_entries_pkey PRIMARY KEY (sequence);


--
-- Name: telescope_entries_tags telescope_entries_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.telescope_entries_tags
    ADD CONSTRAINT telescope_entries_tags_pkey PRIMARY KEY (entry_uuid, tag);


--
-- Name: telescope_entries telescope_entries_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.telescope_entries
    ADD CONSTRAINT telescope_entries_uuid_unique UNIQUE (uuid);


--
-- Name: telescope_monitoring telescope_monitoring_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.telescope_monitoring
    ADD CONSTRAINT telescope_monitoring_pkey PRIMARY KEY (tag);


--
-- Name: time_boxings time_boxings_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.time_boxings
    ADD CONSTRAINT time_boxings_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: telescope_entries_batch_id_index; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX telescope_entries_batch_id_index ON public.telescope_entries USING btree (batch_id);


--
-- Name: telescope_entries_created_at_index; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX telescope_entries_created_at_index ON public.telescope_entries USING btree (created_at);


--
-- Name: telescope_entries_family_hash_index; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX telescope_entries_family_hash_index ON public.telescope_entries USING btree (family_hash);


--
-- Name: telescope_entries_tags_tag_index; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX telescope_entries_tags_tag_index ON public.telescope_entries_tags USING btree (tag);


--
-- Name: telescope_entries_type_should_display_on_index_index; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX telescope_entries_type_should_display_on_index_index ON public.telescope_entries USING btree (type, should_display_on_index);


--
-- Name: telescope_entries_tags telescope_entries_tags_entry_uuid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.telescope_entries_tags
    ADD CONSTRAINT telescope_entries_tags_entry_uuid_foreign FOREIGN KEY (entry_uuid) REFERENCES public.telescope_entries(uuid) ON DELETE CASCADE;


--
-- Name: time_boxings time_boxings_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.time_boxings
    ADD CONSTRAINT time_boxings_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict oZeJ3MDbU9Rn5EPbJ5nNxfhevCggkHPnz6RxizG6k1Kvy6qAjiO7ADMqUqVAjJw

