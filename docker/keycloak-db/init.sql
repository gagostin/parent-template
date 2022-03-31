--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO "keycloak-admin";

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO "keycloak-admin";

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO "keycloak-admin";

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO "keycloak-admin";

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO "keycloak-admin";

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO "keycloak-admin";

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO "keycloak-admin";

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO "keycloak-admin";

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO "keycloak-admin";

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO "keycloak-admin";

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO "keycloak-admin";

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO "keycloak-admin";

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO "keycloak-admin";

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO "keycloak-admin";

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO "keycloak-admin";

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO "keycloak-admin";

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO "keycloak-admin";

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO "keycloak-admin";

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO "keycloak-admin";

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO "keycloak-admin";

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO "keycloak-admin";

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO "keycloak-admin";

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO "keycloak-admin";

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO "keycloak-admin";

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO "keycloak-admin";

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO "keycloak-admin";

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO "keycloak-admin";

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO "keycloak-admin";

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO "keycloak-admin";

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO "keycloak-admin";

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO "keycloak-admin";

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO "keycloak-admin";

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO "keycloak-admin";

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO "keycloak-admin";

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO "keycloak-admin";

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO "keycloak-admin";

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO "keycloak-admin";

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO "keycloak-admin";

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO "keycloak-admin";

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO "keycloak-admin";

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO "keycloak-admin";

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO "keycloak-admin";

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO "keycloak-admin";

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO "keycloak-admin";

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO "keycloak-admin";

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO "keycloak-admin";

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO "keycloak-admin";

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO "keycloak-admin";

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO "keycloak-admin";

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO "keycloak-admin";

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO "keycloak-admin";

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO "keycloak-admin";

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO "keycloak-admin";

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO "keycloak-admin";

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO "keycloak-admin";

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO "keycloak-admin";

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO "keycloak-admin";

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO "keycloak-admin";

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO "keycloak-admin";

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO "keycloak-admin";

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO "keycloak-admin";

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO "keycloak-admin";

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO "keycloak-admin";

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO "keycloak-admin";

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO "keycloak-admin";

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO "keycloak-admin";

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO "keycloak-admin";

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO "keycloak-admin";

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO "keycloak-admin";

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO "keycloak-admin";

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO "keycloak-admin";

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO "keycloak-admin";

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO "keycloak-admin";

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO "keycloak-admin";

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO "keycloak-admin";

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO "keycloak-admin";

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO "keycloak-admin";

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO "keycloak-admin";

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO "keycloak-admin";

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO "keycloak-admin";

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO "keycloak-admin";

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO "keycloak-admin";

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO "keycloak-admin";

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO "keycloak-admin";

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO "keycloak-admin";

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO "keycloak-admin";

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO "keycloak-admin";

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO "keycloak-admin";

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO "keycloak-admin";

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO "keycloak-admin";

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO "keycloak-admin";

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak-admin
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO "keycloak-admin";

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.associated_policy VALUES ('e1ec6296-0120-482d-abbd-5d5f25c19f2a', '708b76cc-7be5-4364-bb48-bbe8ec696690');


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.authentication_execution VALUES ('64e1b7df-d24e-42bc-ae51-19dd95a65434', NULL, 'auth-cookie', 'master', '58e94817-50de-44f5-9448-cdf8dd84cecd', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('883d05ce-76c1-4d26-9c1e-40ab14fed701', NULL, 'auth-spnego', 'master', '58e94817-50de-44f5-9448-cdf8dd84cecd', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('eeabe87a-0081-4550-85db-ffceddbff2f7', NULL, 'identity-provider-redirector', 'master', '58e94817-50de-44f5-9448-cdf8dd84cecd', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a3af85c9-8ae8-49a3-9760-764e972cdc45', NULL, NULL, 'master', '58e94817-50de-44f5-9448-cdf8dd84cecd', 2, 30, true, '6ed0209a-ef6e-415c-8200-59a136458cd1', NULL);
INSERT INTO public.authentication_execution VALUES ('ba751a58-14fc-475b-ad67-bc9ca3e645fb', NULL, 'auth-username-password-form', 'master', '6ed0209a-ef6e-415c-8200-59a136458cd1', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cef6fda3-9799-4d87-ab74-5ade50546416', NULL, NULL, 'master', '6ed0209a-ef6e-415c-8200-59a136458cd1', 1, 20, true, 'ef072333-9ef4-4f24-b822-1a0987149980', NULL);
INSERT INTO public.authentication_execution VALUES ('2966ce50-2e24-44dc-b0a3-b5d987bd5aa4', NULL, 'conditional-user-configured', 'master', 'ef072333-9ef4-4f24-b822-1a0987149980', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('25fc9f98-5e77-46db-a9d9-e6082e678e74', NULL, 'auth-otp-form', 'master', 'ef072333-9ef4-4f24-b822-1a0987149980', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('176fa0b3-dfc5-4395-b991-e9b92140560f', NULL, 'direct-grant-validate-username', 'master', '0669636e-19a4-424f-bb4b-8296055e79ca', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fca1c7f5-c23f-4d64-bd5e-481af55bcab8', NULL, 'direct-grant-validate-password', 'master', '0669636e-19a4-424f-bb4b-8296055e79ca', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('783c8ddc-f5bd-43ea-bd00-00c0849ba7d9', NULL, NULL, 'master', '0669636e-19a4-424f-bb4b-8296055e79ca', 1, 30, true, '34f6a510-add8-424d-a0d4-789e195b5132', NULL);
INSERT INTO public.authentication_execution VALUES ('52193b4c-c8c2-4161-926f-bfee45a0f75b', NULL, 'conditional-user-configured', 'master', '34f6a510-add8-424d-a0d4-789e195b5132', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9499dc0c-64a6-4b64-9d4d-711b9f42f000', NULL, 'direct-grant-validate-otp', 'master', '34f6a510-add8-424d-a0d4-789e195b5132', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b824efb2-4cb3-4ed5-bb0c-4e0cbf7f613f', NULL, 'registration-page-form', 'master', '57f7d0b2-e78a-43f2-a059-91e28916d384', 0, 10, true, '970f49f7-8f11-467b-a0d3-6e25ce3dd482', NULL);
INSERT INTO public.authentication_execution VALUES ('4810cf99-da8e-4254-98e6-7cb26d154292', NULL, 'registration-user-creation', 'master', '970f49f7-8f11-467b-a0d3-6e25ce3dd482', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('209edbbb-b996-4ca0-b73e-03c1a292ed56', NULL, 'registration-profile-action', 'master', '970f49f7-8f11-467b-a0d3-6e25ce3dd482', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cb3f5ca0-6634-458d-9d6d-5a77e4727e92', NULL, 'registration-password-action', 'master', '970f49f7-8f11-467b-a0d3-6e25ce3dd482', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('937e78dd-9e83-4446-942f-f86b7a67fcde', NULL, 'registration-recaptcha-action', 'master', '970f49f7-8f11-467b-a0d3-6e25ce3dd482', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f6c4c94f-b28a-4fee-ae1d-dae2d2396dad', NULL, 'reset-credentials-choose-user', 'master', 'fc675049-c9f2-43b1-83a3-eaf36435f11a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7e65b6ea-7aee-459b-a490-e7f14b7baf80', NULL, 'reset-credential-email', 'master', 'fc675049-c9f2-43b1-83a3-eaf36435f11a', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cd7620c0-40cf-401e-918c-49f65c6705d4', NULL, 'reset-password', 'master', 'fc675049-c9f2-43b1-83a3-eaf36435f11a', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7c0d1e0d-54e0-4660-9d01-035fae7ba972', NULL, NULL, 'master', 'fc675049-c9f2-43b1-83a3-eaf36435f11a', 1, 40, true, '2d2137cf-3e8f-4768-beac-f1c8f77cb21f', NULL);
INSERT INTO public.authentication_execution VALUES ('b162c97b-a82d-4840-97c2-e1b05cea45bf', NULL, 'conditional-user-configured', 'master', '2d2137cf-3e8f-4768-beac-f1c8f77cb21f', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('94f71483-d4cf-4472-97b3-f6c59fbeb092', NULL, 'reset-otp', 'master', '2d2137cf-3e8f-4768-beac-f1c8f77cb21f', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f303b1b7-25d5-4ed4-b9e9-ebb941fbca93', NULL, 'client-secret', 'master', 'af2f5fc2-f9ab-4f16-8835-4c630196bb0b', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0a5fe60e-bf02-441e-b3ed-bfbe8697a1b5', NULL, 'client-jwt', 'master', 'af2f5fc2-f9ab-4f16-8835-4c630196bb0b', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('64a23ae9-3ebd-4ddb-9d9b-c38034119020', NULL, 'client-secret-jwt', 'master', 'af2f5fc2-f9ab-4f16-8835-4c630196bb0b', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('648f1b04-0f70-435f-a818-7a4c1324983c', NULL, 'client-x509', 'master', 'af2f5fc2-f9ab-4f16-8835-4c630196bb0b', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('50c6dc0f-8266-4077-97f1-b15e73cd4b6f', NULL, 'idp-review-profile', 'master', '7a5ae0df-b7f2-42e6-b009-d31424562b04', 0, 10, false, NULL, 'a6964e36-dfcd-4105-9c11-6abca88ac1b2');
INSERT INTO public.authentication_execution VALUES ('72f3a071-888f-4eae-b836-344929ad0255', NULL, NULL, 'master', '7a5ae0df-b7f2-42e6-b009-d31424562b04', 0, 20, true, '195d2ed9-489e-432e-a940-f38c57b1d638', NULL);
INSERT INTO public.authentication_execution VALUES ('3690f464-c44f-42fd-bcf8-73b1f1400830', NULL, 'idp-create-user-if-unique', 'master', '195d2ed9-489e-432e-a940-f38c57b1d638', 2, 10, false, NULL, '363530ac-ddee-45f3-a94d-0ee4690ec0a7');
INSERT INTO public.authentication_execution VALUES ('386b9b8a-3547-480c-925c-6a03b74a3a91', NULL, NULL, 'master', '195d2ed9-489e-432e-a940-f38c57b1d638', 2, 20, true, '43552c24-f5cf-4a0b-8d8a-7465ed0ef727', NULL);
INSERT INTO public.authentication_execution VALUES ('5ad57a8b-7745-41ca-8fe7-18b2080edcb9', NULL, 'idp-confirm-link', 'master', '43552c24-f5cf-4a0b-8d8a-7465ed0ef727', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0e5213ca-eb9f-4bfd-a463-54dbb6db559a', NULL, NULL, 'master', '43552c24-f5cf-4a0b-8d8a-7465ed0ef727', 0, 20, true, '8799ec05-9d91-4d96-b793-72ea1d604537', NULL);
INSERT INTO public.authentication_execution VALUES ('cf00a44a-2180-4db0-9870-d0ffc436a741', NULL, 'idp-email-verification', 'master', '8799ec05-9d91-4d96-b793-72ea1d604537', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a140682c-3b11-4254-ae09-e0fd0d74aaf0', NULL, NULL, 'master', '8799ec05-9d91-4d96-b793-72ea1d604537', 2, 20, true, 'c2ff5b81-7f52-4d40-b38a-d71ce917ba02', NULL);
INSERT INTO public.authentication_execution VALUES ('16f08b7e-8511-4f2f-954d-9b70c252e6b4', NULL, 'idp-username-password-form', 'master', 'c2ff5b81-7f52-4d40-b38a-d71ce917ba02', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ac87eb39-d8b9-4400-a5df-0e18128bf72b', NULL, NULL, 'master', 'c2ff5b81-7f52-4d40-b38a-d71ce917ba02', 1, 20, true, '99be479b-adb6-4e47-b6b1-bc069a9f2576', NULL);
INSERT INTO public.authentication_execution VALUES ('1b4d2ad2-12cd-4dc9-b837-a0347254edc2', NULL, 'conditional-user-configured', 'master', '99be479b-adb6-4e47-b6b1-bc069a9f2576', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('88081cb4-94ce-4447-a2b3-044f3fdd446b', NULL, 'auth-otp-form', 'master', '99be479b-adb6-4e47-b6b1-bc069a9f2576', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bd97fa44-37d6-4330-b185-f88154bd88b9', NULL, 'http-basic-authenticator', 'master', '7b12add2-362b-4082-8785-256a65797e77', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b6bde17d-f339-417f-9b09-03be044dd335', NULL, 'docker-http-basic-authenticator', 'master', '1911a259-1a0b-472a-9a03-f50bd524e111', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ac08b6cc-96e4-466d-a211-fb504a6ccba9', NULL, 'no-cookie-redirect', 'master', '9272faa3-788d-4b6c-a608-ebfb3a9de79b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('49f13a2d-9eb7-4fd3-89aa-977d526be7d1', NULL, NULL, 'master', '9272faa3-788d-4b6c-a608-ebfb3a9de79b', 0, 20, true, 'de546ff2-0f15-4c27-a2a3-cda991912edb', NULL);
INSERT INTO public.authentication_execution VALUES ('e90d64ee-eff5-4f39-bef0-d4685527289c', NULL, 'basic-auth', 'master', 'de546ff2-0f15-4c27-a2a3-cda991912edb', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('202d6556-5951-4c64-bab4-4b487bd5cba6', NULL, 'basic-auth-otp', 'master', 'de546ff2-0f15-4c27-a2a3-cda991912edb', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a785300f-c6d2-4c65-ab22-225160c9286e', NULL, 'auth-spnego', 'master', 'de546ff2-0f15-4c27-a2a3-cda991912edb', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d32bfc86-ac22-408c-93aa-f54b948dbbae', NULL, 'auth-cookie', 'parent-template', '82364aa2-40d8-4f92-8309-a5958ab8dac3', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a655ae01-3b02-4fad-bfb4-7db1f786455a', NULL, 'auth-spnego', 'parent-template', '82364aa2-40d8-4f92-8309-a5958ab8dac3', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e0a50562-5753-490e-99ce-41744e310340', NULL, 'identity-provider-redirector', 'parent-template', '82364aa2-40d8-4f92-8309-a5958ab8dac3', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d5bb83ea-1e7e-4084-93b8-c33ee8fa91a0', NULL, NULL, 'parent-template', '82364aa2-40d8-4f92-8309-a5958ab8dac3', 2, 30, true, '79423973-6c20-45b4-a052-a774f26de4be', NULL);
INSERT INTO public.authentication_execution VALUES ('d1807a74-b445-4a6b-8182-8d2fb0428fad', NULL, 'auth-username-password-form', 'parent-template', '79423973-6c20-45b4-a052-a774f26de4be', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('444423b3-859e-48f3-ae35-49bc63dd1e2b', NULL, NULL, 'parent-template', '79423973-6c20-45b4-a052-a774f26de4be', 1, 20, true, '381a44d4-643e-4000-9722-5a823cca4428', NULL);
INSERT INTO public.authentication_execution VALUES ('2679365e-a6e9-4ba8-91c4-a4995e3485c8', NULL, 'conditional-user-configured', 'parent-template', '381a44d4-643e-4000-9722-5a823cca4428', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bcf9892c-9780-4a23-9ce1-4faedf3a9bbd', NULL, 'auth-otp-form', 'parent-template', '381a44d4-643e-4000-9722-5a823cca4428', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0bf449a3-6aa4-4222-b439-aa232bcf6918', NULL, 'direct-grant-validate-username', 'parent-template', '2fcc99e3-cddb-491d-9e65-20a1dff91bbf', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1f164371-bbf6-414d-abf0-ac87d218f483', NULL, 'direct-grant-validate-password', 'parent-template', '2fcc99e3-cddb-491d-9e65-20a1dff91bbf', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('84f894e9-451a-4394-8bcc-e1854bd28c3a', NULL, NULL, 'parent-template', '2fcc99e3-cddb-491d-9e65-20a1dff91bbf', 1, 30, true, 'd511ffb3-a32f-4a33-b5e7-3b45136267f6', NULL);
INSERT INTO public.authentication_execution VALUES ('ed799b01-f7a5-49ee-a447-2012be603ad8', NULL, 'conditional-user-configured', 'parent-template', 'd511ffb3-a32f-4a33-b5e7-3b45136267f6', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('40b7b45e-5003-44e6-aef2-0043439ae01b', NULL, 'direct-grant-validate-otp', 'parent-template', 'd511ffb3-a32f-4a33-b5e7-3b45136267f6', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ea3d91eb-4117-47ad-9285-0a345b9b7d0f', NULL, 'registration-page-form', 'parent-template', '837430a4-78ca-44eb-95d3-8147a395d0eb', 0, 10, true, '5c316e60-f771-4617-b02a-2d4f807f730d', NULL);
INSERT INTO public.authentication_execution VALUES ('1889c485-5f82-404c-9076-52637b853043', NULL, 'registration-user-creation', 'parent-template', '5c316e60-f771-4617-b02a-2d4f807f730d', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('210222fa-b1e6-45c4-a445-3c8d0ee98633', NULL, 'registration-profile-action', 'parent-template', '5c316e60-f771-4617-b02a-2d4f807f730d', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('15558cfa-8578-4429-a9aa-822b26af408b', NULL, 'registration-password-action', 'parent-template', '5c316e60-f771-4617-b02a-2d4f807f730d', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a11046da-d2a3-4a44-8244-6ff1552ecd4d', NULL, 'registration-recaptcha-action', 'parent-template', '5c316e60-f771-4617-b02a-2d4f807f730d', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e2942600-e77d-4447-92a9-901fc67077a4', NULL, 'reset-credentials-choose-user', 'parent-template', '7f4a07d7-e2c0-49dd-9f1c-ebae0a3f89a2', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6d2f7e51-e397-4491-9579-c7d0968cad4c', NULL, 'reset-credential-email', 'parent-template', '7f4a07d7-e2c0-49dd-9f1c-ebae0a3f89a2', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('74c3b39e-db9d-42c7-9080-44b95c90bb50', NULL, 'reset-password', 'parent-template', '7f4a07d7-e2c0-49dd-9f1c-ebae0a3f89a2', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c0151fd4-474f-4dad-bc38-38ca624edac7', NULL, NULL, 'parent-template', '7f4a07d7-e2c0-49dd-9f1c-ebae0a3f89a2', 1, 40, true, 'e7c0e7cd-00fe-4962-9a03-6e3eafc57e6c', NULL);
INSERT INTO public.authentication_execution VALUES ('fca76396-23db-4bf0-9b69-9d3da4468672', NULL, 'conditional-user-configured', 'parent-template', 'e7c0e7cd-00fe-4962-9a03-6e3eafc57e6c', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('961c5f58-0a69-4b35-86fd-597390814e6e', NULL, 'reset-otp', 'parent-template', 'e7c0e7cd-00fe-4962-9a03-6e3eafc57e6c', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f2e2cf46-82b0-4e9d-8d54-0d7c18407323', NULL, 'client-secret', 'parent-template', 'cc3959aa-9008-46cd-ac52-63b38ae2cbdf', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('58071981-2c16-4c74-8cf3-fb31369e0fbe', NULL, 'client-jwt', 'parent-template', 'cc3959aa-9008-46cd-ac52-63b38ae2cbdf', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4944b8c0-4647-4b87-91c6-f3f14cd6ff46', NULL, 'client-secret-jwt', 'parent-template', 'cc3959aa-9008-46cd-ac52-63b38ae2cbdf', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e59884b9-79ea-4f70-848c-2be751fe176e', NULL, 'client-x509', 'parent-template', 'cc3959aa-9008-46cd-ac52-63b38ae2cbdf', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('763be666-a2c7-4a5c-a682-04a83157a456', NULL, 'idp-review-profile', 'parent-template', 'c2a41200-9cd7-4696-b15d-b59ee58f240d', 0, 10, false, NULL, '00294e87-d233-4e9b-ad2d-f867d9de8b39');
INSERT INTO public.authentication_execution VALUES ('c1a0b777-c604-428a-add4-104624d863f3', NULL, NULL, 'parent-template', 'c2a41200-9cd7-4696-b15d-b59ee58f240d', 0, 20, true, '222a8b1a-5f7c-46e6-ac2c-64c5fd9c8395', NULL);
INSERT INTO public.authentication_execution VALUES ('741b522f-114a-4899-bfa5-d89d569654cf', NULL, 'idp-create-user-if-unique', 'parent-template', '222a8b1a-5f7c-46e6-ac2c-64c5fd9c8395', 2, 10, false, NULL, 'a2e74fff-b865-43f8-8881-9b1490fd66ee');
INSERT INTO public.authentication_execution VALUES ('749baf5b-49e9-4830-a333-09506ff16f66', NULL, NULL, 'parent-template', '222a8b1a-5f7c-46e6-ac2c-64c5fd9c8395', 2, 20, true, '5781bf26-1447-4e01-ad60-c9159eadb1b3', NULL);
INSERT INTO public.authentication_execution VALUES ('9123d974-b1dd-4660-a6a0-330763af9685', NULL, 'idp-confirm-link', 'parent-template', '5781bf26-1447-4e01-ad60-c9159eadb1b3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cc03d295-1487-406e-a98f-cffc64f8a470', NULL, NULL, 'parent-template', '5781bf26-1447-4e01-ad60-c9159eadb1b3', 0, 20, true, '2d2c2825-bb67-40d1-be48-435d40f5c5b6', NULL);
INSERT INTO public.authentication_execution VALUES ('23955181-c70d-4794-8b25-ee8f0186fa1a', NULL, 'idp-email-verification', 'parent-template', '2d2c2825-bb67-40d1-be48-435d40f5c5b6', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6b162b3e-91e7-418b-9043-3a9d12759795', NULL, NULL, 'parent-template', '2d2c2825-bb67-40d1-be48-435d40f5c5b6', 2, 20, true, 'e36145c8-a258-47ee-907c-0154ba19bfdb', NULL);
INSERT INTO public.authentication_execution VALUES ('350d2704-94ba-4463-a750-461aefd415d0', NULL, 'idp-username-password-form', 'parent-template', 'e36145c8-a258-47ee-907c-0154ba19bfdb', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3a5d096d-7cfe-4ae1-b5d2-54cd34d57346', NULL, NULL, 'parent-template', 'e36145c8-a258-47ee-907c-0154ba19bfdb', 1, 20, true, 'f3203b35-141c-480a-86d2-711b6032028a', NULL);
INSERT INTO public.authentication_execution VALUES ('a1208643-750a-465c-a318-c7aa9df9443a', NULL, 'conditional-user-configured', 'parent-template', 'f3203b35-141c-480a-86d2-711b6032028a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a621bb21-af06-4e28-9d99-f7d0474994a5', NULL, 'auth-otp-form', 'parent-template', 'f3203b35-141c-480a-86d2-711b6032028a', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('37a1a510-4f52-4198-a320-42609554cf71', NULL, 'http-basic-authenticator', 'parent-template', '3a4cc3b0-7c22-42d3-a81f-ab4c51de93c8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6f454c45-ed60-4a3d-8cbf-8be6d51ba00e', NULL, 'docker-http-basic-authenticator', 'parent-template', '1dbe2914-ca96-4da0-9529-e0c04dedc573', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5e8f78ae-4aca-40ea-91b0-e2b414a6c8a2', NULL, 'no-cookie-redirect', 'parent-template', '44dddc07-086a-4760-8fe5-28cee1a8e53d', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('82883856-9808-4185-a6d2-42dbc148a511', NULL, NULL, 'parent-template', '44dddc07-086a-4760-8fe5-28cee1a8e53d', 0, 20, true, '2328fe06-0fdf-4f48-a309-798cf7225b22', NULL);
INSERT INTO public.authentication_execution VALUES ('c7a5bf6f-c92f-4ca4-bc74-21f48b47b7ad', NULL, 'basic-auth', 'parent-template', '2328fe06-0fdf-4f48-a309-798cf7225b22', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('18bded90-671b-4a6a-86ef-fd1c9448b868', NULL, 'basic-auth-otp', 'parent-template', '2328fe06-0fdf-4f48-a309-798cf7225b22', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b9d71f8e-89ee-45eb-9c92-b9c43d772467', NULL, 'auth-spnego', 'parent-template', '2328fe06-0fdf-4f48-a309-798cf7225b22', 3, 30, false, NULL, NULL);


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.authentication_flow VALUES ('58e94817-50de-44f5-9448-cdf8dd84cecd', 'browser', 'browser based authentication', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('6ed0209a-ef6e-415c-8200-59a136458cd1', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('ef072333-9ef4-4f24-b822-1a0987149980', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('0669636e-19a4-424f-bb4b-8296055e79ca', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('34f6a510-add8-424d-a0d4-789e195b5132', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('57f7d0b2-e78a-43f2-a059-91e28916d384', 'registration', 'registration flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('970f49f7-8f11-467b-a0d3-6e25ce3dd482', 'registration form', 'registration form', 'master', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('fc675049-c9f2-43b1-83a3-eaf36435f11a', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('2d2137cf-3e8f-4768-beac-f1c8f77cb21f', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('af2f5fc2-f9ab-4f16-8835-4c630196bb0b', 'clients', 'Base authentication for clients', 'master', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('7a5ae0df-b7f2-42e6-b009-d31424562b04', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('195d2ed9-489e-432e-a940-f38c57b1d638', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('43552c24-f5cf-4a0b-8d8a-7465ed0ef727', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('8799ec05-9d91-4d96-b793-72ea1d604537', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('c2ff5b81-7f52-4d40-b38a-d71ce917ba02', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('99be479b-adb6-4e47-b6b1-bc069a9f2576', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('7b12add2-362b-4082-8785-256a65797e77', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('1911a259-1a0b-472a-9a03-f50bd524e111', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('9272faa3-788d-4b6c-a608-ebfb3a9de79b', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('de546ff2-0f15-4c27-a2a3-cda991912edb', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('82364aa2-40d8-4f92-8309-a5958ab8dac3', 'browser', 'browser based authentication', 'parent-template', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('79423973-6c20-45b4-a052-a774f26de4be', 'forms', 'Username, password, otp and other auth forms.', 'parent-template', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('381a44d4-643e-4000-9722-5a823cca4428', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'parent-template', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('2fcc99e3-cddb-491d-9e65-20a1dff91bbf', 'direct grant', 'OpenID Connect Resource Owner Grant', 'parent-template', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('d511ffb3-a32f-4a33-b5e7-3b45136267f6', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'parent-template', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('837430a4-78ca-44eb-95d3-8147a395d0eb', 'registration', 'registration flow', 'parent-template', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('5c316e60-f771-4617-b02a-2d4f807f730d', 'registration form', 'registration form', 'parent-template', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('7f4a07d7-e2c0-49dd-9f1c-ebae0a3f89a2', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'parent-template', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('e7c0e7cd-00fe-4962-9a03-6e3eafc57e6c', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'parent-template', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('cc3959aa-9008-46cd-ac52-63b38ae2cbdf', 'clients', 'Base authentication for clients', 'parent-template', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('c2a41200-9cd7-4696-b15d-b59ee58f240d', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'parent-template', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('222a8b1a-5f7c-46e6-ac2c-64c5fd9c8395', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'parent-template', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('5781bf26-1447-4e01-ad60-c9159eadb1b3', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'parent-template', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('2d2c2825-bb67-40d1-be48-435d40f5c5b6', 'Account verification options', 'Method with which to verity the existing account', 'parent-template', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('e36145c8-a258-47ee-907c-0154ba19bfdb', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'parent-template', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('f3203b35-141c-480a-86d2-711b6032028a', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'parent-template', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('3a4cc3b0-7c22-42d3-a81f-ab4c51de93c8', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'parent-template', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('1dbe2914-ca96-4da0-9529-e0c04dedc573', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'parent-template', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('44dddc07-086a-4760-8fe5-28cee1a8e53d', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'parent-template', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('2328fe06-0fdf-4f48-a309-798cf7225b22', 'Authentication Options', 'Authentication options.', 'parent-template', 'basic-flow', false, true);


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.authenticator_config VALUES ('a6964e36-dfcd-4105-9c11-6abca88ac1b2', 'review profile config', 'master');
INSERT INTO public.authenticator_config VALUES ('363530ac-ddee-45f3-a94d-0ee4690ec0a7', 'create unique user config', 'master');
INSERT INTO public.authenticator_config VALUES ('00294e87-d233-4e9b-ad2d-f867d9de8b39', 'review profile config', 'parent-template');
INSERT INTO public.authenticator_config VALUES ('a2e74fff-b865-43f8-8881-9b1490fd66ee', 'create unique user config', 'parent-template');


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.authenticator_config_entry VALUES ('a6964e36-dfcd-4105-9c11-6abca88ac1b2', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('363530ac-ddee-45f3-a94d-0ee4690ec0a7', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('00294e87-d233-4e9b-ad2d-f867d9de8b39', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('a2e74fff-b865-43f8-8881-9b1490fd66ee', 'false', 'require.password.update.after.registration');


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client VALUES ('7af949cd-12c7-4505-9df1-b1f682a178c9', true, false, 'master-realm', 0, false, NULL, NULL, true, NULL, false, 'master', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', true, false, 'account', 0, true, NULL, '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', true, false, 'account-console', 0, true, NULL, '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('43ac882b-a9c0-4e8a-8851-3d3419ed570e', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', true, false, 'security-admin-console', 0, true, NULL, '/admin/master/console/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('b46dc46b-9d7b-4a81-9339-4459b3db0ba5', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, false, 'parent-template-realm', 0, false, NULL, NULL, true, NULL, false, 'master', NULL, 0, false, false, 'parent-template Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('f53779a4-0976-4de3-815f-117b48bb478a', true, false, 'realm-management', 0, false, NULL, NULL, true, NULL, false, 'parent-template', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', true, false, 'account', 0, true, NULL, '/realms/parent-template/account/', false, NULL, false, 'parent-template', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', true, false, 'account-console', 0, true, NULL, '/realms/parent-template/account/', false, NULL, false, 'parent-template', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('87064351-10df-4638-84d9-b242f925af79', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, 'parent-template', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', true, false, 'security-admin-console', 0, true, NULL, '/admin/parent-template/console/', false, NULL, false, 'parent-template', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('aa0f44d1-ab03-483f-b490-1beb8c6364be', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, 'parent-template', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', true, true, 'parent-template-login-app', 0, false, 'NgRUBwhLhqgSMHnQGmYyH7Y74nMLBsRZ', NULL, false, NULL, false, 'parent-template', 'openid-connect', -1, false, false, 'Parent Template Login App', true, 'client-secret', '', NULL, NULL, true, false, true, false);


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client_attributes VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'true', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'backchannel.logout.revoke.offline.tokens');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.artifact.binding');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'oauth2.device.authorization.grant.enabled');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'oidc.ciba.grant.enabled');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'true', 'use.refresh.tokens');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'id.token.as.detached.signature');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'require.pushed.authorization.requests');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'false', 'display.on.consent.screen');


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client_scope VALUES ('5913a083-f959-47f0-a65b-534b7a367725', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('acada3e9-a709-4ae5-9691-22fa1b461109', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('18548663-faf3-454b-947c-b3a4977e928a', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('9c214c87-006f-440c-a187-1b2687dd649c', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('a2875101-8e27-4043-995a-440e76bd68fb', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('92bacdbc-fee2-4c02-b310-7419899e7fdd', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('e39a226a-ac5d-4414-914e-0d0f7c2f0753', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('f40652a1-ba66-4c66-8ce2-b7f49044dd7b', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('d83e96fb-9b7d-4a56-bc3e-d5a30665adf1', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('8418a2a8-ce3f-413c-abfe-993e120485c2', 'offline_access', 'parent-template', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('117033eb-def4-4b04-a08b-780a0301b81c', 'role_list', 'parent-template', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('f318802c-fe18-464b-9ede-3afeea29ca8a', 'profile', 'parent-template', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', 'email', 'parent-template', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('c731bf75-5798-4a55-b13a-8204dc0237e3', 'address', 'parent-template', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', 'phone', 'parent-template', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('1f046dd2-6c70-4dd1-aa95-68059d84dcf3', 'roles', 'parent-template', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('696124a2-cd43-47c2-8c67-3907af107470', 'web-origins', 'parent-template', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('1db64da0-add0-41ee-aa19-182e59293840', 'microprofile-jwt', 'parent-template', 'Microprofile - JWT built-in scope', 'openid-connect');


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client_scope_attributes VALUES ('5913a083-f959-47f0-a65b-534b7a367725', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('5913a083-f959-47f0-a65b-534b7a367725', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('acada3e9-a709-4ae5-9691-22fa1b461109', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('acada3e9-a709-4ae5-9691-22fa1b461109', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('18548663-faf3-454b-947c-b3a4977e928a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('18548663-faf3-454b-947c-b3a4977e928a', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('18548663-faf3-454b-947c-b3a4977e928a', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('9c214c87-006f-440c-a187-1b2687dd649c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('9c214c87-006f-440c-a187-1b2687dd649c', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('9c214c87-006f-440c-a187-1b2687dd649c', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('a2875101-8e27-4043-995a-440e76bd68fb', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('a2875101-8e27-4043-995a-440e76bd68fb', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('a2875101-8e27-4043-995a-440e76bd68fb', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('92bacdbc-fee2-4c02-b310-7419899e7fdd', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('92bacdbc-fee2-4c02-b310-7419899e7fdd', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('92bacdbc-fee2-4c02-b310-7419899e7fdd', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('e39a226a-ac5d-4414-914e-0d0f7c2f0753', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('e39a226a-ac5d-4414-914e-0d0f7c2f0753', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('e39a226a-ac5d-4414-914e-0d0f7c2f0753', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('f40652a1-ba66-4c66-8ce2-b7f49044dd7b', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('f40652a1-ba66-4c66-8ce2-b7f49044dd7b', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('f40652a1-ba66-4c66-8ce2-b7f49044dd7b', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('d83e96fb-9b7d-4a56-bc3e-d5a30665adf1', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('d83e96fb-9b7d-4a56-bc3e-d5a30665adf1', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('8418a2a8-ce3f-413c-abfe-993e120485c2', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('8418a2a8-ce3f-413c-abfe-993e120485c2', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('117033eb-def4-4b04-a08b-780a0301b81c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('117033eb-def4-4b04-a08b-780a0301b81c', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('f318802c-fe18-464b-9ede-3afeea29ca8a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('f318802c-fe18-464b-9ede-3afeea29ca8a', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('f318802c-fe18-464b-9ede-3afeea29ca8a', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('c731bf75-5798-4a55-b13a-8204dc0237e3', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('c731bf75-5798-4a55-b13a-8204dc0237e3', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('c731bf75-5798-4a55-b13a-8204dc0237e3', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('1f046dd2-6c70-4dd1-aa95-68059d84dcf3', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('1f046dd2-6c70-4dd1-aa95-68059d84dcf3', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('1f046dd2-6c70-4dd1-aa95-68059d84dcf3', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('696124a2-cd43-47c2-8c67-3907af107470', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('696124a2-cd43-47c2-8c67-3907af107470', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('696124a2-cd43-47c2-8c67-3907af107470', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('1db64da0-add0-41ee-aa19-182e59293840', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('1db64da0-add0-41ee-aa19-182e59293840', 'true', 'include.in.token.scope');


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client_scope_client VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', '18548663-faf3-454b-947c-b3a4977e928a', true);
INSERT INTO public.client_scope_client VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', 'f40652a1-ba66-4c66-8ce2-b7f49044dd7b', true);
INSERT INTO public.client_scope_client VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', '9c214c87-006f-440c-a187-1b2687dd649c', true);
INSERT INTO public.client_scope_client VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', 'e39a226a-ac5d-4414-914e-0d0f7c2f0753', true);
INSERT INTO public.client_scope_client VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', 'a2875101-8e27-4043-995a-440e76bd68fb', false);
INSERT INTO public.client_scope_client VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', '5913a083-f959-47f0-a65b-534b7a367725', false);
INSERT INTO public.client_scope_client VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', '92bacdbc-fee2-4c02-b310-7419899e7fdd', false);
INSERT INTO public.client_scope_client VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', 'd83e96fb-9b7d-4a56-bc3e-d5a30665adf1', false);
INSERT INTO public.client_scope_client VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', '18548663-faf3-454b-947c-b3a4977e928a', true);
INSERT INTO public.client_scope_client VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', 'f40652a1-ba66-4c66-8ce2-b7f49044dd7b', true);
INSERT INTO public.client_scope_client VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', '9c214c87-006f-440c-a187-1b2687dd649c', true);
INSERT INTO public.client_scope_client VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', 'e39a226a-ac5d-4414-914e-0d0f7c2f0753', true);
INSERT INTO public.client_scope_client VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', 'a2875101-8e27-4043-995a-440e76bd68fb', false);
INSERT INTO public.client_scope_client VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', '5913a083-f959-47f0-a65b-534b7a367725', false);
INSERT INTO public.client_scope_client VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', '92bacdbc-fee2-4c02-b310-7419899e7fdd', false);
INSERT INTO public.client_scope_client VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', 'd83e96fb-9b7d-4a56-bc3e-d5a30665adf1', false);
INSERT INTO public.client_scope_client VALUES ('b46dc46b-9d7b-4a81-9339-4459b3db0ba5', '18548663-faf3-454b-947c-b3a4977e928a', true);
INSERT INTO public.client_scope_client VALUES ('b46dc46b-9d7b-4a81-9339-4459b3db0ba5', 'f40652a1-ba66-4c66-8ce2-b7f49044dd7b', true);
INSERT INTO public.client_scope_client VALUES ('b46dc46b-9d7b-4a81-9339-4459b3db0ba5', '9c214c87-006f-440c-a187-1b2687dd649c', true);
INSERT INTO public.client_scope_client VALUES ('b46dc46b-9d7b-4a81-9339-4459b3db0ba5', 'e39a226a-ac5d-4414-914e-0d0f7c2f0753', true);
INSERT INTO public.client_scope_client VALUES ('b46dc46b-9d7b-4a81-9339-4459b3db0ba5', 'a2875101-8e27-4043-995a-440e76bd68fb', false);
INSERT INTO public.client_scope_client VALUES ('b46dc46b-9d7b-4a81-9339-4459b3db0ba5', '5913a083-f959-47f0-a65b-534b7a367725', false);
INSERT INTO public.client_scope_client VALUES ('b46dc46b-9d7b-4a81-9339-4459b3db0ba5', '92bacdbc-fee2-4c02-b310-7419899e7fdd', false);
INSERT INTO public.client_scope_client VALUES ('b46dc46b-9d7b-4a81-9339-4459b3db0ba5', 'd83e96fb-9b7d-4a56-bc3e-d5a30665adf1', false);
INSERT INTO public.client_scope_client VALUES ('43ac882b-a9c0-4e8a-8851-3d3419ed570e', '18548663-faf3-454b-947c-b3a4977e928a', true);
INSERT INTO public.client_scope_client VALUES ('43ac882b-a9c0-4e8a-8851-3d3419ed570e', 'f40652a1-ba66-4c66-8ce2-b7f49044dd7b', true);
INSERT INTO public.client_scope_client VALUES ('43ac882b-a9c0-4e8a-8851-3d3419ed570e', '9c214c87-006f-440c-a187-1b2687dd649c', true);
INSERT INTO public.client_scope_client VALUES ('43ac882b-a9c0-4e8a-8851-3d3419ed570e', 'e39a226a-ac5d-4414-914e-0d0f7c2f0753', true);
INSERT INTO public.client_scope_client VALUES ('43ac882b-a9c0-4e8a-8851-3d3419ed570e', 'a2875101-8e27-4043-995a-440e76bd68fb', false);
INSERT INTO public.client_scope_client VALUES ('43ac882b-a9c0-4e8a-8851-3d3419ed570e', '5913a083-f959-47f0-a65b-534b7a367725', false);
INSERT INTO public.client_scope_client VALUES ('43ac882b-a9c0-4e8a-8851-3d3419ed570e', '92bacdbc-fee2-4c02-b310-7419899e7fdd', false);
INSERT INTO public.client_scope_client VALUES ('43ac882b-a9c0-4e8a-8851-3d3419ed570e', 'd83e96fb-9b7d-4a56-bc3e-d5a30665adf1', false);
INSERT INTO public.client_scope_client VALUES ('7af949cd-12c7-4505-9df1-b1f682a178c9', '18548663-faf3-454b-947c-b3a4977e928a', true);
INSERT INTO public.client_scope_client VALUES ('7af949cd-12c7-4505-9df1-b1f682a178c9', 'f40652a1-ba66-4c66-8ce2-b7f49044dd7b', true);
INSERT INTO public.client_scope_client VALUES ('7af949cd-12c7-4505-9df1-b1f682a178c9', '9c214c87-006f-440c-a187-1b2687dd649c', true);
INSERT INTO public.client_scope_client VALUES ('7af949cd-12c7-4505-9df1-b1f682a178c9', 'e39a226a-ac5d-4414-914e-0d0f7c2f0753', true);
INSERT INTO public.client_scope_client VALUES ('7af949cd-12c7-4505-9df1-b1f682a178c9', 'a2875101-8e27-4043-995a-440e76bd68fb', false);
INSERT INTO public.client_scope_client VALUES ('7af949cd-12c7-4505-9df1-b1f682a178c9', '5913a083-f959-47f0-a65b-534b7a367725', false);
INSERT INTO public.client_scope_client VALUES ('7af949cd-12c7-4505-9df1-b1f682a178c9', '92bacdbc-fee2-4c02-b310-7419899e7fdd', false);
INSERT INTO public.client_scope_client VALUES ('7af949cd-12c7-4505-9df1-b1f682a178c9', 'd83e96fb-9b7d-4a56-bc3e-d5a30665adf1', false);
INSERT INTO public.client_scope_client VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', '18548663-faf3-454b-947c-b3a4977e928a', true);
INSERT INTO public.client_scope_client VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', 'f40652a1-ba66-4c66-8ce2-b7f49044dd7b', true);
INSERT INTO public.client_scope_client VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', '9c214c87-006f-440c-a187-1b2687dd649c', true);
INSERT INTO public.client_scope_client VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', 'e39a226a-ac5d-4414-914e-0d0f7c2f0753', true);
INSERT INTO public.client_scope_client VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', 'a2875101-8e27-4043-995a-440e76bd68fb', false);
INSERT INTO public.client_scope_client VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', '5913a083-f959-47f0-a65b-534b7a367725', false);
INSERT INTO public.client_scope_client VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', '92bacdbc-fee2-4c02-b310-7419899e7fdd', false);
INSERT INTO public.client_scope_client VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', 'd83e96fb-9b7d-4a56-bc3e-d5a30665adf1', false);
INSERT INTO public.client_scope_client VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', '1f046dd2-6c70-4dd1-aa95-68059d84dcf3', true);
INSERT INTO public.client_scope_client VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', '696124a2-cd43-47c2-8c67-3907af107470', true);
INSERT INTO public.client_scope_client VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', 'f318802c-fe18-464b-9ede-3afeea29ca8a', true);
INSERT INTO public.client_scope_client VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', true);
INSERT INTO public.client_scope_client VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', false);
INSERT INTO public.client_scope_client VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', '8418a2a8-ce3f-413c-abfe-993e120485c2', false);
INSERT INTO public.client_scope_client VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', 'c731bf75-5798-4a55-b13a-8204dc0237e3', false);
INSERT INTO public.client_scope_client VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', '1db64da0-add0-41ee-aa19-182e59293840', false);
INSERT INTO public.client_scope_client VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', '1f046dd2-6c70-4dd1-aa95-68059d84dcf3', true);
INSERT INTO public.client_scope_client VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', '696124a2-cd43-47c2-8c67-3907af107470', true);
INSERT INTO public.client_scope_client VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', 'f318802c-fe18-464b-9ede-3afeea29ca8a', true);
INSERT INTO public.client_scope_client VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', true);
INSERT INTO public.client_scope_client VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', false);
INSERT INTO public.client_scope_client VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', '8418a2a8-ce3f-413c-abfe-993e120485c2', false);
INSERT INTO public.client_scope_client VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', 'c731bf75-5798-4a55-b13a-8204dc0237e3', false);
INSERT INTO public.client_scope_client VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', '1db64da0-add0-41ee-aa19-182e59293840', false);
INSERT INTO public.client_scope_client VALUES ('aa0f44d1-ab03-483f-b490-1beb8c6364be', '1f046dd2-6c70-4dd1-aa95-68059d84dcf3', true);
INSERT INTO public.client_scope_client VALUES ('aa0f44d1-ab03-483f-b490-1beb8c6364be', '696124a2-cd43-47c2-8c67-3907af107470', true);
INSERT INTO public.client_scope_client VALUES ('aa0f44d1-ab03-483f-b490-1beb8c6364be', 'f318802c-fe18-464b-9ede-3afeea29ca8a', true);
INSERT INTO public.client_scope_client VALUES ('aa0f44d1-ab03-483f-b490-1beb8c6364be', '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', true);
INSERT INTO public.client_scope_client VALUES ('aa0f44d1-ab03-483f-b490-1beb8c6364be', 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', false);
INSERT INTO public.client_scope_client VALUES ('aa0f44d1-ab03-483f-b490-1beb8c6364be', '8418a2a8-ce3f-413c-abfe-993e120485c2', false);
INSERT INTO public.client_scope_client VALUES ('aa0f44d1-ab03-483f-b490-1beb8c6364be', 'c731bf75-5798-4a55-b13a-8204dc0237e3', false);
INSERT INTO public.client_scope_client VALUES ('aa0f44d1-ab03-483f-b490-1beb8c6364be', '1db64da0-add0-41ee-aa19-182e59293840', false);
INSERT INTO public.client_scope_client VALUES ('87064351-10df-4638-84d9-b242f925af79', '1f046dd2-6c70-4dd1-aa95-68059d84dcf3', true);
INSERT INTO public.client_scope_client VALUES ('87064351-10df-4638-84d9-b242f925af79', '696124a2-cd43-47c2-8c67-3907af107470', true);
INSERT INTO public.client_scope_client VALUES ('87064351-10df-4638-84d9-b242f925af79', 'f318802c-fe18-464b-9ede-3afeea29ca8a', true);
INSERT INTO public.client_scope_client VALUES ('87064351-10df-4638-84d9-b242f925af79', '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', true);
INSERT INTO public.client_scope_client VALUES ('87064351-10df-4638-84d9-b242f925af79', 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', false);
INSERT INTO public.client_scope_client VALUES ('87064351-10df-4638-84d9-b242f925af79', '8418a2a8-ce3f-413c-abfe-993e120485c2', false);
INSERT INTO public.client_scope_client VALUES ('87064351-10df-4638-84d9-b242f925af79', 'c731bf75-5798-4a55-b13a-8204dc0237e3', false);
INSERT INTO public.client_scope_client VALUES ('87064351-10df-4638-84d9-b242f925af79', '1db64da0-add0-41ee-aa19-182e59293840', false);
INSERT INTO public.client_scope_client VALUES ('f53779a4-0976-4de3-815f-117b48bb478a', '1f046dd2-6c70-4dd1-aa95-68059d84dcf3', true);
INSERT INTO public.client_scope_client VALUES ('f53779a4-0976-4de3-815f-117b48bb478a', '696124a2-cd43-47c2-8c67-3907af107470', true);
INSERT INTO public.client_scope_client VALUES ('f53779a4-0976-4de3-815f-117b48bb478a', 'f318802c-fe18-464b-9ede-3afeea29ca8a', true);
INSERT INTO public.client_scope_client VALUES ('f53779a4-0976-4de3-815f-117b48bb478a', '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', true);
INSERT INTO public.client_scope_client VALUES ('f53779a4-0976-4de3-815f-117b48bb478a', 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', false);
INSERT INTO public.client_scope_client VALUES ('f53779a4-0976-4de3-815f-117b48bb478a', '8418a2a8-ce3f-413c-abfe-993e120485c2', false);
INSERT INTO public.client_scope_client VALUES ('f53779a4-0976-4de3-815f-117b48bb478a', 'c731bf75-5798-4a55-b13a-8204dc0237e3', false);
INSERT INTO public.client_scope_client VALUES ('f53779a4-0976-4de3-815f-117b48bb478a', '1db64da0-add0-41ee-aa19-182e59293840', false);
INSERT INTO public.client_scope_client VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', '1f046dd2-6c70-4dd1-aa95-68059d84dcf3', true);
INSERT INTO public.client_scope_client VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', '696124a2-cd43-47c2-8c67-3907af107470', true);
INSERT INTO public.client_scope_client VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', 'f318802c-fe18-464b-9ede-3afeea29ca8a', true);
INSERT INTO public.client_scope_client VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', true);
INSERT INTO public.client_scope_client VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', false);
INSERT INTO public.client_scope_client VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', '8418a2a8-ce3f-413c-abfe-993e120485c2', false);
INSERT INTO public.client_scope_client VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', 'c731bf75-5798-4a55-b13a-8204dc0237e3', false);
INSERT INTO public.client_scope_client VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', '1db64da0-add0-41ee-aa19-182e59293840', false);
INSERT INTO public.client_scope_client VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', '1f046dd2-6c70-4dd1-aa95-68059d84dcf3', true);
INSERT INTO public.client_scope_client VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', '696124a2-cd43-47c2-8c67-3907af107470', true);
INSERT INTO public.client_scope_client VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'f318802c-fe18-464b-9ede-3afeea29ca8a', true);
INSERT INTO public.client_scope_client VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', true);
INSERT INTO public.client_scope_client VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', false);
INSERT INTO public.client_scope_client VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', '8418a2a8-ce3f-413c-abfe-993e120485c2', false);
INSERT INTO public.client_scope_client VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'c731bf75-5798-4a55-b13a-8204dc0237e3', false);
INSERT INTO public.client_scope_client VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', '1db64da0-add0-41ee-aa19-182e59293840', false);


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client_scope_role_mapping VALUES ('5913a083-f959-47f0-a65b-534b7a367725', '097545b4-6822-4b59-afae-acb57314cb32');
INSERT INTO public.client_scope_role_mapping VALUES ('8418a2a8-ce3f-413c-abfe-993e120485c2', 'cf4d1129-6250-4550-8750-31cdab07bab5');


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.component VALUES ('90d1e3e7-7051-4d1f-b5d8-2534beee680a', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('ee116dc5-37ba-4c24-8fec-7fa3bdab62b1', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('c6942544-1373-4977-a344-f1b11ae33a58', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('5b50de4c-7830-47c0-8c60-95177d33a346', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('7769c534-b815-455e-96fd-1775bbffbd08', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('faec26cf-1ac1-4d17-acff-743443e06e4a', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('3597de25-476e-47d8-a635-5992506e5ffe', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('c25411bc-79f1-45db-90b9-378b0acde3a4', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('880b965c-a927-41f5-b499-5b8556fb5bb0', 'rsa-generated', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('1f0991b1-20a4-429c-bf18-e0e6c38ae137', 'rsa-enc-generated', 'master', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('dafe8958-3c4e-4858-a7e4-3e7bfb7bdc5e', 'hmac-generated', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('f990c35d-4eac-44cb-8447-428872dd3d42', 'aes-generated', 'master', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('d20e0847-9afb-4400-885f-b76a4c7b021b', 'rsa-generated', 'parent-template', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'parent-template', NULL);
INSERT INTO public.component VALUES ('edbb5f2c-69bf-42af-a633-6e630221d0b0', 'rsa-enc-generated', 'parent-template', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', 'parent-template', NULL);
INSERT INTO public.component VALUES ('a485ee48-0045-44a0-ac07-ce4877a31f5f', 'hmac-generated', 'parent-template', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'parent-template', NULL);
INSERT INTO public.component VALUES ('00b59cab-3abf-49a1-8dad-2775712d003b', 'aes-generated', 'parent-template', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'parent-template', NULL);
INSERT INTO public.component VALUES ('ceb11315-cc58-4f18-b110-f94ae83e6595', 'Trusted Hosts', 'parent-template', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'parent-template', 'anonymous');
INSERT INTO public.component VALUES ('59b93bae-f2db-420b-9613-66121b6881ea', 'Consent Required', 'parent-template', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'parent-template', 'anonymous');
INSERT INTO public.component VALUES ('0c3a0e8a-af71-48cc-b800-d3d61764e2e4', 'Full Scope Disabled', 'parent-template', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'parent-template', 'anonymous');
INSERT INTO public.component VALUES ('510bf610-d03b-4e3d-aef4-3f0434467ec1', 'Max Clients Limit', 'parent-template', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'parent-template', 'anonymous');
INSERT INTO public.component VALUES ('2419a881-73e3-4e37-9128-a7da95d77299', 'Allowed Protocol Mapper Types', 'parent-template', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'parent-template', 'anonymous');
INSERT INTO public.component VALUES ('0163db50-681c-4384-8b15-03d7c0dfec4d', 'Allowed Client Scopes', 'parent-template', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'parent-template', 'anonymous');
INSERT INTO public.component VALUES ('d096255b-1c07-4243-a381-bd54380836a1', 'Allowed Protocol Mapper Types', 'parent-template', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'parent-template', 'authenticated');
INSERT INTO public.component VALUES ('b95375a6-c790-4ef9-87dd-22463adadb65', 'Allowed Client Scopes', 'parent-template', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'parent-template', 'authenticated');
INSERT INTO public.component VALUES ('7bad4a86-f0e4-49c9-ae78-8fa826aaba54', NULL, 'parent-template', 'declarative-user-profile', 'org.keycloak.userprofile.UserProfileProvider', 'parent-template', NULL);


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.component_config VALUES ('14616c6a-700c-439a-b1d6-721ae2738f37', 'c25411bc-79f1-45db-90b9-378b0acde3a4', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('6f3b875c-d732-443d-86e8-bbe70dfd183f', '5b50de4c-7830-47c0-8c60-95177d33a346', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('4fdb59cf-909e-445e-a55b-f69397fd2135', '3597de25-476e-47d8-a635-5992506e5ffe', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('b5b660e5-3029-444f-8ccc-80f8830f9608', '3597de25-476e-47d8-a635-5992506e5ffe', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('aa636665-0875-4262-9223-63e836c1203e', '3597de25-476e-47d8-a635-5992506e5ffe', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('bb137291-fd44-4869-a2fa-e9f7d7eaad59', '3597de25-476e-47d8-a635-5992506e5ffe', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('e2c0caa6-1a26-4c5e-b205-1b45529de9e1', '3597de25-476e-47d8-a635-5992506e5ffe', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('defd732f-436e-49ce-a4f0-1d89ce14a939', '3597de25-476e-47d8-a635-5992506e5ffe', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('158b6261-4baa-4d6c-97dc-5adb7810478f', '3597de25-476e-47d8-a635-5992506e5ffe', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('f736cf3c-97fc-448b-a815-e2dedb80e9c2', '3597de25-476e-47d8-a635-5992506e5ffe', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('07be6a46-f04f-43eb-9346-4c1da6e7121b', 'faec26cf-1ac1-4d17-acff-743443e06e4a', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('e25d00a9-6941-4bee-b6e2-03da18616655', '90d1e3e7-7051-4d1f-b5d8-2534beee680a', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('ac918f5c-4fb6-4558-8067-6a2dae86b112', '90d1e3e7-7051-4d1f-b5d8-2534beee680a', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('8dcaf211-083a-426a-b459-aa48ece8b745', '7769c534-b815-455e-96fd-1775bbffbd08', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('36cc0225-bf62-4b02-90d5-c682343b5e91', '7769c534-b815-455e-96fd-1775bbffbd08', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('64d67589-4db8-4a6c-896d-0039fb97d213', '7769c534-b815-455e-96fd-1775bbffbd08', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('8813e64c-fb87-46fb-90f0-9dd814627701', '7769c534-b815-455e-96fd-1775bbffbd08', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('058a39a1-0ea0-455a-b203-97b69833e870', '7769c534-b815-455e-96fd-1775bbffbd08', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('4ae08f61-832f-48cb-8fc2-98f48d88b91b', '7769c534-b815-455e-96fd-1775bbffbd08', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('cb95335f-24ed-4ea5-b4e2-7e2e6dd68a1f', '7769c534-b815-455e-96fd-1775bbffbd08', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('332ff8a3-6f1b-4e2e-81cd-cda6c66b0226', '7769c534-b815-455e-96fd-1775bbffbd08', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('b93adffc-194c-4db7-8528-4c49e22c4fc2', '1f0991b1-20a4-429c-bf18-e0e6c38ae137', 'keyUse', 'ENC');
INSERT INTO public.component_config VALUES ('54ce453e-6d70-4417-88f8-a78b7d183dce', '1f0991b1-20a4-429c-bf18-e0e6c38ae137', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config VALUES ('7c22437e-1f81-4e02-a466-b27b13884f73', '1f0991b1-20a4-429c-bf18-e0e6c38ae137', 'privateKey', 'MIIEogIBAAKCAQEAlIB6eyWDLt/iOk2NeVuMPaaIbrJ3bVeuiSWeOUdG6CAFOdoyqMCkEsabLmHIwE3E7I3Yf4gwb4bTzQPbhRPBp5I/duZPpQzUkSwS93CdUCEo1KLDrJcneitwFmCvbwLMvzihJH2NrullgEgMGl9f+Pmj/AUOWG/W1kzfEhxF78gbTitQ9joXDQ8JK7ijhU9bbfWkOkbdNOhNFtR5yawlWOEtPW3Qkg+lVRqqFcTQWbTJx2QZ5U7AfOr/GMwtmt84/sj5gNdp3FXh4BJeqZaKC+1ICuzE29sJxujwXz/Ls44g3fwmKBeQ1OqFsfSUUfHj7k7WBWbPWaxHo/jJyyN+PwIDAQABAoIBAANiomgoRMNOy0N0/SKlGZ9WKooLe3l8pDfwKZk4rL8h67yT4s/CBHuBF4yJIiBwJWsXGLZfjmsccbucuOZhuuptBRFa0rn6fuYIUS5e3Nc0yk9+nmNS1s2MK/P2pEktkSlSyymfyxkPrQatnckEH5X3auuV2eveMNGV0wgAqP98UTfEtF7g1banb8e/F8O7jTgO/6WbmJGH0iNcpa1fMmag3LTqTXzibzs18XnxDGYtIkmF+vsPJdRS51CwOdDELDZ+4jZoVdwdlhUNVre0mRuP8avyu00ZBJmPCMq6ZXQ3MeKbURi6DzUPWthnN+Id8JSieRVhrR+HGY9Vp4N02nECgYEA8w8QVOsgV16Ke6x2XSaCk3ti/gfVPR9BlzV8+WFfY4CHPQSFxEfTWg4neJpKEbcoXLkWeFlOoYVe2fOvxsUBT2iMViRC+YRVKyokd4OqQ/R53Mco2ZRah6sDVh4LNAVWgKqHKCbqbbBEjcLYgsfEUoCURuErUAZHAwu2V30EtkMCgYEAnGiV/dQPtXz4p66+wqFm1bj2FXjT84LoOUalzYM5QxMUe72z404EwZIkxIWrsWb/fsOMQnCP54oZZqvfUGO/ljH6t7PgIXHM7nZJGgg5leoIoGb+pmzNU2cDA9kpmELW90gn70LHBdJNkSoLOhe+wU8MK8hB7Blwu8gHsuLKflUCgYA+mnKqbKU327HviMwz0edv9SfaJkpWI+bQ+4Xk9Z+MEV7D6JZLp/RYDa088wCA75wFxeZzuQz3rVJw8MMlfziHK3Z5+X0Gp38ITyJ1ZgRE3INGykVLRVrL9tA1LifUjktpeIK3ZM6c0fnWSYlapfl7BoMqfnSZeARyVGHyxtCf4QKBgGryaH0jX4ptZWji57UVv8crrbiI4gSD4l4nnH+l1qWyijMCR9qJIl9pmpJ2BCxNjS4Ub/eOGBfuKeg2ZYAGdJ4yloi+CedUdRgo8VtHfHixiiyDwGPzyYHZ0gnzl6lxKqPzRrsnIgctAbTc1shmLBzp/ByD1e+mhZsg74K16FfxAoGAJGY725ygONRvAraWaiWFzpto40NUtqGedDh2+IVziDrp3hzk1INqM6fxgw+eAVuRbySsFXSXlzJ3rDzOd9jWtLgwEU08h1L+dHlamufBBLVMDOeNDquH8AkSus91px/IraWPda7fBrDtQV6MJoGTAC3dUH+YlPDcAs5BI0R6AA0=');
INSERT INTO public.component_config VALUES ('14a79097-a22a-4ca1-ae3a-68673f71285d', '1f0991b1-20a4-429c-bf18-e0e6c38ae137', 'priority', '100');
INSERT INTO public.component_config VALUES ('21035b8b-ca65-471c-af89-8c96be336b50', '1f0991b1-20a4-429c-bf18-e0e6c38ae137', 'certificate', 'MIICmzCCAYMCBgF/4BGtYDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMzMxMTMwMDI5WhcNMzIwMzMxMTMwMjA5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCUgHp7JYMu3+I6TY15W4w9pohusndtV66JJZ45R0boIAU52jKowKQSxpsuYcjATcTsjdh/iDBvhtPNA9uFE8Gnkj925k+lDNSRLBL3cJ1QISjUosOslyd6K3AWYK9vAsy/OKEkfY2u6WWASAwaX1/4+aP8BQ5Yb9bWTN8SHEXvyBtOK1D2OhcNDwkruKOFT1tt9aQ6Rt006E0W1HnJrCVY4S09bdCSD6VVGqoVxNBZtMnHZBnlTsB86v8YzC2a3zj+yPmA12ncVeHgEl6plooL7UgK7MTb2wnG6PBfP8uzjiDd/CYoF5DU6oWx9JRR8ePuTtYFZs9ZrEej+MnLI34/AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGm8exu0wetl/Mjq4bxp00dTKy6oNGJ+Xy1c2120Aio9/tSKiKtRvZvQbOrDVxK6I/TVUDj/8GDYKQxicgmDPXcbGmunzh5aw/R1SwDW9AeH2ALheP4flfsMHo6e6M1kflEy1wj2aT+m5N9SfW8jQ4ziDpjOSix1L0DWp3movuH+r4fW+aei/LaO0kOhxVQqTw6/hZEdCBiX3etC74HczaLWj9frmVKFUVB4LTBcNQ1P9br7YVnUwXVi0KSeycEONtClm8BaWtyI4MKV1pjMfQkDpAIB3r27AIz0ea/+RAqzC3KRrYpn2hvaUNNWqcDSkCuje5JCkflOeaHeKDbA//g=');
INSERT INTO public.component_config VALUES ('ce370f5e-ea45-44e8-adcd-98bc674149b4', '880b965c-a927-41f5-b499-5b8556fb5bb0', 'keyUse', 'SIG');
INSERT INTO public.component_config VALUES ('f46d1a11-b54c-463e-8af2-f22adfb5c357', '880b965c-a927-41f5-b499-5b8556fb5bb0', 'privateKey', 'MIIEpAIBAAKCAQEAkc1pp25Pk8yZZH7mHqyA1K6U2Of/J4gP5AqbvF059A5iIalDxElMYSkYVXzmZIWFPAGbw9DUt4oAkfjwhGM+9Wf5gwV2a497yNY1dPVwp50XPMLlfdyQSl+owKcDCn7KgItxd0ZpC8g7OZLm1wIbGqiUmYPvzMrdbtsXk9dJiQ3yJaco90hAscID0uveYEopzS5DGx8xWxzkuwu1RLTwtT4u1Eja9lCXFBU8V4hgpLXfyK6gOz1uvUkVPEOxQ0ZeWjxCVY7JzwcUumqjKe2acCI8rEvqjocfpU8IsT3Bnv2bJYBGuYJoiTf44gs6LBwCbhT3eWZ2gKsEQz0C5+RnrQIDAQABAoIBAAhA9qAx0HNve6eCv4gw/8IKeAana3xTaYLhTtuk82jrf4akTF/KPnapmuUMAwbhwB8bgDPfmIsjVtDspMD51VCTKD7Qilmgb8N4zOHoGw6CCBS6e79aQxjSvXzad4OaleAdBLlZ1QyDs0aZGFRHnD0wGelu3J5dRZfG81i9MT5+47wZtC3G82rV9zBS1NpU8n0rH/W+u4xRc5h7CG/Y/xjCnXntSaHgw/52XY+iinvxrPJESIV1ay5oRl4/DKMNmRcAipTeR6y9BmLviAW5H4pXdEP2eWFtbSxja7D2TepuLKO2Pr9LarPdVKphQjkrgDWlwEG2fm+Xfhbx8vq5UwkCgYEAw+DyNGmAKxEbpORouG8m6vaHUZm48LF+VGibIWipWMrFeC8BM7BjBiWt9FFCMKGIo+S4F6r5USG812PQogYn8v3jNUPAG27vZWMC7/uzG/MLuyphOEtHo530DYnPThmkK7fSjvmj6ApyUVRMM5R3phBbnI4CUT3Zz4v66yrphQsCgYEAvo3AHU0d+rswgzUIGq7orK7LkzARA5d4wZg6I+Bc0D0oGhwwFbwr0L42+lPTfzGsadmqcCeGLRODFGht5HMzYuanmteCdvcFqqbm3/Id+lD+3XWVUPnF/4+GldTnjzWTdjLTxow+anbD9jyasE81Ty0mHCn+bOFAmSdQ3VDDSScCgYEAnI+JR7cjiEiuTcd6pB/DfX36fpBdr5ROouzRQYzD/oJj/0Gitku/ekRXm7XvL6uM6WKAefpgOCa9J3NSaI5/E8s19Xbnb4XltqXCzUniyO4kbD7dYf9ZjT9MuB10Irp/66mLlFeYWHkxEixMk9WRJJxifOlMlN7Y3vjFX333FC0CgYBlG6WyZnbf0W8+T2dLcT94UQ8nvDtq4nZqkrFW0/erbqfWotpIzh2ZlzRoww3X0a2gRKSQ+gfR5yaIL5kPvKipc6W/HVbWdOAG2qRqc3fAmDWDoJ5n5wBOSAOrgNqVPGJQN0vzb/q2VupHv4R8xKqOpnAwRYAAmczC9v+LTw0vxQKBgQCRbHzG4H65kIiQbNXizmkAwsol38LdXsG+sMZx9EDgJMeQLvhUDnrE3zZ31LAC2oGkWHI+/LjiNT5o1jcW2+iTx22oesv24a2i8/Z65mfNSfc7yEIeyUEwDsxXUTGRICzKG6a9trVDdwIr1JuuR4cfL8R8dINmF6QJ0A7kn6Sq5A==');
INSERT INTO public.component_config VALUES ('5c54e2c6-5820-4389-bb3c-e7e6a0849dc4', '880b965c-a927-41f5-b499-5b8556fb5bb0', 'priority', '100');
INSERT INTO public.component_config VALUES ('86b7a22a-504d-4313-943b-200620fadf6b', '880b965c-a927-41f5-b499-5b8556fb5bb0', 'certificate', 'MIICmzCCAYMCBgF/4BGr2TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMzMxMTMwMDI4WhcNMzIwMzMxMTMwMjA4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCRzWmnbk+TzJlkfuYerIDUrpTY5/8niA/kCpu8XTn0DmIhqUPESUxhKRhVfOZkhYU8AZvD0NS3igCR+PCEYz71Z/mDBXZrj3vI1jV09XCnnRc8wuV93JBKX6jApwMKfsqAi3F3RmkLyDs5kubXAhsaqJSZg+/Myt1u2xeT10mJDfIlpyj3SECxwgPS695gSinNLkMbHzFbHOS7C7VEtPC1Pi7USNr2UJcUFTxXiGCktd/IrqA7PW69SRU8Q7FDRl5aPEJVjsnPBxS6aqMp7ZpwIjysS+qOhx+lTwixPcGe/ZslgEa5gmiJN/jiCzosHAJuFPd5ZnaAqwRDPQLn5GetAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAH1HR9oMwCxCU2XrRm2Y5jikHzqOoCKWLV1v0OMWDKW24H0Rz1/gqPfqgT4g178272Bai4wXyI3k7cTq4nOv15XHlUl5n8cNltHc73eHx5e5h71DWX4Q3kAWKcmwbvd84i9qx46tXLmndz/ojDJg7OtkExvfos/prwDqLh2gztQDf1JxiFIUGu/frfsCyHp/0QCq/feUGHtF40VooSe4IeMaX7ZssAQwoVPcFlMTle4l2VoYprt3dH/53XFHVLVPlB9qqGVqFwHa3f97s1T3IuWtllvphO+ciyUBw6QaUYxXrmbUTlnHl4UewZ8nIfZCZiMfk/Rad4KYsAc8LUqZeQk=');
INSERT INTO public.component_config VALUES ('d3285868-970a-4b57-b86c-8fe70e2b2f01', 'dafe8958-3c4e-4858-a7e4-3e7bfb7bdc5e', 'secret', 'YG798glk-LDUGb7PmPhq8FyRIQiIBM7Z2sG1lhtVRYQztBNyisbcMXEHc-7YKXqAoIcVFdLmtgEHBF2KiELeJA');
INSERT INTO public.component_config VALUES ('d69d4798-51c0-4dd9-a752-6deaa0b53b8e', 'dafe8958-3c4e-4858-a7e4-3e7bfb7bdc5e', 'priority', '100');
INSERT INTO public.component_config VALUES ('2f7a27cf-dd35-404f-b47b-b9ae4c213f9e', 'dafe8958-3c4e-4858-a7e4-3e7bfb7bdc5e', 'kid', '40dcb3c4-e0be-40d4-a35e-47af2480de4a');
INSERT INTO public.component_config VALUES ('a594fc21-4195-4ee8-bb20-7809c246825d', 'dafe8958-3c4e-4858-a7e4-3e7bfb7bdc5e', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('5da2c595-d4fa-4fd4-81d7-42a4fe7ecf1e', 'f990c35d-4eac-44cb-8447-428872dd3d42', 'priority', '100');
INSERT INTO public.component_config VALUES ('4a7cd9a6-86b4-4f19-931d-cc17cb1d7e32', 'f990c35d-4eac-44cb-8447-428872dd3d42', 'kid', '096ee459-5138-49dd-9087-0ba9307b9c6b');
INSERT INTO public.component_config VALUES ('77ff0d0f-91cf-4c08-acf3-2b05be4f5dd1', 'f990c35d-4eac-44cb-8447-428872dd3d42', 'secret', 'v3uP9tcQryOYlLJX-wsrsg');
INSERT INTO public.component_config VALUES ('64be36bb-6b7c-4da2-9f57-ef49142b1aba', 'a485ee48-0045-44a0-ac07-ce4877a31f5f', 'kid', '6562801d-20ce-4080-a76b-0b9a3f628842');
INSERT INTO public.component_config VALUES ('a60bc595-7cd2-45ea-9996-fd4d0a61655b', 'a485ee48-0045-44a0-ac07-ce4877a31f5f', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('feea0583-310f-484c-9684-abfb759e4403', 'a485ee48-0045-44a0-ac07-ce4877a31f5f', 'priority', '100');
INSERT INTO public.component_config VALUES ('7199d41b-82c0-4289-bfe6-a6a1bcce575c', 'a485ee48-0045-44a0-ac07-ce4877a31f5f', 'secret', 'tOILI-2Cy6aNM1q8I9f-zFW5ZHe3Z1Y4-5FO6WDeILr30UfOBo_ufJVTwhAPj_2GpQX40P-EpQ7OdLnISnAATw');
INSERT INTO public.component_config VALUES ('981f3396-48ca-441e-a48f-5fcddc0784c3', '00b59cab-3abf-49a1-8dad-2775712d003b', 'kid', 'c6c931fc-9ae3-49cd-8b76-1c223357d321');
INSERT INTO public.component_config VALUES ('fbbc016e-93d9-4136-bb9d-b6b88da13f07', '00b59cab-3abf-49a1-8dad-2775712d003b', 'priority', '100');
INSERT INTO public.component_config VALUES ('a1b0b71b-e8b4-43dc-ae27-7776df846b58', '00b59cab-3abf-49a1-8dad-2775712d003b', 'secret', '0ZiXE6EallSte3VnOLlP5w');
INSERT INTO public.component_config VALUES ('d5733d61-1a55-4534-9ec6-a691568c228b', 'd20e0847-9afb-4400-885f-b76a4c7b021b', 'keyUse', 'SIG');
INSERT INTO public.component_config VALUES ('d5fce949-0161-46d4-ac7e-db0e3a0a04cf', 'd20e0847-9afb-4400-885f-b76a4c7b021b', 'certificate', 'MIICrTCCAZUCBgF/4BXe9DANBgkqhkiG9w0BAQsFADAaMRgwFgYDVQQDDA9wYXJlbnQtdGVtcGxhdGUwHhcNMjIwMzMxMTMwNTA0WhcNMzIwMzMxMTMwNjQ0WjAaMRgwFgYDVQQDDA9wYXJlbnQtdGVtcGxhdGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCQqNI5eqXyJdjF9fhJkw3Y/HUtMh+SSMWTi+fn442dA0XwslSBWo9urX6V90M/bLwKCAAszfVfTXV82gORqz7k1q2kC0imrNw+xSqq2yXRzxPR9uYh0pMyWpc0KYjoqWtapFyo8SMcQSepxn7Kwp+QD6F3UqldDVPlV49OaPgKGhi6pxAykv2C3ClLan9vBzPqpTENO1YBy8+9TYLZTDwGlAjp8gfbIi/HwispDEQjNzzb6wCHjXutYunLjhURBPeX+WyF8uZmYRQewcxnOi+6yCEpSnr+W2oYwiSZpklQV/I5g/KAkLGh1qs+VYEvfM7ayR4Z8Eznr5MB/mKwCbodAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAnEE9AxejnnvoY7/XnOBG0C1Xs+hwD5hOsFI6XN2XnZFkL/B25NaCiBBGom9SGcZ+C20QAt5i4DMWHlITpRjIAei2eNuOT/qJmCiKC+aV5ByiJ0aMk3AGpHeSvcLIWoIDoPusYPy9pUWjmIv+oA12LULEECJGfU2jUIWxPlP+9Tsefw3Jz2v5nJVfq6E6qkJ5zVXTPeZdlmqEYJfR41u6GPyCycXvbM6kEftiOpte5Q1U2MltAXs8jjiaXchnJzXC2Cbg36LJ6Fbw0TExVwhOf0IdgcMwcrMQ5n248RPs4Q1Yw16VgLOnJUczXm8e1zZUW2Uk1n2l/rg2tSg9WBpnI=');
INSERT INTO public.component_config VALUES ('87eb6fe1-f0cd-479b-b955-4ef492d8b6fa', 'd20e0847-9afb-4400-885f-b76a4c7b021b', 'priority', '100');
INSERT INTO public.component_config VALUES ('75025745-d513-4244-a828-82367896efa6', 'd20e0847-9afb-4400-885f-b76a4c7b021b', 'privateKey', 'MIIEowIBAAKCAQEAkKjSOXql8iXYxfX4SZMN2Px1LTIfkkjFk4vn5+ONnQNF8LJUgVqPbq1+lfdDP2y8CggALM31X011fNoDkas+5NatpAtIpqzcPsUqqtsl0c8T0fbmIdKTMlqXNCmI6KlrWqRcqPEjHEEnqcZ+ysKfkA+hd1KpXQ1T5VePTmj4ChoYuqcQMpL9gtwpS2p/bwcz6qUxDTtWAcvPvU2C2Uw8BpQI6fIH2yIvx8IrKQxEIzc82+sAh417rWLpy44VEQT3l/lshfLmZmEUHsHMZzovusghKUp6/ltqGMIkmaZJUFfyOYPygJCxodarPlWBL3zO2skeGfBM56+TAf5isAm6HQIDAQABAoIBACAaVw0KeulSHNlRzNgHGnudCyQMi5UbMT2dPsnnZfYCU/MmoDpUrqARQJZnWTUqHFDdlaxbyKhtuDUM7N3W8w411jMhje3vTrFfcCiamboGCo/+CvRWlvQFxqh8zzVS49ApyaZ0XSZYD0VOF7VHm8GMtniUj6Fm48dxtwvfn6wd6KsYuYhq75VvQLb0VAHXwEXqyVxmgwY5Y8EALJJn1KWAnLHSNVfa7Px7h3zYW34fF2Kjzzckt+7fyJKY9gOkmbC24jf+Sm2yCeYZZid+zvy/PTo8vBasPC4pEMyIlDpDPseWm9Lr1LkexvyjYDjzLE670Q4XYAN/Idm0m/wM9sECgYEA1Fh506yW+c0oukGRQ7w8Y85GesNc2vyZV/xA95YmnNcaweWmBDGTDBt58p+hZuA3XGJkd9/hxS9pAypYUv6su/2mCbDmHO4EQxvDKa0sPp/FFOZfuXHvzPglKGMtx9yTU07Xr/kXi2MIkBFxr0EcsVmfkb/4NZBoVp8PeOotdJcCgYEArmYYUH+1v4yais92eGvlh8X/QLkdSzNygN1snzZlbWJbGsIiNQ1AMsAguRfsjFIFaZje7rF1X/gRJRv5DnPh/vWQKoa/lAgOG8gTisXLpSTmbYm2QwmZL/ROJcuRjqODZ876fhEN/wMJzzdozcV6xwLZkc9CeXATmpOKjas62WsCgYEAqS81IanJQI5tfLjw/H7lvr+C+BzfxrqrkqaxPJKtgRkBgKtwcrbs6iCaMO1us4DBmyHp2njOcUUs7hC2/qlbBw05VU9UiIg7bRyZioMnVV4GsHg8nIxi+3RaZqtetnbQCvgucU6Nq8jj8aV0ZqYCLmux73Z8VHESMLHaqgQq41ECgYBkHhpBRD+bWmVx4M3bLd3UBxeVGXA2tq86SWNNN1Yc6ITypJYsrJG5UNC4UYKrv35585evodKHKIr3KcrdwCryShjcQQUEP2eSDVciqJBTGw7pvVATxhPaEr82NVo3b6lFU+47pyDIz/62pdGVp5PnYbxzV2+K9Ytbhu3YjH85RwKBgBA7mBW4T9IDM8shR+wWXYhOcEQWCkJEuAmlS4/xAxQB0E7JgPEJpbowAlv0AoDNZCMd9cbg9XVX+vzsc3VkTuyhUvFnsXZeNQvVhjEP+NOgrjpEljwdf5FbLl3mqQ2WDtRo9McTvHpkdN6xbI93O/vH0/IDHp0POri5bMnGPpqX');
INSERT INTO public.component_config VALUES ('ad4b2313-bf49-422c-9650-1273f78c3cdc', 'edbb5f2c-69bf-42af-a633-6e630221d0b0', 'privateKey', 'MIIEogIBAAKCAQEAjLaf8QcRxODORwgKqCArCj8qt2kN8CbmJqQUGQMQCr60thbIAYp1BzGnr1eQNUVxPbhAdH6ONVOyvS7SQtJC+BzeGELJmzMT6HJBO6RoQ2zQ+PWLq1TTuf+z+CQIza8ns6Gjxvm4OJylwZfJ/Bn073A9d3qDPWuG7LWs3L3ggfxtxKdJWMiol1HkfFqOFQ92vHVNaC1J5J72pILwLoqX5zT//L7BbvJmF4YLuJMPBhq0BBmsdQ68MHNib98cNsxRM9X4YGVbu71+ZnsKaLsPdd23tvWHN7FEx+0z/tqHo7ogPVsMd5s8wq1WNakpgK/J5Rba5DkTkGAkdxPO9AjdnQIDAQABAoIBAFtviHr81wUR97icdyBM1urvpPhNoar9++v8Drs6DECPL6prH0gxCl7EW2xLAAA9wZoTkn6ghhQM8UaRmDunmbDUQVWOgKcDB9qx88WnzcCSgzBjjoCkvHhOuklyUO4m9St6y4vOVXEkCWnFEpFo5Ip6ataqm4Fbz+8dFtjR4YNU59DZijsud/EsDOIzXu+K/2M4oRKMcu1K6FDfJjkl6bS8HAuNi95p+YBvXU9x/Sfn1n5xsItwkY4bFKXw3kmDkDhre96jn4HDh5U9GqePcfATTiURxrqaSPTCvrcalQjJSDR4dDgq5dZiAtbknV7wTAxIs6par0jQdyzL852qwRkCgYEAw5bJ4kpU6A/z5+4KufbGns9B0Y6f05sOltU2FZW8XJOk6gQB+T5uTg9ZmppuwcXz6KlVlcffybraA8NBhauv4c8ePMrILv5cT3sCSgdjISga2838UX2elffTn/+L3oHWR13/qF4BEQ3whgS4Py3OPw829NXmIl5Qut+uz5Jhgj8CgYEAuCzSn6rKojKVN/iBz/DgBhGIoIMWhjsmUviHhKss7f4Iw+skZbk9SuK3s+MaNgkLnt5m2KsiATH3qNkvzqCMapvFhWWxxNGn3mxKhlScXgWX4F5EiJK9k5x2zjZW62GlCNIUdvvmPQ8jKtx169RLsnV4ysIMuDX4FqOULBu6MSMCgYBLrC93yeKH1oQ7m7GyuXOnRfDlLxVPPZKrcNp4B3LVLpqDoAFTeYAb23yDgHSRrBDuV3WxeZ9v4UcwZX8YRJDMAOJmCt7gr7DvX1xHYAxOa8HYgR26Oav9weCy6qAm+nz5J7keXyByhL4mW/UdHI/Lfgt5NrjPW0ZIxvpPfQcU6QKBgA2bcixNyA7XweKSv7SHTWXlYbzKMp3UPO6gYhLROs6SmD8xXk0NtJOV0JC/1K3tWShxshOMAUUpVezprviLMBSoUZ2bd9jczJRIV/E4yxy/OQtgq5uTi+IeC0ENDrrxSeou60gnMEmOlsCR7TxxQO58c2I3mAz8H8o8Z7QikE0VAoGAZw9C3i3okKKQBINkL8Tsj/6hEO0E4oYo5IH5dh/bWQnW/qjtBIWLG+iM5xncyWN5HtqnzSTLf8D9+6UYcyODxJZXOgoVXM4zPKWRjBET03oSpEPksZuyHHMsQovSf6v5FI5KXiXMubb9OcDolR8B5gSGYzvHIyEweztL5HnPxgU=');
INSERT INTO public.component_config VALUES ('9b96942e-95ec-48b7-8335-e91124665382', 'edbb5f2c-69bf-42af-a633-6e630221d0b0', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config VALUES ('5df9952a-b324-40fa-866f-53f2e60bac9d', 'edbb5f2c-69bf-42af-a633-6e630221d0b0', 'certificate', 'MIICrTCCAZUCBgF/4BXftjANBgkqhkiG9w0BAQsFADAaMRgwFgYDVQQDDA9wYXJlbnQtdGVtcGxhdGUwHhcNMjIwMzMxMTMwNTA0WhcNMzIwMzMxMTMwNjQ0WjAaMRgwFgYDVQQDDA9wYXJlbnQtdGVtcGxhdGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCMtp/xBxHE4M5HCAqoICsKPyq3aQ3wJuYmpBQZAxAKvrS2FsgBinUHMaevV5A1RXE9uEB0fo41U7K9LtJC0kL4HN4YQsmbMxPockE7pGhDbND49YurVNO5/7P4JAjNryezoaPG+bg4nKXBl8n8GfTvcD13eoM9a4bstazcveCB/G3Ep0lYyKiXUeR8Wo4VD3a8dU1oLUnknvakgvAuipfnNP/8vsFu8mYXhgu4kw8GGrQEGax1Drwwc2Jv3xw2zFEz1fhgZVu7vX5mewpouw913be29Yc3sUTH7TP+2oejuiA9Wwx3mzzCrVY1qSmAr8nlFtrkOROQYCR3E870CN2dAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABHC3WTsRu6H/zoSdU7MSNokgv0t5VKxaa1wG1OdkRCj7iECsRJrFrf1DXWvY0gnFzDdjhYv4Wzt9sqvnCdj7Tqp1GCSIjPTizPG2HEcpOTjsz9fyo5dG1QnDUK3dRjRdmAYsZa/5EiPnACkrqu1wLWmaaGUVKtga4ySfzVpvx9W9ytUSjrJhMLNw0kNRlX6nCu0mriiP+nEWSpQ3uq9nW7IFaureXScWWh/bbMsVQNzvL3ynkaBpcX/R40gyXYIvDYpS4pHQSPDdS/WWri/FIew0oV84uQPci1dXtrjfFzniG0Ima23DyVl72amFrqQxFMeytX181MWSGkiny7AOkE=');
INSERT INTO public.component_config VALUES ('4f3f0481-e314-45d0-811e-09533b2d4d14', 'edbb5f2c-69bf-42af-a633-6e630221d0b0', 'keyUse', 'ENC');
INSERT INTO public.component_config VALUES ('5e11ace1-e4e2-4403-be8a-d5b4fda0ab64', 'edbb5f2c-69bf-42af-a633-6e630221d0b0', 'priority', '100');
INSERT INTO public.component_config VALUES ('3d37dbe7-e1e6-4731-9406-d211fec08cad', 'ceb11315-cc58-4f18-b110-f94ae83e6595', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('3963f8cc-19f1-4a3f-a75a-bfaa4011e122', 'ceb11315-cc58-4f18-b110-f94ae83e6595', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('2b120687-0025-44eb-b10b-c5a3920a17d4', '2419a881-73e3-4e37-9128-a7da95d77299', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('7a9e3686-9bc2-4911-a7d9-d41e2cf43491', '2419a881-73e3-4e37-9128-a7da95d77299', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('f5dc5ffb-e45d-48f9-bd52-e1157d889443', '2419a881-73e3-4e37-9128-a7da95d77299', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('077f87cf-780a-4bac-9f73-9606ecac030d', '2419a881-73e3-4e37-9128-a7da95d77299', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('00baaf54-8852-4512-b80e-b8a197d5a9ec', '2419a881-73e3-4e37-9128-a7da95d77299', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('ecf79d46-9a06-4dfb-bd78-e9595d82520b', '2419a881-73e3-4e37-9128-a7da95d77299', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('51584d1f-930e-4086-be02-bad26eafa553', '2419a881-73e3-4e37-9128-a7da95d77299', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('bdd6c1ec-00e4-4cce-b5cb-97d97e1599c2', '2419a881-73e3-4e37-9128-a7da95d77299', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('6615d02f-747a-43b0-b778-daa936340463', '0163db50-681c-4384-8b15-03d7c0dfec4d', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('c1bb1b1b-bd59-4788-bb96-ac79fe0d5611', '510bf610-d03b-4e3d-aef4-3f0434467ec1', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('973b6992-cb39-4966-a94a-4a0fd40c2a2a', 'b95375a6-c790-4ef9-87dd-22463adadb65', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('391887ac-879f-489f-b387-76a62af84039', 'd096255b-1c07-4243-a381-bd54380836a1', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('597d6c6c-f7b6-4aba-9fb6-f066be322490', 'd096255b-1c07-4243-a381-bd54380836a1', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('78b24098-3c42-4acc-b732-6afa306bbd93', 'd096255b-1c07-4243-a381-bd54380836a1', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('315ae86c-af1e-448a-aa57-f3098e5984c0', 'd096255b-1c07-4243-a381-bd54380836a1', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('c2d3af43-4c97-4412-b36a-6220ae8ff9e6', 'd096255b-1c07-4243-a381-bd54380836a1', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('38bd2987-03b7-41fb-b06d-73b81697ea8e', 'd096255b-1c07-4243-a381-bd54380836a1', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('a219d56a-b313-42c9-b0be-a62682c6756a', 'd096255b-1c07-4243-a381-bd54380836a1', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('c71fdc9b-cdd0-4932-be0f-1036a642e074', 'd096255b-1c07-4243-a381-bd54380836a1', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '4f7daa00-e1a0-4b4c-9c52-11aa804c2aff');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'f0031d59-06e5-4d69-ba7e-49b4b0b907c0');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '26347411-5b00-4775-8cbf-1373fa91afaa');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '30f1d930-d19b-42e1-8e66-e4060325697d');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '726cea80-543b-4de5-8f08-7ae4e45553c1');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '93bf117e-77e5-4daa-9080-9abd20da49ba');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'ae7eb019-0e60-455a-b83d-7d33a3009ac9');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'bdbb046e-5111-4858-9629-f2f45346d911');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '5d3482ad-0f53-4340-829f-1efb7b6a606a');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '3c91965d-81dd-4b7a-a55c-6ca6841a34c8');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '859d34d2-4a8d-4886-9404-8bedc53aa122');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '3b901a00-9e6a-48e0-97a1-c122f9c93b36');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'e64ec327-00da-48e7-a003-05a7d4038f2f');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '22e05e21-1b89-4147-b9c5-63cb81724429');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '6be00505-a7bd-4a3b-8873-90f747632bab');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '43492616-4ec3-48b6-a88d-7120843fe3bd');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '7a71c658-7ac5-4794-9f0c-2a3ed7739b4c');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '96f6cfdc-6edb-4cf3-95f2-18e861d43b7b');
INSERT INTO public.composite_role VALUES ('726cea80-543b-4de5-8f08-7ae4e45553c1', '43492616-4ec3-48b6-a88d-7120843fe3bd');
INSERT INTO public.composite_role VALUES ('30f1d930-d19b-42e1-8e66-e4060325697d', '96f6cfdc-6edb-4cf3-95f2-18e861d43b7b');
INSERT INTO public.composite_role VALUES ('30f1d930-d19b-42e1-8e66-e4060325697d', '6be00505-a7bd-4a3b-8873-90f747632bab');
INSERT INTO public.composite_role VALUES ('b980df10-d53e-47fd-b9da-c9b8c7d63743', 'cf14bb4a-d327-4ecd-b383-bcc6233bd995');
INSERT INTO public.composite_role VALUES ('b980df10-d53e-47fd-b9da-c9b8c7d63743', '4de78aa3-e68c-4cde-8f89-cfc1aa723789');
INSERT INTO public.composite_role VALUES ('4de78aa3-e68c-4cde-8f89-cfc1aa723789', '1f04a612-2675-4cf4-8866-898f66dbf535');
INSERT INTO public.composite_role VALUES ('b0008429-2ccf-4797-b897-86876855fa98', 'a7195bcd-e83c-4ac5-9985-835fbd908104');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '014cb29d-1e5f-4e0b-a8e4-0e5494d6ae10');
INSERT INTO public.composite_role VALUES ('b980df10-d53e-47fd-b9da-c9b8c7d63743', '097545b4-6822-4b59-afae-acb57314cb32');
INSERT INTO public.composite_role VALUES ('b980df10-d53e-47fd-b9da-c9b8c7d63743', '026ddd93-c1e5-4904-abbc-e5988b190f35');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'b110bc32-cf53-4db6-ab4b-955d1c4ea4ee');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'aeccdf0c-e560-40b4-a06f-86a551acd7bc');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '6ab9e921-80d1-4915-b4dc-e4e3ae400e72');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '7abca55f-39e3-49c8-92bd-8625707a85b3');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '3a566ee9-c68c-42d7-91a9-d4f7f78d83b5');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'c0d874bc-68d6-4ee3-bd57-be190c652eaf');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '4ef5227e-6ae7-42ff-a6c2-13637076bf92');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '5e6335a4-47e1-4702-8d54-0a686f8afa9b');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '16473847-934b-489f-ac4c-82f78d4347fe');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'b314bb9e-a0f6-4f9e-9f4b-2424d1415f34');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'e4440dbd-90cf-4560-b483-1315ba5d1f52');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '11326423-14e2-411d-96a2-513df1214d92');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '0b7ab232-5e69-4a17-be18-8287e3e0d559');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'e4f311ff-268e-44fb-add8-08fb8c994906');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '02670718-5483-42f9-8b6c-3c7990f469c3');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '5d721c4d-8970-472b-a0a0-c52baef8c520');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '2a12db3e-fc31-492e-a170-1ec962282a98');
INSERT INTO public.composite_role VALUES ('7abca55f-39e3-49c8-92bd-8625707a85b3', '02670718-5483-42f9-8b6c-3c7990f469c3');
INSERT INTO public.composite_role VALUES ('6ab9e921-80d1-4915-b4dc-e4e3ae400e72', '2a12db3e-fc31-492e-a170-1ec962282a98');
INSERT INTO public.composite_role VALUES ('6ab9e921-80d1-4915-b4dc-e4e3ae400e72', 'e4f311ff-268e-44fb-add8-08fb8c994906');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '3b406356-cf20-4ca9-b2cb-124f6adab757');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', 'a4727c2e-0e41-4eba-a195-b45eb8c48e46');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '75ce6690-d8db-4556-818d-da664e75f04c');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', 'bb03cd70-13b2-48b7-b15b-f6d254b72c1a');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', 'a778190f-6932-4104-a9bf-65b275a8463f');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '05551764-c032-4bda-b6f4-7c873c88f9b0');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '677ec15d-7275-4096-a3ce-7ac122a287d4');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '68850c4e-1baa-461b-ae27-63fd70015952');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '95bbdd43-6d81-47af-adf1-bee3074e4944');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '18e66189-98c9-4015-b348-dcd52a42c39d');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', 'e92bfefb-93fa-47f1-8849-63702a6e57d1');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '39bb2d87-f014-4ce2-a019-ebfb43850f7c');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', 'ba2277be-ff53-476a-bee9-6932cf10850f');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', 'bfe109ad-7b29-4513-bd6e-6f11861245f3');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '0eb04dbd-0486-4dca-a8a2-4ba6ca0701a5');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', 'e5a84954-9a8e-4e5b-acad-9877d6d15eb9');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '6ec9dcd5-bcee-43aa-91c8-eb64bda5aef4');
INSERT INTO public.composite_role VALUES ('bb03cd70-13b2-48b7-b15b-f6d254b72c1a', '0eb04dbd-0486-4dca-a8a2-4ba6ca0701a5');
INSERT INTO public.composite_role VALUES ('75ce6690-d8db-4556-818d-da664e75f04c', 'bfe109ad-7b29-4513-bd6e-6f11861245f3');
INSERT INTO public.composite_role VALUES ('75ce6690-d8db-4556-818d-da664e75f04c', '6ec9dcd5-bcee-43aa-91c8-eb64bda5aef4');
INSERT INTO public.composite_role VALUES ('f04d71df-ade0-4368-a25b-a242601f18f2', '5ec9e687-e01d-443e-9b5e-2f5e8b3e163e');
INSERT INTO public.composite_role VALUES ('f04d71df-ade0-4368-a25b-a242601f18f2', 'e55e8b24-308e-4d85-b06f-dd77e72423c5');
INSERT INTO public.composite_role VALUES ('e55e8b24-308e-4d85-b06f-dd77e72423c5', '46297048-7508-4abe-aefd-ea5f575662ac');
INSERT INTO public.composite_role VALUES ('b9a4b881-38fe-4e03-ad84-403a72fdfaae', '42fb8096-c943-41b3-bd57-e999b3ac37d2');
INSERT INTO public.composite_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', '4b556672-174a-4b8a-a068-5f7732f2e1ae');
INSERT INTO public.composite_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', '10dc4ea6-da66-4276-87dd-7f85e1da5456');
INSERT INTO public.composite_role VALUES ('f04d71df-ade0-4368-a25b-a242601f18f2', 'cf4d1129-6250-4550-8750-31cdab07bab5');
INSERT INTO public.composite_role VALUES ('f04d71df-ade0-4368-a25b-a242601f18f2', 'e70f7eb3-6981-4fa5-af4c-5ffc0a22c66c');
INSERT INTO public.composite_role VALUES ('c373822a-7ecb-4d44-8743-55b69db581a5', '1504064e-7e35-45c1-b66c-6339e9dc22dd');
INSERT INTO public.composite_role VALUES ('e0cdceb3-7276-4533-b23a-c182a8514b20', 'ce693ea5-de33-4c39-8c43-234013f3596a');


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.credential VALUES ('8becfd59-4e4f-4833-85d4-dc27fa85897e', NULL, 'password', 'afb9eb48-31c2-44fd-95df-98eab656509f', 1648731729878, NULL, '{"value":"U2w4cQqoEpHLOxVjIwTJolZMo3yY0PqgY93eKLmZNfJzUb5XJTbmC+7KbLIzYUJlbIjxIq24XWAMOcP6TE/K2A==","salt":"RPadhcgAWXcbqAFs0kMDeA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('35e68912-b387-401e-a037-c907ab14604b', NULL, 'password', 'e8bf1bce-112d-434a-bafa-a8f7defcce8c', 1648733881811, NULL, '{"value":"QCUuBUwfbpOmK84uFIPIurkuoyddhbB+wlMLWFpX0+HBiM7c3HnyQQO+FG8BPO2/kKsKjxDIAlOW/fhKmt/ScQ==","salt":"DChSzIiv/yoitRVQGVPEmQ==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2022-03-31 13:01:55.252517', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2022-03-31 13:01:55.278168', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2022-03-31 13:01:55.389448', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2022-03-31 13:01:55.400467', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2022-03-31 13:01:55.637805', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2022-03-31 13:01:55.646944', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2022-03-31 13:01:55.822999', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2022-03-31 13:01:55.832047', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2022-03-31 13:01:55.860756', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2022-03-31 13:01:56.131313', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2022-03-31 13:01:56.268174', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2022-03-31 13:01:56.273918', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2022-03-31 13:01:56.335602', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-03-31 13:01:56.379635', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-03-31 13:01:56.383543', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-03-31 13:01:56.39821', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-03-31 13:01:56.401975', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2022-03-31 13:01:56.535303', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2022-03-31 13:01:56.619461', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2022-03-31 13:01:56.635651', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-03-31 13:01:59.033789', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2022-03-31 13:01:56.639303', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2022-03-31 13:01:56.644436', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2022-03-31 13:01:56.739055', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2022-03-31 13:01:56.749962', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2022-03-31 13:01:56.761293', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2022-03-31 13:01:57.105012', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2022-03-31 13:01:57.407021', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2022-03-31 13:01:57.418199', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2022-03-31 13:01:57.533522', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2022-03-31 13:01:57.560273', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2022-03-31 13:01:57.614518', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2022-03-31 13:01:57.621845', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-03-31 13:01:57.630617', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-03-31 13:01:57.635064', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-03-31 13:01:57.690072', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2022-03-31 13:01:57.698941', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-03-31 13:01:57.708352', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2022-03-31 13:01:57.715084', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2022-03-31 13:01:57.721539', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2022-03-31 13:01:57.730203', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2022-03-31 13:01:57.734133', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2022-03-31 13:01:57.744878', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2022-03-31 13:01:59.01016', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2022-03-31 13:01:59.021613', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-03-31 13:01:59.040542', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-03-31 13:01:59.044916', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-03-31 13:01:59.248455', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-03-31 13:01:59.258141', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2022-03-31 13:01:59.399965', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2022-03-31 13:01:59.677019', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2022-03-31 13:01:59.683987', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2022-03-31 13:01:59.690958', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2022-03-31 13:01:59.702883', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-03-31 13:01:59.715185', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-03-31 13:01:59.741871', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-03-31 13:01:59.820069', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-03-31 13:02:00.226295', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2022-03-31 13:02:00.276411', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2022-03-31 13:02:00.285802', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2022-03-31 13:02:00.30079', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2022-03-31 13:02:00.323546', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2022-03-31 13:02:00.330923', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2022-03-31 13:02:00.339786', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2022-03-31 13:02:00.345773', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2022-03-31 13:02:00.446205', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2022-03-31 13:02:00.471543', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2022-03-31 13:02:00.478057', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2022-03-31 13:02:00.508261', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2022-03-31 13:02:00.533349', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2022-03-31 13:02:00.54011', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-03-31 13:02:00.550121', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-03-31 13:02:00.560065', 73, 'EXECUTED', '7:3979a0ae07ac465e920ca696532fc736', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-03-31 13:02:00.564521', 74, 'MARK_RAN', '7:5abfde4c259119d143bd2fbf49ac2bca', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-03-31 13:02:00.601081', 75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-03-31 13:02:00.634449', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2022-03-31 13:02:00.642496', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2022-03-31 13:02:00.646213', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2022-03-31 13:02:00.675857', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2022-03-31 13:02:00.67978', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-03-31 13:02:00.70386', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-03-31 13:02:00.712646', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-03-31 13:02:00.741725', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-03-31 13:02:00.75345', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-03-31 13:02:00.818304', 85, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2022-03-31 13:02:00.828899', 86, 'EXECUTED', '7:3dace6b144c11f53f1ad2c0361279b86', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2022-03-31 13:02:00.849003', 87, 'EXECUTED', '7:578d0b92077eaf2ab95ad0ec087aa903', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2022-03-31 13:02:00.871976', 88, 'EXECUTED', '7:c95abe90d962c57a09ecaee57972835d', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-31 13:02:00.881825', 89, 'EXECUTED', '7:f1313bcc2994a5c4dc1062ed6d8282d3', 'addColumn tableName=REALM; customChange', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-31 13:02:00.904415', 90, 'EXECUTED', '7:90d763b52eaffebefbcbde55f269508b', 'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-31 13:02:00.931713', 91, 'EXECUTED', '7:d554f0cb92b764470dccfa5e0014a7dd', 'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-31 13:02:00.951742', 92, 'EXECUTED', '7:73193e3ab3c35cf0f37ccea3bf783764', 'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-31 13:02:00.955622', 93, 'MARK_RAN', '7:90a1e74f92e9cbaa0c5eab80b8a037f3', 'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-31 13:02:00.985602', 94, 'EXECUTED', '7:5b9248f29cd047c200083cc6d8388b16', 'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-31 13:02:00.990014', 95, 'MARK_RAN', '7:64db59e44c374f13955489e8990d17a1', 'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('json-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-31 13:02:01.009961', 96, 'EXECUTED', '7:329a578cdb43262fff975f0a7f6cda60', 'addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-11019', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-31 13:02:01.161722', 97, 'EXECUTED', '7:fae0de241ac0fd0bbc2b380b85e4f567', 'createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-31 13:02:01.176142', 98, 'MARK_RAN', '7:075d54e9180f49bb0c64ca4218936e81', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-revert', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-31 13:02:01.201712', 99, 'MARK_RAN', '7:06499836520f4f6b3d05e35a59324910', 'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-31 13:02:01.243736', 100, 'EXECUTED', '7:fad08e83c77d0171ec166bc9bc5d390a', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-31 13:02:01.249128', 101, 'MARK_RAN', '7:3d2b23076e59c6f70bae703aa01be35b', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-17267-add-index-to-user-attributes', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-31 13:02:01.291976', 102, 'EXECUTED', '7:1a7f28ff8d9e53aeb879d76ea3d9341a', 'createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-18146-add-saml-art-binding-identifier', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-31 13:02:01.311891', 103, 'EXECUTED', '7:2fd554456fed4a82c698c555c5b751b6', 'customChange', '', NULL, '3.5.4', NULL, NULL, '8731714599');
INSERT INTO public.databasechangelog VALUES ('15.0.0-KEYCLOAK-18467', 'keycloak', 'META-INF/jpa-changelog-15.0.0.xml', '2022-03-31 13:02:01.327911', 104, 'EXECUTED', '7:b06356d66c2790ecc2ae54ba0458397a', 'addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...', '', NULL, '3.5.4', NULL, NULL, '8731714599');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1001, false, NULL, NULL);


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.default_client_scope VALUES ('master', '5913a083-f959-47f0-a65b-534b7a367725', false);
INSERT INTO public.default_client_scope VALUES ('master', 'acada3e9-a709-4ae5-9691-22fa1b461109', true);
INSERT INTO public.default_client_scope VALUES ('master', '18548663-faf3-454b-947c-b3a4977e928a', true);
INSERT INTO public.default_client_scope VALUES ('master', '9c214c87-006f-440c-a187-1b2687dd649c', true);
INSERT INTO public.default_client_scope VALUES ('master', 'a2875101-8e27-4043-995a-440e76bd68fb', false);
INSERT INTO public.default_client_scope VALUES ('master', '92bacdbc-fee2-4c02-b310-7419899e7fdd', false);
INSERT INTO public.default_client_scope VALUES ('master', 'e39a226a-ac5d-4414-914e-0d0f7c2f0753', true);
INSERT INTO public.default_client_scope VALUES ('master', 'f40652a1-ba66-4c66-8ce2-b7f49044dd7b', true);
INSERT INTO public.default_client_scope VALUES ('master', 'd83e96fb-9b7d-4a56-bc3e-d5a30665adf1', false);
INSERT INTO public.default_client_scope VALUES ('parent-template', '8418a2a8-ce3f-413c-abfe-993e120485c2', false);
INSERT INTO public.default_client_scope VALUES ('parent-template', '117033eb-def4-4b04-a08b-780a0301b81c', true);
INSERT INTO public.default_client_scope VALUES ('parent-template', 'f318802c-fe18-464b-9ede-3afeea29ca8a', true);
INSERT INTO public.default_client_scope VALUES ('parent-template', '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6', true);
INSERT INTO public.default_client_scope VALUES ('parent-template', 'c731bf75-5798-4a55-b13a-8204dc0237e3', false);
INSERT INTO public.default_client_scope VALUES ('parent-template', 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b', false);
INSERT INTO public.default_client_scope VALUES ('parent-template', '1f046dd2-6c70-4dd1-aa95-68059d84dcf3', true);
INSERT INTO public.default_client_scope VALUES ('parent-template', '696124a2-cd43-47c2-8c67-3907af107470', true);
INSERT INTO public.default_client_scope VALUES ('parent-template', '1db64da0-add0-41ee-aa19-182e59293840', false);


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.keycloak_role VALUES ('b980df10-d53e-47fd-b9da-c9b8c7d63743', 'master', false, '${role_default-roles}', 'default-roles-master', 'master', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'master', false, '${role_admin}', 'admin', 'master', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('4f7daa00-e1a0-4b4c-9c52-11aa804c2aff', 'master', false, '${role_create-realm}', 'create-realm', 'master', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('f0031d59-06e5-4d69-ba7e-49b4b0b907c0', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_create-client}', 'create-client', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('26347411-5b00-4775-8cbf-1373fa91afaa', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_view-realm}', 'view-realm', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('30f1d930-d19b-42e1-8e66-e4060325697d', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_view-users}', 'view-users', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('726cea80-543b-4de5-8f08-7ae4e45553c1', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_view-clients}', 'view-clients', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('93bf117e-77e5-4daa-9080-9abd20da49ba', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_view-events}', 'view-events', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('ae7eb019-0e60-455a-b83d-7d33a3009ac9', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('bdbb046e-5111-4858-9629-f2f45346d911', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_view-authorization}', 'view-authorization', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('5d3482ad-0f53-4340-829f-1efb7b6a606a', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_manage-realm}', 'manage-realm', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('3c91965d-81dd-4b7a-a55c-6ca6841a34c8', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_manage-users}', 'manage-users', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('859d34d2-4a8d-4886-9404-8bedc53aa122', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_manage-clients}', 'manage-clients', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('3b901a00-9e6a-48e0-97a1-c122f9c93b36', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_manage-events}', 'manage-events', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('e64ec327-00da-48e7-a003-05a7d4038f2f', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('22e05e21-1b89-4147-b9c5-63cb81724429', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_manage-authorization}', 'manage-authorization', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('6be00505-a7bd-4a3b-8873-90f747632bab', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_query-users}', 'query-users', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('43492616-4ec3-48b6-a88d-7120843fe3bd', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_query-clients}', 'query-clients', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('7a71c658-7ac5-4794-9f0c-2a3ed7739b4c', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_query-realms}', 'query-realms', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('96f6cfdc-6edb-4cf3-95f2-18e861d43b7b', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_query-groups}', 'query-groups', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('cf14bb4a-d327-4ecd-b383-bcc6233bd995', '6eff441c-7aab-467e-a2ec-c159c0e45539', true, '${role_view-profile}', 'view-profile', 'master', '6eff441c-7aab-467e-a2ec-c159c0e45539', NULL);
INSERT INTO public.keycloak_role VALUES ('4de78aa3-e68c-4cde-8f89-cfc1aa723789', '6eff441c-7aab-467e-a2ec-c159c0e45539', true, '${role_manage-account}', 'manage-account', 'master', '6eff441c-7aab-467e-a2ec-c159c0e45539', NULL);
INSERT INTO public.keycloak_role VALUES ('1f04a612-2675-4cf4-8866-898f66dbf535', '6eff441c-7aab-467e-a2ec-c159c0e45539', true, '${role_manage-account-links}', 'manage-account-links', 'master', '6eff441c-7aab-467e-a2ec-c159c0e45539', NULL);
INSERT INTO public.keycloak_role VALUES ('c768d3b6-178d-4072-93b5-a1b24e8ccd83', '6eff441c-7aab-467e-a2ec-c159c0e45539', true, '${role_view-applications}', 'view-applications', 'master', '6eff441c-7aab-467e-a2ec-c159c0e45539', NULL);
INSERT INTO public.keycloak_role VALUES ('a7195bcd-e83c-4ac5-9985-835fbd908104', '6eff441c-7aab-467e-a2ec-c159c0e45539', true, '${role_view-consent}', 'view-consent', 'master', '6eff441c-7aab-467e-a2ec-c159c0e45539', NULL);
INSERT INTO public.keycloak_role VALUES ('b0008429-2ccf-4797-b897-86876855fa98', '6eff441c-7aab-467e-a2ec-c159c0e45539', true, '${role_manage-consent}', 'manage-consent', 'master', '6eff441c-7aab-467e-a2ec-c159c0e45539', NULL);
INSERT INTO public.keycloak_role VALUES ('3e60dfbf-9672-4eb0-b190-1d56507a06a7', '6eff441c-7aab-467e-a2ec-c159c0e45539', true, '${role_delete-account}', 'delete-account', 'master', '6eff441c-7aab-467e-a2ec-c159c0e45539', NULL);
INSERT INTO public.keycloak_role VALUES ('7a0c3fd0-1d14-4639-8718-3bae7b3260a6', '43ac882b-a9c0-4e8a-8851-3d3419ed570e', true, '${role_read-token}', 'read-token', 'master', '43ac882b-a9c0-4e8a-8851-3d3419ed570e', NULL);
INSERT INTO public.keycloak_role VALUES ('014cb29d-1e5f-4e0b-a8e4-0e5494d6ae10', '7af949cd-12c7-4505-9df1-b1f682a178c9', true, '${role_impersonation}', 'impersonation', 'master', '7af949cd-12c7-4505-9df1-b1f682a178c9', NULL);
INSERT INTO public.keycloak_role VALUES ('097545b4-6822-4b59-afae-acb57314cb32', 'master', false, '${role_offline-access}', 'offline_access', 'master', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('026ddd93-c1e5-4904-abbc-e5988b190f35', 'master', false, '${role_uma_authorization}', 'uma_authorization', 'master', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('f04d71df-ade0-4368-a25b-a242601f18f2', 'parent-template', false, '${role_default-roles}', 'default-roles-parent-template', 'parent-template', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('b110bc32-cf53-4db6-ab4b-955d1c4ea4ee', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_create-client}', 'create-client', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('aeccdf0c-e560-40b4-a06f-86a551acd7bc', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_view-realm}', 'view-realm', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('6ab9e921-80d1-4915-b4dc-e4e3ae400e72', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_view-users}', 'view-users', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('7abca55f-39e3-49c8-92bd-8625707a85b3', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_view-clients}', 'view-clients', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('3a566ee9-c68c-42d7-91a9-d4f7f78d83b5', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_view-events}', 'view-events', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('c0d874bc-68d6-4ee3-bd57-be190c652eaf', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('4ef5227e-6ae7-42ff-a6c2-13637076bf92', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_view-authorization}', 'view-authorization', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('5e6335a4-47e1-4702-8d54-0a686f8afa9b', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_manage-realm}', 'manage-realm', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('16473847-934b-489f-ac4c-82f78d4347fe', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_manage-users}', 'manage-users', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('b314bb9e-a0f6-4f9e-9f4b-2424d1415f34', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_manage-clients}', 'manage-clients', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('e4440dbd-90cf-4560-b483-1315ba5d1f52', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_manage-events}', 'manage-events', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('11326423-14e2-411d-96a2-513df1214d92', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('0b7ab232-5e69-4a17-be18-8287e3e0d559', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_manage-authorization}', 'manage-authorization', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('e4f311ff-268e-44fb-add8-08fb8c994906', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_query-users}', 'query-users', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('02670718-5483-42f9-8b6c-3c7990f469c3', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_query-clients}', 'query-clients', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('5d721c4d-8970-472b-a0a0-c52baef8c520', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_query-realms}', 'query-realms', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('2a12db3e-fc31-492e-a170-1ec962282a98', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_query-groups}', 'query-groups', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('d8b6f5f4-ec33-4676-a806-cfb7aaff9045', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_realm-admin}', 'realm-admin', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('3b406356-cf20-4ca9-b2cb-124f6adab757', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_create-client}', 'create-client', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('a4727c2e-0e41-4eba-a195-b45eb8c48e46', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_view-realm}', 'view-realm', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('75ce6690-d8db-4556-818d-da664e75f04c', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_view-users}', 'view-users', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('bb03cd70-13b2-48b7-b15b-f6d254b72c1a', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_view-clients}', 'view-clients', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('a778190f-6932-4104-a9bf-65b275a8463f', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_view-events}', 'view-events', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('05551764-c032-4bda-b6f4-7c873c88f9b0', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_view-identity-providers}', 'view-identity-providers', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('677ec15d-7275-4096-a3ce-7ac122a287d4', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_view-authorization}', 'view-authorization', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('68850c4e-1baa-461b-ae27-63fd70015952', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_manage-realm}', 'manage-realm', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('95bbdd43-6d81-47af-adf1-bee3074e4944', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_manage-users}', 'manage-users', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('18e66189-98c9-4015-b348-dcd52a42c39d', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_manage-clients}', 'manage-clients', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('e92bfefb-93fa-47f1-8849-63702a6e57d1', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_manage-events}', 'manage-events', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('39bb2d87-f014-4ce2-a019-ebfb43850f7c', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('ba2277be-ff53-476a-bee9-6932cf10850f', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_manage-authorization}', 'manage-authorization', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('bfe109ad-7b29-4513-bd6e-6f11861245f3', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_query-users}', 'query-users', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('0eb04dbd-0486-4dca-a8a2-4ba6ca0701a5', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_query-clients}', 'query-clients', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('e5a84954-9a8e-4e5b-acad-9877d6d15eb9', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_query-realms}', 'query-realms', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('6ec9dcd5-bcee-43aa-91c8-eb64bda5aef4', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_query-groups}', 'query-groups', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('5ec9e687-e01d-443e-9b5e-2f5e8b3e163e', '88b896f1-605b-49ca-8c64-1423555d4fc2', true, '${role_view-profile}', 'view-profile', 'parent-template', '88b896f1-605b-49ca-8c64-1423555d4fc2', NULL);
INSERT INTO public.keycloak_role VALUES ('e55e8b24-308e-4d85-b06f-dd77e72423c5', '88b896f1-605b-49ca-8c64-1423555d4fc2', true, '${role_manage-account}', 'manage-account', 'parent-template', '88b896f1-605b-49ca-8c64-1423555d4fc2', NULL);
INSERT INTO public.keycloak_role VALUES ('46297048-7508-4abe-aefd-ea5f575662ac', '88b896f1-605b-49ca-8c64-1423555d4fc2', true, '${role_manage-account-links}', 'manage-account-links', 'parent-template', '88b896f1-605b-49ca-8c64-1423555d4fc2', NULL);
INSERT INTO public.keycloak_role VALUES ('a2cb0d6c-cba6-4a71-be51-2bb6c248a227', '88b896f1-605b-49ca-8c64-1423555d4fc2', true, '${role_view-applications}', 'view-applications', 'parent-template', '88b896f1-605b-49ca-8c64-1423555d4fc2', NULL);
INSERT INTO public.keycloak_role VALUES ('42fb8096-c943-41b3-bd57-e999b3ac37d2', '88b896f1-605b-49ca-8c64-1423555d4fc2', true, '${role_view-consent}', 'view-consent', 'parent-template', '88b896f1-605b-49ca-8c64-1423555d4fc2', NULL);
INSERT INTO public.keycloak_role VALUES ('b9a4b881-38fe-4e03-ad84-403a72fdfaae', '88b896f1-605b-49ca-8c64-1423555d4fc2', true, '${role_manage-consent}', 'manage-consent', 'parent-template', '88b896f1-605b-49ca-8c64-1423555d4fc2', NULL);
INSERT INTO public.keycloak_role VALUES ('7e8257c8-c488-4852-ba87-e0fe6afbe716', '88b896f1-605b-49ca-8c64-1423555d4fc2', true, '${role_delete-account}', 'delete-account', 'parent-template', '88b896f1-605b-49ca-8c64-1423555d4fc2', NULL);
INSERT INTO public.keycloak_role VALUES ('4b556672-174a-4b8a-a068-5f7732f2e1ae', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', true, '${role_impersonation}', 'impersonation', 'master', '9b6f8857-c6c4-48e6-951d-a45f290a3e82', NULL);
INSERT INTO public.keycloak_role VALUES ('10dc4ea6-da66-4276-87dd-7f85e1da5456', 'f53779a4-0976-4de3-815f-117b48bb478a', true, '${role_impersonation}', 'impersonation', 'parent-template', 'f53779a4-0976-4de3-815f-117b48bb478a', NULL);
INSERT INTO public.keycloak_role VALUES ('dc8aed5a-98b7-4a08-a4bd-967c1123d0ca', '87064351-10df-4638-84d9-b242f925af79', true, '${role_read-token}', 'read-token', 'parent-template', '87064351-10df-4638-84d9-b242f925af79', NULL);
INSERT INTO public.keycloak_role VALUES ('cf4d1129-6250-4550-8750-31cdab07bab5', 'parent-template', false, '${role_offline-access}', 'offline_access', 'parent-template', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('e70f7eb3-6981-4fa5-af4c-5ffc0a22c66c', 'parent-template', false, '${role_uma_authorization}', 'uma_authorization', 'parent-template', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('3be84428-26ce-4c41-b4a7-2436bc699418', '5d503869-9917-4d5e-92fb-a965be3efa9e', true, NULL, 'uma_protection', 'parent-template', '5d503869-9917-4d5e-92fb-a965be3efa9e', NULL);
INSERT INTO public.keycloak_role VALUES ('1504064e-7e35-45c1-b66c-6339e9dc22dd', '5d503869-9917-4d5e-92fb-a965be3efa9e', true, 'Parent Template default user', 'user', 'parent-template', '5d503869-9917-4d5e-92fb-a965be3efa9e', NULL);
INSERT INTO public.keycloak_role VALUES ('ce693ea5-de33-4c39-8c43-234013f3596a', '5d503869-9917-4d5e-92fb-a965be3efa9e', true, 'Parent Template administrator', 'admin', 'parent-template', '5d503869-9917-4d5e-92fb-a965be3efa9e', NULL);
INSERT INTO public.keycloak_role VALUES ('c373822a-7ecb-4d44-8743-55b69db581a5', 'parent-template', false, NULL, 'app-user', 'parent-template', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('e0cdceb3-7276-4533-b23a-c182a8514b20', 'parent-template', false, NULL, 'app-admin', 'parent-template', NULL, NULL);


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.migration_model VALUES ('1gh2o', '16.1.1', 1648731726);


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.policy_config VALUES ('708b76cc-7be5-4364-bb48-bbe8ec696690', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config VALUES ('e1ec6296-0120-482d-abbd-5d5f25c19f2a', 'defaultResourceType', 'urn:parent-template-login-app:resources:default');


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.protocol_mapper VALUES ('d6026949-4d2a-4bb8-8e62-2eb4505750bf', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '47f81b5f-526e-4624-8032-179ed5f91118', NULL);
INSERT INTO public.protocol_mapper VALUES ('81f1271a-34d9-4193-867f-e63291af95b8', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'cd4d3103-f083-4933-afc8-6399043aaa66', NULL);
INSERT INTO public.protocol_mapper VALUES ('73857222-f550-4a92-9116-420da95715a0', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'acada3e9-a709-4ae5-9691-22fa1b461109');
INSERT INTO public.protocol_mapper VALUES ('27c38f7b-4a10-4ddc-9d2f-16a2fa36c7fe', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('384e8ddd-69c9-461d-8509-447bee0ba851', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('8b47e6fd-d301-44c0-a7f8-dc7fc7e6d885', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('605e20f7-c94a-425f-8516-61c2ef355b55', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('f58af00a-1718-4525-bdc2-83b4f86096bc', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('89224357-fea1-4d71-a12f-31ab026b6682', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('bcf9ca9d-6fd6-430e-85e8-cc6bb0bad56c', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('0a69442b-37d3-417a-852a-d58dc0117e74', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('48d40012-fee7-4c7c-9098-38ede5164ae5', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('0dd2756f-c2c9-48ca-91b9-dc72a25208dc', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('4a6dcd18-24e6-4be9-a4d3-ec588aae34b0', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('2259f110-ad4b-45a4-be67-38e902c444b0', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('21090be0-c399-4b12-9423-f514511ed564', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('a5791205-cd0b-43ce-8b09-740d0e8f2938', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '18548663-faf3-454b-947c-b3a4977e928a');
INSERT INTO public.protocol_mapper VALUES ('6488d968-af7d-4cd0-97d5-f7830c371f6c', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '9c214c87-006f-440c-a187-1b2687dd649c');
INSERT INTO public.protocol_mapper VALUES ('6e6389d9-9447-42b0-8aee-62390557efdf', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '9c214c87-006f-440c-a187-1b2687dd649c');
INSERT INTO public.protocol_mapper VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'a2875101-8e27-4043-995a-440e76bd68fb');
INSERT INTO public.protocol_mapper VALUES ('3247c5e0-9e52-4402-b97b-ffff0376acf9', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '92bacdbc-fee2-4c02-b310-7419899e7fdd');
INSERT INTO public.protocol_mapper VALUES ('485c23af-fd60-4ac5-9788-867795257641', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '92bacdbc-fee2-4c02-b310-7419899e7fdd');
INSERT INTO public.protocol_mapper VALUES ('cc32fc6c-c9c8-4aeb-9641-3909150df4a5', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'e39a226a-ac5d-4414-914e-0d0f7c2f0753');
INSERT INTO public.protocol_mapper VALUES ('6c6156e6-7f63-4902-9ab1-9accb182bf89', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'e39a226a-ac5d-4414-914e-0d0f7c2f0753');
INSERT INTO public.protocol_mapper VALUES ('c2b24b62-a8b1-4897-8dee-aa467c7442a0', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'e39a226a-ac5d-4414-914e-0d0f7c2f0753');
INSERT INTO public.protocol_mapper VALUES ('b6406c89-1ceb-487e-8a97-583f72d6569f', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'f40652a1-ba66-4c66-8ce2-b7f49044dd7b');
INSERT INTO public.protocol_mapper VALUES ('a9a91e3a-580a-49c6-b428-e5f6f314f015', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd83e96fb-9b7d-4a56-bc3e-d5a30665adf1');
INSERT INTO public.protocol_mapper VALUES ('8d794131-0d04-4010-90ac-c1ef8b5b51f2', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'd83e96fb-9b7d-4a56-bc3e-d5a30665adf1');
INSERT INTO public.protocol_mapper VALUES ('7af89802-d25b-4d8a-91bc-cb0e38bb8b81', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '0bb37522-ffa3-4d31-b308-c999e72a48e5', NULL);
INSERT INTO public.protocol_mapper VALUES ('b990412c-1ff1-4f04-96bd-31404a78d8fe', 'role list', 'saml', 'saml-role-list-mapper', NULL, '117033eb-def4-4b04-a08b-780a0301b81c');
INSERT INTO public.protocol_mapper VALUES ('823aac4d-c9f6-419e-9220-b0cce310d44a', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('caeeefed-5401-47fc-8376-7b073e230a3d', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('9e86a8c6-45f9-473f-b83e-6175e1d218ca', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('34fc72b7-3fad-4f34-950d-29ffeff748fc', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('5b9979c3-ba6d-4705-8c61-d26670fceee9', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('53308fd3-059f-4908-8b5c-937b419fdc27', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('aa495c09-cac1-4a0a-9f87-a2db60d9a891', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('bfd89c3e-655c-4ea0-abd9-5807541340b5', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('214c4ec6-063d-4a48-b8ae-eb47b20bcaab', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('62622d17-0432-4da8-b773-de5ca615ecb8', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('df825b49-a180-4b14-86f6-dd19edc8b818', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('9625a52d-1384-4669-9f91-76ea7896bc1f', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('286a3c02-ce53-4cda-aecd-12152732b4ee', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('bbc4652b-3424-4b2d-be69-ad90c6c5fd24', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'f318802c-fe18-464b-9ede-3afeea29ca8a');
INSERT INTO public.protocol_mapper VALUES ('8778753b-058d-4278-a7dd-47a99b3d86a7', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6');
INSERT INTO public.protocol_mapper VALUES ('fe8bdaad-3908-4a75-8af8-bf1e33f28595', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1b6d97d0-e3a0-4d38-be1f-b6335f86cdb6');
INSERT INTO public.protocol_mapper VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'c731bf75-5798-4a55-b13a-8204dc0237e3');
INSERT INTO public.protocol_mapper VALUES ('48cd5f69-9a99-4732-89d6-7e5daec7f58d', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b');
INSERT INTO public.protocol_mapper VALUES ('48f1b4b1-c9c3-4fee-a09d-d291b25cfd2a', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a49b27ac-7301-4b0c-88a6-8e73ad56cb0b');
INSERT INTO public.protocol_mapper VALUES ('3f8f35b1-ea13-45e2-98f8-8c1256b338ba', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '1f046dd2-6c70-4dd1-aa95-68059d84dcf3');
INSERT INTO public.protocol_mapper VALUES ('c3e4ac51-e316-4915-895f-0f95a0d3b5e9', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '1f046dd2-6c70-4dd1-aa95-68059d84dcf3');
INSERT INTO public.protocol_mapper VALUES ('a3fdb654-8b64-49c1-bc04-efa1b9d7df81', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '1f046dd2-6c70-4dd1-aa95-68059d84dcf3');
INSERT INTO public.protocol_mapper VALUES ('4cd090ef-8490-47bc-b1b6-4ddc9302c70e', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '696124a2-cd43-47c2-8c67-3907af107470');
INSERT INTO public.protocol_mapper VALUES ('4575d0a6-2bdb-491f-a9ac-740c9f77af6d', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1db64da0-add0-41ee-aa19-182e59293840');
INSERT INTO public.protocol_mapper VALUES ('13ab85e2-9832-4456-a8c8-c98c61546caf', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '1db64da0-add0-41ee-aa19-182e59293840');
INSERT INTO public.protocol_mapper VALUES ('3adecd78-1866-4061-afe3-e760bd93f3ea', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '49f50ce3-f706-4303-b307-f1f6a6adb185', NULL);
INSERT INTO public.protocol_mapper VALUES ('a3f29380-d2a2-491b-9ff5-4d59fc49afc4', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '5d503869-9917-4d5e-92fb-a965be3efa9e', NULL);
INSERT INTO public.protocol_mapper VALUES ('51639cf4-a28e-463c-8f70-1a53b82b3f63', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '5d503869-9917-4d5e-92fb-a965be3efa9e', NULL);
INSERT INTO public.protocol_mapper VALUES ('81077bd3-1540-43f2-9c8b-2f426f692daa', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '5d503869-9917-4d5e-92fb-a965be3efa9e', NULL);


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.protocol_mapper_config VALUES ('81f1271a-34d9-4193-867f-e63291af95b8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('81f1271a-34d9-4193-867f-e63291af95b8', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('81f1271a-34d9-4193-867f-e63291af95b8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('81f1271a-34d9-4193-867f-e63291af95b8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('81f1271a-34d9-4193-867f-e63291af95b8', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('81f1271a-34d9-4193-867f-e63291af95b8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('73857222-f550-4a92-9116-420da95715a0', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('73857222-f550-4a92-9116-420da95715a0', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('73857222-f550-4a92-9116-420da95715a0', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('27c38f7b-4a10-4ddc-9d2f-16a2fa36c7fe', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27c38f7b-4a10-4ddc-9d2f-16a2fa36c7fe', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27c38f7b-4a10-4ddc-9d2f-16a2fa36c7fe', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('384e8ddd-69c9-461d-8509-447bee0ba851', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('384e8ddd-69c9-461d-8509-447bee0ba851', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('384e8ddd-69c9-461d-8509-447bee0ba851', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('384e8ddd-69c9-461d-8509-447bee0ba851', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('384e8ddd-69c9-461d-8509-447bee0ba851', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('384e8ddd-69c9-461d-8509-447bee0ba851', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8b47e6fd-d301-44c0-a7f8-dc7fc7e6d885', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8b47e6fd-d301-44c0-a7f8-dc7fc7e6d885', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8b47e6fd-d301-44c0-a7f8-dc7fc7e6d885', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8b47e6fd-d301-44c0-a7f8-dc7fc7e6d885', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8b47e6fd-d301-44c0-a7f8-dc7fc7e6d885', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8b47e6fd-d301-44c0-a7f8-dc7fc7e6d885', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('605e20f7-c94a-425f-8516-61c2ef355b55', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('605e20f7-c94a-425f-8516-61c2ef355b55', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('605e20f7-c94a-425f-8516-61c2ef355b55', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('605e20f7-c94a-425f-8516-61c2ef355b55', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('605e20f7-c94a-425f-8516-61c2ef355b55', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('605e20f7-c94a-425f-8516-61c2ef355b55', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f58af00a-1718-4525-bdc2-83b4f86096bc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f58af00a-1718-4525-bdc2-83b4f86096bc', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f58af00a-1718-4525-bdc2-83b4f86096bc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f58af00a-1718-4525-bdc2-83b4f86096bc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f58af00a-1718-4525-bdc2-83b4f86096bc', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f58af00a-1718-4525-bdc2-83b4f86096bc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('89224357-fea1-4d71-a12f-31ab026b6682', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('89224357-fea1-4d71-a12f-31ab026b6682', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('89224357-fea1-4d71-a12f-31ab026b6682', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('89224357-fea1-4d71-a12f-31ab026b6682', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('89224357-fea1-4d71-a12f-31ab026b6682', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('89224357-fea1-4d71-a12f-31ab026b6682', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('bcf9ca9d-6fd6-430e-85e8-cc6bb0bad56c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bcf9ca9d-6fd6-430e-85e8-cc6bb0bad56c', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('bcf9ca9d-6fd6-430e-85e8-cc6bb0bad56c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bcf9ca9d-6fd6-430e-85e8-cc6bb0bad56c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bcf9ca9d-6fd6-430e-85e8-cc6bb0bad56c', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('bcf9ca9d-6fd6-430e-85e8-cc6bb0bad56c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0a69442b-37d3-417a-852a-d58dc0117e74', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0a69442b-37d3-417a-852a-d58dc0117e74', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0a69442b-37d3-417a-852a-d58dc0117e74', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0a69442b-37d3-417a-852a-d58dc0117e74', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0a69442b-37d3-417a-852a-d58dc0117e74', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0a69442b-37d3-417a-852a-d58dc0117e74', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('48d40012-fee7-4c7c-9098-38ede5164ae5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48d40012-fee7-4c7c-9098-38ede5164ae5', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('48d40012-fee7-4c7c-9098-38ede5164ae5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48d40012-fee7-4c7c-9098-38ede5164ae5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48d40012-fee7-4c7c-9098-38ede5164ae5', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('48d40012-fee7-4c7c-9098-38ede5164ae5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0dd2756f-c2c9-48ca-91b9-dc72a25208dc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0dd2756f-c2c9-48ca-91b9-dc72a25208dc', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0dd2756f-c2c9-48ca-91b9-dc72a25208dc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0dd2756f-c2c9-48ca-91b9-dc72a25208dc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0dd2756f-c2c9-48ca-91b9-dc72a25208dc', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0dd2756f-c2c9-48ca-91b9-dc72a25208dc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4a6dcd18-24e6-4be9-a4d3-ec588aae34b0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4a6dcd18-24e6-4be9-a4d3-ec588aae34b0', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4a6dcd18-24e6-4be9-a4d3-ec588aae34b0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4a6dcd18-24e6-4be9-a4d3-ec588aae34b0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4a6dcd18-24e6-4be9-a4d3-ec588aae34b0', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4a6dcd18-24e6-4be9-a4d3-ec588aae34b0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2259f110-ad4b-45a4-be67-38e902c444b0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2259f110-ad4b-45a4-be67-38e902c444b0', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2259f110-ad4b-45a4-be67-38e902c444b0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2259f110-ad4b-45a4-be67-38e902c444b0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2259f110-ad4b-45a4-be67-38e902c444b0', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2259f110-ad4b-45a4-be67-38e902c444b0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('21090be0-c399-4b12-9423-f514511ed564', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('21090be0-c399-4b12-9423-f514511ed564', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('21090be0-c399-4b12-9423-f514511ed564', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('21090be0-c399-4b12-9423-f514511ed564', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('21090be0-c399-4b12-9423-f514511ed564', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('21090be0-c399-4b12-9423-f514511ed564', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a5791205-cd0b-43ce-8b09-740d0e8f2938', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a5791205-cd0b-43ce-8b09-740d0e8f2938', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a5791205-cd0b-43ce-8b09-740d0e8f2938', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a5791205-cd0b-43ce-8b09-740d0e8f2938', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a5791205-cd0b-43ce-8b09-740d0e8f2938', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a5791205-cd0b-43ce-8b09-740d0e8f2938', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6488d968-af7d-4cd0-97d5-f7830c371f6c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6488d968-af7d-4cd0-97d5-f7830c371f6c', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6488d968-af7d-4cd0-97d5-f7830c371f6c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6488d968-af7d-4cd0-97d5-f7830c371f6c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6488d968-af7d-4cd0-97d5-f7830c371f6c', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6488d968-af7d-4cd0-97d5-f7830c371f6c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6e6389d9-9447-42b0-8aee-62390557efdf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6e6389d9-9447-42b0-8aee-62390557efdf', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6e6389d9-9447-42b0-8aee-62390557efdf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6e6389d9-9447-42b0-8aee-62390557efdf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6e6389d9-9447-42b0-8aee-62390557efdf', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6e6389d9-9447-42b0-8aee-62390557efdf', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da4f69c8-c98c-4489-90a1-d0d0084a0b12', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('3247c5e0-9e52-4402-b97b-ffff0376acf9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3247c5e0-9e52-4402-b97b-ffff0376acf9', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3247c5e0-9e52-4402-b97b-ffff0376acf9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3247c5e0-9e52-4402-b97b-ffff0376acf9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3247c5e0-9e52-4402-b97b-ffff0376acf9', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3247c5e0-9e52-4402-b97b-ffff0376acf9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('485c23af-fd60-4ac5-9788-867795257641', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('485c23af-fd60-4ac5-9788-867795257641', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('485c23af-fd60-4ac5-9788-867795257641', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('485c23af-fd60-4ac5-9788-867795257641', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('485c23af-fd60-4ac5-9788-867795257641', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('485c23af-fd60-4ac5-9788-867795257641', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cc32fc6c-c9c8-4aeb-9641-3909150df4a5', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('cc32fc6c-c9c8-4aeb-9641-3909150df4a5', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cc32fc6c-c9c8-4aeb-9641-3909150df4a5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cc32fc6c-c9c8-4aeb-9641-3909150df4a5', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cc32fc6c-c9c8-4aeb-9641-3909150df4a5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6c6156e6-7f63-4902-9ab1-9accb182bf89', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('6c6156e6-7f63-4902-9ab1-9accb182bf89', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6c6156e6-7f63-4902-9ab1-9accb182bf89', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6c6156e6-7f63-4902-9ab1-9accb182bf89', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6c6156e6-7f63-4902-9ab1-9accb182bf89', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a9a91e3a-580a-49c6-b428-e5f6f314f015', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a9a91e3a-580a-49c6-b428-e5f6f314f015', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a9a91e3a-580a-49c6-b428-e5f6f314f015', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a9a91e3a-580a-49c6-b428-e5f6f314f015', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a9a91e3a-580a-49c6-b428-e5f6f314f015', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a9a91e3a-580a-49c6-b428-e5f6f314f015', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8d794131-0d04-4010-90ac-c1ef8b5b51f2', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('8d794131-0d04-4010-90ac-c1ef8b5b51f2', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8d794131-0d04-4010-90ac-c1ef8b5b51f2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8d794131-0d04-4010-90ac-c1ef8b5b51f2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8d794131-0d04-4010-90ac-c1ef8b5b51f2', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8d794131-0d04-4010-90ac-c1ef8b5b51f2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b990412c-1ff1-4f04-96bd-31404a78d8fe', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('b990412c-1ff1-4f04-96bd-31404a78d8fe', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('b990412c-1ff1-4f04-96bd-31404a78d8fe', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('823aac4d-c9f6-419e-9220-b0cce310d44a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('823aac4d-c9f6-419e-9220-b0cce310d44a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('823aac4d-c9f6-419e-9220-b0cce310d44a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('caeeefed-5401-47fc-8376-7b073e230a3d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('caeeefed-5401-47fc-8376-7b073e230a3d', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('caeeefed-5401-47fc-8376-7b073e230a3d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('caeeefed-5401-47fc-8376-7b073e230a3d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('caeeefed-5401-47fc-8376-7b073e230a3d', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('caeeefed-5401-47fc-8376-7b073e230a3d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('9e86a8c6-45f9-473f-b83e-6175e1d218ca', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9e86a8c6-45f9-473f-b83e-6175e1d218ca', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9e86a8c6-45f9-473f-b83e-6175e1d218ca', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9e86a8c6-45f9-473f-b83e-6175e1d218ca', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9e86a8c6-45f9-473f-b83e-6175e1d218ca', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9e86a8c6-45f9-473f-b83e-6175e1d218ca', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('34fc72b7-3fad-4f34-950d-29ffeff748fc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('34fc72b7-3fad-4f34-950d-29ffeff748fc', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('34fc72b7-3fad-4f34-950d-29ffeff748fc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('34fc72b7-3fad-4f34-950d-29ffeff748fc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('34fc72b7-3fad-4f34-950d-29ffeff748fc', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('34fc72b7-3fad-4f34-950d-29ffeff748fc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('5b9979c3-ba6d-4705-8c61-d26670fceee9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5b9979c3-ba6d-4705-8c61-d26670fceee9', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('5b9979c3-ba6d-4705-8c61-d26670fceee9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5b9979c3-ba6d-4705-8c61-d26670fceee9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5b9979c3-ba6d-4705-8c61-d26670fceee9', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('5b9979c3-ba6d-4705-8c61-d26670fceee9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('53308fd3-059f-4908-8b5c-937b419fdc27', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('53308fd3-059f-4908-8b5c-937b419fdc27', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('53308fd3-059f-4908-8b5c-937b419fdc27', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('53308fd3-059f-4908-8b5c-937b419fdc27', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('53308fd3-059f-4908-8b5c-937b419fdc27', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('53308fd3-059f-4908-8b5c-937b419fdc27', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('aa495c09-cac1-4a0a-9f87-a2db60d9a891', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('aa495c09-cac1-4a0a-9f87-a2db60d9a891', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('aa495c09-cac1-4a0a-9f87-a2db60d9a891', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('aa495c09-cac1-4a0a-9f87-a2db60d9a891', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('aa495c09-cac1-4a0a-9f87-a2db60d9a891', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('aa495c09-cac1-4a0a-9f87-a2db60d9a891', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('bfd89c3e-655c-4ea0-abd9-5807541340b5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bfd89c3e-655c-4ea0-abd9-5807541340b5', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('bfd89c3e-655c-4ea0-abd9-5807541340b5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bfd89c3e-655c-4ea0-abd9-5807541340b5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bfd89c3e-655c-4ea0-abd9-5807541340b5', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('bfd89c3e-655c-4ea0-abd9-5807541340b5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('214c4ec6-063d-4a48-b8ae-eb47b20bcaab', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('214c4ec6-063d-4a48-b8ae-eb47b20bcaab', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('214c4ec6-063d-4a48-b8ae-eb47b20bcaab', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('214c4ec6-063d-4a48-b8ae-eb47b20bcaab', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('214c4ec6-063d-4a48-b8ae-eb47b20bcaab', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('214c4ec6-063d-4a48-b8ae-eb47b20bcaab', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('62622d17-0432-4da8-b773-de5ca615ecb8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('62622d17-0432-4da8-b773-de5ca615ecb8', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('62622d17-0432-4da8-b773-de5ca615ecb8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('62622d17-0432-4da8-b773-de5ca615ecb8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('62622d17-0432-4da8-b773-de5ca615ecb8', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('62622d17-0432-4da8-b773-de5ca615ecb8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('df825b49-a180-4b14-86f6-dd19edc8b818', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('df825b49-a180-4b14-86f6-dd19edc8b818', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('df825b49-a180-4b14-86f6-dd19edc8b818', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('df825b49-a180-4b14-86f6-dd19edc8b818', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('df825b49-a180-4b14-86f6-dd19edc8b818', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('df825b49-a180-4b14-86f6-dd19edc8b818', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('9625a52d-1384-4669-9f91-76ea7896bc1f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9625a52d-1384-4669-9f91-76ea7896bc1f', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9625a52d-1384-4669-9f91-76ea7896bc1f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9625a52d-1384-4669-9f91-76ea7896bc1f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9625a52d-1384-4669-9f91-76ea7896bc1f', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9625a52d-1384-4669-9f91-76ea7896bc1f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('286a3c02-ce53-4cda-aecd-12152732b4ee', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('286a3c02-ce53-4cda-aecd-12152732b4ee', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('286a3c02-ce53-4cda-aecd-12152732b4ee', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('286a3c02-ce53-4cda-aecd-12152732b4ee', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('286a3c02-ce53-4cda-aecd-12152732b4ee', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('286a3c02-ce53-4cda-aecd-12152732b4ee', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('bbc4652b-3424-4b2d-be69-ad90c6c5fd24', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bbc4652b-3424-4b2d-be69-ad90c6c5fd24', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('bbc4652b-3424-4b2d-be69-ad90c6c5fd24', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bbc4652b-3424-4b2d-be69-ad90c6c5fd24', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bbc4652b-3424-4b2d-be69-ad90c6c5fd24', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('bbc4652b-3424-4b2d-be69-ad90c6c5fd24', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8778753b-058d-4278-a7dd-47a99b3d86a7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8778753b-058d-4278-a7dd-47a99b3d86a7', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8778753b-058d-4278-a7dd-47a99b3d86a7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8778753b-058d-4278-a7dd-47a99b3d86a7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8778753b-058d-4278-a7dd-47a99b3d86a7', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8778753b-058d-4278-a7dd-47a99b3d86a7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fe8bdaad-3908-4a75-8af8-bf1e33f28595', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fe8bdaad-3908-4a75-8af8-bf1e33f28595', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fe8bdaad-3908-4a75-8af8-bf1e33f28595', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fe8bdaad-3908-4a75-8af8-bf1e33f28595', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fe8bdaad-3908-4a75-8af8-bf1e33f28595', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fe8bdaad-3908-4a75-8af8-bf1e33f28595', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('57898d01-cefa-473a-a84f-34787f3123dd', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('48cd5f69-9a99-4732-89d6-7e5daec7f58d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48cd5f69-9a99-4732-89d6-7e5daec7f58d', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('48cd5f69-9a99-4732-89d6-7e5daec7f58d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48cd5f69-9a99-4732-89d6-7e5daec7f58d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48cd5f69-9a99-4732-89d6-7e5daec7f58d', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('48cd5f69-9a99-4732-89d6-7e5daec7f58d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('48f1b4b1-c9c3-4fee-a09d-d291b25cfd2a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48f1b4b1-c9c3-4fee-a09d-d291b25cfd2a', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('48f1b4b1-c9c3-4fee-a09d-d291b25cfd2a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48f1b4b1-c9c3-4fee-a09d-d291b25cfd2a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48f1b4b1-c9c3-4fee-a09d-d291b25cfd2a', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('48f1b4b1-c9c3-4fee-a09d-d291b25cfd2a', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3f8f35b1-ea13-45e2-98f8-8c1256b338ba', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('3f8f35b1-ea13-45e2-98f8-8c1256b338ba', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3f8f35b1-ea13-45e2-98f8-8c1256b338ba', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3f8f35b1-ea13-45e2-98f8-8c1256b338ba', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3f8f35b1-ea13-45e2-98f8-8c1256b338ba', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('c3e4ac51-e316-4915-895f-0f95a0d3b5e9', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('c3e4ac51-e316-4915-895f-0f95a0d3b5e9', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('c3e4ac51-e316-4915-895f-0f95a0d3b5e9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c3e4ac51-e316-4915-895f-0f95a0d3b5e9', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c3e4ac51-e316-4915-895f-0f95a0d3b5e9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4575d0a6-2bdb-491f-a9ac-740c9f77af6d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4575d0a6-2bdb-491f-a9ac-740c9f77af6d', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4575d0a6-2bdb-491f-a9ac-740c9f77af6d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4575d0a6-2bdb-491f-a9ac-740c9f77af6d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4575d0a6-2bdb-491f-a9ac-740c9f77af6d', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4575d0a6-2bdb-491f-a9ac-740c9f77af6d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('13ab85e2-9832-4456-a8c8-c98c61546caf', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('13ab85e2-9832-4456-a8c8-c98c61546caf', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('13ab85e2-9832-4456-a8c8-c98c61546caf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('13ab85e2-9832-4456-a8c8-c98c61546caf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('13ab85e2-9832-4456-a8c8-c98c61546caf', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('13ab85e2-9832-4456-a8c8-c98c61546caf', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3adecd78-1866-4061-afe3-e760bd93f3ea', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3adecd78-1866-4061-afe3-e760bd93f3ea', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3adecd78-1866-4061-afe3-e760bd93f3ea', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3adecd78-1866-4061-afe3-e760bd93f3ea', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3adecd78-1866-4061-afe3-e760bd93f3ea', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3adecd78-1866-4061-afe3-e760bd93f3ea', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a3f29380-d2a2-491b-9ff5-4d59fc49afc4', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('a3f29380-d2a2-491b-9ff5-4d59fc49afc4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a3f29380-d2a2-491b-9ff5-4d59fc49afc4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a3f29380-d2a2-491b-9ff5-4d59fc49afc4', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a3f29380-d2a2-491b-9ff5-4d59fc49afc4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('51639cf4-a28e-463c-8f70-1a53b82b3f63', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('51639cf4-a28e-463c-8f70-1a53b82b3f63', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('51639cf4-a28e-463c-8f70-1a53b82b3f63', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('51639cf4-a28e-463c-8f70-1a53b82b3f63', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('51639cf4-a28e-463c-8f70-1a53b82b3f63', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('81077bd3-1540-43f2-9c8b-2f426f692daa', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('81077bd3-1540-43f2-9c8b-2f426f692daa', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('81077bd3-1540-43f2-9c8b-2f426f692daa', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('81077bd3-1540-43f2-9c8b-2f426f692daa', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('81077bd3-1540-43f2-9c8b-2f426f692daa', 'String', 'jsonType.label');


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.realm VALUES ('master', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '7af949cd-12c7-4505-9df1-b1f682a178c9', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '58e94817-50de-44f5-9448-cdf8dd84cecd', '57f7d0b2-e78a-43f2-a059-91e28916d384', '0669636e-19a4-424f-bb4b-8296055e79ca', 'fc675049-c9f2-43b1-83a3-eaf36435f11a', 'af2f5fc2-f9ab-4f16-8835-4c630196bb0b', 2592000, false, 900, true, false, '1911a259-1a0b-472a-9a03-f50bd524e111', 0, false, 0, 0, 'b980df10-d53e-47fd-b9da-c9b8c7d63743');
INSERT INTO public.realm VALUES ('parent-template', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'parent-template', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '9b6f8857-c6c4-48e6-951d-a45f290a3e82', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '82364aa2-40d8-4f92-8309-a5958ab8dac3', '837430a4-78ca-44eb-95d3-8147a395d0eb', '2fcc99e3-cddb-491d-9e65-20a1dff91bbf', '7f4a07d7-e2c0-49dd-9f1c-ebae0a3f89a2', 'cc3959aa-9008-46cd-ac52-63b38ae2cbdf', 2592000, false, 900, true, false, '1dbe2914-ca96-4da0-9529-e0c04dedc573', 0, false, 0, 0, 'f04d71df-ade0-4368-a25b-a242601f18f2');


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', 'master', '');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'master', 'nosniff');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'master', 'none');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'master', 'SAMEORIGIN');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'master', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', 'master', '1; mode=block');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'master', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'master', 'false');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'master', 'false');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', 'master', '900');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', 'master', '60');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', 'master', '60');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', 'master', '1000');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', 'master', '43200');
INSERT INTO public.realm_attribute VALUES ('failureFactor', 'master', '30');
INSERT INTO public.realm_attribute VALUES ('displayName', 'master', 'Keycloak');
INSERT INTO public.realm_attribute VALUES ('displayNameHtml', 'master', '<div class="kc-logo-text"><span>Keycloak</span></div>');
INSERT INTO public.realm_attribute VALUES ('defaultSignatureAlgorithm', 'master', 'RS256');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'master', 'false');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', 'master', '5184000');
INSERT INTO public.realm_attribute VALUES ('oauth2DeviceCodeLifespan', 'parent-template', '600');
INSERT INTO public.realm_attribute VALUES ('oauth2DevicePollingInterval', 'parent-template', '5');
INSERT INTO public.realm_attribute VALUES ('cibaBackchannelTokenDeliveryMode', 'parent-template', 'poll');
INSERT INTO public.realm_attribute VALUES ('cibaExpiresIn', 'parent-template', '120');
INSERT INTO public.realm_attribute VALUES ('cibaInterval', 'parent-template', '5');
INSERT INTO public.realm_attribute VALUES ('cibaAuthRequestedUserHint', 'parent-template', 'login_hint');
INSERT INTO public.realm_attribute VALUES ('parRequestUriLifespan', 'parent-template', '60');
INSERT INTO public.realm_attribute VALUES ('userProfileEnabled', 'parent-template', 'false');
INSERT INTO public.realm_attribute VALUES ('displayName', 'parent-template', 'Parent Template');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'parent-template', 'false');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'parent-template', 'false');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', 'parent-template', '900');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', 'parent-template', '60');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', 'parent-template', '60');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', 'parent-template', '1000');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', 'parent-template', '43200');
INSERT INTO public.realm_attribute VALUES ('failureFactor', 'parent-template', '30');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', 'parent-template', '43200');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', 'parent-template', '300');
INSERT INTO public.realm_attribute VALUES ('defaultSignatureAlgorithm', 'parent-template', 'RS256');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'parent-template', 'false');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', 'parent-template', '5184000');
INSERT INTO public.realm_attribute VALUES ('clientSessionIdleTimeout', 'parent-template', '0');
INSERT INTO public.realm_attribute VALUES ('clientSessionMaxLifespan', 'parent-template', '0');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionIdleTimeout', 'parent-template', '0');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionMaxLifespan', 'parent-template', '0');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityName', 'parent-template', 'keycloak');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithms', 'parent-template', 'ES256');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpId', 'parent-template', '');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreference', 'parent-template', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachment', 'parent-template', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKey', 'parent-template', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirement', 'parent-template', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeout', 'parent-template', '0');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'parent-template', 'false');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'parent-template', 'keycloak');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'parent-template', 'ES256');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpIdPasswordless', 'parent-template', '');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'parent-template', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'parent-template', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'parent-template', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'parent-template', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeoutPasswordless', 'parent-template', '0');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'parent-template', 'false');
INSERT INTO public.realm_attribute VALUES ('client-policies.profiles', 'parent-template', '{"profiles":[]}');
INSERT INTO public.realm_attribute VALUES ('client-policies.policies', 'parent-template', '{"policies":[]}');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', 'parent-template', '');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'parent-template', 'nosniff');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'parent-template', 'none');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'parent-template', 'SAMEORIGIN');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'parent-template', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', 'parent-template', '1; mode=block');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'parent-template', 'max-age=31536000; includeSubDomains');


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.realm_events_listeners VALUES ('master', 'jboss-logging');
INSERT INTO public.realm_events_listeners VALUES ('parent-template', 'jboss-logging');


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'master');
INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'parent-template');


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.redirect_uris VALUES ('6eff441c-7aab-467e-a2ec-c159c0e45539', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', '/admin/master/console/*');
INSERT INTO public.redirect_uris VALUES ('88b896f1-605b-49ca-8c64-1423555d4fc2', '/realms/parent-template/account/*');
INSERT INTO public.redirect_uris VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', '/realms/parent-template/account/*');
INSERT INTO public.redirect_uris VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', '/admin/parent-template/console/*');
INSERT INTO public.redirect_uris VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', 'http://localhost:10004/*');


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.required_action_provider VALUES ('ac7f848d-c873-4fd4-9ce3-42ff480d2c5c', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('7f39b943-43e8-42de-9f97-fea9cd0a64b2', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('685136d4-8f92-4072-8e87-f11ebfd1c1ac', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('b2acb35d-e431-4d98-910f-4ea95d53e839', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('810b4d16-2914-475f-84de-4da79d4deb36', 'terms_and_conditions', 'Terms and Conditions', 'master', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('310ba2c9-dd35-4ee5-a595-4f3372849560', 'update_user_locale', 'Update User Locale', 'master', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('70bad156-ec58-4cbc-9c34-bb2e4d1eb411', 'delete_account', 'Delete Account', 'master', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('7b077247-e497-449a-9828-8c84394dacc0', 'VERIFY_EMAIL', 'Verify Email', 'parent-template', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('d58e2254-6ada-44bc-9550-0e60590f01cf', 'UPDATE_PROFILE', 'Update Profile', 'parent-template', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('0555ad08-fa48-41d0-9856-8b1e324a8a9c', 'CONFIGURE_TOTP', 'Configure OTP', 'parent-template', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('e6fd2d6e-e49c-41fa-98d2-00a088eb4391', 'UPDATE_PASSWORD', 'Update Password', 'parent-template', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('746e37a0-0b6b-4fec-899c-be98998a0752', 'terms_and_conditions', 'Terms and Conditions', 'parent-template', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('e5b2c4c5-2d91-4f90-b355-46911b794a5d', 'update_user_locale', 'Update User Locale', 'parent-template', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('cb93a78a-cd34-4fef-9b12-9e6787da50db', 'delete_account', 'Delete Account', 'parent-template', false, false, 'delete_account', 60);


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.resource_server VALUES ('5d503869-9917-4d5e-92fb-a965be3efa9e', true, '0', 1);


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.resource_server_policy VALUES ('708b76cc-7be5-4364-bb48-bbe8ec696690', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', '5d503869-9917-4d5e-92fb-a965be3efa9e', NULL);
INSERT INTO public.resource_server_policy VALUES ('e1ec6296-0120-482d-abbd-5d5f25c19f2a', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', '5d503869-9917-4d5e-92fb-a965be3efa9e', NULL);


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.resource_server_resource VALUES ('e07bf05a-931c-4489-bc80-e8021356ea4f', 'Default Resource', 'urn:parent-template-login-app:resources:default', NULL, '5d503869-9917-4d5e-92fb-a965be3efa9e', '5d503869-9917-4d5e-92fb-a965be3efa9e', false, NULL);


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.resource_uris VALUES ('e07bf05a-931c-4489-bc80-e8021356ea4f', '/*');


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.scope_mapping VALUES ('47f81b5f-526e-4624-8032-179ed5f91118', '4de78aa3-e68c-4cde-8f89-cfc1aa723789');
INSERT INTO public.scope_mapping VALUES ('0bb37522-ffa3-4d31-b308-c999e72a48e5', 'e55e8b24-308e-4d85-b06f-dd77e72423c5');


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.user_entity VALUES ('afb9eb48-31c2-44fd-95df-98eab656509f', NULL, 'a2892a2e-657c-413c-a318-a3513cf6c483', false, true, NULL, NULL, NULL, 'master', 'admin', 1648731729829, NULL, 0);
INSERT INTO public.user_entity VALUES ('e8bf1bce-112d-434a-bafa-a8f7defcce8c', 'giordano.agostini@yahoo.it', 'giordano.agostini@yahoo.it', false, true, NULL, 'Giordano', 'Agostini', 'parent-template', 'gagostin', 1648733852004, NULL, 0);
INSERT INTO public.user_entity VALUES ('a7bba840-523d-4fda-bc40-ef653e55a829', NULL, '04cce649-6d36-4d0a-87b1-67f0e9b1c89e', false, true, NULL, NULL, NULL, 'parent-template', 'service-account-parent-template-login-app', 1648737272774, '5d503869-9917-4d5e-92fb-a965be3efa9e', 0);


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.user_role_mapping VALUES ('b980df10-d53e-47fd-b9da-c9b8c7d63743', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('7ad8c23e-9997-4a1a-be7a-a1bc18ed2898', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('b110bc32-cf53-4db6-ab4b-955d1c4ea4ee', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('aeccdf0c-e560-40b4-a06f-86a551acd7bc', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('6ab9e921-80d1-4915-b4dc-e4e3ae400e72', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('7abca55f-39e3-49c8-92bd-8625707a85b3', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('3a566ee9-c68c-42d7-91a9-d4f7f78d83b5', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('c0d874bc-68d6-4ee3-bd57-be190c652eaf', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('4ef5227e-6ae7-42ff-a6c2-13637076bf92', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('5e6335a4-47e1-4702-8d54-0a686f8afa9b', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('16473847-934b-489f-ac4c-82f78d4347fe', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('b314bb9e-a0f6-4f9e-9f4b-2424d1415f34', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('e4440dbd-90cf-4560-b483-1315ba5d1f52', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('11326423-14e2-411d-96a2-513df1214d92', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('0b7ab232-5e69-4a17-be18-8287e3e0d559', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('e4f311ff-268e-44fb-add8-08fb8c994906', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('02670718-5483-42f9-8b6c-3c7990f469c3', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('5d721c4d-8970-472b-a0a0-c52baef8c520', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('2a12db3e-fc31-492e-a170-1ec962282a98', 'afb9eb48-31c2-44fd-95df-98eab656509f');
INSERT INTO public.user_role_mapping VALUES ('f04d71df-ade0-4368-a25b-a242601f18f2', 'e8bf1bce-112d-434a-bafa-a8f7defcce8c');
INSERT INTO public.user_role_mapping VALUES ('f04d71df-ade0-4368-a25b-a242601f18f2', 'a7bba840-523d-4fda-bc40-ef653e55a829');
INSERT INTO public.user_role_mapping VALUES ('3be84428-26ce-4c41-b4a7-2436bc699418', 'a7bba840-523d-4fda-bc40-ef653e55a829');
INSERT INTO public.user_role_mapping VALUES ('e0cdceb3-7276-4533-b23a-c182a8514b20', 'e8bf1bce-112d-434a-bafa-a8f7defcce8c');
INSERT INTO public.user_role_mapping VALUES ('c373822a-7ecb-4d44-8743-55b69db581a5', 'e8bf1bce-112d-434a-bafa-a8f7defcce8c');


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.web_origins VALUES ('cd4d3103-f083-4933-afc8-6399043aaa66', '+');
INSERT INTO public.web_origins VALUES ('49f50ce3-f706-4303-b307-f1f6a6adb185', '+');


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak-admin
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

