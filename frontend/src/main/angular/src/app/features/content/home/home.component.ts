import {Component, OnInit} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {Calendar} from "@fullcalendar/core";
import {CalendarService} from "../../../services/calendar/calendar.service";
import {Event} from "../../../models/event";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent extends AbstractComponent implements OnInit {

  calendar: Calendar;
  events: Event[];

  constructor(
    private route: ActivatedRoute,
    public calendarService : CalendarService
  ) {
    super('homePage');
  }

  ngOnInit() {
    this.events = this.route.snapshot.data.events;

    let calendarEl: HTMLElement = document.getElementById('calendar')!;
    this.calendar = this.calendarService.buildCalendar(calendarEl, this.fields, this.events);
  }

}
