import { Injectable } from '@angular/core';
import {KeycloakService} from "keycloak-angular";

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private keycloakService: KeycloakService) { }

  getToken() : string {
    let token : string = '';
    this.keycloakService.getToken().then(
      response => token = response,
      error => console.log(error)
    )
    return token;
  }

  getLoggedUser() {
    try {
      let userDetails = this.keycloakService.getKeycloakInstance().idTokenParsed;
      console.log('UserDetails: ', userDetails);
      console.log('UserRoles: ', this.getRoles())
      return userDetails;
    } catch (e) {
      console.log('authService.getLoggedUser() exception', e);
      return undefined;
    }
  }

  logout() {
    this.keycloakService.logout();
  }

  redirectToProfile() {
    this.keycloakService.getKeycloakInstance().accountManagement();
  }

  getRoles(): string[] {
    return this.keycloakService.getUserRoles();
  }

}
