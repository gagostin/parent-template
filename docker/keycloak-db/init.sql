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

INSERT INTO public.associated_policy VALUES ('7e80b864-cbef-499c-b7b6-12570ce426dc', '01caacee-6108-48cf-b8b1-4c8428ce0501');


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.authentication_execution VALUES ('69c9a523-8128-4489-a5c7-7d55996ec65b', NULL, 'auth-cookie', 'master', '0146dc46-4d51-4713-a13f-1f8cc1fc4964', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('559d6c6f-be6e-465b-9f1a-9feca8cdc5a3', NULL, 'auth-spnego', 'master', '0146dc46-4d51-4713-a13f-1f8cc1fc4964', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e31bfd09-7aad-4095-a515-67e13b00e42b', NULL, 'identity-provider-redirector', 'master', '0146dc46-4d51-4713-a13f-1f8cc1fc4964', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('15a5b772-fccc-4bce-81c6-1e3c834b7dd1', NULL, NULL, 'master', '0146dc46-4d51-4713-a13f-1f8cc1fc4964', 2, 30, true, '0bd08587-a42b-4d2a-9b08-a06b4f12c8b8', NULL);
INSERT INTO public.authentication_execution VALUES ('8f1083f9-8fe6-444a-8e6c-4ff15e808fbf', NULL, 'auth-username-password-form', 'master', '0bd08587-a42b-4d2a-9b08-a06b4f12c8b8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4790ef4b-e41a-448e-83d8-64d104018930', NULL, NULL, 'master', '0bd08587-a42b-4d2a-9b08-a06b4f12c8b8', 1, 20, true, '92d6422c-2539-428c-a168-06cda90996d9', NULL);
INSERT INTO public.authentication_execution VALUES ('793ea422-7604-412f-94ee-b7b7592878ba', NULL, 'conditional-user-configured', 'master', '92d6422c-2539-428c-a168-06cda90996d9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9e03c68e-0dc2-4514-bc73-397878647529', NULL, 'auth-otp-form', 'master', '92d6422c-2539-428c-a168-06cda90996d9', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1ab0b041-6563-4fef-8731-63ab50bd8885', NULL, 'direct-grant-validate-username', 'master', 'd6789e83-3013-4cfc-9822-5ff1ecd7b3db', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('20cff548-0f23-42ab-84b2-f950ffd8f93a', NULL, 'direct-grant-validate-password', 'master', 'd6789e83-3013-4cfc-9822-5ff1ecd7b3db', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f99a8383-b1ce-4bf9-ade3-e62c7d585479', NULL, NULL, 'master', 'd6789e83-3013-4cfc-9822-5ff1ecd7b3db', 1, 30, true, 'a82a1256-6ca6-4fbe-b3f1-aea2b8dc8b5e', NULL);
INSERT INTO public.authentication_execution VALUES ('08629750-0dcf-4323-b7f5-cb43a3fccd1c', NULL, 'conditional-user-configured', 'master', 'a82a1256-6ca6-4fbe-b3f1-aea2b8dc8b5e', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3fb8106e-8092-4ed9-9349-c4d02f8cf5c8', NULL, 'direct-grant-validate-otp', 'master', 'a82a1256-6ca6-4fbe-b3f1-aea2b8dc8b5e', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d2e76213-eb8a-4325-86a7-3bc5cdad58a1', NULL, 'registration-page-form', 'master', '66fdb4cd-9e72-445b-bb45-91b08b62a6c7', 0, 10, true, '8d2ba3b0-7b0b-4184-a7ce-fd6fd8a0d3ee', NULL);
INSERT INTO public.authentication_execution VALUES ('dc9ad3dd-29a2-4b60-9b62-399a64337834', NULL, 'registration-user-creation', 'master', '8d2ba3b0-7b0b-4184-a7ce-fd6fd8a0d3ee', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fd58a775-fd02-42b9-8835-f20ef4dd23cc', NULL, 'registration-profile-action', 'master', '8d2ba3b0-7b0b-4184-a7ce-fd6fd8a0d3ee', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('22a24b25-851f-425c-ada8-ad89942229ce', NULL, 'registration-password-action', 'master', '8d2ba3b0-7b0b-4184-a7ce-fd6fd8a0d3ee', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c5d94074-7c56-4fcd-86a2-fc506a5914f8', NULL, 'registration-recaptcha-action', 'master', '8d2ba3b0-7b0b-4184-a7ce-fd6fd8a0d3ee', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9402c87c-dcf9-42bc-8c49-cec29861ca0a', NULL, 'reset-credentials-choose-user', 'master', 'ff25ce1d-266a-42b4-98a2-5618507111e8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('05dd2733-0199-4fb5-8c11-86ac3a060506', NULL, 'reset-credential-email', 'master', 'ff25ce1d-266a-42b4-98a2-5618507111e8', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('87921635-b4e8-4a72-b815-22c510e322fe', NULL, 'reset-password', 'master', 'ff25ce1d-266a-42b4-98a2-5618507111e8', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('594a7afb-045c-4a27-ace0-e7b5be3df75d', NULL, NULL, 'master', 'ff25ce1d-266a-42b4-98a2-5618507111e8', 1, 40, true, '468114f0-6a93-44fb-8cb6-183f824662a8', NULL);
INSERT INTO public.authentication_execution VALUES ('198d5836-dda1-4eda-9e4f-1b078d968ebb', NULL, 'conditional-user-configured', 'master', '468114f0-6a93-44fb-8cb6-183f824662a8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('999d8b97-4fa0-4fee-a10d-fdc90e3df5eb', NULL, 'reset-otp', 'master', '468114f0-6a93-44fb-8cb6-183f824662a8', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c131ce34-95b0-4792-9c02-acc10a2b7976', NULL, 'client-secret', 'master', 'e8179734-58bc-43d3-9ec9-b2983a3dc17f', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2661945c-e7c9-47c3-84db-5b8b0367a41b', NULL, 'client-jwt', 'master', 'e8179734-58bc-43d3-9ec9-b2983a3dc17f', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d32d6240-5037-4660-a6b3-c46ef470ed59', NULL, 'client-secret-jwt', 'master', 'e8179734-58bc-43d3-9ec9-b2983a3dc17f', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2e9e009f-f4b4-4d3f-8504-30ea168ef2b2', NULL, 'client-x509', 'master', 'e8179734-58bc-43d3-9ec9-b2983a3dc17f', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ea6ee11c-c205-4993-ba99-994f3e67b707', NULL, 'idp-review-profile', 'master', 'd18df150-d4ab-4512-aa1c-07daa1049ea4', 0, 10, false, NULL, '5fe5abfb-506e-4b75-8357-11b9a5fa7a66');
INSERT INTO public.authentication_execution VALUES ('ca145992-973b-499a-b772-769879a7c020', NULL, NULL, 'master', 'd18df150-d4ab-4512-aa1c-07daa1049ea4', 0, 20, true, '4b04c997-3dd1-4be5-b831-4c7d8d3a1415', NULL);
INSERT INTO public.authentication_execution VALUES ('cb7dc67e-401a-4919-9b64-6e33bb10e9e2', NULL, 'idp-create-user-if-unique', 'master', '4b04c997-3dd1-4be5-b831-4c7d8d3a1415', 2, 10, false, NULL, 'd2acff82-820d-42e3-9d43-126614293e52');
INSERT INTO public.authentication_execution VALUES ('766bbde0-6d62-4448-99e7-44f5815b3874', NULL, NULL, 'master', '4b04c997-3dd1-4be5-b831-4c7d8d3a1415', 2, 20, true, '79e10136-a4db-4143-b7c4-34ce017f267f', NULL);
INSERT INTO public.authentication_execution VALUES ('94aa8a0d-0b6f-496b-aea6-e58bf5a69bdf', NULL, 'idp-confirm-link', 'master', '79e10136-a4db-4143-b7c4-34ce017f267f', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6bfcf766-8cad-40de-9564-be37f71e7368', NULL, NULL, 'master', '79e10136-a4db-4143-b7c4-34ce017f267f', 0, 20, true, 'b576ebc2-ebc2-4c73-93a8-37204dedfd21', NULL);
INSERT INTO public.authentication_execution VALUES ('b4c8daa5-3e0e-424c-ad67-4db77cfd49f2', NULL, 'idp-email-verification', 'master', 'b576ebc2-ebc2-4c73-93a8-37204dedfd21', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c0617399-ae96-4e60-9eb5-6f854102f0be', NULL, NULL, 'master', 'b576ebc2-ebc2-4c73-93a8-37204dedfd21', 2, 20, true, '7b652c26-6c45-46b8-be52-c19774904420', NULL);
INSERT INTO public.authentication_execution VALUES ('3e1c7c9e-3791-4bd2-8f2e-9fb4875fbe6f', NULL, 'idp-username-password-form', 'master', '7b652c26-6c45-46b8-be52-c19774904420', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('be4f0547-5bd4-4f9d-a317-e332bac2df5d', NULL, NULL, 'master', '7b652c26-6c45-46b8-be52-c19774904420', 1, 20, true, '65e54bcf-20e0-4ea9-9b80-882fb349c03b', NULL);
INSERT INTO public.authentication_execution VALUES ('47478772-59e9-4d00-8d42-3cf77c273f50', NULL, 'conditional-user-configured', 'master', '65e54bcf-20e0-4ea9-9b80-882fb349c03b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7e07dea8-46d7-4a41-b344-1e621c3631f8', NULL, 'auth-otp-form', 'master', '65e54bcf-20e0-4ea9-9b80-882fb349c03b', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4f2f0fe9-e069-48d2-86e8-2eefa336223a', NULL, 'http-basic-authenticator', 'master', '3b769305-ed12-40dc-bb2f-be2276173d21', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2000392a-ea6d-4939-b7cc-24eb90966894', NULL, 'docker-http-basic-authenticator', 'master', 'b9e557e7-ea2a-40ee-b2b4-39a72e1e7f1b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('368f7f30-6c9c-48aa-92c1-7c80c6bcf8dd', NULL, 'no-cookie-redirect', 'master', '82e2ebc8-1442-42f2-856d-f923bb3a1ab3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9f50f273-dadb-47b2-a814-4a4d16f202f1', NULL, NULL, 'master', '82e2ebc8-1442-42f2-856d-f923bb3a1ab3', 0, 20, true, 'cd03123c-8f56-4781-a941-12908dcd6936', NULL);
INSERT INTO public.authentication_execution VALUES ('ca50a0ea-ede6-4da4-8a1e-dfd042c60ced', NULL, 'basic-auth', 'master', 'cd03123c-8f56-4781-a941-12908dcd6936', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bd6c82a5-46d3-4506-9621-46ca67eef4c2', NULL, 'basic-auth-otp', 'master', 'cd03123c-8f56-4781-a941-12908dcd6936', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2819d0ba-88b1-41c3-b3f0-4eac6d675222', NULL, 'auth-spnego', 'master', 'cd03123c-8f56-4781-a941-12908dcd6936', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('63c0dfb5-1e34-4aee-a599-e091c1d23b17', NULL, 'auth-cookie', 'monthly', 'a09309ca-ec34-4d9b-97fd-3b468ff4c994', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0188164a-106a-42ad-b454-d7a28230ca16', NULL, 'auth-spnego', 'monthly', 'a09309ca-ec34-4d9b-97fd-3b468ff4c994', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b823b75f-4176-4a63-b1cb-bbaed573687e', NULL, 'identity-provider-redirector', 'monthly', 'a09309ca-ec34-4d9b-97fd-3b468ff4c994', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4d7392b3-2b60-49ff-bd58-387be1b4f531', NULL, NULL, 'monthly', 'a09309ca-ec34-4d9b-97fd-3b468ff4c994', 2, 30, true, 'f94fe710-d40b-401f-a61b-929e730910b3', NULL);
INSERT INTO public.authentication_execution VALUES ('6ea738cb-c3fa-4882-9272-ddc3615f4de3', NULL, 'auth-username-password-form', 'monthly', 'f94fe710-d40b-401f-a61b-929e730910b3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b6b7d5bf-f266-4571-9f9f-43a1e498625d', NULL, NULL, 'monthly', 'f94fe710-d40b-401f-a61b-929e730910b3', 1, 20, true, '799c0f9e-a008-44a0-8e37-a3b28c29b862', NULL);
INSERT INTO public.authentication_execution VALUES ('efa38421-0ff9-4679-b3f5-1d8175622d4d', NULL, 'conditional-user-configured', 'monthly', '799c0f9e-a008-44a0-8e37-a3b28c29b862', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ee6bf8ae-9137-4461-97e5-84eef87c4f01', NULL, 'auth-otp-form', 'monthly', '799c0f9e-a008-44a0-8e37-a3b28c29b862', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('767d6b03-541f-4a95-af91-41009720ef35', NULL, 'direct-grant-validate-username', 'monthly', 'cde95596-664c-4360-a11c-e9f799fb4380', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('115e627d-1c6b-4e0d-9fb6-6eb21b8b8409', NULL, 'direct-grant-validate-password', 'monthly', 'cde95596-664c-4360-a11c-e9f799fb4380', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7de80a08-9436-4710-b2c8-77313bff0c6a', NULL, NULL, 'monthly', 'cde95596-664c-4360-a11c-e9f799fb4380', 1, 30, true, '9d636604-7bee-4c52-9f83-1a06da1157f0', NULL);
INSERT INTO public.authentication_execution VALUES ('0f420a6c-dff8-4754-9035-30ccbb385c67', NULL, 'conditional-user-configured', 'monthly', '9d636604-7bee-4c52-9f83-1a06da1157f0', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('db819ae7-5e2f-4aa4-ae0b-89823a51ac2e', NULL, 'direct-grant-validate-otp', 'monthly', '9d636604-7bee-4c52-9f83-1a06da1157f0', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3fc30d21-6d49-44e1-8c7f-6daabf8b5508', NULL, 'registration-page-form', 'monthly', 'a857775d-6b3c-4013-96b5-5eb9ab7af1ff', 0, 10, true, '57820ff2-c689-46fc-8e5b-5a91bf37f4ab', NULL);
INSERT INTO public.authentication_execution VALUES ('8a17cb2d-b2f6-48ef-9d82-31b1b040e772', NULL, 'registration-user-creation', 'monthly', '57820ff2-c689-46fc-8e5b-5a91bf37f4ab', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1de6217d-2966-42e2-a680-95f52877b127', NULL, 'registration-profile-action', 'monthly', '57820ff2-c689-46fc-8e5b-5a91bf37f4ab', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('099125c7-3b12-4057-b000-2c6e1b29b2e6', NULL, 'registration-password-action', 'monthly', '57820ff2-c689-46fc-8e5b-5a91bf37f4ab', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('26e7a0a2-dc91-4f49-967d-516c04d88ed8', NULL, 'registration-recaptcha-action', 'monthly', '57820ff2-c689-46fc-8e5b-5a91bf37f4ab', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('af802e24-782c-4046-989f-c02de44d4283', NULL, 'reset-credentials-choose-user', 'monthly', '24dad399-e154-482a-bc8b-e36de576a7da', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ca49b6f2-0742-4e9b-8768-a20a518a5320', NULL, 'reset-credential-email', 'monthly', '24dad399-e154-482a-bc8b-e36de576a7da', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('dec3d6d7-99ac-4e97-91ce-1b1d412047ef', NULL, 'reset-password', 'monthly', '24dad399-e154-482a-bc8b-e36de576a7da', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8eb152ab-0100-47ae-9f50-4e8437e655c4', NULL, NULL, 'monthly', '24dad399-e154-482a-bc8b-e36de576a7da', 1, 40, true, 'b3856b62-54cf-4081-af51-c6611b489311', NULL);
INSERT INTO public.authentication_execution VALUES ('42c75e68-0812-4d03-a10c-d010d5149afb', NULL, 'conditional-user-configured', 'monthly', 'b3856b62-54cf-4081-af51-c6611b489311', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d7c96009-343c-4396-b093-eec24155b04f', NULL, 'reset-otp', 'monthly', 'b3856b62-54cf-4081-af51-c6611b489311', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8f1616e3-5298-4c57-b242-a9037a235a43', NULL, 'client-secret', 'monthly', '9094d152-9dca-4d7f-9113-8d82eba81c1c', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('205c8783-aa5f-4a94-af84-0f138df4596e', NULL, 'client-jwt', 'monthly', '9094d152-9dca-4d7f-9113-8d82eba81c1c', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a797701f-25f5-431f-914a-f560b681e5ae', NULL, 'client-secret-jwt', 'monthly', '9094d152-9dca-4d7f-9113-8d82eba81c1c', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3cae3baf-2dfe-40f6-8530-07a4a0691f38', NULL, 'client-x509', 'monthly', '9094d152-9dca-4d7f-9113-8d82eba81c1c', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a8e32402-47dc-4547-827e-a46543bf90a8', NULL, 'idp-review-profile', 'monthly', '0ccdc1b3-359b-481c-86ba-5aecc803da83', 0, 10, false, NULL, 'c6da8d50-3927-4b42-a252-0d0040b6475a');
INSERT INTO public.authentication_execution VALUES ('592abd49-133a-41b8-873b-1f4cf066d826', NULL, NULL, 'monthly', '0ccdc1b3-359b-481c-86ba-5aecc803da83', 0, 20, true, '6d6231b7-61a6-450f-a416-807415acb25e', NULL);
INSERT INTO public.authentication_execution VALUES ('b9387aad-5d3b-4c50-a997-9f1733eeeb08', NULL, 'idp-create-user-if-unique', 'monthly', '6d6231b7-61a6-450f-a416-807415acb25e', 2, 10, false, NULL, 'c30d2557-f281-4b1e-9724-160e89bb7f29');
INSERT INTO public.authentication_execution VALUES ('5ab1fb4d-8f6d-444e-a7c2-9ba20b7b7268', NULL, NULL, 'monthly', '6d6231b7-61a6-450f-a416-807415acb25e', 2, 20, true, '804f8481-7923-43ca-ab53-9a41dc4f2c99', NULL);
INSERT INTO public.authentication_execution VALUES ('f1ed51d8-c050-4859-b664-373b2dde4560', NULL, 'idp-confirm-link', 'monthly', '804f8481-7923-43ca-ab53-9a41dc4f2c99', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5dcd1d5c-2e65-4053-8247-555f10bef53f', NULL, NULL, 'monthly', '804f8481-7923-43ca-ab53-9a41dc4f2c99', 0, 20, true, '93850d20-b441-4015-ac0e-4de32e6e4175', NULL);
INSERT INTO public.authentication_execution VALUES ('1dc5abe6-ec4f-4ea5-9f42-02abe9eb663b', NULL, 'idp-email-verification', 'monthly', '93850d20-b441-4015-ac0e-4de32e6e4175', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ea8a919c-79ad-417f-9736-5aadf57435ca', NULL, NULL, 'monthly', '93850d20-b441-4015-ac0e-4de32e6e4175', 2, 20, true, 'f5d2d9d2-2e5c-4209-b3d3-000b35af7a8e', NULL);
INSERT INTO public.authentication_execution VALUES ('40d38cf8-3084-4da4-9743-a58a5e2a07b7', NULL, 'idp-username-password-form', 'monthly', 'f5d2d9d2-2e5c-4209-b3d3-000b35af7a8e', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8262a152-405a-44c6-99ef-5b7dc60630f2', NULL, NULL, 'monthly', 'f5d2d9d2-2e5c-4209-b3d3-000b35af7a8e', 1, 20, true, 'd6d41a76-5e53-4f74-b49e-56dd8e0753f3', NULL);
INSERT INTO public.authentication_execution VALUES ('6ea7a761-cc0c-496e-bec4-a3c85229e813', NULL, 'conditional-user-configured', 'monthly', 'd6d41a76-5e53-4f74-b49e-56dd8e0753f3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('901e63b0-b67e-432f-85ec-64af710ff5b9', NULL, 'auth-otp-form', 'monthly', 'd6d41a76-5e53-4f74-b49e-56dd8e0753f3', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0e2aaf00-4d2b-41c2-b757-4abf56e30ae3', NULL, 'http-basic-authenticator', 'monthly', '15652b33-f33a-4782-bbbe-2f1e5746c07a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('566b39ac-61db-43ca-acbc-d2fdd9f75258', NULL, 'docker-http-basic-authenticator', 'monthly', 'f911c6fc-3139-42f2-9ab6-a074b48d5fd6', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ba4cc41e-a967-44a5-be97-e83ce1d3326c', NULL, 'no-cookie-redirect', 'monthly', '7e4656e6-95de-4813-bd12-e6f39f7ff95a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('330ba91d-9640-4307-b27c-8a529a199a67', NULL, NULL, 'monthly', '7e4656e6-95de-4813-bd12-e6f39f7ff95a', 0, 20, true, 'b1bdd2c0-246c-4c35-b78d-0d0f705f64f6', NULL);
INSERT INTO public.authentication_execution VALUES ('19065e5b-86ee-4eca-a179-f6a840c6aba5', NULL, 'basic-auth', 'monthly', 'b1bdd2c0-246c-4c35-b78d-0d0f705f64f6', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e3a020bf-9320-42c2-b2c3-5d56731623ab', NULL, 'basic-auth-otp', 'monthly', 'b1bdd2c0-246c-4c35-b78d-0d0f705f64f6', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('00898dbc-6c1d-44ff-92e4-17836ab68b6e', NULL, 'auth-spnego', 'monthly', 'b1bdd2c0-246c-4c35-b78d-0d0f705f64f6', 3, 30, false, NULL, NULL);


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.authentication_flow VALUES ('0146dc46-4d51-4713-a13f-1f8cc1fc4964', 'browser', 'browser based authentication', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('0bd08587-a42b-4d2a-9b08-a06b4f12c8b8', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('92d6422c-2539-428c-a168-06cda90996d9', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('d6789e83-3013-4cfc-9822-5ff1ecd7b3db', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('a82a1256-6ca6-4fbe-b3f1-aea2b8dc8b5e', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('66fdb4cd-9e72-445b-bb45-91b08b62a6c7', 'registration', 'registration flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('8d2ba3b0-7b0b-4184-a7ce-fd6fd8a0d3ee', 'registration form', 'registration form', 'master', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('ff25ce1d-266a-42b4-98a2-5618507111e8', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('468114f0-6a93-44fb-8cb6-183f824662a8', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('e8179734-58bc-43d3-9ec9-b2983a3dc17f', 'clients', 'Base authentication for clients', 'master', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('d18df150-d4ab-4512-aa1c-07daa1049ea4', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('4b04c997-3dd1-4be5-b831-4c7d8d3a1415', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('79e10136-a4db-4143-b7c4-34ce017f267f', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('b576ebc2-ebc2-4c73-93a8-37204dedfd21', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('7b652c26-6c45-46b8-be52-c19774904420', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('65e54bcf-20e0-4ea9-9b80-882fb349c03b', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('3b769305-ed12-40dc-bb2f-be2276173d21', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('b9e557e7-ea2a-40ee-b2b4-39a72e1e7f1b', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('82e2ebc8-1442-42f2-856d-f923bb3a1ab3', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('cd03123c-8f56-4781-a941-12908dcd6936', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('a09309ca-ec34-4d9b-97fd-3b468ff4c994', 'browser', 'browser based authentication', 'monthly', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('f94fe710-d40b-401f-a61b-929e730910b3', 'forms', 'Username, password, otp and other auth forms.', 'monthly', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('799c0f9e-a008-44a0-8e37-a3b28c29b862', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'monthly', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('cde95596-664c-4360-a11c-e9f799fb4380', 'direct grant', 'OpenID Connect Resource Owner Grant', 'monthly', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('9d636604-7bee-4c52-9f83-1a06da1157f0', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'monthly', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('a857775d-6b3c-4013-96b5-5eb9ab7af1ff', 'registration', 'registration flow', 'monthly', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('57820ff2-c689-46fc-8e5b-5a91bf37f4ab', 'registration form', 'registration form', 'monthly', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('24dad399-e154-482a-bc8b-e36de576a7da', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'monthly', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('b3856b62-54cf-4081-af51-c6611b489311', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'monthly', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('9094d152-9dca-4d7f-9113-8d82eba81c1c', 'clients', 'Base authentication for clients', 'monthly', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('0ccdc1b3-359b-481c-86ba-5aecc803da83', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'monthly', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('6d6231b7-61a6-450f-a416-807415acb25e', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'monthly', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('804f8481-7923-43ca-ab53-9a41dc4f2c99', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'monthly', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('93850d20-b441-4015-ac0e-4de32e6e4175', 'Account verification options', 'Method with which to verity the existing account', 'monthly', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('f5d2d9d2-2e5c-4209-b3d3-000b35af7a8e', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'monthly', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('d6d41a76-5e53-4f74-b49e-56dd8e0753f3', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'monthly', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('15652b33-f33a-4782-bbbe-2f1e5746c07a', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'monthly', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('f911c6fc-3139-42f2-9ab6-a074b48d5fd6', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'monthly', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('7e4656e6-95de-4813-bd12-e6f39f7ff95a', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'monthly', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('b1bdd2c0-246c-4c35-b78d-0d0f705f64f6', 'Authentication Options', 'Authentication options.', 'monthly', 'basic-flow', false, true);


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.authenticator_config VALUES ('5fe5abfb-506e-4b75-8357-11b9a5fa7a66', 'review profile config', 'master');
INSERT INTO public.authenticator_config VALUES ('d2acff82-820d-42e3-9d43-126614293e52', 'create unique user config', 'master');
INSERT INTO public.authenticator_config VALUES ('c6da8d50-3927-4b42-a252-0d0040b6475a', 'review profile config', 'monthly');
INSERT INTO public.authenticator_config VALUES ('c30d2557-f281-4b1e-9724-160e89bb7f29', 'create unique user config', 'monthly');


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.authenticator_config_entry VALUES ('5fe5abfb-506e-4b75-8357-11b9a5fa7a66', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('d2acff82-820d-42e3-9d43-126614293e52', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('c6da8d50-3927-4b42-a252-0d0040b6475a', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('c30d2557-f281-4b1e-9724-160e89bb7f29', 'false', 'require.password.update.after.registration');


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', true, true, 'master-realm', 0, false, 'ac0657e8-037f-4765-bbb0-d71c40aab3c1', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', true, false, 'account', 0, false, '59fd4260-f188-41ee-8852-5b0fee7b09aa', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', true, false, 'account-console', 0, true, 'fe74b813-7091-4cc3-bc3d-58e213cb7d29', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', true, false, 'broker', 0, false, '53ee09c5-5fd9-4d1d-b1b2-e45f582e6a2c', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', true, false, 'security-admin-console', 0, true, 'b53f4f10-ee7f-4cd0-80d3-84090597f095', '/admin/master/console/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', true, false, 'realm-management', 0, false, '3a3f954d-8b93-4e39-87b2-0d2e2be8f747', NULL, true, NULL, false, 'monthly', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', true, false, 'broker', 0, false, '3ed4b37c-dd27-414b-8cd5-4ba3e4291c72', NULL, false, NULL, false, 'monthly', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', true, false, 'admin-cli', 0, true, '9747cbd8-52c8-433a-b44d-54520730f8a8', NULL, false, NULL, false, 'monthly', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', true, false, 'admin-cli', 0, false, '20d9f569-dc7f-4951-afe4-ca3c2b766cec', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_admin-cli}', true, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', true, true, 'app-realm', 0, false, 'dcd09e8d-129c-4e55-817e-e8cbcbed1e10', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'monthly Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', true, false, 'security-admin-console', 0, true, '284b99ca-21cc-4f56-ad06-1a6d6b78f05e', '/admin/app/console/', false, NULL, false, 'monthly', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', true, false, 'account', 0, false, '8cc48e00-7c4a-496d-8244-8e8ed29ccfea', '/realms/app/account/', false, NULL, false, 'monthly', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', true, false, 'account-console', 0, true, NULL, '/realms/app/account/', false, NULL, false, 'monthly', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', true, true, 'login-app', 0, false, 'd93fb7d2-46bc-42d0-9d4e-3ac917dcb962', '', false, NULL, false, 'monthly', 'openid-connect', -1, false, false, 'Login App', true, 'client-secret', 'http://localhost:8081', NULL, NULL, true, false, true, false);


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client_attributes VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'display.on.consent.screen');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'true', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', '1200', 'access.token.lifespan');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'false', 'display.on.consent.screen');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.artifact.binding');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'oauth2.device.authorization.grant.enabled');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'oidc.ciba.grant.enabled');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'true', 'use.refresh.tokens');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'id.token.as.detached.signature');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'require.pushed.authorization.requests');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'display.on.consent.screen');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'false', 'backchannel.logout.revoke.offline.tokens');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'saml.artifact.binding');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'oauth2.device.authorization.grant.enabled');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'oidc.ciba.grant.enabled');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'true', 'use.refresh.tokens');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'id.token.as.detached.signature');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'require.pushed.authorization.requests');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'false', 'backchannel.logout.revoke.offline.tokens');


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

INSERT INTO public.client_scope VALUES ('84aed7ba-433a-4443-b18a-f5cec2fc5a5a', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('bf9935c1-0494-4708-b467-21c6f62b600b', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('e37ca8a8-b185-4e13-b453-b004b2cc3b5d', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('752a3c23-e930-4624-bb8c-22229eeee821', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('8d3170cd-f782-4321-9e46-f06e71334a02', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('6876c768-d5aa-43eb-bb26-5c832faf4a38', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('6339ca16-e251-448e-9b53-62dcfc981348', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('444f7cda-4ba1-4206-94b8-1a07beebd250', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('028becdd-bc86-42ef-a954-116df4fcd559', 'offline_access', 'monthly', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('aadd283d-c18c-463a-9ca4-9200b0ddc16f', 'role_list', 'monthly', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('0bfaf6c9-e78c-42ec-b711-6e197bdf0842', 'profile', 'monthly', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('b0616f3b-5a9c-4e00-98d5-053c50874a2f', 'email', 'monthly', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('68630d2a-a59d-421c-ae58-a756334c4c52', 'address', 'monthly', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('4debef64-1869-4a54-9b61-49d19e453e57', 'phone', 'monthly', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('87ce471f-a987-4a90-ada0-4050e3181524', 'roles', 'monthly', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('af3f763c-8d29-4128-ad42-86675aed9ed0', 'web-origins', 'monthly', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('680b199d-863d-4b5a-abd8-26424060a491', 'microprofile-jwt', 'monthly', 'Microprofile - JWT built-in scope', 'openid-connect');


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client_scope_attributes VALUES ('84aed7ba-433a-4443-b18a-f5cec2fc5a5a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('84aed7ba-433a-4443-b18a-f5cec2fc5a5a', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('bf9935c1-0494-4708-b467-21c6f62b600b', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('bf9935c1-0494-4708-b467-21c6f62b600b', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('e37ca8a8-b185-4e13-b453-b004b2cc3b5d', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('e37ca8a8-b185-4e13-b453-b004b2cc3b5d', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('e37ca8a8-b185-4e13-b453-b004b2cc3b5d', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('752a3c23-e930-4624-bb8c-22229eeee821', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('752a3c23-e930-4624-bb8c-22229eeee821', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('752a3c23-e930-4624-bb8c-22229eeee821', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('8d3170cd-f782-4321-9e46-f06e71334a02', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('8d3170cd-f782-4321-9e46-f06e71334a02', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('8d3170cd-f782-4321-9e46-f06e71334a02', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('6876c768-d5aa-43eb-bb26-5c832faf4a38', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('6876c768-d5aa-43eb-bb26-5c832faf4a38', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('6876c768-d5aa-43eb-bb26-5c832faf4a38', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('6339ca16-e251-448e-9b53-62dcfc981348', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('6339ca16-e251-448e-9b53-62dcfc981348', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('6339ca16-e251-448e-9b53-62dcfc981348', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('444f7cda-4ba1-4206-94b8-1a07beebd250', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('444f7cda-4ba1-4206-94b8-1a07beebd250', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('028becdd-bc86-42ef-a954-116df4fcd559', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('028becdd-bc86-42ef-a954-116df4fcd559', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('aadd283d-c18c-463a-9ca4-9200b0ddc16f', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('aadd283d-c18c-463a-9ca4-9200b0ddc16f', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('0bfaf6c9-e78c-42ec-b711-6e197bdf0842', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('0bfaf6c9-e78c-42ec-b711-6e197bdf0842', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('0bfaf6c9-e78c-42ec-b711-6e197bdf0842', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('b0616f3b-5a9c-4e00-98d5-053c50874a2f', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('b0616f3b-5a9c-4e00-98d5-053c50874a2f', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('b0616f3b-5a9c-4e00-98d5-053c50874a2f', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('68630d2a-a59d-421c-ae58-a756334c4c52', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('68630d2a-a59d-421c-ae58-a756334c4c52', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('68630d2a-a59d-421c-ae58-a756334c4c52', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('4debef64-1869-4a54-9b61-49d19e453e57', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('4debef64-1869-4a54-9b61-49d19e453e57', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('4debef64-1869-4a54-9b61-49d19e453e57', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('87ce471f-a987-4a90-ada0-4050e3181524', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('87ce471f-a987-4a90-ada0-4050e3181524', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('87ce471f-a987-4a90-ada0-4050e3181524', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('af3f763c-8d29-4128-ad42-86675aed9ed0', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('af3f763c-8d29-4128-ad42-86675aed9ed0', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('af3f763c-8d29-4128-ad42-86675aed9ed0', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('680b199d-863d-4b5a-abd8-26424060a491', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('680b199d-863d-4b5a-abd8-26424060a491', 'true', 'include.in.token.scope');


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client_scope_client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', 'bf9935c1-0494-4708-b467-21c6f62b600b', true);
INSERT INTO public.client_scope_client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', 'bf9935c1-0494-4708-b467-21c6f62b600b', true);
INSERT INTO public.client_scope_client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'bf9935c1-0494-4708-b467-21c6f62b600b', true);
INSERT INTO public.client_scope_client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', 'bf9935c1-0494-4708-b467-21c6f62b600b', true);
INSERT INTO public.client_scope_client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', 'bf9935c1-0494-4708-b467-21c6f62b600b', true);
INSERT INTO public.client_scope_client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', 'bf9935c1-0494-4708-b467-21c6f62b600b', true);
INSERT INTO public.client_scope_client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d', true);
INSERT INTO public.client_scope_client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', '752a3c23-e930-4624-bb8c-22229eeee821', true);
INSERT INTO public.client_scope_client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', '6339ca16-e251-448e-9b53-62dcfc981348', true);
INSERT INTO public.client_scope_client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', '0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', true);
INSERT INTO public.client_scope_client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', '84aed7ba-433a-4443-b18a-f5cec2fc5a5a', false);
INSERT INTO public.client_scope_client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', '8d3170cd-f782-4321-9e46-f06e71334a02', false);
INSERT INTO public.client_scope_client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', '6876c768-d5aa-43eb-bb26-5c832faf4a38', false);
INSERT INTO public.client_scope_client VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', '444f7cda-4ba1-4206-94b8-1a07beebd250', false);
INSERT INTO public.client_scope_client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d', true);
INSERT INTO public.client_scope_client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', '752a3c23-e930-4624-bb8c-22229eeee821', true);
INSERT INTO public.client_scope_client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', '6339ca16-e251-448e-9b53-62dcfc981348', true);
INSERT INTO public.client_scope_client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', '0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', true);
INSERT INTO public.client_scope_client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', '84aed7ba-433a-4443-b18a-f5cec2fc5a5a', false);
INSERT INTO public.client_scope_client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', '8d3170cd-f782-4321-9e46-f06e71334a02', false);
INSERT INTO public.client_scope_client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', '6876c768-d5aa-43eb-bb26-5c832faf4a38', false);
INSERT INTO public.client_scope_client VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', '444f7cda-4ba1-4206-94b8-1a07beebd250', false);
INSERT INTO public.client_scope_client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d', true);
INSERT INTO public.client_scope_client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', '752a3c23-e930-4624-bb8c-22229eeee821', true);
INSERT INTO public.client_scope_client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', '6339ca16-e251-448e-9b53-62dcfc981348', true);
INSERT INTO public.client_scope_client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', '0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', true);
INSERT INTO public.client_scope_client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', '84aed7ba-433a-4443-b18a-f5cec2fc5a5a', false);
INSERT INTO public.client_scope_client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', '8d3170cd-f782-4321-9e46-f06e71334a02', false);
INSERT INTO public.client_scope_client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', '6876c768-d5aa-43eb-bb26-5c832faf4a38', false);
INSERT INTO public.client_scope_client VALUES ('61cd8b8e-bf9d-4c47-b8af-596dcda6d716', '444f7cda-4ba1-4206-94b8-1a07beebd250', false);
INSERT INTO public.client_scope_client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d', true);
INSERT INTO public.client_scope_client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', '752a3c23-e930-4624-bb8c-22229eeee821', true);
INSERT INTO public.client_scope_client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', '6339ca16-e251-448e-9b53-62dcfc981348', true);
INSERT INTO public.client_scope_client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', '0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', true);
INSERT INTO public.client_scope_client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', '84aed7ba-433a-4443-b18a-f5cec2fc5a5a', false);
INSERT INTO public.client_scope_client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', '8d3170cd-f782-4321-9e46-f06e71334a02', false);
INSERT INTO public.client_scope_client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', '6876c768-d5aa-43eb-bb26-5c832faf4a38', false);
INSERT INTO public.client_scope_client VALUES ('1330007e-73e9-4696-bb3a-0b9a5e0fc478', '444f7cda-4ba1-4206-94b8-1a07beebd250', false);
INSERT INTO public.client_scope_client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d', true);
INSERT INTO public.client_scope_client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', '752a3c23-e930-4624-bb8c-22229eeee821', true);
INSERT INTO public.client_scope_client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', '6339ca16-e251-448e-9b53-62dcfc981348', true);
INSERT INTO public.client_scope_client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', '0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', true);
INSERT INTO public.client_scope_client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', '84aed7ba-433a-4443-b18a-f5cec2fc5a5a', false);
INSERT INTO public.client_scope_client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', '8d3170cd-f782-4321-9e46-f06e71334a02', false);
INSERT INTO public.client_scope_client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', '6876c768-d5aa-43eb-bb26-5c832faf4a38', false);
INSERT INTO public.client_scope_client VALUES ('d372285d-fea6-470c-8e4d-8fd86d529378', '444f7cda-4ba1-4206-94b8-1a07beebd250', false);
INSERT INTO public.client_scope_client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d', true);
INSERT INTO public.client_scope_client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', '752a3c23-e930-4624-bb8c-22229eeee821', true);
INSERT INTO public.client_scope_client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', '6339ca16-e251-448e-9b53-62dcfc981348', true);
INSERT INTO public.client_scope_client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', '0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', true);
INSERT INTO public.client_scope_client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', '84aed7ba-433a-4443-b18a-f5cec2fc5a5a', false);
INSERT INTO public.client_scope_client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', '8d3170cd-f782-4321-9e46-f06e71334a02', false);
INSERT INTO public.client_scope_client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', '6876c768-d5aa-43eb-bb26-5c832faf4a38', false);
INSERT INTO public.client_scope_client VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', '444f7cda-4ba1-4206-94b8-1a07beebd250', false);
INSERT INTO public.client_scope_client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', 'bf9935c1-0494-4708-b467-21c6f62b600b', true);
INSERT INTO public.client_scope_client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d', true);
INSERT INTO public.client_scope_client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', '752a3c23-e930-4624-bb8c-22229eeee821', true);
INSERT INTO public.client_scope_client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', '6339ca16-e251-448e-9b53-62dcfc981348', true);
INSERT INTO public.client_scope_client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', '0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', true);
INSERT INTO public.client_scope_client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', '84aed7ba-433a-4443-b18a-f5cec2fc5a5a', false);
INSERT INTO public.client_scope_client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', '8d3170cd-f782-4321-9e46-f06e71334a02', false);
INSERT INTO public.client_scope_client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', '6876c768-d5aa-43eb-bb26-5c832faf4a38', false);
INSERT INTO public.client_scope_client VALUES ('2f681d28-3893-4210-a4e9-1837e9100c96', '444f7cda-4ba1-4206-94b8-1a07beebd250', false);
INSERT INTO public.client_scope_client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', 'aadd283d-c18c-463a-9ca4-9200b0ddc16f', true);
INSERT INTO public.client_scope_client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'aadd283d-c18c-463a-9ca4-9200b0ddc16f', true);
INSERT INTO public.client_scope_client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', 'aadd283d-c18c-463a-9ca4-9200b0ddc16f', true);
INSERT INTO public.client_scope_client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', 'aadd283d-c18c-463a-9ca4-9200b0ddc16f', true);
INSERT INTO public.client_scope_client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', 'aadd283d-c18c-463a-9ca4-9200b0ddc16f', true);
INSERT INTO public.client_scope_client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', 'aadd283d-c18c-463a-9ca4-9200b0ddc16f', true);
INSERT INTO public.client_scope_client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', '0bfaf6c9-e78c-42ec-b711-6e197bdf0842', true);
INSERT INTO public.client_scope_client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', 'b0616f3b-5a9c-4e00-98d5-053c50874a2f', true);
INSERT INTO public.client_scope_client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', '87ce471f-a987-4a90-ada0-4050e3181524', true);
INSERT INTO public.client_scope_client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', 'af3f763c-8d29-4128-ad42-86675aed9ed0', true);
INSERT INTO public.client_scope_client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', '028becdd-bc86-42ef-a954-116df4fcd559', false);
INSERT INTO public.client_scope_client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', '68630d2a-a59d-421c-ae58-a756334c4c52', false);
INSERT INTO public.client_scope_client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', '4debef64-1869-4a54-9b61-49d19e453e57', false);
INSERT INTO public.client_scope_client VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', '680b199d-863d-4b5a-abd8-26424060a491', false);
INSERT INTO public.client_scope_client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', '0bfaf6c9-e78c-42ec-b711-6e197bdf0842', true);
INSERT INTO public.client_scope_client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'b0616f3b-5a9c-4e00-98d5-053c50874a2f', true);
INSERT INTO public.client_scope_client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', '87ce471f-a987-4a90-ada0-4050e3181524', true);
INSERT INTO public.client_scope_client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', 'af3f763c-8d29-4128-ad42-86675aed9ed0', true);
INSERT INTO public.client_scope_client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', '028becdd-bc86-42ef-a954-116df4fcd559', false);
INSERT INTO public.client_scope_client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', '68630d2a-a59d-421c-ae58-a756334c4c52', false);
INSERT INTO public.client_scope_client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', '4debef64-1869-4a54-9b61-49d19e453e57', false);
INSERT INTO public.client_scope_client VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', '680b199d-863d-4b5a-abd8-26424060a491', false);
INSERT INTO public.client_scope_client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', '0bfaf6c9-e78c-42ec-b711-6e197bdf0842', true);
INSERT INTO public.client_scope_client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', 'b0616f3b-5a9c-4e00-98d5-053c50874a2f', true);
INSERT INTO public.client_scope_client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', '87ce471f-a987-4a90-ada0-4050e3181524', true);
INSERT INTO public.client_scope_client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', 'af3f763c-8d29-4128-ad42-86675aed9ed0', true);
INSERT INTO public.client_scope_client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', '028becdd-bc86-42ef-a954-116df4fcd559', false);
INSERT INTO public.client_scope_client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', '68630d2a-a59d-421c-ae58-a756334c4c52', false);
INSERT INTO public.client_scope_client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', '4debef64-1869-4a54-9b61-49d19e453e57', false);
INSERT INTO public.client_scope_client VALUES ('c6416b8c-6d60-4058-a323-1427f42ec623', '680b199d-863d-4b5a-abd8-26424060a491', false);
INSERT INTO public.client_scope_client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', '0bfaf6c9-e78c-42ec-b711-6e197bdf0842', true);
INSERT INTO public.client_scope_client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', 'b0616f3b-5a9c-4e00-98d5-053c50874a2f', true);
INSERT INTO public.client_scope_client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', '87ce471f-a987-4a90-ada0-4050e3181524', true);
INSERT INTO public.client_scope_client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', 'af3f763c-8d29-4128-ad42-86675aed9ed0', true);
INSERT INTO public.client_scope_client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', '028becdd-bc86-42ef-a954-116df4fcd559', false);
INSERT INTO public.client_scope_client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', '68630d2a-a59d-421c-ae58-a756334c4c52', false);
INSERT INTO public.client_scope_client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', '4debef64-1869-4a54-9b61-49d19e453e57', false);
INSERT INTO public.client_scope_client VALUES ('0ca739d3-acc4-4418-8de5-b852d1d102df', '680b199d-863d-4b5a-abd8-26424060a491', false);
INSERT INTO public.client_scope_client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', '0bfaf6c9-e78c-42ec-b711-6e197bdf0842', true);
INSERT INTO public.client_scope_client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', 'b0616f3b-5a9c-4e00-98d5-053c50874a2f', true);
INSERT INTO public.client_scope_client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', '87ce471f-a987-4a90-ada0-4050e3181524', true);
INSERT INTO public.client_scope_client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', 'af3f763c-8d29-4128-ad42-86675aed9ed0', true);
INSERT INTO public.client_scope_client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', '028becdd-bc86-42ef-a954-116df4fcd559', false);
INSERT INTO public.client_scope_client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', '68630d2a-a59d-421c-ae58-a756334c4c52', false);
INSERT INTO public.client_scope_client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', '4debef64-1869-4a54-9b61-49d19e453e57', false);
INSERT INTO public.client_scope_client VALUES ('acaccaf4-1502-4957-92ac-1a90531360a9', '680b199d-863d-4b5a-abd8-26424060a491', false);
INSERT INTO public.client_scope_client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', '0bfaf6c9-e78c-42ec-b711-6e197bdf0842', true);
INSERT INTO public.client_scope_client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', 'b0616f3b-5a9c-4e00-98d5-053c50874a2f', true);
INSERT INTO public.client_scope_client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', '87ce471f-a987-4a90-ada0-4050e3181524', true);
INSERT INTO public.client_scope_client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', 'af3f763c-8d29-4128-ad42-86675aed9ed0', true);
INSERT INTO public.client_scope_client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', '028becdd-bc86-42ef-a954-116df4fcd559', false);
INSERT INTO public.client_scope_client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', '68630d2a-a59d-421c-ae58-a756334c4c52', false);
INSERT INTO public.client_scope_client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', '4debef64-1869-4a54-9b61-49d19e453e57', false);
INSERT INTO public.client_scope_client VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', '680b199d-863d-4b5a-abd8-26424060a491', false);
INSERT INTO public.client_scope_client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'aadd283d-c18c-463a-9ca4-9200b0ddc16f', true);
INSERT INTO public.client_scope_client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', '0bfaf6c9-e78c-42ec-b711-6e197bdf0842', true);
INSERT INTO public.client_scope_client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'b0616f3b-5a9c-4e00-98d5-053c50874a2f', true);
INSERT INTO public.client_scope_client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', '87ce471f-a987-4a90-ada0-4050e3181524', true);
INSERT INTO public.client_scope_client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'af3f763c-8d29-4128-ad42-86675aed9ed0', true);
INSERT INTO public.client_scope_client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', '028becdd-bc86-42ef-a954-116df4fcd559', false);
INSERT INTO public.client_scope_client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', '68630d2a-a59d-421c-ae58-a756334c4c52', false);
INSERT INTO public.client_scope_client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', '4debef64-1869-4a54-9b61-49d19e453e57', false);
INSERT INTO public.client_scope_client VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', '680b199d-863d-4b5a-abd8-26424060a491', false);


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.client_scope_role_mapping VALUES ('84aed7ba-433a-4443-b18a-f5cec2fc5a5a', '2ef36f95-dfce-44c2-af52-fb3cddaa713e');
INSERT INTO public.client_scope_role_mapping VALUES ('028becdd-bc86-42ef-a954-116df4fcd559', 'e707184d-2fe4-4be1-9a90-b7f77da5090a');


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

INSERT INTO public.component VALUES ('4c0eb63e-d76c-456f-9556-1856ca993a84', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('bb27ef0c-98c7-400d-bdad-36eb1d2861df', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('b5103939-4456-4561-967d-4a1bb2ed5926', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('fb76beaa-8029-4310-ba37-3afc4c49cc96', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('e973ec1a-1577-414c-89f0-5bce5271ebff', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('8cd8c36e-fa7f-4628-9738-fa6fc2292a3d', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('d4a3b517-ab70-43de-83fb-5f9e37d77955', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('ecabe8f5-98f6-4c07-8c72-224077e9d4b1', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('1f532491-391f-484f-993f-61952fff302e', 'rsa-generated', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('f92d0e55-5a73-4b7e-9c22-6f18c97ae56f', 'hmac-generated', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('a821d32a-4a80-4f5e-965b-6a0bcc4606ff', 'aes-generated', 'master', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('9b00c973-a579-4797-ba4a-f7558e7c2f5a', 'rsa-generated', 'monthly', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'monthly', NULL);
INSERT INTO public.component VALUES ('fd7b5c6e-bb93-4f92-b064-e130a4e655ce', 'hmac-generated', 'monthly', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'monthly', NULL);
INSERT INTO public.component VALUES ('018f9ddc-754f-48b2-bd4b-3db93f2c9cb6', 'aes-generated', 'monthly', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'monthly', NULL);
INSERT INTO public.component VALUES ('bdcf40d8-44e1-4fdd-91d6-f5f0847e415c', 'Trusted Hosts', 'monthly', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'monthly', 'anonymous');
INSERT INTO public.component VALUES ('96e8c4bb-db4c-4872-9205-e98559add264', 'Consent Required', 'monthly', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'monthly', 'anonymous');
INSERT INTO public.component VALUES ('282cfc97-b3aa-4bfb-a905-168383972e39', 'Full Scope Disabled', 'monthly', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'monthly', 'anonymous');
INSERT INTO public.component VALUES ('97c01b90-753e-49ed-b752-e46413a27b8e', 'Max Clients Limit', 'monthly', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'monthly', 'anonymous');
INSERT INTO public.component VALUES ('d64cdd24-19a9-4258-92f4-7fa14a0c5d62', 'Allowed Protocol Mapper Types', 'monthly', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'monthly', 'anonymous');
INSERT INTO public.component VALUES ('32643e8b-1195-4089-b7f5-9dbfcf0784f2', 'Allowed Client Scopes', 'monthly', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'monthly', 'anonymous');
INSERT INTO public.component VALUES ('6645fbd7-3c23-471b-a614-77735a5de30e', 'Allowed Protocol Mapper Types', 'monthly', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'monthly', 'authenticated');
INSERT INTO public.component VALUES ('d40d85fa-b555-4b58-8615-b487f6593c36', 'Allowed Client Scopes', 'monthly', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'monthly', 'authenticated');
INSERT INTO public.component VALUES ('dbeb2cef-25f7-4de1-b10a-b20bffe49508', NULL, 'monthly', 'declarative-user-profile', 'org.keycloak.userprofile.UserProfileProvider', 'monthly', NULL);


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.component_config VALUES ('d982497f-ade4-4045-a4c0-9f4593be6f9d', 'ecabe8f5-98f6-4c07-8c72-224077e9d4b1', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('248eccc2-7e26-45f8-93c4-398e588b6241', '8cd8c36e-fa7f-4628-9738-fa6fc2292a3d', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('5cb47c0c-183a-4bf8-b5f9-b692c672f31c', '4c0eb63e-d76c-456f-9556-1856ca993a84', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('f98eaca0-ff04-452c-95a8-ba575e444203', '4c0eb63e-d76c-456f-9556-1856ca993a84', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('310837c3-829b-45ab-ac32-840ee321aa7a', 'e973ec1a-1577-414c-89f0-5bce5271ebff', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('59add28b-0fe8-4499-b51f-fc2343bf6436', 'e973ec1a-1577-414c-89f0-5bce5271ebff', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('6b407225-5431-472d-8bca-c18f113bc712', 'e973ec1a-1577-414c-89f0-5bce5271ebff', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('6617048c-418c-41a2-a160-26d9d63243e2', 'e973ec1a-1577-414c-89f0-5bce5271ebff', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('eb337c48-d26b-4018-a00d-b29d4a6c002e', 'e973ec1a-1577-414c-89f0-5bce5271ebff', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('52b01aa3-194d-4e79-a597-fc534300576f', 'e973ec1a-1577-414c-89f0-5bce5271ebff', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('ede7c884-661c-45a7-864f-b21194236b6a', 'e973ec1a-1577-414c-89f0-5bce5271ebff', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('05b61873-1ab3-4d12-9f16-104e23148a96', 'e973ec1a-1577-414c-89f0-5bce5271ebff', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('fae21c32-a68f-4f93-bfb7-a06d4c66a43c', 'd4a3b517-ab70-43de-83fb-5f9e37d77955', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('72600689-a08c-4665-933c-38d90c67e38e', 'd4a3b517-ab70-43de-83fb-5f9e37d77955', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('b55eebe6-166e-4b16-b2d2-0f293ec6aca9', 'd4a3b517-ab70-43de-83fb-5f9e37d77955', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('a0fdb7a2-5abd-4825-86f3-944776f12a5d', 'd4a3b517-ab70-43de-83fb-5f9e37d77955', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('615eddbf-1a6d-4a05-b8ac-da65cbb350d6', 'd4a3b517-ab70-43de-83fb-5f9e37d77955', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('4c90db58-93c4-4631-beb9-1de11d2a4478', 'd4a3b517-ab70-43de-83fb-5f9e37d77955', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('7692cd69-4ef7-4143-9563-a708ddfd86b2', 'd4a3b517-ab70-43de-83fb-5f9e37d77955', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('1bb19152-3736-40a0-b548-8fca2746230b', 'd4a3b517-ab70-43de-83fb-5f9e37d77955', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('033bf70c-bcf0-46a6-b8f0-cbfa0e49df8b', 'fb76beaa-8029-4310-ba37-3afc4c49cc96', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('973f11ea-6af7-4914-acab-b4c49b8287d2', '1f532491-391f-484f-993f-61952fff302e', 'privateKey', 'MIIEpAIBAAKCAQEArNho+S1C/Ixef+ryJyF6te4cjgnNyO27ggqUwOyoWSuA5gF5uAceFhyaU3mB0Fl3qKit3QAE4KXI5pvWm0iCYPXv/sU8USGHRfo+TJYHh2II+NkKlHliQqXYS4wyxhzIxKHV0Oh08dmT01ogTK75QhkiBfv7RG9qjhJh8Gn+wKjHyGhAVqpcw0joQ+Kmff2xo/efuPcOTZuj0Npx16QdHq8+/s3rLlTPP774QBNZYqJY2bBW/d/ydPdN99KXivzTtGR4bD/PZWfzSKHRnxR7/8BuztrECs4wDs0PNdhIZbsP+l6LCTvaM/IdxyyjoCb09m4mbxrqXzfHE7CTh+pBdwIDAQABAoIBAF/9X27igA0ZN3H63Lh2k1tt/VW0hCBORpAVqD7sLyI2UsNplltpOIA3Kk2pcTpwNU/pPYU6eXr5FvVbHnfmcOHAM6RdjP3RjPqD2w1VVKEPBMSOZJ3IO5Wf3Ns35Qq4+ZaZ+dCnCCs4FiyOJNnxYmQe6RJBum1rItX7x4BonR4IsHrdTFkffOAHXtYQagO0h/EOlYq3F0NMf0pbSBJ6VYf9TM4oEXxkTWpQXWVmSMlWZ0MPDNAtUzwTPezffmqHWEfpMpG6mwdS11Xk5qjfQ2a2YrWUDhqESEdDYfSXk5PM9n9M9tGj9TFgdhYPIi6vg7qkHXTkgIDSjgmWhpvBv8ECgYEA+xVo+T8mUH3zOsSBsLTWpevcklLxa9KYg2Rkjv9LOrD2BQNVid6mB+sQYK4ZqYQspv4+Rf7aJqvC715yNTi+lxMbxPnqXm/WTqZSimz60j+s02eF+mkvaFxt4BtpP/ylutRaXnSzz5ijUEPnMJCfE0lLAoj3fDu+zJLKOp3tKNkCgYEAsDrR/GeWzMYM5ouRA5ljvEE+7ywk2b+4L18UCzTWiP/WK/mUPHq3daor73OQTmJOTTVK2N9T3+u1cEuSx14o8nGAHADxDOXUDRDZq4pnARE7vuHPtiTTLQOSWljMU8KiE137A+9cEx9G/CvDUtVV9AFRcx60OyYRTykdYL9jys8CgYBdFgXyChiBVQCc9AeE5LaDkxsWYIvCxrPmWozxevKAEuVS3HaVA6eYXeyXe1RmRWtsieu6dY6ZMaq2pdQ/qQb36YytDV53nozcYctOKLMgyZygT8wbF24NCd9ua5ssrtUem+XZCPk06Mj7VAFdPvDK7KxTh0YBmADXxUAWVUB8mQKBgQCMY09Es4D+QAem4Sf0pg09uvxXq+LvVDt2AVgGVWFSYfxLq9bbFydvJNE7P+SFjOqztvCZM8+tYih3/LxA9lHIUYKszFM64xu6DOJaNTc5MnFV7q15fHx+L4o3TuX3E+XpZ8S/rb67vP7fhD1lj22ZpDMuchdBx2Gini45FD57IQKBgQDceisFW4dfWyzUbsIVxg0ncBDwFYm4yX5M+YPRrk+XlLls6ltub5pSt+0VaPszOnOA2038ZwMdJdY6Kf3ZHhArGH3Yl6Bgccw0yZcVzTlnrcbO0YlBB9i2ze2BIlAet4bkh2uSokmpaNmxJXAhkwkhEtBmRfFbtjqyw5Z6M1+pbA==');
INSERT INTO public.component_config VALUES ('a768b8d6-d0dc-41e2-acfa-127f246a0323', '1f532491-391f-484f-993f-61952fff302e', 'certificate', 'MIICmzCCAYMCBgF2Q4GH5zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAxMjA4MTc1NzExWhcNMzAxMjA4MTc1ODUxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCs2Gj5LUL8jF5/6vInIXq17hyOCc3I7buCCpTA7KhZK4DmAXm4Bx4WHJpTeYHQWXeoqK3dAATgpcjmm9abSIJg9e/+xTxRIYdF+j5MlgeHYgj42QqUeWJCpdhLjDLGHMjEodXQ6HTx2ZPTWiBMrvlCGSIF+/tEb2qOEmHwaf7AqMfIaEBWqlzDSOhD4qZ9/bGj95+49w5Nm6PQ2nHXpB0erz7+zesuVM8/vvhAE1lioljZsFb93/J090330peK/NO0ZHhsP89lZ/NIodGfFHv/wG7O2sQKzjAOzQ812Ehluw/6XosJO9oz8h3HLKOgJvT2biZvGupfN8cTsJOH6kF3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAA/SYgId3LuKbj9rbdTN6BQKFTnv4Mh2kh6CkTtrdaNrmz2ncTDkBpvCrVPyttvKi6bF9mXnymJhg3Ku5Ditm2H6zWNm2mxJFbzCTTtPna0xGMIuHBW+wGlcxzdmS3qmRFpBFy3YquEiQSOzOYCgrkGDTMZqiiojsjv5CoLMe2O1puvorxZEmcb7kY4l+j+fQo13tq9+PTVF/XOdQzSbjNzA8QjVNK+wRbgYbJbF3EGvsQtJIlryx9JS3u6WgPDoAHwQ199I0GrX3EhIknqhJDc1qm38bo8kHUFIg1J28G/6Xww8OX8TqflZZSk+T21/IhF1h+Al3OoQPSnYJUZQx0E=');
INSERT INTO public.component_config VALUES ('37858ba3-ba58-434e-a32a-0aee5a1e4155', '1f532491-391f-484f-993f-61952fff302e', 'priority', '100');
INSERT INTO public.component_config VALUES ('62a0fe27-ea99-4393-af35-7bf0a08b09de', 'f92d0e55-5a73-4b7e-9c22-6f18c97ae56f', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('609bae92-78ab-441f-a869-7a9b381b3c1d', 'f92d0e55-5a73-4b7e-9c22-6f18c97ae56f', 'kid', 'dbf9076c-f1dc-42a1-a0f4-c76fd01285d3');
INSERT INTO public.component_config VALUES ('08cc80b4-fe8f-4696-9e25-be52b57e9957', 'f92d0e55-5a73-4b7e-9c22-6f18c97ae56f', 'priority', '100');
INSERT INTO public.component_config VALUES ('f95f3754-f286-4060-aa63-c6ccd31e4b04', 'f92d0e55-5a73-4b7e-9c22-6f18c97ae56f', 'secret', 'MyqpPa2urYawbRpu1VQSWTcDa5NjfbN19WA7ysZVUf_172uBXDQzpUWwXUGMMPmfluGVeL4bwMqRkQPXOKLhSA');
INSERT INTO public.component_config VALUES ('6db3fb2f-a209-41d7-95c0-a2ba9971e607', 'a821d32a-4a80-4f5e-965b-6a0bcc4606ff', 'priority', '100');
INSERT INTO public.component_config VALUES ('840bae29-59d2-465c-b74b-f9f9082e97ab', 'a821d32a-4a80-4f5e-965b-6a0bcc4606ff', 'secret', 'mQ-kYFJAvUaPlOdDx-0mAA');
INSERT INTO public.component_config VALUES ('6b7df7f9-eeab-4bb5-8e7b-68f6c7fd72b6', 'a821d32a-4a80-4f5e-965b-6a0bcc4606ff', 'kid', '84a99270-75f0-4f60-bec7-631ff8aa6a19');
INSERT INTO public.component_config VALUES ('eb34e1ad-5325-423d-804a-5875126c8f06', 'fd7b5c6e-bb93-4f92-b064-e130a4e655ce', 'priority', '100');
INSERT INTO public.component_config VALUES ('e7b6c53f-6d59-408a-8d12-338db342a153', 'fd7b5c6e-bb93-4f92-b064-e130a4e655ce', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('d42b5ff5-21f6-49c4-ac84-b84ddf46480f', 'fd7b5c6e-bb93-4f92-b064-e130a4e655ce', 'kid', 'a6e1e0c4-abc8-4c5f-824a-ade37aa726bf');
INSERT INTO public.component_config VALUES ('c40cccd9-31eb-48d6-87e9-42355d88d0f7', 'fd7b5c6e-bb93-4f92-b064-e130a4e655ce', 'secret', '_J_mUzF2AjoOjs_loXROQ2rBm40pWTAqwomHF_pAVqeIhyl0jMAISleGIV_-ZFfV4YqAEQJy9oe-IenpoRdSeg');
INSERT INTO public.component_config VALUES ('4eb42502-7efd-4ca3-97e5-5c8026160ba5', '018f9ddc-754f-48b2-bd4b-3db93f2c9cb6', 'kid', 'b3ddcd2f-9c4c-4e59-ab27-8fd694b6ac14');
INSERT INTO public.component_config VALUES ('37f60b48-7e4c-4ea7-bcd2-350235a4713f', '018f9ddc-754f-48b2-bd4b-3db93f2c9cb6', 'secret', 'Fkly2P8EXKXFH_BimUsngA');
INSERT INTO public.component_config VALUES ('0080f1ce-eaf9-45a4-b06b-82b4a1d72ebd', '018f9ddc-754f-48b2-bd4b-3db93f2c9cb6', 'priority', '100');
INSERT INTO public.component_config VALUES ('0919574a-d095-4acf-88d8-3e472d05a7a6', '9b00c973-a579-4797-ba4a-f7558e7c2f5a', 'certificate', 'MIICnTCCAYUCBgF2Q5vCtTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdtb250aGx5MB4XDTIwMTIwODE4MjU1MFoXDTMwMTIwODE4MjczMFowEjEQMA4GA1UEAwwHbW9udGhseTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ4WXWSbcz2gQLj3SD4YvE+taQEfDdof1E465S6CbaXKV+q66l7EEmyLrnw7Pk37VoZUJkNLZvh7l3OVNchhquWw1eBkTqPEMNSZcaOQ/VsTu9so5bwg3sxnDR2472eWpUwq0GLxKGM13jg1eFmzzeKg1w37pG6MzQ+d5u1ydUoEGfTNTCOeWXzNji8zmdo8M4PkskNY3RAuAGPsU1c+VLRc9F3z+PbFrb1S0FuW58ErfKtbxfkgH/ldltckkxFmW1JYgFjbpynY4sTVVEdvT9mO14c1op0+NHyfaSUDd+cewGIjrKaoiFk/4urcS615lfsTqUORgy76mGzbyP27lYsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAhWn0ypwPVwPix5rYmt0NCkpHxCXcYIz+GrZG6YA+Vk7AiDu+NXgHj1lXj/4kS72kEzpafnvEk7vYHmbk7deRxLMY62rq2Gzp8XMohXviIMSU96p9ZoNdLxZBuYxN18eBOojA+I2nd5yj0zBo92nJBBp7+liKhm3/ekk1sQ/OvFH32zBNEdWZXc8nW6tik0k9YXwY7urxbQ3oQGTd95pmciZ43lwTbhzIHajpBH91BXaOYEy0G8Tf3IwJs/Tvm7w8WDefF2CQj7UpDCF5lTTgHg2iGRnAoQPdm3w5EPIW48FzXC77IVNIDA5gR6kqnIMv9Ym51HXihg7KwbhiTU8uug==');
INSERT INTO public.component_config VALUES ('3b6cfc66-540f-4513-a0fe-a480484a28a1', '9b00c973-a579-4797-ba4a-f7558e7c2f5a', 'privateKey', 'MIIEogIBAAKCAQEAnhZdZJtzPaBAuPdIPhi8T61pAR8N2h/UTjrlLoJtpcpX6rrqXsQSbIuufDs+TftWhlQmQ0tm+HuXc5U1yGGq5bDV4GROo8Qw1Jlxo5D9WxO72yjlvCDezGcNHbjvZ5alTCrQYvEoYzXeODV4WbPN4qDXDfukbozND53m7XJ1SgQZ9M1MI55ZfM2OLzOZ2jwzg+SyQ1jdEC4AY+xTVz5UtFz0XfP49sWtvVLQW5bnwSt8q1vF+SAf+V2W1ySTEWZbUliAWNunKdjixNVUR29P2Y7XhzWinT40fJ9pJQN35x7AYiOspqiIWT/i6txLrXmV+xOpQ5GDLvqYbNvI/buViwIDAQABAoH/OqoR/kOxgCz316vsIx8KwoaXcNMVUNx+7Ijug1PjXKK5/WFfl8srCxzKo09Yz5d1hGO1z0Mr8wnqKfo0+ydDQ/lbZOnURPGJLVvDz+7+Fc486BdFKYsJItEbDOyT6tz8ekdpDU5wrmBPFozBHIic3nzRUV8QpfWaIzF1gKf43n4RtkkFSxjYNZ1aPElaV9o+jGSbsa5+M0hTAPfzBVpo4ylmV56ObtpX3SG6UZasmsb9eZhrZdE0vKfuvHdFz1O2p0Ik5vcQZnFiGdvN0CX0Erw7uj9Ue+mfLGT862OjMl9wJMl2iQG5f6m/NhhWfC0aI2j38oY31PcpFp1XrmZxAoGBANFmuiGPoiSxx51md7yq7mGq9wg5qKNJrj7lyMwg8RW3WaYH053A5v+EAfL1xsfwpW9cCPcmXI58+d/xIc3p7G3h65Qrs1OutW515e/cTgf4aJ/0wxak2wATuy8H7Xrf5RwX4Vpnok0bI+jwqIQ5MPEwvFyU55cX/mdyanNmeiAJAoGBAMFEXKT6EWR48ZAtaW+yyuOhUPKPpPFV7NOVmjkX2DZBiUTk5Vhf4fpwoBzbh2KplJ4lUxeZiVoZDl+cLdyp5wBa8YKmIFUxA7OELaCWX+OT1z5ouyZLRUcKiCvLOja7vqr7gVwoM1eF0o6GwR7RNuSd2FvjOv3+POKvmJgpdwXzAoGBAKCpi8fyNzqmOHy4wMe98jZ3gSALdSsLfih+D0knQTIjQiJUQPX5qoKDWyd5kXGYXqYJXEucYElm9CTxErm1cBSC0UgXG3jqRAQjay9UvX36BvQrTH+ULv9pJCYalAfBvzyFyf6eIvW8DBpOg00nwDhd5ze1e9b+rs/aBnjSOINZAoGANkpn5AhDXoADC8dV+QS2rd8hCCKF6S2EC6PY4PTrzcH3N509N+gnaNy+fZzFmVed4hcGEnkU9nRXb1BGKdiohZcGhPb52jScn48f6h6T7TAYpPVyrT0zxtMUkYjTX5C57Podyq+YTJvRHCyKj4eh7fLRVm6sobELlXpSWVw8jTUCgYEAl6aoRRBPsESGYlAhzflUb9+DvdkNrv75i1y/8izwH+Suf2iuM43i0paTZcVPHysVyGIChytR4bNxR+e/r2JnQDQGEhYfyaUkmwvEcf4b6nfC74W+z1rG98ZqN478Z5dYDIUv1p2pyQqpJtYF0nmNAo95AdRe6tECToeIHLFUhFs=');
INSERT INTO public.component_config VALUES ('37c55155-d42d-4639-9205-f8ec9d26327a', '9b00c973-a579-4797-ba4a-f7558e7c2f5a', 'priority', '100');
INSERT INTO public.component_config VALUES ('35cd97ed-6251-44aa-95bf-0258a681a77e', 'd64cdd24-19a9-4258-92f4-7fa14a0c5d62', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('935fae80-b49b-44ac-bf52-c53294e997c9', 'd64cdd24-19a9-4258-92f4-7fa14a0c5d62', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('4cea8802-750e-4b90-806e-19a09c413ff3', 'd64cdd24-19a9-4258-92f4-7fa14a0c5d62', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('472f3635-11a7-41f1-ae1c-d2241de65955', 'd64cdd24-19a9-4258-92f4-7fa14a0c5d62', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('7411a3d8-b5b1-4f34-b459-54c3da58cb26', 'd64cdd24-19a9-4258-92f4-7fa14a0c5d62', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('de493531-5331-4355-9b3a-0ed0b5e7bfa3', 'd64cdd24-19a9-4258-92f4-7fa14a0c5d62', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('74af879a-3e54-473f-a748-0a52374e5951', 'd64cdd24-19a9-4258-92f4-7fa14a0c5d62', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('19347741-5c38-436e-9a8b-ae7e959beeb8', 'd64cdd24-19a9-4258-92f4-7fa14a0c5d62', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('6320dd62-c065-45f4-af6e-6f62b959540d', 'd40d85fa-b555-4b58-8615-b487f6593c36', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('d7b45c10-570f-4791-91e9-732890fc8a62', '6645fbd7-3c23-471b-a614-77735a5de30e', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('da2ed68c-48ac-4e22-b9bf-83de12748c86', '6645fbd7-3c23-471b-a614-77735a5de30e', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('d1cc6f75-1737-4b0e-b667-ec118c757a51', '6645fbd7-3c23-471b-a614-77735a5de30e', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('556e5141-9fc5-44bf-b946-f20781be101a', '6645fbd7-3c23-471b-a614-77735a5de30e', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('1724baaf-02b3-4d54-9bdb-090c6a2f428c', '6645fbd7-3c23-471b-a614-77735a5de30e', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('9efe0be4-a907-4c9b-b15f-39bf6c6ccbd6', '6645fbd7-3c23-471b-a614-77735a5de30e', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('8ee8f9dd-c171-4e30-afe5-47e513375ed4', '6645fbd7-3c23-471b-a614-77735a5de30e', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('67583cbf-0acd-4c78-89d4-cf0b41a70ad5', '6645fbd7-3c23-471b-a614-77735a5de30e', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('806735b1-6e4d-4f9c-ae77-2a0abd74e331', 'bdcf40d8-44e1-4fdd-91d6-f5f0847e415c', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('ae2ad410-5666-4ada-b1a9-84a206d98f02', 'bdcf40d8-44e1-4fdd-91d6-f5f0847e415c', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('de55be18-20c7-421c-b72a-2c21c1d5c686', '97c01b90-753e-49ed-b752-e46413a27b8e', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('0e75c488-a481-4743-9d8d-12d487219a7c', '32643e8b-1195-4089-b7f5-9dbfcf0784f2', 'allow-default-scopes', 'true');


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '800c4d2a-fa50-4e89-b5db-7c01de177dfa');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '4088e103-ce17-415a-9f97-77b656642226');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '799facbb-cc45-4438-ab94-8bc6c2dc5b36');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'eb62f4ad-9629-4e52-8cc9-7d076f079b62');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'c41b1dd2-4aa4-4ed9-bc0f-d94db06269e4');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '212e1164-3f35-46a0-a3c4-ef5c03cf7765');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '8f2b6755-158d-4bc1-8402-a0ebd348a07f');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '5882b8da-6bbf-44c3-8b74-1b87aaa8df1c');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '16bec54c-2276-43b6-8e98-26479f9c81c6');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '72ab1383-b307-4649-b5fc-235d8ab41d46');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '2806f563-ba50-4eea-acfe-bb9ce1f631d0');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '05beeb05-24ec-43bd-a1f7-feeb32c7b13c');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'c33f2ff7-9051-4517-8c96-ee0b2de97fc2');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '4b1e0a80-f5cd-45b4-989e-e6d41687f8fe');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'cd2b0805-c399-444c-b078-92412c89b114');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'c995ce09-e04f-48f7-a8d8-ae0e681f5c0d');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '16fa733f-267e-4a3f-99f7-85657f6b57ad');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '3e4905b5-4550-4a96-8b9c-81159731607b');
INSERT INTO public.composite_role VALUES ('eb62f4ad-9629-4e52-8cc9-7d076f079b62', '3e4905b5-4550-4a96-8b9c-81159731607b');
INSERT INTO public.composite_role VALUES ('eb62f4ad-9629-4e52-8cc9-7d076f079b62', 'cd2b0805-c399-444c-b078-92412c89b114');
INSERT INTO public.composite_role VALUES ('c41b1dd2-4aa4-4ed9-bc0f-d94db06269e4', 'c995ce09-e04f-48f7-a8d8-ae0e681f5c0d');
INSERT INTO public.composite_role VALUES ('65d6ca47-a8ea-4be5-aa07-4f62db4a8b96', '0dc29ffc-8911-45a2-829a-287d83998a0c');
INSERT INTO public.composite_role VALUES ('a521a352-c903-4df1-811a-24f008576e20', 'b266c6d9-e243-4535-9606-c18717b34d41');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'd9679019-8dda-4dd4-a157-5424280977e4');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '12c0f6e7-5bfe-4f09-a9ea-07fade68bfa2');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'b87cdb7e-84f0-4341-81b4-149610a3eff3');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '42033cfb-468e-4d2e-95c6-1dd89445dcda');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '352261e3-8c36-41bb-9070-01b978310860');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '8a1b6e79-fe52-4596-9e9f-52883b06f439');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'ac1e8399-435f-4da4-bcaf-340fc3089b5c');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'e8cfda87-a961-4a15-aeef-607bcec5edc7');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '4538e5fa-2bca-41a2-a231-2fc69b2e1d04');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '7dbac1b2-cd48-4e67-991d-72107de8caf0');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '1d924cdb-0d15-4b4c-bdc5-581cb15f3e7f');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '447e29fb-e991-41e0-83e7-c872114e1586');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '6180d8f9-8c73-45f8-9577-afebc030eb04');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'eb381da2-ad88-4bba-ac4b-5d5610318b67');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '2cfb12aa-71f9-4f5d-b8b8-2baf49147fbf');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '2c987a36-34aa-48e6-98a5-c6ffd8af67c1');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '1e7f48af-2274-48c3-89ce-3323088d93b3');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'b14e3db6-3d45-4838-9c09-5e6e949032f0');
INSERT INTO public.composite_role VALUES ('42033cfb-468e-4d2e-95c6-1dd89445dcda', '2cfb12aa-71f9-4f5d-b8b8-2baf49147fbf');
INSERT INTO public.composite_role VALUES ('42033cfb-468e-4d2e-95c6-1dd89445dcda', 'b14e3db6-3d45-4838-9c09-5e6e949032f0');
INSERT INTO public.composite_role VALUES ('352261e3-8c36-41bb-9070-01b978310860', '2c987a36-34aa-48e6-98a5-c6ffd8af67c1');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '8325202c-aa18-40ee-bf42-a377cad20076');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '8b6c5ace-4205-4cb2-a921-5b9ea55b6349');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', 'a7c11fe8-dc8e-4cd5-850c-cbad38965820');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '8ebd77a7-fdd9-45ba-a4f9-24dcdca3d84b');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '415c3c38-db6e-4057-89d5-481e535dfbf5');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '146a6504-abca-495f-9507-b39d4729848b');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', 'f7e975a2-9487-4728-a6eb-cd811d82300f');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', 'f6baf483-ff0e-44e7-a9ee-1d8a4bb60597');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '354d7eb6-ff94-4a2c-9746-b851e8dcedc8');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '9f1672c8-c08f-4768-929a-cb3fbf29a088');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', 'f5606112-cf9e-49fa-8da3-ff32c759deac');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', 'f906d21c-3057-4f04-82a9-7f2e6362a651');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '8962c9ae-578d-471a-87c2-fd347f0713c1');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '8dfd913d-c1c8-44ac-b88d-58dad5325c1f');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '73197852-38d7-43cb-b918-21e7834f4b90');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', 'c816cc64-5c9b-4a9c-a48e-d94141ba8183');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '4e67928b-4564-4835-b54f-0686fded61c0');
INSERT INTO public.composite_role VALUES ('a7c11fe8-dc8e-4cd5-850c-cbad38965820', '8dfd913d-c1c8-44ac-b88d-58dad5325c1f');
INSERT INTO public.composite_role VALUES ('a7c11fe8-dc8e-4cd5-850c-cbad38965820', '4e67928b-4564-4835-b54f-0686fded61c0');
INSERT INTO public.composite_role VALUES ('8ebd77a7-fdd9-45ba-a4f9-24dcdca3d84b', '73197852-38d7-43cb-b918-21e7834f4b90');
INSERT INTO public.composite_role VALUES ('04ab2a31-3da1-4a06-a8d3-f9a008d356d5', '182b7f0a-a2dd-4fb1-9481-54be76800da4');
INSERT INTO public.composite_role VALUES ('af59471c-6a8f-49cf-9401-c1edb4459ec6', '31194f2e-0377-4e79-83bb-21f87be63ff6');
INSERT INTO public.composite_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '42c7818b-e05e-440f-847c-0cedb696ed84');
INSERT INTO public.composite_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', '068487b9-1fcc-4f4c-8788-6fc4e775a599');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', 'b245b684-78ed-40fd-88d8-fcd82f3bb2ea');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', 'f7e975a2-9487-4728-a6eb-cd811d82300f');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '146a6504-abca-495f-9507-b39d4729848b');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '8b6c5ace-4205-4cb2-a921-5b9ea55b6349');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '8dfd913d-c1c8-44ac-b88d-58dad5325c1f');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '4e67928b-4564-4835-b54f-0686fded61c0');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '8325202c-aa18-40ee-bf42-a377cad20076');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '354d7eb6-ff94-4a2c-9746-b851e8dcedc8');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', 'c816cc64-5c9b-4a9c-a48e-d94141ba8183');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '415c3c38-db6e-4057-89d5-481e535dfbf5');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', 'f5606112-cf9e-49fa-8da3-ff32c759deac');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', 'f6baf483-ff0e-44e7-a9ee-1d8a4bb60597');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '15c3421f-4ab8-4fc3-a7a7-b5d07dca2976');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '068487b9-1fcc-4f4c-8788-6fc4e775a599');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', 'a7c11fe8-dc8e-4cd5-850c-cbad38965820');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '9f1672c8-c08f-4768-929a-cb3fbf29a088');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '73197852-38d7-43cb-b918-21e7834f4b90');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '8962c9ae-578d-471a-87c2-fd347f0713c1');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', 'f906d21c-3057-4f04-82a9-7f2e6362a651');
INSERT INTO public.composite_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', '8ebd77a7-fdd9-45ba-a4f9-24dcdca3d84b');
INSERT INTO public.composite_role VALUES ('e458c786-edf0-4b59-9c89-d1d2528db20b', 'e707184d-2fe4-4be1-9a90-b7f77da5090a');
INSERT INTO public.composite_role VALUES ('e458c786-edf0-4b59-9c89-d1d2528db20b', '7f9c2f0a-4b51-4ca4-b254-70b72b08262f');
INSERT INTO public.composite_role VALUES ('e458c786-edf0-4b59-9c89-d1d2528db20b', '6ee15ba2-d581-4f39-b819-77c64a6e7844');
INSERT INTO public.composite_role VALUES ('e458c786-edf0-4b59-9c89-d1d2528db20b', '04ab2a31-3da1-4a06-a8d3-f9a008d356d5');
INSERT INTO public.composite_role VALUES ('e0aff75d-0516-4c7a-8deb-68508f180082', '2ef36f95-dfce-44c2-af52-fb3cddaa713e');
INSERT INTO public.composite_role VALUES ('e0aff75d-0516-4c7a-8deb-68508f180082', '3ad06f96-de63-4ca8-8a16-d66add08b413');
INSERT INTO public.composite_role VALUES ('e0aff75d-0516-4c7a-8deb-68508f180082', '15ab8020-ea70-4ec6-b192-45b82b40add4');
INSERT INTO public.composite_role VALUES ('e0aff75d-0516-4c7a-8deb-68508f180082', '65d6ca47-a8ea-4be5-aa07-4f62db4a8b96');
INSERT INTO public.composite_role VALUES ('e458c786-edf0-4b59-9c89-d1d2528db20b', '4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba');
INSERT INTO public.composite_role VALUES ('e458c786-edf0-4b59-9c89-d1d2528db20b', 'b245b684-78ed-40fd-88d8-fcd82f3bb2ea');


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.credential VALUES ('9cb90543-9544-4d0e-9498-825aa3485e66', NULL, 'password', '2cf387a2-bc07-4267-b7f5-97c827688286', 1607450910661, NULL, '{"value":"E651Nb6PwYhLqUDFT6fFd5ZiWDD6A3C9O7C0vhY+6jUALvZveSjWyNHEX9ljpV7ggs1CwChYlob6Ab6q7ooceg==","salt":"kjUip5XbaNsqnJ5woV3g3A=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO public.credential VALUES ('6a04a241-23fe-47cf-82f9-b11ab670a0c4', NULL, 'password', '429cf9d8-b393-43de-a895-7d08277e9aff', 1607452195514, NULL, '{"value":"0tb8kuQPmQdZ872hpOHe/bI9WvSBr/Ep34V6PdNWeyTLmZnBMkDTHn9BwdfE5cYrjYtDXDAMNhR2uEH8WY8TrQ==","salt":"48WpkPyC/LNXsxuJCH5XXg=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2020-12-08 17:58:45.407286', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2020-12-08 17:58:45.420738', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2020-12-08 17:58:45.453779', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2020-12-08 17:58:45.45734', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2020-12-08 17:58:45.532261', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2020-12-08 17:58:45.541682', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2020-12-08 17:58:45.616602', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2020-12-08 17:58:45.622495', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2020-12-08 17:58:45.628691', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2020-12-08 17:58:45.701107', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2020-12-08 17:58:45.743676', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2020-12-08 17:58:45.746954', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2020-12-08 17:58:45.764334', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-12-08 17:58:45.779486', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-12-08 17:58:45.781448', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-12-08 17:58:45.783278', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-12-08 17:58:45.784854', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2020-12-08 17:58:45.817771', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2020-12-08 17:58:45.847896', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2020-12-08 17:58:45.852258', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-12-08 17:58:46.148086', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2020-12-08 17:58:45.854684', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2020-12-08 17:58:45.856899', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2020-12-08 17:58:45.873921', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2020-12-08 17:58:45.878314', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2020-12-08 17:58:45.880005', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2020-12-08 17:58:45.898878', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2020-12-08 17:58:45.947199', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2020-12-08 17:58:45.950571', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2020-12-08 17:58:45.988889', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2020-12-08 17:58:45.998524', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2020-12-08 17:58:46.011622', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2020-12-08 17:58:46.015705', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-12-08 17:58:46.020733', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-12-08 17:58:46.023104', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-12-08 17:58:46.042054', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2020-12-08 17:58:46.04589', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-12-08 17:58:46.049998', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2020-12-08 17:58:46.052937', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2020-12-08 17:58:46.055808', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-12-08 17:58:46.057363', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-12-08 17:58:46.058961', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2020-12-08 17:58:46.06299', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-12-08 17:58:46.138761', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2020-12-08 17:58:46.143907', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-12-08 17:58:46.152745', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-12-08 17:58:46.154881', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-12-08 17:58:46.181806', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-12-08 17:58:46.185478', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2020-12-08 17:58:46.211327', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2020-12-08 17:58:46.228974', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2020-12-08 17:58:46.231497', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2020-12-08 17:58:46.234002', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2020-12-08 17:58:46.236356', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-12-08 17:58:46.240585', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-12-08 17:58:46.244013', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-12-08 17:58:46.25903', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-12-08 17:58:46.331912', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2020-12-08 17:58:46.35376', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2020-12-08 17:58:46.359675', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2020-12-08 17:58:46.366344', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2020-12-08 17:58:46.370659', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2020-12-08 17:58:46.373453', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2020-12-08 17:58:46.376442', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2020-12-08 17:58:46.379294', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2020-12-08 17:58:46.392285', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2020-12-08 17:58:46.396411', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2020-12-08 17:58:46.400372', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2020-12-08 17:58:46.409992', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2020-12-08 17:58:46.414634', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2020-12-08 17:58:46.417694', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-12-08 17:58:46.423984', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-12-08 17:58:46.430356', 73, 'EXECUTED', '7:03b3f4b264c3c68ba082250a80b74216', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-12-08 17:58:46.432083', 74, 'MARK_RAN', '7:64c5728f5ca1f5aa4392217701c4fe23', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-12-08 17:58:46.447166', 75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-12-08 17:58:46.453342', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-12-08 17:58:46.457036', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-12-08 17:58:46.45883', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-12-08 17:58:46.473537', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-12-08 17:58:46.475394', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-12-08 17:58:46.479391', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-12-08 17:58:46.48142', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-12-08 17:58:46.484591', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-12-08 17:58:46.486208', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-12-08 17:58:46.490043', 85, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '7450325144');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-03-29 13:19:14.558297', 86, 'MARK_RAN', '7:3979a0ae07ac465e920ca696532fc736', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-03-29 13:19:14.585356', 87, 'MARK_RAN', '7:5abfde4c259119d143bd2fbf49ac2bca', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2022-03-29 13:19:14.621912', 88, 'EXECUTED', '7:3dace6b144c11f53f1ad2c0361279b86', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2022-03-29 13:19:14.667678', 89, 'EXECUTED', '7:578d0b92077eaf2ab95ad0ec087aa903', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2022-03-29 13:19:14.71224', 90, 'EXECUTED', '7:c95abe90d962c57a09ecaee57972835d', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-29 13:19:14.774564', 91, 'EXECUTED', '7:f1313bcc2994a5c4dc1062ed6d8282d3', 'addColumn tableName=REALM; customChange', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-29 13:19:14.796368', 92, 'EXECUTED', '7:90d763b52eaffebefbcbde55f269508b', 'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-29 13:19:14.912813', 93, 'EXECUTED', '7:d554f0cb92b764470dccfa5e0014a7dd', 'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-29 13:19:14.948958', 94, 'EXECUTED', '7:73193e3ab3c35cf0f37ccea3bf783764', 'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-29 13:19:14.957526', 95, 'MARK_RAN', '7:90a1e74f92e9cbaa0c5eab80b8a037f3', 'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-29 13:19:14.991736', 96, 'EXECUTED', '7:5b9248f29cd047c200083cc6d8388b16', 'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-29 13:19:14.99847', 97, 'MARK_RAN', '7:64db59e44c374f13955489e8990d17a1', 'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('json-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-03-29 13:19:15.030027', 98, 'EXECUTED', '7:329a578cdb43262fff975f0a7f6cda60', 'addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-11019', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-29 13:19:15.210604', 99, 'EXECUTED', '7:fae0de241ac0fd0bbc2b380b85e4f567', 'createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-29 13:19:15.221861', 100, 'MARK_RAN', '7:075d54e9180f49bb0c64ca4218936e81', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-revert', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-29 13:19:15.23549', 101, 'MARK_RAN', '7:06499836520f4f6b3d05e35a59324910', 'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-29 13:19:15.281413', 102, 'EXECUTED', '7:fad08e83c77d0171ec166bc9bc5d390a', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-29 13:19:15.292627', 103, 'MARK_RAN', '7:3d2b23076e59c6f70bae703aa01be35b', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-17267-add-index-to-user-attributes', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-29 13:19:15.344104', 104, 'EXECUTED', '7:1a7f28ff8d9e53aeb879d76ea3d9341a', 'createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-18146-add-saml-art-binding-identifier', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-03-29 13:19:15.355519', 105, 'EXECUTED', '7:2fd554456fed4a82c698c555c5b751b6', 'customChange', '', NULL, '3.5.4', NULL, NULL, '8559954513');
INSERT INTO public.databasechangelog VALUES ('15.0.0-KEYCLOAK-18467', 'keycloak', 'META-INF/jpa-changelog-15.0.0.xml', '2022-03-29 13:19:15.374895', 106, 'EXECUTED', '7:b06356d66c2790ecc2ae54ba0458397a', 'addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...', '', NULL, '3.5.4', NULL, NULL, '8559954513');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1001, false, NULL, NULL);


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.default_client_scope VALUES ('master', '84aed7ba-433a-4443-b18a-f5cec2fc5a5a', false);
INSERT INTO public.default_client_scope VALUES ('master', 'bf9935c1-0494-4708-b467-21c6f62b600b', true);
INSERT INTO public.default_client_scope VALUES ('master', 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d', true);
INSERT INTO public.default_client_scope VALUES ('master', '752a3c23-e930-4624-bb8c-22229eeee821', true);
INSERT INTO public.default_client_scope VALUES ('master', '8d3170cd-f782-4321-9e46-f06e71334a02', false);
INSERT INTO public.default_client_scope VALUES ('master', '6876c768-d5aa-43eb-bb26-5c832faf4a38', false);
INSERT INTO public.default_client_scope VALUES ('master', '6339ca16-e251-448e-9b53-62dcfc981348', true);
INSERT INTO public.default_client_scope VALUES ('master', '0b303e12-dfa2-4921-a8b1-f6c2dc6f6248', true);
INSERT INTO public.default_client_scope VALUES ('master', '444f7cda-4ba1-4206-94b8-1a07beebd250', false);
INSERT INTO public.default_client_scope VALUES ('monthly', '028becdd-bc86-42ef-a954-116df4fcd559', false);
INSERT INTO public.default_client_scope VALUES ('monthly', 'aadd283d-c18c-463a-9ca4-9200b0ddc16f', true);
INSERT INTO public.default_client_scope VALUES ('monthly', '0bfaf6c9-e78c-42ec-b711-6e197bdf0842', true);
INSERT INTO public.default_client_scope VALUES ('monthly', 'b0616f3b-5a9c-4e00-98d5-053c50874a2f', true);
INSERT INTO public.default_client_scope VALUES ('monthly', '68630d2a-a59d-421c-ae58-a756334c4c52', false);
INSERT INTO public.default_client_scope VALUES ('monthly', '4debef64-1869-4a54-9b61-49d19e453e57', false);
INSERT INTO public.default_client_scope VALUES ('monthly', '87ce471f-a987-4a90-ada0-4050e3181524', true);
INSERT INTO public.default_client_scope VALUES ('monthly', 'af3f763c-8d29-4128-ad42-86675aed9ed0', true);
INSERT INTO public.default_client_scope VALUES ('monthly', '680b199d-863d-4b5a-abd8-26424060a491', false);


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

INSERT INTO public.keycloak_role VALUES ('97758d42-1b88-4cec-8300-544de97339bf', 'master', false, '${role_admin}', 'admin', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('800c4d2a-fa50-4e89-b5db-7c01de177dfa', 'master', false, '${role_create-realm}', 'create-realm', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('4088e103-ce17-415a-9f97-77b656642226', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_create-client}', 'create-client', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('799facbb-cc45-4438-ab94-8bc6c2dc5b36', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_view-realm}', 'view-realm', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('eb62f4ad-9629-4e52-8cc9-7d076f079b62', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_view-users}', 'view-users', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('c41b1dd2-4aa4-4ed9-bc0f-d94db06269e4', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_view-clients}', 'view-clients', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('212e1164-3f35-46a0-a3c4-ef5c03cf7765', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_view-events}', 'view-events', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('8f2b6755-158d-4bc1-8402-a0ebd348a07f', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('5882b8da-6bbf-44c3-8b74-1b87aaa8df1c', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_view-authorization}', 'view-authorization', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('16bec54c-2276-43b6-8e98-26479f9c81c6', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_manage-realm}', 'manage-realm', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('72ab1383-b307-4649-b5fc-235d8ab41d46', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_manage-users}', 'manage-users', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('2806f563-ba50-4eea-acfe-bb9ce1f631d0', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_manage-clients}', 'manage-clients', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('05beeb05-24ec-43bd-a1f7-feeb32c7b13c', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_manage-events}', 'manage-events', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('c33f2ff7-9051-4517-8c96-ee0b2de97fc2', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('4b1e0a80-f5cd-45b4-989e-e6d41687f8fe', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_manage-authorization}', 'manage-authorization', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('cd2b0805-c399-444c-b078-92412c89b114', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_query-users}', 'query-users', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('c995ce09-e04f-48f7-a8d8-ae0e681f5c0d', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_query-clients}', 'query-clients', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('16fa733f-267e-4a3f-99f7-85657f6b57ad', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_query-realms}', 'query-realms', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('3e4905b5-4550-4a96-8b9c-81159731607b', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_query-groups}', 'query-groups', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('15ab8020-ea70-4ec6-b192-45b82b40add4', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', true, '${role_view-profile}', 'view-profile', 'master', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', NULL);
INSERT INTO public.keycloak_role VALUES ('65d6ca47-a8ea-4be5-aa07-4f62db4a8b96', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', true, '${role_manage-account}', 'manage-account', 'master', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', NULL);
INSERT INTO public.keycloak_role VALUES ('0dc29ffc-8911-45a2-829a-287d83998a0c', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', true, '${role_manage-account-links}', 'manage-account-links', 'master', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', NULL);
INSERT INTO public.keycloak_role VALUES ('ce071f60-547c-464f-b540-1fa772030d93', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', true, '${role_view-applications}', 'view-applications', 'master', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', NULL);
INSERT INTO public.keycloak_role VALUES ('b266c6d9-e243-4535-9606-c18717b34d41', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', true, '${role_view-consent}', 'view-consent', 'master', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', NULL);
INSERT INTO public.keycloak_role VALUES ('a521a352-c903-4df1-811a-24f008576e20', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', true, '${role_manage-consent}', 'manage-consent', 'master', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', NULL);
INSERT INTO public.keycloak_role VALUES ('a593f0a2-bdf0-410e-8375-3932d3842ab5', '1330007e-73e9-4696-bb3a-0b9a5e0fc478', true, '${role_read-token}', 'read-token', 'master', '1330007e-73e9-4696-bb3a-0b9a5e0fc478', NULL);
INSERT INTO public.keycloak_role VALUES ('d9679019-8dda-4dd4-a157-5424280977e4', 'd372285d-fea6-470c-8e4d-8fd86d529378', true, '${role_impersonation}', 'impersonation', 'master', 'd372285d-fea6-470c-8e4d-8fd86d529378', NULL);
INSERT INTO public.keycloak_role VALUES ('2ef36f95-dfce-44c2-af52-fb3cddaa713e', 'master', false, '${role_offline-access}', 'offline_access', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('3ad06f96-de63-4ca8-8a16-d66add08b413', 'master', false, '${role_uma_authorization}', 'uma_authorization', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('12c0f6e7-5bfe-4f09-a9ea-07fade68bfa2', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_create-client}', 'create-client', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('b87cdb7e-84f0-4341-81b4-149610a3eff3', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_view-realm}', 'view-realm', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('42033cfb-468e-4d2e-95c6-1dd89445dcda', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_view-users}', 'view-users', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('352261e3-8c36-41bb-9070-01b978310860', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_view-clients}', 'view-clients', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('8a1b6e79-fe52-4596-9e9f-52883b06f439', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_view-events}', 'view-events', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('ac1e8399-435f-4da4-bcaf-340fc3089b5c', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('e8cfda87-a961-4a15-aeef-607bcec5edc7', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_view-authorization}', 'view-authorization', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('4538e5fa-2bca-41a2-a231-2fc69b2e1d04', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_manage-realm}', 'manage-realm', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('7dbac1b2-cd48-4e67-991d-72107de8caf0', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_manage-users}', 'manage-users', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('1d924cdb-0d15-4b4c-bdc5-581cb15f3e7f', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_manage-clients}', 'manage-clients', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('447e29fb-e991-41e0-83e7-c872114e1586', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_manage-events}', 'manage-events', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('6180d8f9-8c73-45f8-9577-afebc030eb04', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('eb381da2-ad88-4bba-ac4b-5d5610318b67', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_manage-authorization}', 'manage-authorization', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('2cfb12aa-71f9-4f5d-b8b8-2baf49147fbf', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_query-users}', 'query-users', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('2c987a36-34aa-48e6-98a5-c6ffd8af67c1', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_query-clients}', 'query-clients', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('1e7f48af-2274-48c3-89ce-3323088d93b3', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_query-realms}', 'query-realms', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('b14e3db6-3d45-4838-9c09-5e6e949032f0', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_query-groups}', 'query-groups', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('15c3421f-4ab8-4fc3-a7a7-b5d07dca2976', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_realm-admin}', 'realm-admin', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('8325202c-aa18-40ee-bf42-a377cad20076', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_create-client}', 'create-client', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('8b6c5ace-4205-4cb2-a921-5b9ea55b6349', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_view-realm}', 'view-realm', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('a7c11fe8-dc8e-4cd5-850c-cbad38965820', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_view-users}', 'view-users', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('8ebd77a7-fdd9-45ba-a4f9-24dcdca3d84b', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_view-clients}', 'view-clients', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('415c3c38-db6e-4057-89d5-481e535dfbf5', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_view-events}', 'view-events', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('146a6504-abca-495f-9507-b39d4729848b', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_view-identity-providers}', 'view-identity-providers', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('f7e975a2-9487-4728-a6eb-cd811d82300f', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_view-authorization}', 'view-authorization', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('f6baf483-ff0e-44e7-a9ee-1d8a4bb60597', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_manage-realm}', 'manage-realm', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('354d7eb6-ff94-4a2c-9746-b851e8dcedc8', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_manage-users}', 'manage-users', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('9f1672c8-c08f-4768-929a-cb3fbf29a088', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_manage-clients}', 'manage-clients', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('f5606112-cf9e-49fa-8da3-ff32c759deac', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_manage-events}', 'manage-events', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('f906d21c-3057-4f04-82a9-7f2e6362a651', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('8962c9ae-578d-471a-87c2-fd347f0713c1', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_manage-authorization}', 'manage-authorization', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('8dfd913d-c1c8-44ac-b88d-58dad5325c1f', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_query-users}', 'query-users', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('73197852-38d7-43cb-b918-21e7834f4b90', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_query-clients}', 'query-clients', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('c816cc64-5c9b-4a9c-a48e-d94141ba8183', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_query-realms}', 'query-realms', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('4e67928b-4564-4835-b54f-0686fded61c0', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_query-groups}', 'query-groups', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('6ee15ba2-d581-4f39-b819-77c64a6e7844', '237dc637-c5fd-4d16-834e-2b51960b157e', true, '${role_view-profile}', 'view-profile', 'monthly', '237dc637-c5fd-4d16-834e-2b51960b157e', NULL);
INSERT INTO public.keycloak_role VALUES ('04ab2a31-3da1-4a06-a8d3-f9a008d356d5', '237dc637-c5fd-4d16-834e-2b51960b157e', true, '${role_manage-account}', 'manage-account', 'monthly', '237dc637-c5fd-4d16-834e-2b51960b157e', NULL);
INSERT INTO public.keycloak_role VALUES ('182b7f0a-a2dd-4fb1-9481-54be76800da4', '237dc637-c5fd-4d16-834e-2b51960b157e', true, '${role_manage-account-links}', 'manage-account-links', 'monthly', '237dc637-c5fd-4d16-834e-2b51960b157e', NULL);
INSERT INTO public.keycloak_role VALUES ('b88c3679-07ce-4cc9-a007-3edc7d2928db', '237dc637-c5fd-4d16-834e-2b51960b157e', true, '${role_view-applications}', 'view-applications', 'monthly', '237dc637-c5fd-4d16-834e-2b51960b157e', NULL);
INSERT INTO public.keycloak_role VALUES ('31194f2e-0377-4e79-83bb-21f87be63ff6', '237dc637-c5fd-4d16-834e-2b51960b157e', true, '${role_view-consent}', 'view-consent', 'monthly', '237dc637-c5fd-4d16-834e-2b51960b157e', NULL);
INSERT INTO public.keycloak_role VALUES ('af59471c-6a8f-49cf-9401-c1edb4459ec6', '237dc637-c5fd-4d16-834e-2b51960b157e', true, '${role_manage-consent}', 'manage-consent', 'monthly', '237dc637-c5fd-4d16-834e-2b51960b157e', NULL);
INSERT INTO public.keycloak_role VALUES ('42c7818b-e05e-440f-847c-0cedb696ed84', '2f681d28-3893-4210-a4e9-1837e9100c96', true, '${role_impersonation}', 'impersonation', 'master', '2f681d28-3893-4210-a4e9-1837e9100c96', NULL);
INSERT INTO public.keycloak_role VALUES ('068487b9-1fcc-4f4c-8788-6fc4e775a599', 'acaccaf4-1502-4957-92ac-1a90531360a9', true, '${role_impersonation}', 'impersonation', 'monthly', 'acaccaf4-1502-4957-92ac-1a90531360a9', NULL);
INSERT INTO public.keycloak_role VALUES ('3cf63ffa-c5ca-4274-a3de-4d6996b666b4', '0ca739d3-acc4-4418-8de5-b852d1d102df', true, '${role_read-token}', 'read-token', 'monthly', '0ca739d3-acc4-4418-8de5-b852d1d102df', NULL);
INSERT INTO public.keycloak_role VALUES ('e707184d-2fe4-4be1-9a90-b7f77da5090a', 'monthly', false, '${role_offline-access}', 'offline_access', 'monthly', NULL, 'monthly');
INSERT INTO public.keycloak_role VALUES ('7f9c2f0a-4b51-4ca4-b254-70b72b08262f', 'monthly', false, '${role_uma_authorization}', 'uma_authorization', 'monthly', NULL, 'monthly');
INSERT INTO public.keycloak_role VALUES ('b245b684-78ed-40fd-88d8-fcd82f3bb2ea', 'f5c6b235-7689-4b23-89df-98df00fca160', true, NULL, 'USER', 'monthly', 'f5c6b235-7689-4b23-89df-98df00fca160', NULL);
INSERT INTO public.keycloak_role VALUES ('8d2ec278-e302-4a2d-a265-3c7b3830a30b', 'f5c6b235-7689-4b23-89df-98df00fca160', true, NULL, 'uma_protection', 'monthly', 'f5c6b235-7689-4b23-89df-98df00fca160', NULL);
INSERT INTO public.keycloak_role VALUES ('4e4f69dc-33d0-4de2-8b13-5e4d25e8d0ba', 'f5c6b235-7689-4b23-89df-98df00fca160', true, NULL, 'ADMIN', 'monthly', 'f5c6b235-7689-4b23-89df-98df00fca160', NULL);
INSERT INTO public.keycloak_role VALUES ('e458c786-edf0-4b59-9c89-d1d2528db20b', 'monthly', false, '${role_default-roles-monthly}', 'default-roles-monthly', 'monthly', NULL, 'monthly');
INSERT INTO public.keycloak_role VALUES ('e0aff75d-0516-4c7a-8deb-68508f180082', 'master', false, '${role_default-roles-master}', 'default-roles-master', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('9dd443b8-c420-4b0f-b826-14d05cb511c1', '237dc637-c5fd-4d16-834e-2b51960b157e', true, '${role_delete-account}', 'delete-account', 'monthly', '237dc637-c5fd-4d16-834e-2b51960b157e', NULL);
INSERT INTO public.keycloak_role VALUES ('7ec172d4-d757-4dff-9125-7462b3fb967c', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', true, '${role_delete-account}', 'delete-account', 'master', 'cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', NULL);


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.migration_model VALUES ('y3upl', '10.0.2', 1607450329);
INSERT INTO public.migration_model VALUES ('wkwj1', '16.1.1', 1648559961);


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.policy_config VALUES ('01caacee-6108-48cf-b8b1-4c8428ce0501', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config VALUES ('7e80b864-cbef-499c-b7b6-12570ce426dc', 'defaultResourceType', 'urn:monthly-login-app:resources:default');


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.protocol_mapper VALUES ('00a485bf-9771-46e9-8122-afd028d4fd2b', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '6f76a30f-a144-4cde-91aa-396cdb1bd041', NULL);
INSERT INTO public.protocol_mapper VALUES ('1c5203f8-e9f4-4822-834e-7d264e89e88e', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'a7b3085f-1a46-4dbd-bb45-65d206b6252a', NULL);
INSERT INTO public.protocol_mapper VALUES ('d62a871c-2c33-4147-a258-a155a37b8b9c', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'bf9935c1-0494-4708-b467-21c6f62b600b');
INSERT INTO public.protocol_mapper VALUES ('ebbe1adb-df5c-45b8-b0f6-6b17bd107796', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('da932d9e-ec92-466a-ad20-f9f50f655c05', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('70d980f4-d518-4453-9506-90e8ad992405', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('8e05d1cc-b305-4234-97a9-7cd18f38c104', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('f85ca279-9343-401c-bac1-cade5d6cc5aa', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('7a73be5a-28b6-4814-a8c0-edaf12cc7fb1', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('5600288a-0317-4b58-ab3d-820ca22333d0', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('8901aee3-f675-42d9-95ee-569d070802a9', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('36dc5383-0f7a-4f41-8d4a-bd629c103543', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('a1d1fc34-eb88-44dd-abeb-c45c3948cdbf', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('c6ab1b90-df73-4d9c-b6af-a13e8537d056', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('0355a427-9358-49e3-ab3a-30ce2097676e', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('7ee59379-d665-4b19-b028-e45bc262e00e', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('5add1076-e6b0-4115-a1a9-a789feb24204', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e37ca8a8-b185-4e13-b453-b004b2cc3b5d');
INSERT INTO public.protocol_mapper VALUES ('4e27b7f0-8cab-4137-91df-d9e0ce61948b', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '752a3c23-e930-4624-bb8c-22229eeee821');
INSERT INTO public.protocol_mapper VALUES ('4ce9f05f-1a12-4480-ab77-36cecc54856b', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '752a3c23-e930-4624-bb8c-22229eeee821');
INSERT INTO public.protocol_mapper VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '8d3170cd-f782-4321-9e46-f06e71334a02');
INSERT INTO public.protocol_mapper VALUES ('37fc89b2-06b7-4cdb-bcb1-5a779a113521', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6876c768-d5aa-43eb-bb26-5c832faf4a38');
INSERT INTO public.protocol_mapper VALUES ('8ece4470-0353-4e20-bbbb-aba847e28c67', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '6876c768-d5aa-43eb-bb26-5c832faf4a38');
INSERT INTO public.protocol_mapper VALUES ('f2856250-5aa1-4523-9433-367fee645826', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '6339ca16-e251-448e-9b53-62dcfc981348');
INSERT INTO public.protocol_mapper VALUES ('bed085ea-f4e8-46c7-8630-c3a48865439d', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '6339ca16-e251-448e-9b53-62dcfc981348');
INSERT INTO public.protocol_mapper VALUES ('7e83e430-1fc7-4ef1-ada3-34690bebfebe', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '6339ca16-e251-448e-9b53-62dcfc981348');
INSERT INTO public.protocol_mapper VALUES ('0e931008-7d4b-4438-b223-3bf7cd9e6998', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '0b303e12-dfa2-4921-a8b1-f6c2dc6f6248');
INSERT INTO public.protocol_mapper VALUES ('9cdbf04c-689c-4a44-ad33-e5230c5948ce', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '444f7cda-4ba1-4206-94b8-1a07beebd250');
INSERT INTO public.protocol_mapper VALUES ('a1c8139e-0a4a-4c9d-8efc-36d15b58a9df', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '444f7cda-4ba1-4206-94b8-1a07beebd250');
INSERT INTO public.protocol_mapper VALUES ('6631728d-e3bb-417d-8f87-49e09d8d90a1', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'e4bdf2ef-025f-46b8-a430-228614135818', NULL);
INSERT INTO public.protocol_mapper VALUES ('f1cedfc9-08ea-4ce1-a135-9a085930c0f2', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'aadd283d-c18c-463a-9ca4-9200b0ddc16f');
INSERT INTO public.protocol_mapper VALUES ('360a96be-4ec0-4e1f-955b-5b74937de1ad', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('ed3009e8-b8d4-4c2c-ae22-08234f1c910f', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('b44bca74-25c2-4e90-8857-d5f95f24d76e', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('0162aabc-0ec0-4c5d-87f6-2845bfc706e8', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('4e270e6f-b4be-423d-aa65-aa0101677cc1', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('e396fac5-9bfc-4a6d-bdba-df3906363dbd', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('66fd3454-1760-45d1-8f3f-33021b79aaae', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('fdb0ef13-7d18-4baa-ab07-1a4a422b8b83', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('71db05a2-7894-4239-9453-7718b7d8024e', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('43a3f0d2-5ea3-4daa-ae67-a186f5a07fb2', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('344cf47e-78fc-4b0b-91b7-a5356744c756', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('98cc8129-d3f4-468e-a064-c1e87c03b5dc', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('3fef1cfb-8fa5-4d68-8446-2af11af529ed', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('2def3740-edfe-4b09-b674-690146dc2a19', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0bfaf6c9-e78c-42ec-b711-6e197bdf0842');
INSERT INTO public.protocol_mapper VALUES ('496503c2-5cf0-4b98-b631-177fd9402350', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'b0616f3b-5a9c-4e00-98d5-053c50874a2f');
INSERT INTO public.protocol_mapper VALUES ('e0006612-94b3-42b8-91fb-014237d1e96a', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'b0616f3b-5a9c-4e00-98d5-053c50874a2f');
INSERT INTO public.protocol_mapper VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '68630d2a-a59d-421c-ae58-a756334c4c52');
INSERT INTO public.protocol_mapper VALUES ('1b8f8eb5-19d2-4538-8b34-e83cce18d4b8', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '4debef64-1869-4a54-9b61-49d19e453e57');
INSERT INTO public.protocol_mapper VALUES ('599e6aa8-6d78-4c3a-9f9f-e83fd75958d0', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '4debef64-1869-4a54-9b61-49d19e453e57');
INSERT INTO public.protocol_mapper VALUES ('cc249c66-ce9f-4583-aef5-c838b8f280f1', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '87ce471f-a987-4a90-ada0-4050e3181524');
INSERT INTO public.protocol_mapper VALUES ('6ae830e9-e174-4431-b661-7f63cefe5d27', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '87ce471f-a987-4a90-ada0-4050e3181524');
INSERT INTO public.protocol_mapper VALUES ('791d0b19-cdb2-4fee-90c1-139598a5abd2', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '87ce471f-a987-4a90-ada0-4050e3181524');
INSERT INTO public.protocol_mapper VALUES ('1f91bb18-538d-4e41-b0d3-6da458a93c42', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'af3f763c-8d29-4128-ad42-86675aed9ed0');
INSERT INTO public.protocol_mapper VALUES ('6a62a3d7-3f0f-4566-9837-c50fd5d4b866', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '680b199d-863d-4b5a-abd8-26424060a491');
INSERT INTO public.protocol_mapper VALUES ('452b819b-54d3-4b03-a413-0dd09d8b897d', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '680b199d-863d-4b5a-abd8-26424060a491');
INSERT INTO public.protocol_mapper VALUES ('ac190e88-d331-4805-9524-12cd3276d24d', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '5bf30d61-eaf2-4820-9b11-3b22220902c5', NULL);
INSERT INTO public.protocol_mapper VALUES ('5130f074-8768-426d-b284-c574c298c576', 'Username', 'openid-connect', 'oidc-usermodel-property-mapper', 'f5c6b235-7689-4b23-89df-98df00fca160', NULL);
INSERT INTO public.protocol_mapper VALUES ('f388acf9-bc6d-47d4-b7ab-35d33389f274', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'f5c6b235-7689-4b23-89df-98df00fca160', NULL);
INSERT INTO public.protocol_mapper VALUES ('a927930c-6772-40cf-aefc-6e7105bd98ba', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'f5c6b235-7689-4b23-89df-98df00fca160', NULL);
INSERT INTO public.protocol_mapper VALUES ('6f89dbc4-ec6b-4bcf-884a-954d37ff223f', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'f5c6b235-7689-4b23-89df-98df00fca160', NULL);
INSERT INTO public.protocol_mapper VALUES ('b030fabc-f219-4133-9b28-cfceff40558a', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '61cd8b8e-bf9d-4c47-b8af-596dcda6d716', NULL);
INSERT INTO public.protocol_mapper VALUES ('33f55186-e5cf-4937-8d87-e97761fe1688', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '61cd8b8e-bf9d-4c47-b8af-596dcda6d716', NULL);
INSERT INTO public.protocol_mapper VALUES ('1ad829f6-b994-4de3-8079-edb7e433d0d8', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '61cd8b8e-bf9d-4c47-b8af-596dcda6d716', NULL);


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.protocol_mapper_config VALUES ('1c5203f8-e9f4-4822-834e-7d264e89e88e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1c5203f8-e9f4-4822-834e-7d264e89e88e', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('1c5203f8-e9f4-4822-834e-7d264e89e88e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1c5203f8-e9f4-4822-834e-7d264e89e88e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1c5203f8-e9f4-4822-834e-7d264e89e88e', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1c5203f8-e9f4-4822-834e-7d264e89e88e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('d62a871c-2c33-4147-a258-a155a37b8b9c', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('d62a871c-2c33-4147-a258-a155a37b8b9c', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('d62a871c-2c33-4147-a258-a155a37b8b9c', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('ebbe1adb-df5c-45b8-b0f6-6b17bd107796', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ebbe1adb-df5c-45b8-b0f6-6b17bd107796', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ebbe1adb-df5c-45b8-b0f6-6b17bd107796', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da932d9e-ec92-466a-ad20-f9f50f655c05', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da932d9e-ec92-466a-ad20-f9f50f655c05', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('da932d9e-ec92-466a-ad20-f9f50f655c05', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da932d9e-ec92-466a-ad20-f9f50f655c05', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('da932d9e-ec92-466a-ad20-f9f50f655c05', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('da932d9e-ec92-466a-ad20-f9f50f655c05', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('70d980f4-d518-4453-9506-90e8ad992405', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('70d980f4-d518-4453-9506-90e8ad992405', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('70d980f4-d518-4453-9506-90e8ad992405', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('70d980f4-d518-4453-9506-90e8ad992405', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('70d980f4-d518-4453-9506-90e8ad992405', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('70d980f4-d518-4453-9506-90e8ad992405', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8e05d1cc-b305-4234-97a9-7cd18f38c104', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8e05d1cc-b305-4234-97a9-7cd18f38c104', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8e05d1cc-b305-4234-97a9-7cd18f38c104', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8e05d1cc-b305-4234-97a9-7cd18f38c104', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8e05d1cc-b305-4234-97a9-7cd18f38c104', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8e05d1cc-b305-4234-97a9-7cd18f38c104', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f85ca279-9343-401c-bac1-cade5d6cc5aa', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f85ca279-9343-401c-bac1-cade5d6cc5aa', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f85ca279-9343-401c-bac1-cade5d6cc5aa', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f85ca279-9343-401c-bac1-cade5d6cc5aa', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f85ca279-9343-401c-bac1-cade5d6cc5aa', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f85ca279-9343-401c-bac1-cade5d6cc5aa', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('7a73be5a-28b6-4814-a8c0-edaf12cc7fb1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7a73be5a-28b6-4814-a8c0-edaf12cc7fb1', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7a73be5a-28b6-4814-a8c0-edaf12cc7fb1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7a73be5a-28b6-4814-a8c0-edaf12cc7fb1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7a73be5a-28b6-4814-a8c0-edaf12cc7fb1', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7a73be5a-28b6-4814-a8c0-edaf12cc7fb1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('5600288a-0317-4b58-ab3d-820ca22333d0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5600288a-0317-4b58-ab3d-820ca22333d0', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('5600288a-0317-4b58-ab3d-820ca22333d0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5600288a-0317-4b58-ab3d-820ca22333d0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5600288a-0317-4b58-ab3d-820ca22333d0', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('5600288a-0317-4b58-ab3d-820ca22333d0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8901aee3-f675-42d9-95ee-569d070802a9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8901aee3-f675-42d9-95ee-569d070802a9', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8901aee3-f675-42d9-95ee-569d070802a9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8901aee3-f675-42d9-95ee-569d070802a9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8901aee3-f675-42d9-95ee-569d070802a9', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8901aee3-f675-42d9-95ee-569d070802a9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('36dc5383-0f7a-4f41-8d4a-bd629c103543', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('36dc5383-0f7a-4f41-8d4a-bd629c103543', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('36dc5383-0f7a-4f41-8d4a-bd629c103543', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('36dc5383-0f7a-4f41-8d4a-bd629c103543', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('36dc5383-0f7a-4f41-8d4a-bd629c103543', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('36dc5383-0f7a-4f41-8d4a-bd629c103543', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a1d1fc34-eb88-44dd-abeb-c45c3948cdbf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a1d1fc34-eb88-44dd-abeb-c45c3948cdbf', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a1d1fc34-eb88-44dd-abeb-c45c3948cdbf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a1d1fc34-eb88-44dd-abeb-c45c3948cdbf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a1d1fc34-eb88-44dd-abeb-c45c3948cdbf', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a1d1fc34-eb88-44dd-abeb-c45c3948cdbf', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('c6ab1b90-df73-4d9c-b6af-a13e8537d056', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c6ab1b90-df73-4d9c-b6af-a13e8537d056', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('c6ab1b90-df73-4d9c-b6af-a13e8537d056', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c6ab1b90-df73-4d9c-b6af-a13e8537d056', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c6ab1b90-df73-4d9c-b6af-a13e8537d056', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c6ab1b90-df73-4d9c-b6af-a13e8537d056', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0355a427-9358-49e3-ab3a-30ce2097676e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0355a427-9358-49e3-ab3a-30ce2097676e', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0355a427-9358-49e3-ab3a-30ce2097676e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0355a427-9358-49e3-ab3a-30ce2097676e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0355a427-9358-49e3-ab3a-30ce2097676e', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0355a427-9358-49e3-ab3a-30ce2097676e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('7ee59379-d665-4b19-b028-e45bc262e00e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7ee59379-d665-4b19-b028-e45bc262e00e', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7ee59379-d665-4b19-b028-e45bc262e00e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7ee59379-d665-4b19-b028-e45bc262e00e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7ee59379-d665-4b19-b028-e45bc262e00e', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7ee59379-d665-4b19-b028-e45bc262e00e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('5add1076-e6b0-4115-a1a9-a789feb24204', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5add1076-e6b0-4115-a1a9-a789feb24204', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('5add1076-e6b0-4115-a1a9-a789feb24204', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5add1076-e6b0-4115-a1a9-a789feb24204', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5add1076-e6b0-4115-a1a9-a789feb24204', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('5add1076-e6b0-4115-a1a9-a789feb24204', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4e27b7f0-8cab-4137-91df-d9e0ce61948b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4e27b7f0-8cab-4137-91df-d9e0ce61948b', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4e27b7f0-8cab-4137-91df-d9e0ce61948b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4e27b7f0-8cab-4137-91df-d9e0ce61948b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4e27b7f0-8cab-4137-91df-d9e0ce61948b', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4e27b7f0-8cab-4137-91df-d9e0ce61948b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4ce9f05f-1a12-4480-ab77-36cecc54856b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4ce9f05f-1a12-4480-ab77-36cecc54856b', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4ce9f05f-1a12-4480-ab77-36cecc54856b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4ce9f05f-1a12-4480-ab77-36cecc54856b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4ce9f05f-1a12-4480-ab77-36cecc54856b', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4ce9f05f-1a12-4480-ab77-36cecc54856b', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1ce6471e-bddc-45bc-9449-407130a02311', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('37fc89b2-06b7-4cdb-bcb1-5a779a113521', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('37fc89b2-06b7-4cdb-bcb1-5a779a113521', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('37fc89b2-06b7-4cdb-bcb1-5a779a113521', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('37fc89b2-06b7-4cdb-bcb1-5a779a113521', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('37fc89b2-06b7-4cdb-bcb1-5a779a113521', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('37fc89b2-06b7-4cdb-bcb1-5a779a113521', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8ece4470-0353-4e20-bbbb-aba847e28c67', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8ece4470-0353-4e20-bbbb-aba847e28c67', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8ece4470-0353-4e20-bbbb-aba847e28c67', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8ece4470-0353-4e20-bbbb-aba847e28c67', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8ece4470-0353-4e20-bbbb-aba847e28c67', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8ece4470-0353-4e20-bbbb-aba847e28c67', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f2856250-5aa1-4523-9433-367fee645826', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('f2856250-5aa1-4523-9433-367fee645826', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f2856250-5aa1-4523-9433-367fee645826', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f2856250-5aa1-4523-9433-367fee645826', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f2856250-5aa1-4523-9433-367fee645826', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('bed085ea-f4e8-46c7-8630-c3a48865439d', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('bed085ea-f4e8-46c7-8630-c3a48865439d', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('bed085ea-f4e8-46c7-8630-c3a48865439d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bed085ea-f4e8-46c7-8630-c3a48865439d', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('bed085ea-f4e8-46c7-8630-c3a48865439d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('9cdbf04c-689c-4a44-ad33-e5230c5948ce', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9cdbf04c-689c-4a44-ad33-e5230c5948ce', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9cdbf04c-689c-4a44-ad33-e5230c5948ce', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9cdbf04c-689c-4a44-ad33-e5230c5948ce', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9cdbf04c-689c-4a44-ad33-e5230c5948ce', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9cdbf04c-689c-4a44-ad33-e5230c5948ce', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a1c8139e-0a4a-4c9d-8efc-36d15b58a9df', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('a1c8139e-0a4a-4c9d-8efc-36d15b58a9df', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a1c8139e-0a4a-4c9d-8efc-36d15b58a9df', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a1c8139e-0a4a-4c9d-8efc-36d15b58a9df', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a1c8139e-0a4a-4c9d-8efc-36d15b58a9df', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a1c8139e-0a4a-4c9d-8efc-36d15b58a9df', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f1cedfc9-08ea-4ce1-a135-9a085930c0f2', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('f1cedfc9-08ea-4ce1-a135-9a085930c0f2', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('f1cedfc9-08ea-4ce1-a135-9a085930c0f2', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('360a96be-4ec0-4e1f-955b-5b74937de1ad', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('360a96be-4ec0-4e1f-955b-5b74937de1ad', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('360a96be-4ec0-4e1f-955b-5b74937de1ad', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed3009e8-b8d4-4c2c-ae22-08234f1c910f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed3009e8-b8d4-4c2c-ae22-08234f1c910f', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ed3009e8-b8d4-4c2c-ae22-08234f1c910f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed3009e8-b8d4-4c2c-ae22-08234f1c910f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed3009e8-b8d4-4c2c-ae22-08234f1c910f', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ed3009e8-b8d4-4c2c-ae22-08234f1c910f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b44bca74-25c2-4e90-8857-d5f95f24d76e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b44bca74-25c2-4e90-8857-d5f95f24d76e', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b44bca74-25c2-4e90-8857-d5f95f24d76e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b44bca74-25c2-4e90-8857-d5f95f24d76e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b44bca74-25c2-4e90-8857-d5f95f24d76e', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b44bca74-25c2-4e90-8857-d5f95f24d76e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0162aabc-0ec0-4c5d-87f6-2845bfc706e8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0162aabc-0ec0-4c5d-87f6-2845bfc706e8', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0162aabc-0ec0-4c5d-87f6-2845bfc706e8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0162aabc-0ec0-4c5d-87f6-2845bfc706e8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0162aabc-0ec0-4c5d-87f6-2845bfc706e8', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0162aabc-0ec0-4c5d-87f6-2845bfc706e8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4e270e6f-b4be-423d-aa65-aa0101677cc1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4e270e6f-b4be-423d-aa65-aa0101677cc1', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4e270e6f-b4be-423d-aa65-aa0101677cc1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4e270e6f-b4be-423d-aa65-aa0101677cc1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4e270e6f-b4be-423d-aa65-aa0101677cc1', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4e270e6f-b4be-423d-aa65-aa0101677cc1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e396fac5-9bfc-4a6d-bdba-df3906363dbd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e396fac5-9bfc-4a6d-bdba-df3906363dbd', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e396fac5-9bfc-4a6d-bdba-df3906363dbd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e396fac5-9bfc-4a6d-bdba-df3906363dbd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e396fac5-9bfc-4a6d-bdba-df3906363dbd', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e396fac5-9bfc-4a6d-bdba-df3906363dbd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('66fd3454-1760-45d1-8f3f-33021b79aaae', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('66fd3454-1760-45d1-8f3f-33021b79aaae', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('66fd3454-1760-45d1-8f3f-33021b79aaae', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('66fd3454-1760-45d1-8f3f-33021b79aaae', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('66fd3454-1760-45d1-8f3f-33021b79aaae', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('66fd3454-1760-45d1-8f3f-33021b79aaae', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fdb0ef13-7d18-4baa-ab07-1a4a422b8b83', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fdb0ef13-7d18-4baa-ab07-1a4a422b8b83', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fdb0ef13-7d18-4baa-ab07-1a4a422b8b83', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fdb0ef13-7d18-4baa-ab07-1a4a422b8b83', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fdb0ef13-7d18-4baa-ab07-1a4a422b8b83', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fdb0ef13-7d18-4baa-ab07-1a4a422b8b83', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('71db05a2-7894-4239-9453-7718b7d8024e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('71db05a2-7894-4239-9453-7718b7d8024e', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('71db05a2-7894-4239-9453-7718b7d8024e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('71db05a2-7894-4239-9453-7718b7d8024e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('71db05a2-7894-4239-9453-7718b7d8024e', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('71db05a2-7894-4239-9453-7718b7d8024e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('43a3f0d2-5ea3-4daa-ae67-a186f5a07fb2', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('43a3f0d2-5ea3-4daa-ae67-a186f5a07fb2', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('43a3f0d2-5ea3-4daa-ae67-a186f5a07fb2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('43a3f0d2-5ea3-4daa-ae67-a186f5a07fb2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('43a3f0d2-5ea3-4daa-ae67-a186f5a07fb2', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('43a3f0d2-5ea3-4daa-ae67-a186f5a07fb2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('344cf47e-78fc-4b0b-91b7-a5356744c756', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('344cf47e-78fc-4b0b-91b7-a5356744c756', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('344cf47e-78fc-4b0b-91b7-a5356744c756', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('344cf47e-78fc-4b0b-91b7-a5356744c756', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('344cf47e-78fc-4b0b-91b7-a5356744c756', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('344cf47e-78fc-4b0b-91b7-a5356744c756', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('98cc8129-d3f4-468e-a064-c1e87c03b5dc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('98cc8129-d3f4-468e-a064-c1e87c03b5dc', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('98cc8129-d3f4-468e-a064-c1e87c03b5dc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('98cc8129-d3f4-468e-a064-c1e87c03b5dc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('98cc8129-d3f4-468e-a064-c1e87c03b5dc', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('98cc8129-d3f4-468e-a064-c1e87c03b5dc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3fef1cfb-8fa5-4d68-8446-2af11af529ed', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3fef1cfb-8fa5-4d68-8446-2af11af529ed', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3fef1cfb-8fa5-4d68-8446-2af11af529ed', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3fef1cfb-8fa5-4d68-8446-2af11af529ed', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3fef1cfb-8fa5-4d68-8446-2af11af529ed', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3fef1cfb-8fa5-4d68-8446-2af11af529ed', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2def3740-edfe-4b09-b674-690146dc2a19', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2def3740-edfe-4b09-b674-690146dc2a19', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2def3740-edfe-4b09-b674-690146dc2a19', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2def3740-edfe-4b09-b674-690146dc2a19', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2def3740-edfe-4b09-b674-690146dc2a19', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2def3740-edfe-4b09-b674-690146dc2a19', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('496503c2-5cf0-4b98-b631-177fd9402350', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('496503c2-5cf0-4b98-b631-177fd9402350', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('496503c2-5cf0-4b98-b631-177fd9402350', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('496503c2-5cf0-4b98-b631-177fd9402350', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('496503c2-5cf0-4b98-b631-177fd9402350', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('496503c2-5cf0-4b98-b631-177fd9402350', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e0006612-94b3-42b8-91fb-014237d1e96a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e0006612-94b3-42b8-91fb-014237d1e96a', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e0006612-94b3-42b8-91fb-014237d1e96a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e0006612-94b3-42b8-91fb-014237d1e96a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e0006612-94b3-42b8-91fb-014237d1e96a', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e0006612-94b3-42b8-91fb-014237d1e96a', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('00939a61-8ee6-4554-81a5-062ed0c161be', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('1b8f8eb5-19d2-4538-8b34-e83cce18d4b8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1b8f8eb5-19d2-4538-8b34-e83cce18d4b8', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('1b8f8eb5-19d2-4538-8b34-e83cce18d4b8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1b8f8eb5-19d2-4538-8b34-e83cce18d4b8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1b8f8eb5-19d2-4538-8b34-e83cce18d4b8', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1b8f8eb5-19d2-4538-8b34-e83cce18d4b8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('599e6aa8-6d78-4c3a-9f9f-e83fd75958d0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('599e6aa8-6d78-4c3a-9f9f-e83fd75958d0', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('599e6aa8-6d78-4c3a-9f9f-e83fd75958d0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('599e6aa8-6d78-4c3a-9f9f-e83fd75958d0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('599e6aa8-6d78-4c3a-9f9f-e83fd75958d0', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('599e6aa8-6d78-4c3a-9f9f-e83fd75958d0', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cc249c66-ce9f-4583-aef5-c838b8f280f1', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('cc249c66-ce9f-4583-aef5-c838b8f280f1', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cc249c66-ce9f-4583-aef5-c838b8f280f1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cc249c66-ce9f-4583-aef5-c838b8f280f1', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cc249c66-ce9f-4583-aef5-c838b8f280f1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6ae830e9-e174-4431-b661-7f63cefe5d27', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('6ae830e9-e174-4431-b661-7f63cefe5d27', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6ae830e9-e174-4431-b661-7f63cefe5d27', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6ae830e9-e174-4431-b661-7f63cefe5d27', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6ae830e9-e174-4431-b661-7f63cefe5d27', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6a62a3d7-3f0f-4566-9837-c50fd5d4b866', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6a62a3d7-3f0f-4566-9837-c50fd5d4b866', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6a62a3d7-3f0f-4566-9837-c50fd5d4b866', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6a62a3d7-3f0f-4566-9837-c50fd5d4b866', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6a62a3d7-3f0f-4566-9837-c50fd5d4b866', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6a62a3d7-3f0f-4566-9837-c50fd5d4b866', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('452b819b-54d3-4b03-a413-0dd09d8b897d', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('452b819b-54d3-4b03-a413-0dd09d8b897d', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('452b819b-54d3-4b03-a413-0dd09d8b897d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('452b819b-54d3-4b03-a413-0dd09d8b897d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('452b819b-54d3-4b03-a413-0dd09d8b897d', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('452b819b-54d3-4b03-a413-0dd09d8b897d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ac190e88-d331-4805-9524-12cd3276d24d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ac190e88-d331-4805-9524-12cd3276d24d', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ac190e88-d331-4805-9524-12cd3276d24d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ac190e88-d331-4805-9524-12cd3276d24d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ac190e88-d331-4805-9524-12cd3276d24d', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ac190e88-d331-4805-9524-12cd3276d24d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('5130f074-8768-426d-b284-c574c298c576', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5130f074-8768-426d-b284-c574c298c576', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('5130f074-8768-426d-b284-c574c298c576', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5130f074-8768-426d-b284-c574c298c576', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5130f074-8768-426d-b284-c574c298c576', 'user_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('5130f074-8768-426d-b284-c574c298c576', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f388acf9-bc6d-47d4-b7ab-35d33389f274', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('f388acf9-bc6d-47d4-b7ab-35d33389f274', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f388acf9-bc6d-47d4-b7ab-35d33389f274', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f388acf9-bc6d-47d4-b7ab-35d33389f274', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f388acf9-bc6d-47d4-b7ab-35d33389f274', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a927930c-6772-40cf-aefc-6e7105bd98ba', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('a927930c-6772-40cf-aefc-6e7105bd98ba', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a927930c-6772-40cf-aefc-6e7105bd98ba', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a927930c-6772-40cf-aefc-6e7105bd98ba', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a927930c-6772-40cf-aefc-6e7105bd98ba', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6f89dbc4-ec6b-4bcf-884a-954d37ff223f', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('6f89dbc4-ec6b-4bcf-884a-954d37ff223f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6f89dbc4-ec6b-4bcf-884a-954d37ff223f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6f89dbc4-ec6b-4bcf-884a-954d37ff223f', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6f89dbc4-ec6b-4bcf-884a-954d37ff223f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b030fabc-f219-4133-9b28-cfceff40558a', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('b030fabc-f219-4133-9b28-cfceff40558a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b030fabc-f219-4133-9b28-cfceff40558a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b030fabc-f219-4133-9b28-cfceff40558a', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b030fabc-f219-4133-9b28-cfceff40558a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('33f55186-e5cf-4937-8d87-e97761fe1688', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('33f55186-e5cf-4937-8d87-e97761fe1688', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('33f55186-e5cf-4937-8d87-e97761fe1688', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('33f55186-e5cf-4937-8d87-e97761fe1688', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('33f55186-e5cf-4937-8d87-e97761fe1688', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('1ad829f6-b994-4de3-8079-edb7e433d0d8', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('1ad829f6-b994-4de3-8079-edb7e433d0d8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1ad829f6-b994-4de3-8079-edb7e433d0d8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1ad829f6-b994-4de3-8079-edb7e433d0d8', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1ad829f6-b994-4de3-8079-edb7e433d0d8', 'String', 'jsonType.label');


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.realm VALUES ('master', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, 'd372285d-fea6-470c-8e4d-8fd86d529378', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '0146dc46-4d51-4713-a13f-1f8cc1fc4964', '66fdb4cd-9e72-445b-bb45-91b08b62a6c7', 'd6789e83-3013-4cfc-9822-5ff1ecd7b3db', 'ff25ce1d-266a-42b4-98a2-5618507111e8', 'e8179734-58bc-43d3-9ec9-b2983a3dc17f', 2592000, false, 900, true, false, 'b9e557e7-ea2a-40ee-b2b4-39a72e1e7f1b', 0, false, 0, 0, 'e0aff75d-0516-4c7a-8deb-68508f180082');
INSERT INTO public.realm VALUES ('monthly', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'app', 0, NULL, true, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '2f681d28-3893-4210-a4e9-1837e9100c96', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', 'a09309ca-ec34-4d9b-97fd-3b468ff4c994', 'a857775d-6b3c-4013-96b5-5eb9ab7af1ff', 'cde95596-664c-4360-a11c-e9f799fb4380', '24dad399-e154-482a-bc8b-e36de576a7da', '9094d152-9dca-4d7f-9113-8d82eba81c1c', 2592000, false, 900, true, false, 'f911c6fc-3139-42f2-9ab6-a074b48d5fd6', 0, false, 0, 0, 'e458c786-edf0-4b59-9c89-d1d2528db20b');


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
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'master', 'false');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', 'master', '5184000');
INSERT INTO public.realm_attribute VALUES ('clientSessionIdleTimeout', 'monthly', '0');
INSERT INTO public.realm_attribute VALUES ('clientSessionMaxLifespan', 'monthly', '0');
INSERT INTO public.realm_attribute VALUES ('client-policies.profiles', 'master', '{"profiles":[]}');
INSERT INTO public.realm_attribute VALUES ('client-policies.policies', 'master', '{"policies":[]}');
INSERT INTO public.realm_attribute VALUES ('cibaBackchannelTokenDeliveryMode', 'monthly', 'poll');
INSERT INTO public.realm_attribute VALUES ('cibaExpiresIn', 'monthly', '120');
INSERT INTO public.realm_attribute VALUES ('cibaAuthRequestedUserHint', 'monthly', 'login_hint');
INSERT INTO public.realm_attribute VALUES ('parRequestUriLifespan', 'monthly', '60');
INSERT INTO public.realm_attribute VALUES ('cibaInterval', 'monthly', '5');
INSERT INTO public.realm_attribute VALUES ('userProfileEnabled', 'monthly', 'false');
INSERT INTO public.realm_attribute VALUES ('displayName', 'monthly', 'App');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'monthly', 'false');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'monthly', 'false');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', 'monthly', '900');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', 'monthly', '60');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', 'monthly', '60');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', 'monthly', '1000');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', 'monthly', '43200');
INSERT INTO public.realm_attribute VALUES ('failureFactor', 'monthly', '30');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', 'monthly', '43200');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', 'monthly', '300');
INSERT INTO public.realm_attribute VALUES ('oauth2DeviceCodeLifespan', 'monthly', '600');
INSERT INTO public.realm_attribute VALUES ('oauth2DevicePollingInterval', 'monthly', '600');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'monthly', 'false');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', 'monthly', '36000');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionIdleTimeout', 'monthly', '0');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionMaxLifespan', 'monthly', '0');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityName', 'monthly', 'keycloak');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithms', 'monthly', 'ES256');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpId', 'monthly', '');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreference', 'monthly', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachment', 'monthly', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKey', 'monthly', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirement', 'monthly', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeout', 'monthly', '0');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'monthly', 'false');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'monthly', 'keycloak');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'monthly', 'ES256');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpIdPasswordless', 'monthly', '');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'monthly', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'monthly', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'monthly', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'monthly', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeoutPasswordless', 'monthly', '0');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'monthly', 'false');
INSERT INTO public.realm_attribute VALUES ('client-policies.profiles', 'monthly', '{"profiles":[]}');
INSERT INTO public.realm_attribute VALUES ('client-policies.policies', 'monthly', '{"policies":[]}');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', 'monthly', '');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'monthly', 'nosniff');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'monthly', 'none');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'monthly', 'SAMEORIGIN');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'monthly', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', 'monthly', '1; mode=block');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'monthly', 'max-age=31536000; includeSubDomains');


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
INSERT INTO public.realm_events_listeners VALUES ('monthly', 'jboss-logging');


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'master');
INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'monthly');


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.redirect_uris VALUES ('cb7fb9e0-3ecb-4bfc-bd42-5ada914d1848', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', '/admin/master/console/*');
INSERT INTO public.redirect_uris VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', '/admin/app/console/*');
INSERT INTO public.redirect_uris VALUES ('237dc637-c5fd-4d16-834e-2b51960b157e', '/realms/app/account/*');
INSERT INTO public.redirect_uris VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', '/realms/app/account/*');
INSERT INTO public.redirect_uris VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', 'http://localhost:8081');


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.required_action_provider VALUES ('81b864e7-e73e-4c60-b170-63a03e85629c', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('ced9c34b-a3fc-4550-809b-097e9209ad48', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('2d327c56-d457-45f2-a565-c5d03ca67b31', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('21647d51-b67e-46e8-8cc4-dab85c0ff9be', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('d6b7af15-c2c7-44ed-9c2c-eaefa4229d99', 'terms_and_conditions', 'Terms and Conditions', 'master', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('d99009c6-96f2-483e-ba30-938928530490', 'update_user_locale', 'Update User Locale', 'master', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('e065e637-9970-4d30-bf7a-34805998483f', 'VERIFY_EMAIL', 'Verify Email', 'monthly', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('5c02abae-4abd-4ccb-bfae-349a63623adb', 'UPDATE_PROFILE', 'Update Profile', 'monthly', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('0af4a96c-dd67-46bb-a65a-c2e72e28c81e', 'CONFIGURE_TOTP', 'Configure OTP', 'monthly', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('f5552c73-8f30-4438-932d-7664d5300640', 'UPDATE_PASSWORD', 'Update Password', 'monthly', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('fdabd9a5-ffa7-4630-8468-7227946d469d', 'terms_and_conditions', 'Terms and Conditions', 'monthly', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('8784eae8-4f2b-45e2-b57f-664cf3115a22', 'update_user_locale', 'Update User Locale', 'monthly', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('2bc572d9-f341-41be-bab7-82e475284968', 'delete_account', 'Delete Account', 'monthly', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('c7a7ee83-c11d-4cc7-ab73-f749b60ecf2a', 'delete_account', 'Delete Account', 'master', false, false, 'delete_account', 60);


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

INSERT INTO public.resource_server VALUES ('f5c6b235-7689-4b23-89df-98df00fca160', true, '0', 1);


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.resource_server_policy VALUES ('01caacee-6108-48cf-b8b1-4c8428ce0501', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', 'f5c6b235-7689-4b23-89df-98df00fca160', NULL);
INSERT INTO public.resource_server_policy VALUES ('7e80b864-cbef-499c-b7b6-12570ce426dc', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', 'f5c6b235-7689-4b23-89df-98df00fca160', NULL);


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.resource_server_resource VALUES ('6b59651e-687e-4c11-a627-2bd0cb31977f', 'Default Resource', 'urn:monthly-login-app:resources:default', NULL, 'f5c6b235-7689-4b23-89df-98df00fca160', 'f5c6b235-7689-4b23-89df-98df00fca160', false, NULL);


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.resource_uris VALUES ('6b59651e-687e-4c11-a627-2bd0cb31977f', '/*');


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--



--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-admin
--

INSERT INTO public.scope_mapping VALUES ('6f76a30f-a144-4cde-91aa-396cdb1bd041', '65d6ca47-a8ea-4be5-aa07-4f62db4a8b96');
INSERT INTO public.scope_mapping VALUES ('e4bdf2ef-025f-46b8-a430-228614135818', '04ab2a31-3da1-4a06-a8d3-f9a008d356d5');


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

INSERT INTO public.user_entity VALUES ('2cf387a2-bc07-4267-b7f5-97c827688286', NULL, '3017fc3f-7fee-4344-b983-1fe6285890c3', false, true, NULL, NULL, NULL, 'master', 'admin', 1607450910472, NULL, 0);
INSERT INTO public.user_entity VALUES ('429cf9d8-b393-43de-a895-7d08277e9aff', 'giordano.agostini@yahoo.it', 'giordano.agostini@yahoo.it', true, true, NULL, 'Giordano', 'Agostini', 'monthly', 'gagostin', 1607452168770, NULL, 0);
INSERT INTO public.user_entity VALUES ('e432075e-c82a-4c55-9f8d-625b30db0d9c', NULL, 'd43c2efd-914d-47ba-9b54-ec3bf8bf88c9', false, true, NULL, NULL, NULL, 'master', 'service-account-admin-cli', 1609065834208, '61cd8b8e-bf9d-4c47-b8af-596dcda6d716', 0);
INSERT INTO public.user_entity VALUES ('cf1ffab2-0894-4a83-9d3b-969097e748fc', NULL, '76505042-4db7-4d43-811c-7975b58b262d', false, true, NULL, NULL, NULL, 'monthly', 'service-account-login-app', 1607531189808, 'f5c6b235-7689-4b23-89df-98df00fca160', 0);


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

INSERT INTO public.user_role_mapping VALUES ('15ab8020-ea70-4ec6-b192-45b82b40add4', '2cf387a2-bc07-4267-b7f5-97c827688286');
INSERT INTO public.user_role_mapping VALUES ('65d6ca47-a8ea-4be5-aa07-4f62db4a8b96', '2cf387a2-bc07-4267-b7f5-97c827688286');
INSERT INTO public.user_role_mapping VALUES ('2ef36f95-dfce-44c2-af52-fb3cddaa713e', '2cf387a2-bc07-4267-b7f5-97c827688286');
INSERT INTO public.user_role_mapping VALUES ('3ad06f96-de63-4ca8-8a16-d66add08b413', '2cf387a2-bc07-4267-b7f5-97c827688286');
INSERT INTO public.user_role_mapping VALUES ('97758d42-1b88-4cec-8300-544de97339bf', '2cf387a2-bc07-4267-b7f5-97c827688286');
INSERT INTO public.user_role_mapping VALUES ('04ab2a31-3da1-4a06-a8d3-f9a008d356d5', '429cf9d8-b393-43de-a895-7d08277e9aff');
INSERT INTO public.user_role_mapping VALUES ('6ee15ba2-d581-4f39-b819-77c64a6e7844', '429cf9d8-b393-43de-a895-7d08277e9aff');
INSERT INTO public.user_role_mapping VALUES ('7f9c2f0a-4b51-4ca4-b254-70b72b08262f', '429cf9d8-b393-43de-a895-7d08277e9aff');
INSERT INTO public.user_role_mapping VALUES ('e707184d-2fe4-4be1-9a90-b7f77da5090a', '429cf9d8-b393-43de-a895-7d08277e9aff');
INSERT INTO public.user_role_mapping VALUES ('04ab2a31-3da1-4a06-a8d3-f9a008d356d5', 'cf1ffab2-0894-4a83-9d3b-969097e748fc');
INSERT INTO public.user_role_mapping VALUES ('6ee15ba2-d581-4f39-b819-77c64a6e7844', 'cf1ffab2-0894-4a83-9d3b-969097e748fc');
INSERT INTO public.user_role_mapping VALUES ('7f9c2f0a-4b51-4ca4-b254-70b72b08262f', 'cf1ffab2-0894-4a83-9d3b-969097e748fc');
INSERT INTO public.user_role_mapping VALUES ('e707184d-2fe4-4be1-9a90-b7f77da5090a', 'cf1ffab2-0894-4a83-9d3b-969097e748fc');
INSERT INTO public.user_role_mapping VALUES ('8d2ec278-e302-4a2d-a265-3c7b3830a30b', 'cf1ffab2-0894-4a83-9d3b-969097e748fc');
INSERT INTO public.user_role_mapping VALUES ('15ab8020-ea70-4ec6-b192-45b82b40add4', 'e432075e-c82a-4c55-9f8d-625b30db0d9c');
INSERT INTO public.user_role_mapping VALUES ('65d6ca47-a8ea-4be5-aa07-4f62db4a8b96', 'e432075e-c82a-4c55-9f8d-625b30db0d9c');
INSERT INTO public.user_role_mapping VALUES ('2ef36f95-dfce-44c2-af52-fb3cddaa713e', 'e432075e-c82a-4c55-9f8d-625b30db0d9c');
INSERT INTO public.user_role_mapping VALUES ('3ad06f96-de63-4ca8-8a16-d66add08b413', 'e432075e-c82a-4c55-9f8d-625b30db0d9c');
INSERT INTO public.user_role_mapping VALUES ('b245b684-78ed-40fd-88d8-fcd82f3bb2ea', '429cf9d8-b393-43de-a895-7d08277e9aff');
INSERT INTO public.user_role_mapping VALUES ('e458c786-edf0-4b59-9c89-d1d2528db20b', '429cf9d8-b393-43de-a895-7d08277e9aff');


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

INSERT INTO public.web_origins VALUES ('a7b3085f-1a46-4dbd-bb45-65d206b6252a', '+');
INSERT INTO public.web_origins VALUES ('5bf30d61-eaf2-4820-9b11-3b22220902c5', '+');


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

