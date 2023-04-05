import {Injectable} from '@angular/core';
import {Calendar} from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import timeGrigPlugin from "@fullcalendar/timegrid";
import interactionPlugin from "@fullcalendar/interaction";
import {EventImpl} from "@fullcalendar/core/internal";
import {DatePipe} from "@angular/common";

@Injectable({
  providedIn: 'root'
})
export class CalendarService {

  calendar : Calendar;
  selected : any = null;

  constructor(
    private datePipe : DatePipe
  ) { }

  public buildCalendar(fullCalendarElement: HTMLElement, fields: any, initialEvents: any[]) : Calendar {

    this.calendar = new Calendar(fullCalendarElement, {
      plugins: [
        dayGridPlugin,
        timeGrigPlugin,
        interactionPlugin
      ],
      customButtons: {

        // header
        focus: {
          text: fields.calendar.focusButtonText,
          click: () => this.changeToSelectedDay()
        },

        // footer
        addEvent: {
          text: fields.calendar.addEventButtonText,
          click: () => this.addEvent()
        },
        editEvent: {
          text: fields.calendar.editEventButtonText,
          click: () => this.editEvent()
        },
        deleteEvent: {
          text: fields.calendar.deleteEventButtonText,
          click: () => this.deleteEvent()
        }
      },
      headerToolbar: {
        left: 'prev,next',
        center: 'title',
        right: 'dayGridMonth focus,today'
      },
      footerToolbar: {
        center: 'addEvent editEvent deleteEvent'
      },
      initialView: 'dayGridMonth',
      weekends: true,
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
      select: this.onSelection.bind(this),
      events: initialEvents
    });

    this.calendar.render();
    return this.calendar;
  }

  private onSelection(res: any) {
    this.selected = res;
  }

  private changeToSelectedDay() {
    if(this.selected != null) {
      switch (this.selected.view.type) {
        case 'dayGridMonth':
          if(CalendarService.isSingleDay(this.selected)) {
            this.calendar.changeView('timeGridDay', this.selected.startStr);
          } else {
            console.log('please select only one day');
          }
          break;
        default:
          console.log('case not managed: ' + this.selected);
      }
    }
  }

  private addEvent() {
    if(this.selected != null) {
      switch (this.selected.view.type) {
        case 'dayGridMonth':
          let startDate : Date = this.selected.start;
          let endDate : Date = this.selected.end;

          for (let date = startDate; date < endDate; date.setDate(date.getDate() + 1)) {
            this.pushEvent(this.datePipe.transform(date, 'yyyy-MM-dd'));
          }
          break;
        default:
          console.log('case not managed: ' + this.selected);
      }
    }
  }

  private editEvent() {

  }

  private deleteEvent() {
    let events: EventImpl[] = this.calendar.getEvents();
    if (events !== undefined && events !== null) {

      if (this.selected != null) {
        switch (this.selected.view.type) {
          case 'dayGridMonth':
            let candidateEvents: EventImpl[] = events.filter(event => CalendarService.isInSelection(event, this.selected));
            candidateEvents.forEach(candidateEvent => candidateEvent.remove());
            break;
          default:
            console.log('case not managed: ' + this.selected);
        }
      }

    }
  }

  private static isSingleDay(selection : any) : boolean {
    let start : Date = selection.start;
    let end : Date = selection.end;
    return end.getTime() - start.getTime() === 86400000;
  }

  private static isInSelection(event: EventImpl, selection: any) : boolean {
    let startDate: Date | null = selection.start;
    let endDate: Date | null = selection.end;
    let eventDate: Date | null = event.start;

    if(startDate === null || endDate === null || eventDate === null)
      return false;
    else return startDate <= eventDate && eventDate < endDate;
  }

  /**
   * Accepts a date in yyyy-mm-dd format.
   * */
  private pushEvent(date : string | null) : EventImpl | null {
    if(date === null) return null;
    else return this.calendar.addEvent({
      title: 'Commessa non disponibile',
      start: date + 'T09:00:00',
      end: date + 'T18:00:00',
      allDay: false,
      editable: true,
      color: 'red'
    });
  }

}
