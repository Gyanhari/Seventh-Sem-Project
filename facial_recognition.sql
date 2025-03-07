--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    attendance_id integer NOT NULL,
    student_id integer NOT NULL,
    period_id integer NOT NULL,
    status character varying(10),
    recorded_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT attendance_status_check CHECK (((status)::text = ANY ((ARRAY['present'::character varying, 'absent'::character varying, 'late'::character varying])::text[])))
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attendance_attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attendance_attendance_id_seq OWNER TO postgres;

--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attendance_attendance_id_seq OWNED BY public.attendance.attendance_id;


--
-- Name: class_periods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class_periods (
    period_id integer NOT NULL,
    course_id integer NOT NULL,
    period_date date NOT NULL,
    start_time time without time zone NOT NULL,
    duration integer DEFAULT 60 NOT NULL,
    CONSTRAINT class_periods_duration_check CHECK (((duration >= 45) AND (duration <= 120)))
);


ALTER TABLE public.class_periods OWNER TO postgres;

--
-- Name: class_periods_period_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_periods_period_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.class_periods_period_id_seq OWNER TO postgres;

--
-- Name: class_periods_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_periods_period_id_seq OWNED BY public.class_periods.period_id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(100) NOT NULL,
    course_code character varying(20) NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_course_id_seq OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    rollno character varying(20) NOT NULL,
    middle_name character varying(50)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_student_id_seq OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: attendance attendance_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance ALTER COLUMN attendance_id SET DEFAULT nextval('public.attendance_attendance_id_seq'::regclass);


--
-- Name: class_periods period_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_periods ALTER COLUMN period_id SET DEFAULT nextval('public.class_periods_period_id_seq'::regclass);


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attendance (attendance_id, student_id, period_id, status, recorded_timestamp) FROM stdin;
1	34	2	absent	2025-03-07 12:58:37.587072
2	34	1	absent	2025-03-07 12:59:10.950958
3	32	1	absent	2025-03-07 13:04:16.889147
4	33	1	absent	2025-03-07 13:04:16.889147
5	35	1	absent	2025-03-07 13:04:16.889147
6	36	1	absent	2025-03-07 13:04:16.889147
7	37	1	absent	2025-03-07 13:04:16.889147
8	38	1	absent	2025-03-07 13:04:16.889147
9	39	1	absent	2025-03-07 13:04:16.889147
10	40	1	absent	2025-03-07 13:04:16.889147
11	41	1	absent	2025-03-07 13:04:16.889147
12	42	1	absent	2025-03-07 13:04:16.889147
14	29	1	absent	2025-03-07 13:04:16.889147
15	30	1	absent	2025-03-07 13:04:16.889147
16	31	1	absent	2025-03-07 13:04:16.889147
31	32	2	absent	2025-03-07 13:06:26.328182
32	33	2	absent	2025-03-07 13:06:26.328182
33	35	2	absent	2025-03-07 13:06:26.328182
34	36	2	absent	2025-03-07 13:06:26.328182
35	37	2	absent	2025-03-07 13:06:26.328182
36	38	2	absent	2025-03-07 13:06:26.328182
37	39	2	absent	2025-03-07 13:06:26.328182
38	40	2	absent	2025-03-07 13:06:26.328182
39	41	2	absent	2025-03-07 13:06:26.328182
40	42	2	absent	2025-03-07 13:06:26.328182
42	29	2	absent	2025-03-07 13:06:26.328182
43	30	2	absent	2025-03-07 13:06:26.328182
44	31	2	absent	2025-03-07 13:06:26.328182
59	34	3	present	2025-03-07 13:15:12.071782
60	32	3	absent	2025-03-07 13:15:12.531718
61	33	3	absent	2025-03-07 13:15:12.531718
62	35	3	absent	2025-03-07 13:15:12.531718
63	36	3	absent	2025-03-07 13:15:12.531718
64	37	3	absent	2025-03-07 13:15:12.531718
65	38	3	absent	2025-03-07 13:15:12.531718
66	39	3	absent	2025-03-07 13:15:12.531718
67	40	3	absent	2025-03-07 13:15:12.531718
68	41	3	absent	2025-03-07 13:15:12.531718
69	42	3	absent	2025-03-07 13:15:12.531718
71	29	3	absent	2025-03-07 13:15:12.531718
72	30	3	absent	2025-03-07 13:15:12.531718
73	31	3	absent	2025-03-07 13:15:12.531718
130	34	4	present	2025-03-07 15:45:14.176175
131	32	4	absent	2025-03-07 15:45:21.017436
132	33	4	absent	2025-03-07 15:45:21.017436
133	35	4	absent	2025-03-07 15:45:21.017436
134	36	4	absent	2025-03-07 15:45:21.017436
135	37	4	absent	2025-03-07 15:45:21.017436
136	38	4	absent	2025-03-07 15:45:21.017436
137	39	4	absent	2025-03-07 15:45:21.017436
138	40	4	absent	2025-03-07 15:45:21.017436
139	41	4	absent	2025-03-07 15:45:21.017436
140	42	4	absent	2025-03-07 15:45:21.017436
141	29	4	absent	2025-03-07 15:45:21.017436
142	30	4	absent	2025-03-07 15:45:21.017436
143	31	4	absent	2025-03-07 15:45:21.017436
144	34	5	present	2025-03-07 16:32:34.464918
145	32	5	absent	2025-03-07 16:32:47.200426
146	33	5	absent	2025-03-07 16:32:47.200426
147	35	5	absent	2025-03-07 16:32:47.200426
148	36	5	absent	2025-03-07 16:32:47.200426
149	37	5	absent	2025-03-07 16:32:47.200426
150	38	5	absent	2025-03-07 16:32:47.200426
151	39	5	absent	2025-03-07 16:32:47.200426
152	40	5	absent	2025-03-07 16:32:47.200426
153	41	5	absent	2025-03-07 16:32:47.200426
154	42	5	absent	2025-03-07 16:32:47.200426
155	29	5	absent	2025-03-07 16:32:47.200426
156	30	5	absent	2025-03-07 16:32:47.200426
157	31	5	absent	2025-03-07 16:32:47.200426
184	34	6	present	2025-03-07 16:39:49.091179
185	32	6	absent	2025-03-07 16:39:49.623025
186	33	6	absent	2025-03-07 16:39:49.623025
187	35	6	absent	2025-03-07 16:39:49.623025
188	36	6	absent	2025-03-07 16:39:49.623025
189	37	6	absent	2025-03-07 16:39:49.623025
190	38	6	absent	2025-03-07 16:39:49.623025
191	39	6	absent	2025-03-07 16:39:49.623025
192	40	6	absent	2025-03-07 16:39:49.623025
193	41	6	absent	2025-03-07 16:39:49.623025
194	42	6	absent	2025-03-07 16:39:49.623025
195	29	6	absent	2025-03-07 16:39:49.623025
196	30	6	absent	2025-03-07 16:39:49.623025
197	31	6	absent	2025-03-07 16:39:49.623025
\.


