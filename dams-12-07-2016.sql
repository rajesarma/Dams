--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: test_schema; Type: SCHEMA; Schema: -; Owner: dams
--

CREATE SCHEMA test_schema;


ALTER SCHEMA test_schema OWNER TO dams;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chat_users_count; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE chat_users_count (
    id integer,
    users_count bigint
);


ALTER TABLE public.chat_users_count OWNER TO dams;

--
-- Name: chattable; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE chattable (
    id integer NOT NULL,
    from_username character varying(25) NOT NULL,
    to_username character varying(25),
    message character varying(2000) NOT NULL,
    sent_time timestamp without time zone NOT NULL,
    received_time timestamp without time zone,
    sent_ipaddress character varying(100) NOT NULL,
    sent_hostname character varying(100) NOT NULL,
    is_broadcast character(1)
);


ALTER TABLE public.chattable OWNER TO dams;

--
-- Name: chattable_id_seq; Type: SEQUENCE; Schema: public; Owner: dams
--

CREATE SEQUENCE chattable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chattable_id_seq OWNER TO dams;

--
-- Name: chattable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dams
--

ALTER SEQUENCE chattable_id_seq OWNED BY chattable.id;


--
-- Name: daily_works; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE daily_works (
    id integer NOT NULL,
    work_date timestamp without time zone,
    project_id numeric(10,0),
    task_category_id numeric(10,0),
    work_type_id numeric(10,0),
    work_done character varying(200),
    task_status_id numeric(10,0),
    employee_id numeric(10,0),
    user_id numeric(10,0),
    description character varying(500),
    entered_date timestamp without time zone,
    delete_flag character(1),
    deleted_date timestamp without time zone
);


ALTER TABLE public.daily_works OWNER TO dams;

--
-- Name: daily_works_id_seq; Type: SEQUENCE; Schema: public; Owner: dams
--

CREATE SEQUENCE daily_works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.daily_works_id_seq OWNER TO dams;

--
-- Name: daily_works_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dams
--

ALTER SEQUENCE daily_works_id_seq OWNED BY daily_works.id;


--
-- Name: designations; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE designations (
    id integer NOT NULL,
    designation_id numeric(10,0) NOT NULL,
    designation character varying(100)
);


ALTER TABLE public.designations OWNER TO dams;

--
-- Name: employee_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: dams
--

CREATE SEQUENCE employee_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_categories_id_seq OWNER TO dams;

--
-- Name: employee_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dams
--

ALTER SEQUENCE employee_categories_id_seq OWNED BY designations.id;


--
-- Name: employee_details; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE employee_details (
    id integer NOT NULL,
    employee_id numeric(10,0) NOT NULL,
    employee_name character varying(100),
    designation_id numeric(10,0),
    email character varying(50),
    address character varying(100),
    created_date timestamp without time zone,
    delete_flag character(1),
    user_id numeric(6,0),
    mobile character varying(25),
    qualification character varying(25),
    joining_date date,
    releaving_date date,
    gender character(1),
    salary numeric(15,2),
    department_id integer,
    dob date
);


ALTER TABLE public.employee_details OWNER TO dams;

--
-- Name: employee_details_id_seq; Type: SEQUENCE; Schema: public; Owner: dams
--

CREATE SEQUENCE employee_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_details_id_seq OWNER TO dams;

--
-- Name: employee_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dams
--

ALTER SEQUENCE employee_details_id_seq OWNED BY employee_details.id;


--
-- Name: logtable; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE logtable (
    username character varying(25) NOT NULL,
    real_name character varying(100) NOT NULL,
    ipaddress character varying(100) NOT NULL,
    accessdate timestamp without time zone NOT NULL,
    hostname character varying(100),
    id numeric(15,0) NOT NULL,
    logout_time timestamp without time zone,
    session_id character varying(50),
    updated_time timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.logtable OWNER TO dams;

--
-- Name: logtable_seq; Type: SEQUENCE; Schema: public; Owner: dams
--

CREATE SEQUENCE logtable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logtable_seq OWNER TO dams;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE projects (
    project_id integer NOT NULL,
    project_name character varying(200),
    project_desc character varying(500),
    delete_flag character(1)
);


ALTER TABLE public.projects OWNER TO dams;

--
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: dams
--

CREATE SEQUENCE projects_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_project_id_seq OWNER TO dams;

--
-- Name: projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dams
--

ALTER SEQUENCE projects_project_id_seq OWNED BY projects.project_id;


--
-- Name: role_services; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE role_services (
    roleid numeric(6,0) NOT NULL,
    service_id numeric(6,0) NOT NULL
);


ALTER TABLE public.role_services OWNER TO dams;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE roles (
    role_id numeric(10,0) NOT NULL,
    role_name character varying(50) NOT NULL,
    delete_flag character(1)
);


ALTER TABLE public.roles OWNER TO dams;

--
-- Name: services; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE services (
    id numeric(6,0) NOT NULL,
    service_id numeric(6,0) NOT NULL,
    service_name character varying(100),
    parent_id numeric(6,0),
    target character varying(200),
    display numeric(6,0),
    description character varying(50),
    delete_flag character(1)
);


ALTER TABLE public.services OWNER TO dams;

--
-- Name: task_category; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE task_category (
    id integer NOT NULL,
    category_id numeric(10,0) NOT NULL,
    category_name character varying(50),
    delete_flag character(1)
);


ALTER TABLE public.task_category OWNER TO dams;

--
-- Name: task_category_id_seq; Type: SEQUENCE; Schema: public; Owner: dams
--

CREATE SEQUENCE task_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_category_id_seq OWNER TO dams;

--
-- Name: task_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dams
--

ALTER SEQUENCE task_category_id_seq OWNED BY task_category.id;


--
-- Name: task_status; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE task_status (
    id integer NOT NULL,
    status_id numeric(10,0) NOT NULL,
    status_name character varying(50),
    delete_flag character(1)
);


ALTER TABLE public.task_status OWNER TO dams;

--
-- Name: task_status_id_seq; Type: SEQUENCE; Schema: public; Owner: dams
--

CREATE SEQUENCE task_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_status_id_seq OWNER TO dams;

--
-- Name: task_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dams
--

ALTER SEQUENCE task_status_id_seq OWNED BY task_status.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE user_roles (
    id character varying(50) NOT NULL,
    user_id numeric(5,0) NOT NULL,
    role_id numeric(5,0) NOT NULL,
    service_id numeric(5,0) NOT NULL
);


ALTER TABLE public.user_roles OWNER TO dams;

--
-- Name: users; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100),
    role_id integer,
    real_name character varying(100),
    real_password character varying(100),
    delete_flag character(1),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    old_password character varying(100)
);


