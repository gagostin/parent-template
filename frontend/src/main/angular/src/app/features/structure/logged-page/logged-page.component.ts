import { Component, OnInit } from '@angular/core';
import {SidebarService} from "../../../services/sidebar/sidebar.service";

@Component({
  selector: 'app-logged-page',
  templateUrl: './logged-page.component.html',
  styleUrls: ['./logged-page.component.scss']
})
export class LoggedPageComponent implements OnInit {

  constructor(
    private sidebarService: SidebarService
  ) {
    this.sidebarService.init();
    this.sidebarService.actionHome();
  }

  ngOnInit(): void {
  }

  openSidebar(event: boolean) {
    event ? this.sidebarService.open() : this.sidebarService.close();
  }

}
