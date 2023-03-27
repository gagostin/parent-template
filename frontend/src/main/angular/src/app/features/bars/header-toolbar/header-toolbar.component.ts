import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";

@Component({
  selector: 'app-header-toolbar',
  templateUrl: './header-toolbar.component.html',
  styleUrls: ['./header-toolbar.component.scss']
})
export class HeaderToolbarComponent extends AbstractComponent implements OnInit {

  @Input() title: string;
  @Input() opened: boolean;

  @Output() onButtonClicked: EventEmitter<any> = new EventEmitter<any>();

  constructor() {
    super('loggedPage');
  }

  ngOnInit(): void {
  }

  onClick() {
    this.opened = !this.opened;
    this.onButtonClicked.emit(this.opened);
  }
}
