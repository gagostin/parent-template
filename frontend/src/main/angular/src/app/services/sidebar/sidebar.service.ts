import { Injectable } from '@angular/core';
import {MatSidenav} from "@angular/material/sidenav";
import {KeycloakService} from "keycloak-angular";
import {Router} from "@angular/router";

@Injectable({
  providedIn: 'root'
})
export class SidebarService {

  private sidenav: MatSidenav;
  public userInformation: UserInformation = {
    name : '',
    surname : '',
    email : '',
    username : ''
  };

  constructor(
    private keycloakService: KeycloakService,
    private router: Router
  ) {}

  public init() {
    this.keycloakService.loadUserProfile(true).then(
      response => {
        this.userInformation.name = response.firstName;
        this.userInformation.surname = response.lastName;
        this.userInformation.email = response.email;
        this.userInformation.username = response.username;
      },
      errors => console.log(errors)
    );
  }

  public setSidenav(sidenav: MatSidenav) {
    this.sidenav = sidenav;
  }

  public open() {
    return this.sidenav.open();
  }

  public close() {
    return this.sidenav.close();
  }

  public actionHome() {
    this.router.navigate(['/home'])
  }

  public actionProfile() {
    this.router.navigate(['/profile'])
  }

  public actionLogout() {
    this.keycloakService.logout();
  }
}

export interface UserInformation {
  name?: string;
  surname?: string;
  email?: string;
  username?: string;
}