ALTER TABLE public.users OWNER TO dams;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: dams
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO dams;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dams
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: work_categories; Type: TABLE; Schema: public; Owner: dams; Tablespace: 
--

CREATE TABLE work_categories (
    id numeric(10,0) NOT NULL,
    work_id numeric(10,0) NOT NULL,
    work_name character varying(50),
    delete_flag character(1)
);


ALTER TABLE public.work_categories OWNER TO dams;

SET search_path = test_schema, pg_catalog;

--
-- Name: test_table; Type: TABLE; Schema: test_schema; Owner: dams; Tablespace: 
--

CREATE TABLE test_table (
    id integer NOT NULL,
    dept_id integer,
    parameter_id integer NOT NULL,
    students_registered numeric(10,0),
    students_sanctioned numeric(10,0),
    budget_released numeric(10,2),
    amount_sanctioned numeric(10,2),
    remarks character varying(200),
    entered_date timestamp without time zone,
    updated_date timestamp without time zone,
    delete_flag character(1),
    deleted_date timestamp without time zone
);


ALTER TABLE test_schema.test_table OWNER TO dams;

--
-- Name: test_table_id_seq; Type: SEQUENCE; Schema: test_schema; Owner: dams
--

CREATE SEQUENCE test_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test_schema.test_table_id_seq OWNER TO dams;

--
-- Name: test_table_id_seq; Type: SEQUENCE OWNED BY; Schema: test_schema; Owner: dams
--

ALTER SEQUENCE test_table_id_seq OWNED BY test_table.id;


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dams
--

