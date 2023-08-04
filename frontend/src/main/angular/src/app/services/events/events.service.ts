import { Injectable } from '@angular/core';
import {ActivatedRouteSnapshot, Resolve, RouterStateSnapshot} from "@angular/router";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environments/environment";
import {throwError} from "rxjs";
import {Event} from "../../models/event";

@Injectable({
  providedIn: 'root'
})
export class EventsService implements Resolve<any> {

  constructor(
    private http: HttpClient
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    return this.list();
  }

  list() {
    return this.http.get<Event[]>(environment.restBaseUrl + 'events').toPromise()
      .then(
        response => response,
        error => throwError(error)
      )
  }

  create(eventRequest: { allDay: boolean; endDate: string; editable: boolean; commessaKey: string; startDate: string }[]) {
    return this.http.post<number[]>(environment.restBaseUrl + 'events', eventRequest);
  }

  find(eventId: number) {
    return this.http.get<Event[]>(environment.restBaseUrl + 'events/' + eventId);
  }

  remove(eventId: number) {
    return this.http.delete<Event[]>(environment.restBaseUrl + 'events/' + eventId);
  }

  update(eventId: number, eventRequest : { allDay: boolean; endDate: string; editable: boolean; commessaKey: string; startDate: string }) {
    return this.http.patch<Event>(environment.restBaseUrl + 'events/' + eventId, eventRequest);
  }
}
