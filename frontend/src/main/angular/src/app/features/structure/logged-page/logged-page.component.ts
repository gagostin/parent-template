import { Component, OnInit } from '@angular/core';
import {SidebarService} from "../../../services/sidebar/sidebar.service";
import {ProfileService} from "../../../services/profile/profile.service";

@Component({
  selector: 'app-logged-page',
  templateUrl: './logged-page.component.html',
  styleUrls: ['./logged-page.component.scss']
})
export class LoggedPageComponent implements OnInit {

  constructor(
    private sidebarService: SidebarService,
    private profileService: ProfileService
  ) {
    this.sidebarService.init();

    this.profileService.exists().toPromise().then(
      () => this.sidebarService.actionHome(),
      () => this.sidebarService.actionProfile()
    )

  }

  ngOnInit(): void {
  }

  openSidebar(event: boolean) {
    event ? this.sidebarService.open() : this.sidebarService.close();
  }

}
