import {Component, OnInit} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {Calendar} from "@fullcalendar/core";
import {CalendarService} from "../../../services/calendar/calendar.service";
import {Event} from "../../../models/event";
import {ActivatedRoute} from "@angular/router";
import {Commessa} from "../../../models/commessa";
import {CommesseService} from "../../../services/commesse/commesse.service";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent extends AbstractComponent implements OnInit {

  calendar: Calendar;
  events: Event[];
  commesse: Commessa[];

  constructor(
    private route: ActivatedRoute,
    public calendarService : CalendarService,
    public commesseService : CommesseService
  ) {
    super('homePage');
  }

  ngOnInit() {
    this.events = this.route.snapshot.data.events;
    this.commesse = this.route.snapshot.data.commesse;

    let calendarEl: HTMLElement = document.getElementById('calendar')!;
    this.calendar = this.calendarService.buildCalendar(calendarEl, this.fields, this.events);
    this.calendarService.setCommesse(this.commesse);
    this.commesseService.setDefault(this.commesse[0]);
  }

}
