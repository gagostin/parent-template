import {AfterViewInit, Component, OnInit, ViewChild} from '@angular/core';
import {MatSidenav} from "@angular/material/sidenav";
import {SidebarService} from "../../services/sidebar/sidebar.service";

@Component({
  selector: 'app-sidebar-container',
  templateUrl: './sidebar-container.component.html',
  styleUrls: ['./sidebar-container.component.scss']
})
export class SidebarContainerComponent implements AfterViewInit {

  @ViewChild(MatSidenav) public sidenav: MatSidenav;

  constructor(
    private sidebarService : SidebarService
  ) { }

  ngAfterViewInit() {
    this.sidebarService.setSidenav(this.sidenav);
  }

}
