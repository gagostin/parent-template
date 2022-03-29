package com.gago.rest.configurations.auth;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.security.oauth2.resource.JwtAccessTokenConverterConfigurer;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.OAuth2Request;
import org.springframework.security.oauth2.provider.token.DefaultAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

import java.util.*;

@Slf4j
public class JwtAccessTokenCustomizer extends DefaultAccessTokenConverter implements JwtAccessTokenConverterConfigurer {

    public static final String RESOURCE_ACCESS_CLAIM_IN_JWT = "resource_access";
    public static final String ROLES_CLAIM_IN_JWT = "roles";
    public static final String GIVEN_NAME_CLAIM_IN_JWT = "given_name";
    public static final String FAMILY_NAME_CLAIM_IN_JWT = "family_name";
    public static final String EMAIL_CLAIM_IN_JWT = "email";
    public static final String FIRST_NAME_KEY = "firstName";
    public static final String LAST_NAME_KEY = "lastName";
    public static final String EMAIL_KEY = "email";

    private ObjectMapper mapper;

    public JwtAccessTokenCustomizer(ObjectMapper mapper) {
        this.mapper = mapper;
        log.info("Initialized {}", JwtAccessTokenCustomizer.class.getSimpleName());
    }

    @Override
    public void configure(JwtAccessTokenConverter converter) {
        converter.setAccessTokenConverter(this);
        log.info("Configured {}", JwtAccessTokenConverter.class.getSimpleName());
    }

    @Override
    public OAuth2Authentication extractAuthentication(Map<String,?> tokenMap) {
        log.debug("Begin extractAuthentication: tokenMap = {}", tokenMap);
        JsonNode token = mapper.convertValue(tokenMap, JsonNode.class);
        Set<String> audienceList = extractClients(token);
        List<GrantedAuthority> authorities = extractRoles(token);

        OAuth2Authentication authentication = super.extractAuthentication(tokenMap);
        authentication.setDetails(extractDetails(token));
        OAuth2Request oAuth2Request = authentication.getOAuth2Request();

        OAuth2Request request =
                new OAuth2Request(oAuth2Request.getRequestParameters(),
                        oAuth2Request.getClientId(),
                        authorities, true,
                        oAuth2Request.getScope(),
                        audienceList, null, null, null);

        UsernamePasswordAuthenticationToken usernamePasswordAuthentication =
                new UsernamePasswordAuthenticationToken(authentication.getPrincipal(),
                        "N/A", authorities);
        usernamePasswordAuthentication.setDetails(authentication.getDetails());

        log.debug("End extractAuthentication");
        return new OAuth2Authentication(request, usernamePasswordAuthentication);
    }

    private List<GrantedAuthority> extractRoles(JsonNode jwt) {
        log.debug("Begin extractRoles: jwt = {}", jwt);
        Set<String> rolesWithPrefix = new HashSet<>();

        jwt.path(RESOURCE_ACCESS_CLAIM_IN_JWT)
                .elements()
                .forEachRemaining(e -> e.path(ROLES_CLAIM_IN_JWT)
                        .elements()
                        .forEachRemaining(r -> rolesWithPrefix.add("ROLE_" + r.asText())));

        final List<GrantedAuthority> authorityList =
                AuthorityUtils.createAuthorityList(rolesWithPrefix.toArray(new String[0]));

        log.debug("End extractRoles: roles = {}", authorityList);
        return authorityList;
    }

    private Set<String> extractClients(JsonNode jwt) {
        log.debug("Begin extractClients: jwt = {}", jwt);
        if (jwt.has(RESOURCE_ACCESS_CLAIM_IN_JWT)) {
            JsonNode resourceAccessJsonNode = jwt.path(RESOURCE_ACCESS_CLAIM_IN_JWT);
            final Set<String> clientNames = new HashSet<>();
            resourceAccessJsonNode.fieldNames()
                    .forEachRemaining(clientNames::add);

            log.debug("End extractClients: clients = {}", clientNames);
            return clientNames;

        } else {
            throw new IllegalArgumentException("Expected element " +
                    RESOURCE_ACCESS_CLAIM_IN_JWT + " not found in token");
        }
    }

    private Map<String, String> extractDetails(JsonNode jwt) {
        log.debug("Begin extractDetails: jwt = {}", jwt);

        Map<String, String> details = new HashMap<>();
        details.put(FIRST_NAME_KEY, jwt.path(GIVEN_NAME_CLAIM_IN_JWT).asText());
        details.put(LAST_NAME_KEY, jwt.path(FAMILY_NAME_CLAIM_IN_JWT).asText());
        details.put(EMAIL_KEY, jwt.path(EMAIL_CLAIM_IN_JWT).asText());

        log.debug("End extractDetails: details = {}", details);
        return details;
    }
}