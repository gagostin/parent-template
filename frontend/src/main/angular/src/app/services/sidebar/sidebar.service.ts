import {Injectable} from '@angular/core';
import {MatSidenav} from "@angular/material/sidenav";
import {KeycloakService} from "keycloak-angular";
import {Router} from "@angular/router";
import {UserInformation} from "../../models/auth";
import {MatDrawerToggleResult} from "@angular/material/sidenav/drawer";
import {GenericErrorService} from "../generic-error/generic-error.service";

@Injectable({
  providedIn: 'root'
})
export class SidebarService {

  private opened: boolean = false;
  private sidenav: MatSidenav;
  public userInformation: UserInformation = new UserInformation();

  constructor(
    private keycloakService: KeycloakService,
    private router: Router,
    private genericErrorService: GenericErrorService
  ) {}

  public init() {
    this.keycloakService.loadUserProfile(true).then(
      response => {
        this.userInformation.name = response.firstName;
        this.userInformation.surname = response.lastName;
        this.userInformation.email = response.email;
        this.userInformation.username = response.username;
      },
      errors => this.genericErrorService.goToErrorPage(errors)
    );
  }

  public setSidenav(sidenav: MatSidenav) {
    this.sidenav = sidenav;
  }

  public open() : Promise<MatDrawerToggleResult> {
    this.setOpened(true);
    return this.sidenav.open();
  }

  public close() : Promise<MatDrawerToggleResult>{
    this.setOpened(false);
    return this.sidenav.close();
  }

  public actionHome() {
    this.close().then(
      () => this.router.navigate(['/home']),
      error => this.genericErrorService.goToErrorPage(error)
    )

  }

  public actionProfile() {
    this.close().then(
      () => this.router.navigate(['/profile']),
      error => this.genericErrorService.goToErrorPage(error)
    )
  }

  public actionLogout() {
    this.keycloakService.logout();
  }

  public setOpened(opened : boolean) {
    this.opened = opened;
  }

  public isOpened() : boolean {
    return this.opened;
  }

}
