import {AfterViewInit, Component, ViewChild} from '@angular/core';
import {MatSidenav} from "@angular/material/sidenav";
import {SidebarService} from "../../../services/sidebar/sidebar.service";
import {AbstractComponent} from "../../../commons/abstract-component";

@Component({
  selector: 'app-sidebar-container',
  templateUrl: './sidebar-container.component.html',
  styleUrls: ['./sidebar-container.component.scss']
})
export class SidebarContainerComponent extends AbstractComponent implements AfterViewInit {

  @ViewChild(MatSidenav) public sidenav: MatSidenav;

  constructor(
    public sidebarService : SidebarService
  ) {
    super('loggedPage');
  }

  ngAfterViewInit() {
    this.sidebarService.setSidenav(this.sidenav);
  }

}
