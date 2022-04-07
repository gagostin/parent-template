import { Injectable } from '@angular/core';
import {ActivatedRouteSnapshot, Router, RouterStateSnapshot, UrlTree} from '@angular/router';
import {KeycloakAuthGuard, KeycloakService} from "keycloak-angular";

@Injectable({
  providedIn: 'root'
})
export class AuthGuard extends KeycloakAuthGuard {

  constructor(
    router: Router,
    protected keycloak: KeycloakService
  ) {
    super(router, keycloak);
  }

  async isAccessAllowed(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Promise<boolean | UrlTree> {
    return new Promise(async resolve => {
      if(!this.authenticated) {
        await this.keycloak.login();
        resolve(false);
        return;
      }
      const requiredRoles = route.data['roles'];
      let granted: boolean = false;
      if(!requiredRoles || requiredRoles.length === 0) {
        granted = true;
      } else {
        for(const requiredRole of requiredRoles) {
          if(this.roles.indexOf(requiredRole) > -1) {
            granted = true;
            break;
          }
        }
      }

      if(!granted) {
        resolve(granted)
      }

      resolve(granted);
    })
  }
}
