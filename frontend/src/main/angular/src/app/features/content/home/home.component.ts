import {Component, OnInit} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {Calendar} from "@fullcalendar/core";
import {CalendarService} from "../../../services/calendar/calendar.service";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent extends AbstractComponent implements OnInit {

  calendar: Calendar;

  // TODO: recuperare eventi dal servizio dedicato
  events: any[] = [];

  constructor(
      public calendarService : CalendarService
  ) {
    super('homePage');
  }

  ngOnInit() {
    let calendarEl: HTMLElement = document.getElementById('calendar')!;
    this.calendar = this.calendarService.buildCalendar(calendarEl, this.fields, this.events);
  }

}
