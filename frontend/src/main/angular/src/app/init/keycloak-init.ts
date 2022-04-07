import {KeycloakOptions, KeycloakService} from "keycloak-angular";
import {environment} from "../../environments/environment";

export function initializeKeycloak(keycloak: KeycloakService) {
  const config: KeycloakOptions = {
    config: environment.keycloakConfig,
    initOptions: {
      onLoad: 'login-required',
      flow: "standard"
    }
  }
  return () => keycloak.init(config);
}


