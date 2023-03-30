import {Component, OnInit} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {Calendar} from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";
import timeGrigPlugin from '@fullcalendar/timegrid';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent extends AbstractComponent implements OnInit {

  calendar: Calendar;

  // TODO: recuperare eventi dal servizio dedicato
  events: any[] = [];

  constructor() {
    super('homePage');
  }

  ngOnInit() {
    let calendarEl: HTMLElement = document.getElementById('calendar')!;

    this.calendar = new Calendar(calendarEl, {
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
      height: "100%",
      eventTimeFormat: {
        hour: "2-digit",
        minute: "2-digit",
        hour12: false
      },
      dateClick: this.onDateClick.bind(this),
      events: this.events
    });

    this.calendar.render();
  }


  onDateClick(res: any) {
    console.log(res);

    let event = this.calendar.addEvent({
      title: 'Commessa non disponibile',
      start: res.dateStr + 'T09:00:00',
      end: res.dateStr + 'T18:00:00',
      allDay: false,
      editable: true,
      color: 'red'
    });

    // TODO: in questo momento sto salvando degli oggetti di tipo EventImpl, devo salvare solo il json
    this.events.push(event);
  }

}
