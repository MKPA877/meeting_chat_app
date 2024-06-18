--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: app_centresdinteret; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.app_centresdinteret (
    id bigint NOT NULL,
    sport boolean NOT NULL,
    musique boolean NOT NULL,
    lecture boolean NOT NULL,
    voyage boolean NOT NULL,
    cinema boolean NOT NULL,
    technologie boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.app_centresdinteret OWNER TO myuser;

--
-- Name: app_centresdinteret_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.app_centresdinteret ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.app_centresdinteret_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: app_connection; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.app_connection (
    id bigint NOT NULL,
    accepted boolean NOT NULL,
    updated timestamp with time zone NOT NULL,
    created timestamp with time zone NOT NULL,
    receiver_id bigint NOT NULL,
    sender_id bigint NOT NULL
);


ALTER TABLE public.app_connection OWNER TO myuser;

--
-- Name: app_connection_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.app_connection ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.app_connection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: app_friendship; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.app_friendship (
    id bigint NOT NULL,
    common_percentage double precision NOT NULL,
    user1_id bigint NOT NULL,
    user2_id bigint NOT NULL
);


ALTER TABLE public.app_friendship OWNER TO myuser;

--
-- Name: app_friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.app_friendship ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.app_friendship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: app_message; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.app_message (
    id bigint NOT NULL,
    text text,
    image character varying(100),
    video character varying(100),
    document character varying(100),
    audio character varying(100),
    date_envoi timestamp with time zone NOT NULL,
    connection_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.app_message OWNER TO myuser;

--
-- Name: app_message_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.app_message ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.app_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: app_privatechat; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.app_privatechat (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    connection_id bigint
);


ALTER TABLE public.app_privatechat OWNER TO myuser;

--
-- Name: app_privatechat_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.app_privatechat ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.app_privatechat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: app_user; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.app_user (
    id bigint NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    gender character varying(1) NOT NULL,
    date_of_birth date,
    place_of_birth character varying(100) NOT NULL,
    bio text,
    email character varying(254) NOT NULL,
    password character varying(128) NOT NULL,
    profile_picture character varying(100)
);


ALTER TABLE public.app_user OWNER TO myuser;

--
-- Name: app_user_groups; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.app_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.app_user_groups OWNER TO myuser;

--
-- Name: app_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.app_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.app_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.app_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.app_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: app_user_user_permissions; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.app_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.app_user_user_permissions OWNER TO myuser;

--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.app_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.app_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO myuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO myuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO myuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO myuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO myuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO myuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO myuser;

--
-- Name: app_centresdinteret app_centresdinteret_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_centresdinteret
    ADD CONSTRAINT app_centresdinteret_pkey PRIMARY KEY (id);


--
-- Name: app_centresdinteret app_centresdinteret_user_id_key; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_centresdinteret
    ADD CONSTRAINT app_centresdinteret_user_id_key UNIQUE (user_id);


--
-- Name: app_connection app_connection_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_connection
    ADD CONSTRAINT app_connection_pkey PRIMARY KEY (id);


--
-- Name: app_friendship app_friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_friendship
    ADD CONSTRAINT app_friendship_pkey PRIMARY KEY (id);


--
-- Name: app_message app_message_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_message
    ADD CONSTRAINT app_message_pkey PRIMARY KEY (id);


--
-- Name: app_privatechat app_privatechat_connection_id_key; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_privatechat
    ADD CONSTRAINT app_privatechat_connection_id_key UNIQUE (connection_id);


--
-- Name: app_privatechat app_privatechat_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_privatechat
    ADD CONSTRAINT app_privatechat_pkey PRIMARY KEY (id);


--
-- Name: app_user_groups app_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_pkey PRIMARY KEY (id);


--
-- Name: app_user_groups app_user_groups_user_id_group_id_73b8e940_uniq; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_user_id_group_id_73b8e940_uniq UNIQUE (user_id, group_id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: app_user_user_permissions app_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: app_user_user_permissions app_user_user_permissions_user_id_permission_id_7c8316ce_uniq; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_user_id_permission_id_7c8316ce_uniq UNIQUE (user_id, permission_id);


--
-- Name: app_user app_user_username_key; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: app_connection_receiver_id_ecc648fe; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX app_connection_receiver_id_ecc648fe ON public.app_connection USING btree (receiver_id);


--
-- Name: app_connection_sender_id_fdab2e22; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX app_connection_sender_id_fdab2e22 ON public.app_connection USING btree (sender_id);


--
-- Name: app_friendship_User1_id_7b5cea9d; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX "app_friendship_User1_id_7b5cea9d" ON public.app_friendship USING btree (user1_id);


--
-- Name: app_friendship_User2_id_5133f12f; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX "app_friendship_User2_id_5133f12f" ON public.app_friendship USING btree (user2_id);


--
-- Name: app_message_connection_id_f5ed32d1; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX app_message_connection_id_f5ed32d1 ON public.app_message USING btree (connection_id);


--
-- Name: app_message_user_id_5fd14692; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX app_message_user_id_5fd14692 ON public.app_message USING btree (user_id);


--
-- Name: app_user_groups_group_id_e774d92c; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX app_user_groups_group_id_e774d92c ON public.app_user_groups USING btree (group_id);


--
-- Name: app_user_groups_user_id_e6f878f6; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX app_user_groups_user_id_e6f878f6 ON public.app_user_groups USING btree (user_id);


--
-- Name: app_user_user_permissions_permission_id_4ef8e133; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX app_user_user_permissions_permission_id_4ef8e133 ON public.app_user_user_permissions USING btree (permission_id);


--
-- Name: app_user_user_permissions_user_id_24780b52; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX app_user_user_permissions_user_id_24780b52 ON public.app_user_user_permissions USING btree (user_id);


--
-- Name: app_user_username_9d6296ff_like; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX app_user_username_9d6296ff_like ON public.app_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: app_centresdinteret app_centresdinteret_user_id_7edd95b2_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_centresdinteret
    ADD CONSTRAINT app_centresdinteret_user_id_7edd95b2_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_connection app_connection_receiver_id_ecc648fe_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_connection
    ADD CONSTRAINT app_connection_receiver_id_ecc648fe_fk_app_user_id FOREIGN KEY (receiver_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_connection app_connection_sender_id_fdab2e22_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_connection
    ADD CONSTRAINT app_connection_sender_id_fdab2e22_fk_app_user_id FOREIGN KEY (sender_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_friendship app_friendship_user1_id_4fc8a439_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_friendship
    ADD CONSTRAINT app_friendship_user1_id_4fc8a439_fk_app_user_id FOREIGN KEY (user1_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_friendship app_friendship_user2_id_38028bd5_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_friendship
    ADD CONSTRAINT app_friendship_user2_id_38028bd5_fk_app_user_id FOREIGN KEY (user2_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_message app_message_connection_id_f5ed32d1_fk_app_connection_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_message
    ADD CONSTRAINT app_message_connection_id_f5ed32d1_fk_app_connection_id FOREIGN KEY (connection_id) REFERENCES public.app_connection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_message app_message_user_id_5fd14692_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_message
    ADD CONSTRAINT app_message_user_id_5fd14692_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_privatechat app_privatechat_connection_id_b4ce0f85_fk_app_connection_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_privatechat
    ADD CONSTRAINT app_privatechat_connection_id_b4ce0f85_fk_app_connection_id FOREIGN KEY (connection_id) REFERENCES public.app_connection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_groups app_user_groups_group_id_e774d92c_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_group_id_e774d92c_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_groups app_user_groups_user_id_e6f878f6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_user_id_e6f878f6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_user_permissions app_user_user_permis_permission_id_4ef8e133_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permis_permission_id_4ef8e133_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_user_permissions app_user_user_permissions_user_id_24780b52_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_user_id_24780b52_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

