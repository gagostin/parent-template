import {Component, OnInit} from '@angular/core';
import {SidebarService} from "../../../services/sidebar/sidebar.service";
import {ProfileService} from "../../../services/profile/profile.service";
import {Router} from "@angular/router";
import {GenericErrorService} from "../../../services/generic-error/generic-error.service";

@Component({
  selector: 'app-logged-page',
  templateUrl: './logged-page.component.html',
  styleUrls: ['./logged-page.component.scss']
})
export class LoggedPageComponent implements OnInit {

  constructor(
    private router: Router,
    private sidebarService: SidebarService,
    private profileService: ProfileService,
    private genericErrorService: GenericErrorService
  ) {
    this.sidebarService.init();

    this.profileService.exists().toPromise().then(
      () => this.sidebarService.actionHome(),
      error => {
        switch (error.status) {
          case 404:
            this.profileService.create({
              fiscalCode: '',
              address: '',
              city: '',
              postalCode: '',
              birthDate: '',
              age: 0,
              gender: ''
            }).toPromise().then(
              () => this.sidebarService.actionHome(),
              error => this.genericErrorService.goToErrorPage(error)
            )
            break;
          default:
            this.genericErrorService.goToErrorPage(error)
        }
      }
    )

  }

  ngOnInit(): void {
    this.router.navigate(['/home']);
  }

  openSidebar(event: boolean) {
    event ? this.sidebarService.open() : this.sidebarService.close();
  }

}
