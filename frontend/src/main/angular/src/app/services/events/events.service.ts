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

}
