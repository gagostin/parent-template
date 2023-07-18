package com.gago.rest.configurations.auth;

import com.gago.rest.utils.enums.Role;
import org.keycloak.adapters.KeycloakConfigResolver;
import org.keycloak.adapters.springboot.KeycloakSpringBootConfigResolver;
import org.keycloak.adapters.springsecurity.authentication.KeycloakAuthenticationProvider;
import org.keycloak.adapters.springsecurity.config.KeycloakWebSecurityConfigurerAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.authority.mapping.SimpleAuthorityMapper;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.web.authentication.session.RegisterSessionAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(jsr250Enabled = true)
@Profile("!test")
public class KeycloakSecurityConfiguration extends KeycloakWebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        super.configure(http);
        http.authorizeRequests()
                .antMatchers(HttpMethod.GET, "/commesse").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .antMatchers(HttpMethod.GET, "/commesse/{key:[a-z]+}").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .antMatchers(HttpMethod.GET, "/events").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .antMatchers(HttpMethod.GET, "/events/{eventId:[\\d+]}").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .antMatchers(HttpMethod.DELETE, "/events/{eventId:[\\d+]}").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .antMatchers(HttpMethod.PATCH, "/events/{eventId:[\\d+]}").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .antMatchers(HttpMethod.POST, "/events").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .antMatchers(HttpMethod.GET, "/profiles").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .antMatchers(HttpMethod.POST, "/profiles").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .antMatchers(HttpMethod.PATCH, "/profiles").hasAnyRole(Role.ROLE_USER.getOnKeycloak())
                .anyRequest()
                .authenticated();
        http.csrf().disable();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) {
        KeycloakAuthenticationProvider keycloakAuthenticationProvider = keycloakAuthenticationProvider();
        keycloakAuthenticationProvider.setGrantedAuthoritiesMapper(new SimpleAuthorityMapper());
        auth.authenticationProvider(keycloakAuthenticationProvider);
    }

    @Bean
    @Override
    protected SessionAuthenticationStrategy sessionAuthenticationStrategy() {
        return new RegisterSessionAuthenticationStrategy(new SessionRegistryImpl());
    }

    @Bean
    public KeycloakConfigResolver keycloakConfigResolver() {
        return new KeycloakSpringBootConfigResolver();
    }
}