--
-- Data for Name: class_periods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class_periods (period_id, course_id, period_date, start_time, duration) FROM stdin;
1	9	2025-03-07	11:30:00	90
3	2	2025-03-07	13:13:00	90
2	6	2025-03-07	12:10:00	90
4	4	2025-03-07	15:35:00	80
5	7	2025-03-07	16:28:00	50
6	1	2025-03-07	16:39:00	50
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_name, course_code) FROM stdin;
1	Introduction to Computer Science	CS101
2	Calculus I	MATH201
3	English Literature	ENG301
4	General Physics	PHYS101
5	World History	HIST201
6	Organic Chemistry	CHEM301
7	Database Systems	CS303
8	Linear Algebra	MATH250
9	Maths	MAT101
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, first_name, last_name, rollno, middle_name) FROM stdin;
29	Alisha	Something	770301	\N
30	Arbin	Thaku	770302	\N
31	Ankit	Rawal	770303	\N
32	Asmita	Shrestha	770307	\N
33	Creation	Pradhan	770309	\N
34	Gyan	Dahal	770312	Hari
35	Janak	Joshi	770313	\N
36	Jenisha	Shrestha	770315	\N
37	Krishna	Shrestha	770317	\N
38	Kritima	Shrestha	770318	\N
39	Piyush	Gwayamaru	770329	\N
40	Sarif	Tachamo	770334	\N
41	Saragam	Adhikari	770336	\N
42	Yubaraj	Poduel	770348	\N
\.


--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attendance_attendance_id_seq', 197, true);


--
-- Name: class_periods_period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_periods_period_id_seq', 6, true);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 9, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 43, true);


--
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (attendance_id);


--
-- Name: class_periods class_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_periods
    ADD CONSTRAINT class_periods_pkey PRIMARY KEY (period_id);


--
-- Name: courses courses_course_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_course_code_key UNIQUE (course_code);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: students students_enrollment_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_enrollment_number_key UNIQUE (rollno);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: attendance unique_student_period; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT unique_student_period UNIQUE (student_id, period_id);


--
-- Name: idx_attendance_student_period; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_attendance_student_period ON public.attendance USING btree (student_id, period_id);


--
-- Name: idx_class_periods_date_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_class_periods_date_time ON public.class_periods USING btree (period_date, start_time);


--
-- Name: idx_students_enrollment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_students_enrollment ON public.students USING btree (rollno);


--
-- Name: attendance attendance_period_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_period_id_fkey FOREIGN KEY (period_id) REFERENCES public.class_periods(period_id);


--
-- Name: attendance attendance_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id) ON DELETE CASCADE;


--
-- Name: class_periods class_periods_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_periods
    ADD CONSTRAINT class_periods_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- PostgreSQL database dump complete
--

