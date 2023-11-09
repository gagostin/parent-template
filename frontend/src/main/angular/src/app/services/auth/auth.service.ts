import {Injectable} from '@angular/core';
import {KeycloakService} from "keycloak-angular";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(
    private keycloakService: KeycloakService,
    private http: HttpClient

  ) { }

  getToken() : Promise<string> {
    return this.keycloakService.getToken();
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

  getRoles(): string[] {
    return this.keycloakService.getUserRoles();
  }

  logout() {
    this.keycloakService.logout();
  }

}
