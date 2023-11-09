import {Component, EventEmitter, Input, Output} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {SidebarService} from "../../../services/sidebar/sidebar.service";

@Component({
  selector: 'app-header-toolbar',
  templateUrl: './header-toolbar.component.html',
  styleUrls: ['./header-toolbar.component.scss']
})
export class HeaderToolbarComponent extends AbstractComponent {

  @Input() title: string;
  @Output() onButtonClicked: EventEmitter<any> = new EventEmitter<any>();

  constructor(
    public sidebarService : SidebarService
  ) {
    super('loggedPage');
  }

  onClick() {
    this.sidebarService.setOpened(!this.sidebarService.isOpened());
    this.onButtonClicked.emit(this.sidebarService.isOpened());
  }
}
