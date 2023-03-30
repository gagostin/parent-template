import {Component, OnInit} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {CalendarOptions} from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";
import timeGrigPlugin from '@fullcalendar/timegrid';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent extends AbstractComponent implements OnInit {

  Events: any[] = [];
  calendarOptions: CalendarOptions = {
    plugins: [
      dayGridPlugin,
      timeGrigPlugin,
      interactionPlugin,
    ],
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay'
    },
    initialView: 'dayGridMonth',
    weekends: false,
    editable: true,
    selectable: true,
    selectMirror: true,
    dayMaxEvents: true,
    height: "100%"
  };

  constructor() {
    super('homePage');
  }

  onDateClick(res: any) {
    alert('Clicked on date : ' + res.dateStr);
  }

  ngOnInit() {
    setTimeout(() => {
      this.calendarOptions = {
        initialView: 'dayGridMonth',
        dateClick: this.onDateClick.bind(this),
        events: this.Events,
      };
    }, 2500);
  }

}
