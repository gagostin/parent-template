import {Component} from '@angular/core';
import {SidebarService} from "./services/sidebar/sidebar.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  constructor(
    private sidebarService : SidebarService
  ) {}

  openSidebar(event: boolean) {
    event ? this.sidebarService.open() : this.sidebarService.close();
  }
}