ALTER TABLE ONLY chattable ALTER COLUMN id SET DEFAULT nextval('chattable_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dams
--

ALTER TABLE ONLY daily_works ALTER COLUMN id SET DEFAULT nextval('daily_works_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dams
--

ALTER TABLE ONLY designations ALTER COLUMN id SET DEFAULT nextval('employee_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dams
--

ALTER TABLE ONLY employee_details ALTER COLUMN id SET DEFAULT nextval('employee_details_id_seq'::regclass);


--
-- Name: project_id; Type: DEFAULT; Schema: public; Owner: dams
--

ALTER TABLE ONLY projects ALTER COLUMN project_id SET DEFAULT nextval('projects_project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dams
--

ALTER TABLE ONLY task_category ALTER COLUMN id SET DEFAULT nextval('task_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dams
--

ALTER TABLE ONLY task_status ALTER COLUMN id SET DEFAULT nextval('task_status_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: dams
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


SET search_path = test_schema, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: test_schema; Owner: dams
--

ALTER TABLE ONLY test_table ALTER COLUMN id SET DEFAULT nextval('test_table_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Data for Name: chat_users_count; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY chat_users_count (id, users_count) FROM stdin;
1	1
\.


--
-- Data for Name: chattable; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY chattable (id, from_username, to_username, message, sent_time, received_time, sent_ipaddress, sent_hostname, is_broadcast) FROM stdin;
112	admin	rajesh	Hi Rajesh	2017-07-04 11:38:02.77	\N	127.0.0.1	localhost	\N
113	rajesh	admin	Hi Admin	2017-07-04 11:38:15.405	\N	127.0.0.1	localhost	\N
114	admin	rajesh	How are you	2017-07-04 11:38:38.107	\N	127.0.0.1	localhost	\N
115	rajesh	admin	I am doing fine	2017-07-04 11:38:54.204	\N	127.0.0.1	localhost	\N
116	admin	rajesh	Hello	2017-07-04 11:40:52.106	\N	127.0.0.1	localhost	\N
117	rajesh	admin	Are you there	2017-07-04 11:41:07.033	\N	127.0.0.1	localhost	\N
118	admin	rajesh	Yes	2017-07-04 11:41:20.552	\N	127.0.0.1	localhost	\N
119	abhishek	rajesh	hiii anna	2017-07-04 11:44:19.628	\N	10.2.9.88	10.2.9.15	\N
120	rajesh	abhishek	Hi Abhi	2017-07-04 11:44:22.323	\N	10.2.9.93	10.2.9.15	\N
121	abhishek	rajesh	hw r u??	2017-07-04 11:44:27.462	\N	10.2.9.88	10.2.9.15	\N
122	rajesh	abhishek	I am fine	2017-07-04 11:44:32.279	\N	10.2.9.93	10.2.9.15	\N
123	sharat	abhishek	hiiiiii anna	2017-07-04 11:45:00.618	\N	10.2.10.25	10.2.9.15	\N
124	sharat	rajesh	hii anna	2017-07-04 11:45:22.06	\N	10.2.10.25	10.2.9.15	\N
125	sharat	rajesh	hii anna	2017-07-04 11:45:22.062	\N	10.2.10.25	10.2.9.15	\N
126	sharat	rajesh	hii anna	2017-07-04 11:45:22.145	\N	10.2.10.25	10.2.9.15	\N
127	rajesh	sharat	Hi Srinath	2017-07-04 11:45:39.715	\N	10.2.9.93	10.2.9.15	\N
128	rajesh	sharat	Hi Srinath	2017-07-04 11:45:39.715	\N	10.2.9.93	10.2.9.15	\N
129	abhishek	rajesh	helloooooooooo	2017-07-04 11:46:09.171	\N	10.2.9.88	10.2.9.15	\N
130	sharat	rajesh	hiiiiiiiiiiii anna	2017-07-04 11:46:21.344	\N	10.2.10.25	10.2.9.15	\N
131	rajesh	sharat	How are you	2017-07-04 11:46:30.961	\N	10.2.9.93	10.2.9.15	\N
132	rajesh	sharat	How are you	2017-07-04 11:46:30.98	\N	10.2.9.93	10.2.9.15	\N
133	rajesh	sharat	Hi	2017-07-04 14:31:59.51	\N	127.0.0.1	localhost	\N
134	rajesh	sharat	Hi	2017-07-04 14:31:59.513	\N	127.0.0.1	localhost	\N
135	rajesh	sharat	Hi	2017-07-04 14:31:59.55	\N	127.0.0.1	localhost	\N
136	rajesh	sharat	Hello	2017-07-04 14:32:19.269	\N	127.0.0.1	localhost	\N
137	rajesh	sharat	Hello	2017-07-04 14:32:19.274	\N	127.0.0.1	localhost	\N
138	rajesh	sharat	Hello	2017-07-04 14:32:19.338	\N	127.0.0.1	localhost	\N
139	admin	abhishek	hello	2017-07-04 14:48:48.067	\N	127.0.0.1	localhost	\N
140	admin	abhishek	Get	2017-07-04 14:50:25.639	\N	127.0.0.1	localhost	\N
141	admin	abhishek	ffff	2017-07-04 14:51:26.419	\N	127.0.0.1	localhost	\N
142	admin	abhishek	hhh	2017-07-04 14:53:18.212	\N	127.0.0.1	localhost	\N
143	admin	abhishek	gggg	2017-07-04 14:54:00.906	\N	127.0.0.1	localhost	\N
144	admin	abhishek	ffff	2017-07-04 14:57:04.499	\N	127.0.0.1	localhost	\N
145	admin	abhishek	dddd	2017-07-04 14:57:16.017	\N	127.0.0.1	localhost	\N
146	admin	abhishek	dddd	2017-07-04 14:58:15.668	\N	127.0.0.1	localhost	\N
147	admin	abhishek	ddddss	2017-07-04 14:58:40.201	\N	127.0.0.1	localhost	\N
148	admin	abhishek	mmmm	2017-07-04 15:01:04.174	\N	127.0.0.1	localhost	\N
149	admin	rajesh	There	2017-07-04 15:44:48.891	\N	127.0.0.1	localhost	\N
150	admin	rajesh	There	2017-07-04 15:44:48.934	\N	127.0.0.1	localhost	\N
151	rajesh	admin	are you there	2017-07-04 15:46:00.475	\N	127.0.0.1	localhost	\N
152	rajesh	abhishek	Hi	2017-07-04 15:49:44.745	\N	127.0.0.1	localhost	\N
153	admin	rajesh	Hiii	2017-07-04 15:50:05.347	\N	127.0.0.1	localhost	\N
154	rajesh	abhishek	hiihii	2017-07-04 15:50:28.713	\N	127.0.0.1	localhost	\N
155	rajesh	admin	higi	2017-07-04 15:51:45.136	\N	127.0.0.1	localhost	\N
156	rajesh	admin	Hi Ravi	2017-07-04 16:27:16.176	\N	127.0.0.1	localhost	\N
157	admin	rajesh	hi	2017-07-04 16:27:28.536	\N	10.2.9.97	10.2.9.15	\N
158	rajesh	admin	How are you	2017-07-04 16:27:40.046	\N	127.0.0.1	localhost	\N
159	admin	rajesh	i am good thx	2017-07-04 16:28:00.992	\N	10.2.9.97	10.2.9.15	\N
160	admin	rajesh	34531245176538	2017-07-04 16:28:04.905	\N	10.2.9.97	10.2.9.15	\N
161	rajesh	admin	Have you resigned	2017-07-04 16:28:08.063	\N	127.0.0.1	localhost	\N
162	admin	rajesh	%^&%^()))_@!!	2017-07-04 16:28:09.633	\N	10.2.9.97	10.2.9.15	\N
163	rajesh	admin	Hi Admin	2017-07-04 16:45:35.548	\N	127.0.0.1	localhost	\N
164	rajesh	admin	Hello	2017-07-04 16:51:29.656	\N	127.0.0.1	localhost	\N
165	rajesh	admin	df	2017-07-04 16:52:19.025	\N	127.0.0.1	localhost	\N
166	rajesh	admin	Are you thers	2017-07-04 17:06:18.612	\N	127.0.0.1	localhost	\N
167	admin	rajesh	Yes i am here	2017-07-04 17:07:03.221	\N	127.0.0.1	localhost	\N
168	rajesh	admin	Once again	2017-07-04 17:16:09.806	\N	127.0.0.1	localhost	\N
169	admin	rajesh	Hello	2017-07-04 17:16:34.436	\N	127.0.0.1	localhost	\N
170	rajesh	admin	yup	2017-07-04 17:16:47.007	\N	127.0.0.1	localhost	\N
171	admin	rajesh	Ok	2017-07-04 17:17:15.533	\N	127.0.0.1	localhost	\N
172	rajesh	admin	how are you	2017-07-04 17:18:15.548	\N	127.0.0.1	localhost	\N
173	admin	rajesh	I am fine	2017-07-04 17:18:53.628	\N	127.0.0.1	localhost	\N
174	admin	rajesh	TV	2017-07-04 17:19:46.944	\N	127.0.0.1	localhost	\N
175	admin	rajesh	hhhiii	2017-07-04 17:21:36.625	\N	127.0.0.1	localhost	\N
176	rajesh	admin	jj	2017-07-04 17:22:18.049	\N	127.0.0.1	localhost	\N
177	admin	rajesh	dd	2017-07-04 17:22:30.355	\N	127.0.0.1	localhost	\N
178	rajesh	admin	Hi admin	2017-07-04 17:29:36.172	\N	127.0.0.1	localhost	\N
179	admin	rajesh	Hi Rajesh	2017-07-04 17:30:04.064	\N	127.0.0.1	localhost	\N
180	rajesh	sharat	Hi sharat	2017-07-04 17:30:34.141	\N	127.0.0.1	localhost	\N
181	rajesh	sharat	Hi sharat	2017-07-04 17:30:34.144	\N	127.0.0.1	localhost	\N
182	admin	sharat	Hi dd	2017-07-04 17:31:19.772	\N	127.0.0.1	localhost	\N
183	admin	sharat	Hi dd	2017-07-04 17:31:19.775	\N	127.0.0.1	localhost	\N
184	admin	rajesh	Helloooo Rajesh	2017-07-05 10:37:46.226	\N	127.0.0.1	localhost	\N
185	rajesh	admin	Hello Admin	2017-07-05 10:38:07.232	\N	127.0.0.1	localhost	\N
186	admin	sharat	Hi Sharat	2017-07-05 10:38:30.629	\N	127.0.0.1	localhost	\N
187	admin	sharat	Hi Sharat	2017-07-05 10:38:30.631	\N	127.0.0.1	localhost	\N
188	sharat	admin	Hi Admin	2017-07-05 10:40:31.925	\N	127.0.0.1	localhost	\N
189	rajesh	sharat	shaaaaaaaraaaat	2017-07-05 10:42:18.282	\N	127.0.0.1	localhost	\N
190	rajesh	sharat	shaaaaaaaraaaat	2017-07-05 10:42:18.318	\N	127.0.0.1	localhost	\N
191	rajesh	admin	Hiii	2017-07-07 14:54:01.985	\N	127.0.0.1	localhost	\N
192	rajesh	admin	How are you	2017-07-07 14:54:27.072	\N	127.0.0.1	localhost	\N
193	rajesh	admin	Hi\\	2017-07-10 16:28:30.525	\N	127.0.0.1	localhost	\N
194	rajesh	admin	Hiii	2017-07-10 16:37:54.753	\N	127.0.0.1	localhost	\N
195	rajesh	admin	Are you there	2017-07-10 16:39:07.37	\N	127.0.0.1	localhost	\N
196	admin	rajesh	Hi	2017-07-10 16:55:04.841	\N	127.0.0.1	localhost	\N
197	admin	rajesh	Ofo	2017-07-10 17:00:34.27	\N	127.0.0.1	localhost	\N
198	admin	rajesh	What do you say	2017-07-10 17:00:46.515	\N	127.0.0.1	localhost	\N
199	rajesh	sharat	Sharat	2017-07-10 17:01:30.935	\N	127.0.0.1	localhost	\N
200	rajesh	sharat	Sharat	2017-07-10 17:02:30.604	\N	127.0.0.1	localhost	\N
201	rajesh	sharat	Sharat	2017-07-10 17:02:30.611	\N	127.0.0.1	localhost	\N
202	rajesh	admin	I can say	2017-07-10 17:14:37.655	\N	127.0.0.1	localhost	\N
203	admin	rajesh	How	2017-07-10 17:15:18.568	\N	127.0.0.1	localhost	\N
204	rajesh	sharat	ffff	2017-07-11 12:54:18.244	\N	127.0.0.1	localhost	\N
205	rajesh	sharat	ffff	2017-07-11 12:54:18.244	\N	127.0.0.1	localhost	\N
206	rajesh	sharat	gggg	2017-07-11 12:54:26.728	\N	127.0.0.1	localhost	\N
207	rajesh	sharat	gggg	2017-07-11 12:54:26.73	\N	127.0.0.1	localhost	\N
208	sharat	admin	gg	2017-07-11 13:05:54.064	\N	127.0.0.1	localhost	\N
209	sharat	admin	gg	2017-07-11 13:05:54.123	\N	127.0.0.1	localhost	\N
210	sharat	admin	bb	2017-07-11 13:06:18.513	\N	127.0.0.1	localhost	\N
211	sharat	admin	bb	2017-07-11 13:06:18.516	\N	127.0.0.1	localhost	\N
212	rajesh	admin	pp	2017-07-11 13:55:49.691	\N	127.0.0.1	localhost	\N
213	rajesh	admin	pp1	2017-07-11 13:56:54.761	\N	127.0.0.1	localhost	\N
214	rajesh	admin	pp2	2017-07-11 13:57:39.541	\N	127.0.0.1	localhost	\N
215	rajesh	admin	fg	2017-07-11 13:59:04.165	\N	127.0.0.1	localhost	\N
216	rajesh	admin	ppg	2017-07-11 13:59:19.438	\N	127.0.0.1	localhost	\N
217	rajesh	admin	fdfd	2017-07-11 13:59:40.4	\N	127.0.0.1	localhost	\N
218	rajesh	admin	fdfds	2017-07-11 13:59:53.59	\N	127.0.0.1	localhost	\N
219	rajesh	admin	dsd	2017-07-11 14:00:37.451	\N	127.0.0.1	localhost	\N
220	rajesh	admin	vv	2017-07-11 14:03:36.45	\N	127.0.0.1	localhost	\N
221	rajesh	admin	vv1	2017-07-11 14:04:03.782	\N	127.0.0.1	localhost	\N
222	rajesh	admin	dd	2017-07-11 14:05:45.771	\N	127.0.0.1	localhost	\N
223	rajesh	admin	ffgg	2017-07-11 14:07:18.415	\N	127.0.0.1	localhost	\N
224	rajesh	admin	ff	2017-07-11 14:09:10.642	\N	127.0.0.1	localhost	\N
225	rajesh	admin	ccff	2017-07-11 14:10:13.011	\N	127.0.0.1	localhost	\N
226	rajesh	admin	cc	2017-07-11 14:10:43.642	\N	127.0.0.1	localhost	\N
227	rajesh	sharat	xx	2017-07-11 14:10:52.517	\N	127.0.0.1	localhost	\N
228	rajesh	sharat	xx	2017-07-11 14:10:54.413	\N	127.0.0.1	localhost	\N
229	rajesh	admin	bb	2017-07-11 14:15:58.87	\N	127.0.0.1	localhost	\N
230	rajesh	admin	bb1	2017-07-11 14:16:13.818	\N	127.0.0.1	localhost	\N
231	rajesh	admin	bb	2017-07-11 14:23:25.036	\N	127.0.0.1	localhost	\N
232	rajesh	admin	ghgh	2017-07-11 14:25:08.253	\N	10.2.9.15	10.2.9.15	\N
233	rajesh	admin	tt	2017-07-11 14:26:19.032	\N	10.2.9.15	10.2.9.15	\N
234	rajesh	admin	tt1	2017-07-11 14:27:28.703	\N	10.2.9.15	10.2.9.15	\N
235	rajesh	sharat	tt2	2017-07-11 14:27:35.075	\N	10.2.9.15	10.2.9.15	\N
236	rajesh	sharat	tt2	2017-07-11 14:27:35.112	\N	10.2.9.15	10.2.9.15	\N
237	rajesh	admin	tt2	2017-07-11 14:29:24.95	\N	10.2.9.15	10.2.9.15	\N
238	rajesh	admin	yy	2017-07-11 14:29:51.325	\N	10.2.9.15	10.2.9.15	\N
239	rajesh	admin	bb	2017-07-11 14:40:02.751	\N	10.2.9.15	10.2.9.15	\N
240	rajesh	sharat	jj	2017-07-11 14:40:36.236	\N	10.2.9.15	10.2.9.15	\N
241	rajesh	admin	dd	2017-07-11 14:41:33.459	\N	10.2.9.15	10.2.9.15	\N
242	rajesh	sharat	ff	2017-07-11 14:41:40.699	\N	10.2.9.15	10.2.9.15	\N
243	rajesh	admin	kk	2017-07-11 14:42:08.814	\N	10.2.9.15	10.2.9.15	\N
244	rajesh	admin	ll	2017-07-11 14:42:39.316	\N	10.2.9.15	10.2.9.15	\N
245	rajesh	admin	llk	2017-07-11 14:42:45.622	\N	10.2.9.15	10.2.9.15	\N
246	rajesh	sharat	pp	2017-07-11 14:42:51.512	\N	10.2.9.15	10.2.9.15	\N
247	rajesh	sharat	plk	2017-07-11 14:43:28.227	\N	10.2.9.15	10.2.9.15	\N
248	rajesh	admin	kll	2017-07-11 14:43:46.458	\N	10.2.9.15	10.2.9.15	\N
249	sharat	admin	srt	2017-07-11 14:45:34.361	\N	127.0.0.1	localhost	\N
250	rajesh	admin	tp	2017-07-11 15:01:27.824	\N	10.2.9.15	10.2.9.15	\N
251	admin	rajesh	pt	2017-07-11 15:02:47.872	\N	127.0.0.1	localhost	\N
252	sharat	rajesh	bb	2017-07-11 15:09:12.798	\N	127.0.0.1	localhost	\N
253	rajesh	sharat	ll	2017-07-11 15:09:38.201	\N	10.2.9.15	10.2.9.15	\N
254	sharat	admin	How Are you Admin	2017-07-11 15:11:56.63	\N	127.0.0.1	localhost	\N
255	admin	sharat	I am fine Sharat	2017-07-11 15:12:08.746	\N	127.0.0.1	localhost	\N
256	sharat	rajesh	How are you rajesh	2017-07-11 15:12:30.323	\N	127.0.0.1	localhost	\N
257	rajesh	sharat	I am fine Sharat	2017-07-11 15:12:41.997	\N	10.2.9.15	10.2.9.15	\N
258	rajesh	admin	From Rajesh How are you admin	2017-07-11 15:12:52.833	\N	10.2.9.15	10.2.9.15	\N
259	admin	rajesh	Rajesh I am fine	2017-07-11 15:13:11.517	\N	127.0.0.1	localhost	\N
260	admin	abhishek	Hi Abhishek	2017-07-11 15:17:42.438	\N	10.2.9.93	10.2.9.15	\N
261	abhishek	sharat	hiiii sharath	2017-07-11 15:18:00.746	\N	10.2.9.88	10.2.9.15	\N
262	admin	abhishek	How are you Abhi	2017-07-11 15:18:06.023	\N	10.2.9.93	10.2.9.15	\N
263	abhishek	sharat	helooooo	2017-07-11 15:18:07.978	\N	10.2.9.88	10.2.9.15	\N
264	sharat	abhishek	hii	2017-07-11 15:18:10.852	\N	10.2.10.25	10.2.9.15	\N
265	abhishek	admin	yupp m abhi	2017-07-11 15:18:17.418	\N	10.2.9.88	10.2.9.15	\N
266	admin	sharat	What is going on	2017-07-11 15:18:19.917	\N	10.2.9.93	10.2.9.15	\N
267	abhishek	admin	m fine	2017-07-11 15:18:27.93	\N	10.2.9.88	10.2.9.15	\N
268	abhishek	admin	wt about u??	2017-07-11 15:18:32.323	\N	10.2.9.88	10.2.9.15	\N
269	sharat	admin	hii	2017-07-11 15:18:35.745	\N	10.2.10.25	10.2.9.15	\N
270	abhishek	sharat	sharth	2017-07-11 15:19:06.555	\N	10.2.9.88	10.2.9.15	\N
271	abhishek	sharat	hw r u???	2017-07-11 15:19:09.958	\N	10.2.9.88	10.2.9.15	\N
272	rajesh	admin	hi	2017-07-11 15:20:35.64	\N	10.2.10.25	10.2.9.15	\N
273	admin	rajesh	Hi Bhanu	2017-07-11 15:20:46.374	\N	10.2.9.93	10.2.9.15	\N
274	admin	rajesh	How are you	2017-07-11 15:20:58.212	\N	10.2.9.93	10.2.9.15	\N
275	rajesh	admin	how r u?	2017-07-11 15:21:00.737	\N	10.2.10.25	10.2.9.15	\N
276	rajesh	admin	fine good	2017-07-11 15:21:14.769	\N	10.2.10.25	10.2.9.15	\N
277	admin	rajesh	sdfsdf	2017-07-11 15:45:30.443	\N	10.2.9.79	10.2.9.15	\N
278	rajesh	admin	ddddd	2017-07-11 15:45:44.821	\N	10.2.9.79	10.2.9.15	\N
279	rajesh	admin	ddddd	2017-07-11 15:45:49.892	\N	10.2.9.79	10.2.9.15	\N
280	rajesh	admin	ewr234 sd f	2017-07-11 15:45:59.355	\N	10.2.9.79	10.2.9.15	\N
281	sharat	admin	ds	2017-07-11 15:46:45.893	\N	10.2.9.79	10.2.9.15	\N
282	sharat	rajesh	sdf sdf	2017-07-11 15:46:47.694	\N	10.2.9.79	10.2.9.15	\N
285	rajesh	sharat	ddddd dfdfdfd	2017-07-11 15:47:41.971	\N	10.2.9.79	10.2.9.15	\N
283	rajesh	admin	sd sd sdf sd fsdf	2017-07-11 15:47:02.81	\N	10.2.9.79	10.2.9.15	\N
284	rajesh	admin	dddd	2017-07-11 15:47:34.654	\N	10.2.9.79	10.2.9.15	\N
286	admin	rajesh	Hello	2017-07-11 17:11:05.062	\N	127.0.0.1	localhost	\N
287	rajesh	admin	Hi	2017-07-11 17:11:47.37	\N	10.2.9.15	10.2.9.15	\N
288	rajesh	admin	DDDD	2017-07-11 17:12:44.589	\N	10.2.9.15	10.2.9.15	\N
289	admin	rajesh	Now	2017-07-11 17:21:52.875	\N	127.0.0.1	localhost	\N
290	admin	rajesh	Whats up?	2017-07-11 17:24:53.187	\N	127.0.0.1	localhost	\N
291	rajesh	admin	Nothing	2017-07-11 17:25:07.828	\N	10.2.9.15	10.2.9.15	\N
292	rajesh	admin	Hiiiiiiiiiiiiiiiiiiiiiiiiiii	2017-07-12 10:24:41.845	\N	10.2.9.15	10.2.9.15	\N
293	admin	rajesh	Good Morning	2017-07-12 10:25:53.248	\N	127.0.0.1	localhost	\N
294	admin	rajesh	JJ	2017-07-12 10:35:10.261	\N	127.0.0.1	localhost	\N
295	ravi	rajesh	fhgewfdsfh	2017-07-12 14:09:18.088	\N	10.2.9.97	10.2.9.15	\N
296	ravi	sharat	hi	2017-07-12 14:09:28.921	\N	10.2.9.97	10.2.9.15	\N
297	ravi	rajesh	delay of 10 sec	2017-07-12 14:09:38.368	\N	10.2.9.97	10.2.9.15	\N
298	sharat	ravi	Hi Ravi	2017-07-12 14:09:44.67	\N	127.0.0.1	localhost	\N
299	rajesh	ravi	Ravi How are you	2017-07-12 14:09:53.276	\N	127.0.0.1	localhost	\N
300	ravi	sharat	offo working	2017-07-12 14:09:57.601	\N	10.2.9.97	10.2.9.15	\N
301	rajesh	ravi	Of Course	2017-07-12 14:10:02.736	\N	127.0.0.1	localhost	\N
302	ravi	rajesh	i am here	2017-07-12 14:10:04.615	\N	10.2.9.97	10.2.9.15	\N
303	ravi	sharat	jhhbdjs	2017-07-12 14:10:22.305	\N	10.2.9.97	10.2.9.15	\N
\.


--
-- Name: chattable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dams
--

SELECT pg_catalog.setval('chattable_id_seq', 303, true);


--
-- Data for Name: daily_works; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY daily_works (id, work_date, project_id, task_category_id, work_type_id, work_done, task_status_id, employee_id, user_id, description, entered_date, delete_flag, deleted_date) FROM stdin;
1	2017-06-14 00:00:00	1	2	1	Test	1	\N	1	est	2017-06-14 15:27:50.147	\N	\N
2	2017-06-06 00:00:00	1	1	1	sdfsf	1	\N	1	sdfsf	2017-06-14 15:29:57.551	\N	\N
3	2017-06-13 00:00:00	15	9	4	Testing	6	\N	1	Testing	2017-06-14 16:24:08.536	T	2017-06-14 16:26:16.185
\.


--
-- Name: daily_works_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dams
--

SELECT pg_catalog.setval('daily_works_id_seq', 3, true);


--
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY designations (id, designation_id, designation) FROM stdin;
1	1	Trainee Software Developer
2	2	Software Developer
3	3	Sr. Software Developer
4	4	Team Leader
5	5	Project Leader
6	6	Project Manager
7	7	Sr. Project Manager
8	8	Director
9	9	Business Analyst
10	10	Software Tester
11	11	Sr Software Tester
12	12	Project Associate
13	13	Consultant
\.


--
-- Name: employee_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dams
--

SELECT pg_catalog.setval('employee_categories_id_seq', 1, false);


--
-- Data for Name: employee_details; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY employee_details (id, employee_id, employee_name, designation_id, email, address, created_date, delete_flag, user_id, mobile, qualification, joining_date, releaving_date, gender, salary, department_id, dob) FROM stdin;
2	3	rajesh1	3	raje@gmail.com	Address	2016-01-13 10:31:04	\N	3	9949479944	\N	\N	\N	\N	\N	\N	\N
4	5	rajesh2	5	raj@gmail.com	Address	2016-01-13 10:39:28	\N	5	9948418567	\N	\N	\N	\N	\N	\N	\N
1	1	Lakshmi Rajeswara Rao Sarma	3	rajesh@gmail.com	\N	\N	\N	1	9866489944	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: employee_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dams
--

SELECT pg_catalog.setval('employee_details_id_seq', 1, false);


--
-- Data for Name: logtable; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY logtable (username, real_name, ipaddress, accessdate, hostname, id, logout_time, session_id, updated_time) FROM stdin;
rajesh	Lakshmi Rajeswara Sarma	10.2.10.25	2017-07-11 15:20:23.106	10.2.9.15	414	2017-07-11 15:22:15.932	543FB47310358FB57D3240E2A0C9666E	2017-07-11 15:20:23.106
abhishek	Abhishek	10.2.9.88	2017-07-11 15:16:19.407	10.2.9.15	411	2017-07-11 15:25:53.653	9BA0127387682F58BE7CC6669FA2D927	2017-07-11 15:16:19.407
sharat	Sharat	10.2.10.25	2017-07-11 15:17:29.421	10.2.9.15	412	2017-07-11 15:29:49.533	56B2CF3D3EC113650B3BE08DC5D1EB10	2017-07-11 15:17:29.421
admin	Admin	10.2.9.93	2017-07-11 15:17:31.928	10.2.9.15	413	2017-07-11 15:30:18.699	E5BF53E426B3CFCB093A36C4E74BD919	2017-07-11 15:17:31.928
sharat	Sharat	10.2.9.79	2017-07-11 15:46:31.434	10.2.9.15	418	2017-07-11 16:30:09.836	6436D6152F23EBE08B4626E9833ED99E	2017-07-11 15:46:31.434
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-11 16:34:12.647	10.2.9.15	420	2017-07-11 17:13:15.634	8A01592A3C83149BE5ECFC0721B4FEA8	2017-07-11 16:34:12.647
rajesh	Lakshmi Rajeswara Sarma	127.0.0.1	2017-07-11 12:44:51.241	localhost	397	2017-07-11 12:46:15.954	B419A1C1530951664669D9D8B0BE56B4	2017-07-11 12:44:51.241
admin	Admin	127.0.0.1	2017-07-11 12:45:03.417	localhost	398	2017-07-11 12:46:23.299	C86295C79D243DA62C3B562D008B1625	2017-07-11 12:45:03.417
sharat	Sharat	127.0.0.1	2017-07-11 12:53:33.21	localhost	401	2017-07-11 13:32:22.1	F902E3BE0D05BA54EC2F583E518B8E91	2017-07-11 12:53:33.21
sharat	Sharat	127.0.0.1	2017-07-11 14:10:31.927	localhost	403	2017-07-11 14:55:22.738	3B2CB9DD3BD31662947E2F0C3BFDD79A	2017-07-11 14:10:31.927
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-11 14:29:15.836	10.2.9.15	408	2017-07-11 15:15:38.266	CDB393F605C1FF40D5DDFD2D833E8C2F	2017-07-11 14:29:15.836
sharat	Sharat	127.0.0.1	2017-07-11 15:03:03.273	localhost	410	2017-07-11 15:15:43.764	E763A202790F91F2DCAB33A1592EADF3	2017-07-11 15:03:03.273
admin	Admin	127.0.0.1	2017-07-11 16:34:03.636	localhost	419	2017-07-11 17:13:18.593	A3AA77002196C6870FB7D3B898225D20	2017-07-11 16:34:03.636
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-11 17:18:13.622	10.2.9.15	421	2017-07-11 17:18:20.892	720FC5216D5B9890DA72E2B60C1721F3	2017-07-11 17:18:13.622
admin	Admin	127.0.0.1	2017-07-11 17:19:25.187	localhost	423	2017-07-11 17:19:44.816	9A4FF581DAB2794864A87B2D847700CE	2017-07-11 17:19:25.187
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-11 17:19:11.717	10.2.9.15	422	2017-07-11 17:19:51.906	3039F6780BDDC4BA290DE8F50C3C9147	2017-07-11 17:19:11.717
admin	Admin	10.2.9.93	2017-07-11 15:32:10.847	10.2.9.15	415	2017-07-11 17:20:20.624	F26992990F3F1937AA3BB57A26428BC4	2017-07-11 15:32:10.847
admin	Admin	10.2.9.79	2017-07-11 15:44:14.971	10.2.9.15	416	2017-07-11 17:20:20.624	A915B647883103C6E8F4B149E5A37707	2017-07-11 15:44:14.971
rajesh	Lakshmi Rajeswara Sarma	10.2.9.79	2017-07-11 15:45:09.873	10.2.9.15	417	2017-07-11 17:20:20.624	6436D6152F23EBE08B4626E9833ED99E	2017-07-11 15:45:09.873
rajesh	Lakshmi Rajeswara Sarma	127.0.0.1	2017-07-11 12:47:18.672	localhost	399	2017-07-11 17:20:20.624	ACC6E4635C9EEC5783F6A5D03BABD514	2017-07-11 12:47:18.672
admin	Admin	127.0.0.1	2017-07-11 12:47:22.328	localhost	400	2017-07-11 17:20:20.624	F902E3BE0D05BA54EC2F583E518B8E91	2017-07-11 12:47:22.328
admin	Admin	127.0.0.1	2017-07-11 14:10:23.375	localhost	402	2017-07-11 17:20:20.624	3B2CB9DD3BD31662947E2F0C3BFDD79A	2017-07-11 14:10:23.375
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-11 14:24:46.984	10.2.9.15	404	2017-07-11 17:20:20.624	CDB393F605C1FF40D5DDFD2D833E8C2F	2017-07-11 14:24:46.984
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-11 14:26:13.142	10.2.9.15	405	2017-07-11 17:20:20.624	CDB393F605C1FF40D5DDFD2D833E8C2F	2017-07-11 14:26:13.142
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-11 14:27:22.119	10.2.9.15	406	2017-07-11 17:20:20.624	CDB393F605C1FF40D5DDFD2D833E8C2F	2017-07-11 14:27:22.119
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-11 14:29:00.438	10.2.9.15	407	2017-07-11 17:20:20.624	CDB393F605C1FF40D5DDFD2D833E8C2F	2017-07-11 14:29:00.438
admin	Admin	127.0.0.1	2017-07-11 15:02:42.297	localhost	409	2017-07-11 17:20:20.624	E763A202790F91F2DCAB33A1592EADF3	2017-07-11 15:02:42.297
admin	Admin	127.0.0.1	2017-07-11 17:20:25.262	localhost	424	2017-07-11 17:38:05.542	22322CF0E632F9792E77C181871E51A5	2017-07-11 17:20:25.262
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-11 17:20:29.445	10.2.9.15	425	2017-07-11 17:38:07.448	36BD1CA05ECC6A44F76AB554C0F8F5C9	2017-07-11 17:20:29.445
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-12 10:23:27.834	10.2.9.15	426	2017-07-12 10:45:09.206	5FA6968816365BD8F990F956152B44E8	2017-07-12 10:23:27.834
admin	Admin	10.2.9.15	2017-07-12 10:45:14.403	10.2.9.15	428	2017-07-12 10:45:17.352	0448930F6E6B6119DAC54C8D99C23273	2017-07-12 10:45:14.403
admin	Admin	127.0.0.1	2017-07-12 10:23:39.489	localhost	427	2017-07-12 10:57:45.028	0A9EF12A23D665692517229428705171	2017-07-12 10:23:39.489
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-12 10:45:21.546	10.2.9.15	429	2017-07-12 11:00:15.342	0A3B39ABC7235D76EAE6A5E7CE35F1F4	2017-07-12 10:45:21.546
admin	Admin	127.0.0.1	2017-07-12 11:00:08.54	localhost	430	2017-07-12 11:00:17.361	A719DB735C71A992F60DBEED9B1EC785	2017-07-12 11:00:08.54
rajesh	Lakshmi Rajeswara Sarma	10.2.9.15	2017-07-12 11:01:06.195	10.2.9.15	432	2017-07-12 11:04:17.942	42B67405CDFAE501CE9AE199C295391B	2017-07-12 11:01:06.195
admin	Admin	127.0.0.1	2017-07-12 11:01:00.559	localhost	431	2017-07-12 11:04:21.162	012D43A910131F9DA2FC9AB7FE933497	2017-07-12 11:01:00.559
ravi	Ravi	10.2.9.97	2017-07-12 14:09:08.777	10.2.9.15	435	2017-07-12 14:19:31.812	E9B21743F72C9C3B33F544B9B0FF6240	2017-07-12 14:09:08.777
sharat	Sharat	127.0.0.1	2017-07-12 14:08:30.978	localhost	433	2017-07-12 14:32:03.781	B4D054298FD88058F3795D5871901CB1	2017-07-12 14:08:30.978
rajesh	Lakshmi Rajeswara Sarma	127.0.0.1	2017-07-12 14:08:36.894	localhost	434	2017-07-12 14:32:07.162	CE5FA840243C9635F3059453127BE146	2017-07-12 14:08:36.894
\.


--
-- Name: logtable_seq; Type: SEQUENCE SET; Schema: public; Owner: dams
--

SELECT pg_catalog.setval('logtable_seq', 435, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY projects (project_id, project_name, project_desc, delete_flag) FROM stdin;
4	TERPLIVE	\N	\N
5	MPLIVE	\N	\N
6	SWACHHTS	\N	\N
7	HMWFMS	\N	\N
8	TSMDCFMS	\N	\N
9	TSCSCFMS	\N	\N
10	Test Project	Test Desc	\N
2	TERP	\N	\N
1	ERP	ERP Project	\N
11	Test Project21	Test	T
12	ddd	ffff	\N
13	ffd	sdsdsa	\N
14	fdfd	sdsd	\N
15	ffdd	dfd	\N
3	ERPLIVE	\N	T
16	dsd	dgfdsg	T
\.


--
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dams
--

SELECT pg_catalog.setval('projects_project_id_seq', 16, true);


--
-- Data for Name: role_services; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY role_services (roleid, service_id) FROM stdin;
1	1
1	2
1	21
1	22
1	9
1	3
1	4
1	5
1	41
9	1
9	2
9	21
9	22
9	9
9	3
9	4
9	5
9	41
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY roles (role_id, role_name, delete_flag) FROM stdin;
1	user	\N
9	admin	\N
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY services (id, service_id, service_name, parent_id, target, display, description, delete_flag) FROM stdin;
22	22	Projects Mapping	2	projectsMapping.do	22	Projects Mapping	F
1	1	Home	0	Welcome.do	1	Home	F
2	2	Masters	0	Welcome.do	2	Masters	F
9	9	Logout	0	Logout.do	9	Logout	F
6	6	Admin Services	0	Welcome.do	6	Admin Services	F
3	3	Work Log	0	workLog.do	3	Work Log	F
4	4	Reports	0	Welcome.do	4	Reports	F
41	41	Work Log Report	4	workLogReport.do	41	Work Log Report	F
5	5	Tasks	0	Welcome.do	5	Transactions	F
21	21	Projects Master	2	projects.do	21	Projects Master	F
\.


--
-- Data for Name: task_category; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY task_category (id, category_id, category_name, delete_flag) FROM stdin;
1	1	Documentation	\N
2	2	Requirements	\N
3	3	Testing	\N
4	4	Development	\N
5	5	Design	\N
6	6	Implementation	\N
7	7	Maintenance	\N
8	8	Trainings	\N
9	9	Meetings	\N
\.


--
-- Name: task_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dams
--

SELECT pg_catalog.setval('task_category_id_seq', 1, false);


--
-- Data for Name: task_status; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY task_status (id, status_id, status_name, delete_flag) FROM stdin;
1	1	Created	\N
2	2	Assigned	\N
3	3	Completed	\N
4	4	Reassigned	\N
5	5	Pending	\N
6	6	Closed	\N
\.


--
-- Name: task_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dams
--

SELECT pg_catalog.setval('task_status_id_seq', 1, false);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY user_roles (id, user_id, role_id, service_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY users (user_id, username, password, role_id, real_name, real_password, delete_flag, created_date, modified_date, old_password) FROM stdin;
2	admin	084e0343a0486ff05530df6c705c8bb4	9	Admin	guest	\N	\N	\N	\N
3	sharat	084e0343a0486ff05530df6c705c8bb4	1	Sharat	guest	\N	\N	\N	\N
4	abhishek	084e0343a0486ff05530df6c705c8bb4	1	Abhishek	guest	\N	\N	\N	\N
1	rajesh	084e0343a0486ff05530df6c705c8bb4	1	Lakshmi Rajeswara Sarma	guest	\N	\N	\N	\N
5	ravi	084e0343a0486ff05530df6c705c8bb4	1	Ravi	guest	\N	\N	\N	\N
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dams
--

SELECT pg_catalog.setval('users_user_id_seq', 1, false);


--
-- Data for Name: work_categories; Type: TABLE DATA; Schema: public; Owner: dams
--

COPY work_categories (id, work_id, work_name, delete_flag) FROM stdin;
1	1	New Work	\N
2	2	Pending Work	\N
3	3	Modified Existing Work	\N
4	4	Adding to Existing Work	\N
\.


SET search_path = test_schema, pg_catalog;

--
-- Data for Name: test_table; Type: TABLE DATA; Schema: test_schema; Owner: dams
--

COPY test_table (id, dept_id, parameter_id, students_registered, students_sanctioned, budget_released, amount_sanctioned, remarks, entered_date, updated_date, delete_flag, deleted_date) FROM stdin;
\.


--
-- Name: test_table_id_seq; Type: SEQUENCE SET; Schema: test_schema; Owner: dams
--

SELECT pg_catalog.setval('test_table_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- Name: chattable_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY chattable
    ADD CONSTRAINT chattable_pkey PRIMARY KEY (id);


--
-- Name: employee_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY designations
    ADD CONSTRAINT employee_categories_pkey PRIMARY KEY (designation_id);


--
-- Name: employee_details_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY employee_details
    ADD CONSTRAINT employee_details_pkey PRIMARY KEY (id);


--
-- Name: logtable_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY logtable
    ADD CONSTRAINT logtable_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: task_category_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY task_category
    ADD CONSTRAINT task_category_pkey PRIMARY KEY (id);


--
-- Name: task_status_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY task_status
    ADD CONSTRAINT task_status_pkey PRIMARY KEY (id);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: work_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY work_categories
    ADD CONSTRAINT work_categories_pkey PRIMARY KEY (id);


SET search_path = test_schema, pg_catalog;

--
-- Name: test_table_pkey; Type: CONSTRAINT; Schema: test_schema; Owner: dams; Tablespace: 
--

ALTER TABLE ONLY test_table
    ADD CONSTRAINT test_table_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: logtable_index; Type: INDEX; Schema: public; Owner: dams; Tablespace: 
--

CREATE INDEX logtable_index ON logtable USING btree (username, accessdate, ipaddress);


--
-- Name: emp_designation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dams
--

ALTER TABLE ONLY employee_details
    ADD CONSTRAINT emp_designation_fkey FOREIGN KEY (designation_id) REFERENCES designations(designation_id);


--
-- Name: role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dams
--

ALTER TABLE ONLY users
    ADD CONSTRAINT role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(role_id);


--
-- Name: role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dams
--

ALTER TABLE ONLY role_services
    ADD CONSTRAINT role_id_fkey FOREIGN KEY (roleid) REFERENCES roles(role_id);


--
-- Name: role_services_serviceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dams
--

ALTER TABLE ONLY role_services
    ADD CONSTRAINT role_services_serviceid_fkey FOREIGN KEY (service_id) REFERENCES services(service_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

