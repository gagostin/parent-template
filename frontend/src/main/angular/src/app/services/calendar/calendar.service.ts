import {Injectable} from '@angular/core';
import {Calendar} from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import timeGrigPlugin from "@fullcalendar/timegrid";
import interactionPlugin from "@fullcalendar/interaction";
import {EventImpl} from "@fullcalendar/core/internal";
import {DatePipe} from "@angular/common";
import {CommesseService} from "../commesse/commesse.service";
import {Event} from "../../models/event";
import {EventsService} from "../events/events.service";
import {MatDialog} from "@angular/material/dialog";
import {CommesseComponent} from "../../features/dialogs/commesse/commesse.component";
import {Commessa} from "../../models/commessa";
import {ModifyEventComponent} from "../../features/dialogs/modify-event/modify-event.component";
import {GenericErrorService} from "../generic-error/generic-error.service";

@Injectable({
  providedIn: 'root'
})
export class CalendarService {

  calendar : Calendar;
  commesse : Commessa[];
  selectedArea : any = null;
  selectedEvent : any = null;

  constructor(
      private datePipe : DatePipe,
      private commesseService : CommesseService,
      private eventsService : EventsService,
      private genericErrorService : GenericErrorService,
      public dialogManager: MatDialog
  ) { }

  public buildCalendar(fullCalendarElement: HTMLElement, fields: any, initialEvents: Event[]) : Calendar {

    let events : any[] = [];
    initialEvents.forEach(initialEvent => {
      let event = {
        id: initialEvent.eventId,
        title: initialEvent.commessa.key + ': ' + initialEvent.commessa.description,
        start: initialEvent.startDate,
        end: initialEvent.endDate,
        allDay: initialEvent.allDay,
        editable: initialEvent.editable,
        color: initialEvent.commessa.color
      }
      events.push(event);
    })

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

        commessa: {
          text: fields.calendar.commessaButtonText,
          click: () => this.showCommesseDialog()
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
        left: 'prev,next commessa',
        center: 'title',
        right: 'dayGridMonth timeGridWeek focus,today'
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
      eventClick: this.onEventClick.bind(this),
      events: events
    });

    this.calendar.render();
    return this.calendar;
  }

  private onSelection(res: any) {
    this.selectedArea = res;
    this.selectedEvent = null;
  }

  private onEventClick(res: any) {
    this.selectedEvent = res;
    this.selectedArea = null;
  }

  private changeToSelectedDay() {
    if(this.selectedArea != null) {
      switch (this.selectedArea.view.type) {
        case 'dayGridMonth':
          if(CalendarService.isSingleDay(this.selectedArea)) {
            this.calendar.changeView('timeGridDay', this.selectedArea.startStr);
          } else {
            console.log('please select only one day');
          }
          break;
        default:
          console.log('case not managed: ' + this.selectedArea);
      }
    }
  }

  private showCommesseDialog() {
    this.dialogManager.open(CommesseComponent, {
      data: this.getCommesse(),
      disableClose: true
    });
  }

  private addEvent() {
    if(this.selectedArea != null) {

      let startDate : Date = this.selectedArea.start;
      let endDate : Date = this.selectedArea.end;
      let eventRequest : any[] = [];

      switch (this.selectedArea.view.type) {
        case 'dayGridMonth':
          for (let date = startDate; date < endDate; date.setDate(date.getDate() + 1)) {
            eventRequest.push({
              allDay: false,
              startDate: this.datePipe.transform(date, 'yyyy-MM-dd') + 'T09:00:00',
              endDate: this.datePipe.transform(date, 'yyyy-MM-dd') + 'T18:00:00',
              editable: false,
              commessaKey: this.commesseService.getDefault().key
            });
          }
          break;
        case 'timeGridWeek':
        case 'timeGridDay':
          for (let date = startDate; date < endDate; date.setDate(date.getDate() + 1)) {
            eventRequest.push({
              allDay: false,
              startDate: this.datePipe.transform(date, 'yyyy-MM-dd') + 'T' + startDate.toTimeString().split(' ')[0],
              endDate: this.datePipe.transform(date, 'yyyy-MM-dd') + 'T' + endDate.toTimeString().split(' ')[0],
              editable: false,
              commessaKey: this.commesseService.getDefault().key
            });
          }
          break;
        default:
          console.log('case not managed: ' + this.selectedArea);
      }

      this.eventsService.create(eventRequest).toPromise().then(
          response => {
            response?.forEach(eventId => {
              this.eventsService.find(eventId).toPromise().then(
                  response => this.pushEvent(response),
                  error => this.genericErrorService.goToErrorPage(error)
              );

            })
          },
          error => this.genericErrorService.goToErrorPage(error)
      );
    }
  }

  private editEvent() {
    if(this.selectedEvent != null) {
      let event : EventImpl = this.selectedEvent.event;

      let dialogRef = this.dialogManager.open(ModifyEventComponent, {
        data: [event, this.commesse],
        disableClose: true
      });

      dialogRef.afterClosed().subscribe(
          data => {
            if(data !== undefined) {
              let eventRequest = {
                allDay: false,
                startDate: this.datePipe.transform(data.date, 'yyyy-MM-dd') + 'T' + data.start + ':00',
                endDate: this.datePipe.transform(data.date, 'yyyy-MM-dd') + 'T' + data.end + ':00',
                editable: false,
                commessaKey: data.commessa
              }

              this.eventsService.update(data.eventId, eventRequest).toPromise().then(
                  response => {
                    if(response !== undefined) {
                      event.remove();

                      this.eventsService.find(response.eventId).toPromise().then(
                          response => this.pushEvent(response),
                          error => this.genericErrorService.goToErrorPage(error)
                      );
                    }
                  },
                  error => this.genericErrorService.goToErrorPage(error)
              );
            }
          }
      );
    }

  }

  private deleteEvent() {
    let events: EventImpl[] = this.calendar.getEvents();
    if (events !== undefined && events !== null) {

      if (this.selectedArea != null) {
        switch (this.selectedArea.view.type) {
          case 'dayGridMonth':
            let candidateEvents: EventImpl[] = events.filter(event => CalendarService.isInSelection(event, this.selectedArea));
            candidateEvents.forEach(candidateEvent => {
              this.eventsService.remove(+candidateEvent.id).toPromise().then(
                  () => candidateEvent.remove(),
                  error => this.genericErrorService.goToErrorPage(error)
              );
            })
            break;
          default:
            console.log('case not managed: ' + this.selectedArea);
        }
      } else if(this.selectedEvent != null) {
        this.eventsService.remove(+this.selectedEvent.event.id).toPromise().then(
            () => this.selectedEvent.event.remove(),
            error => this.genericErrorService.goToErrorPage(error)
        );
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

  private pushEvent(event : any) : EventImpl | null{
    return this.calendar.addEvent({
      id: event.eventId + '',
      title: event.commessa.key + ': ' + event.commessa.description,
      start: event.startDate,
      end: event.endDate,
      allDay: event.allDay,
      editable: event.editable,
      color: event.commessa.color
    });
  }

  public setCommesse(commesse : Commessa[]) {
    this.commesse = commesse;
  }

  public getCommesse() : Commessa[] {
    return this.commesse;
  }

}
