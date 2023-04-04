import {Injectable} from '@angular/core';
import {Calendar} from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import timeGrigPlugin from "@fullcalendar/timegrid";
import interactionPlugin from "@fullcalendar/interaction";

@Injectable({
  providedIn: 'root'
})
export class CalendarService {

  calendar : Calendar;
  selected : any = null;

  constructor() { }

  public buildCalendar(fullCalendarElement: HTMLElement, fields: any, initialEvents: any[]) : Calendar {

    this.calendar = new Calendar(fullCalendarElement, {
      plugins: [
        dayGridPlugin,
        timeGrigPlugin,
        interactionPlugin,
      ],
      customButtons: {

        // header
        selectedDay: {
          text: fields.calendar.selectedDayButtonText,
          click: (event, element) => this.changeToSelectedDay(event, element)
        },

        // footer
        addEvent: {
          text: fields.calendar.addEventButtonText,
          click: (event, element) => this.addEvent(event, element)
        },
        editEvent: {
          text: fields.calendar.editEventButtonText,
          click: (event: MouseEvent, element: HTMLElement) => this.editEvent(event, element)
        },
        deleteEvent: {
          text: fields.calendar.deleteEventButtonText,
          click: (event: MouseEvent, element: HTMLElement) => this.deleteEvent(event, element)
        }
      },
      headerToolbar: {
        left: 'prev,next today selectedDay',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      footerToolbar: {
        center: 'addEvent editEvent deleteEvent'
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
      eventClick: this.onEventClick.bind(this),
      select: this.onSelection.bind(this),
      events: initialEvents
    });

    this.calendar.render();

    return this.calendar;
  }

  private onDateClick(res: any) {
    // console.log(res);

    //  let event = this.calendar.addEvent({
    //    title: 'Commessa non disponibile',
    //    start: res.dateStr + 'T09:00:00',
    //    end: res.dateStr + 'T18:00:00',
    //    allDay: false,
    //    editable: true,
    //    color: 'red'
    //  });
    //
    // // TODO: in questo momento sto salvando degli oggetti di tipo EventImpl, devo salvare solo il json
    // this.events.push(event);
  }

  private onEventClick(res: any) {
    console.log("event clicked: " + res);
  }

  private onSelection(res: any) {
    this.selected = res;
    // switch (res.view.type) {
    //   case 'dayGridMonth':
    //     console.log('dayGridMonth selected');
    //     break;
    //   case 'timeGridWeek':
    //     console.log('timeGridWeek selected');
    //     break;
    //   case 'timeGridDay':
    //     console.log('timeGridDay selected');
    //     break;
    // }
  }

  private changeToSelectedDay(event: MouseEvent, element: HTMLElement) {
    if(this.selected != null) {
      switch (this.selected.view.type) {
        case 'dayGridMonth':
          if(this.isSingleDay()) {
            this.calendar.changeView('timeGridDay', this.selected.startStr);
          }
          break;
      }
    }
  }

  private addEvent(event: MouseEvent, element: HTMLElement) {
    if(this.selected != null) {
      switch (this.selected.view.type) {
        case 'dayGridMonth':
          if(this.isSingleDay()) {
            let event = this.calendar.addEvent({
              title: 'Commessa non disponibile',
              start: this.selected.startStr + 'T09:00:00',
              end: this.selected.startStr + 'T18:00:00',
              allDay: false,
              editable: true,
              color: 'red'
            });
          } else {
            console.log('manage multiple day add event')
          }
          break;
        case 'timeGridWeek':
          console.log('timeGridWeek selected');
          break;
        case 'timeGridDay':
          console.log('timeGridDay selected');
          break;
      }
    }
  }

  private editEvent(event: MouseEvent, element: HTMLElement) {

  }

  private deleteEvent(event: MouseEvent, element: HTMLElement) {

  }

  private isSingleDay() : boolean {
    let start : Date = this.selected.start;
    let end : Date = this.selected.end;
    return end.getTime() - start.getTime() === 86400000;
  }

}
