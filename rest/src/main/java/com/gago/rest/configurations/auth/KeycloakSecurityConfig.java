package com.gago.rest.configurations.auth;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gago.rest.utils.enums.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@Profile("!test")
@Configuration
@EnableWebSecurity
@EnableResourceServer
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class KeycloakSecurityConfig extends ResourceServerConfigurerAdapter {

    @Value("${rest.security.cors.allowed-origins}")
    private String allowedOrigins;

    @Value("${rest.security.cors.allowed-headers}")
    private String allowedHeaders;

    @Value("${rest.security.cors.allowed-methods}")
    private String allowedMethods;

    @Value("${rest.security.cors.max-age}")
    private Long maxAge;

    @Autowired
    private ResourceServerProperties resourceServerProperties;

    @Override
    public void configure(ResourceServerSecurityConfigurer resources) {
        resources.resourceId(resourceServerProperties.getResourceId());
    }


    @Override
    public void configure(final HttpSecurity http) throws Exception {
        http
                .cors().configurationSource(corsConfigurationSource())
                .and()
                .headers().frameOptions().disable()
                .and()
                .csrf().disable()
                .authorizeRequests()
                .antMatchers(HttpMethod.GET, "/api/v1/parent-template/tests").hasAnyAuthority(Role.ROLE_USER.name())
                .anyRequest().authenticated();

    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.setAllowedOrigins(Arrays.asList(allowedOrigins));
        corsConfiguration.setAllowedHeaders(Arrays.asList(allowedHeaders));
        corsConfiguration.setAllowedMethods(Arrays.asList(allowedMethods));
        corsConfiguration.setMaxAge(maxAge);
        source.registerCorsConfiguration("/**", corsConfiguration);
        return source;
    }

    @Bean
    public JwtAccessTokenCustomizer jwtAccessTokenCustomizer(ObjectMapper mapper) {
        return new JwtAccessTokenCustomizer(mapper);
    }

    @Bean
    public OAuth2RestTemplate oauth2RestTemplate(OAuth2ProtectedResourceDetails details) {
        OAuth2RestTemplate oAuth2RestTemplate = new OAuth2RestTemplate(details);
        return oAuth2RestTemplate;
    }
}