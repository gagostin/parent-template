import {Injectable} from '@angular/core';
import {HttpClient, HttpErrorResponse, HttpHeaders} from "@angular/common/http";
import {environment} from "../../../environments/environment";
import {Test} from "../../models/rest";
import {AuthService} from "../auth/auth.service";
import {Observable, throwError} from "rxjs";
import { catchError, map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class RestService {

  private headers: HttpHeaders = new HttpHeaders();

  constructor(
    private httpClient: HttpClient,
    private authService: AuthService
  ) {
    this.buildHeaders();
  }

  private buildHeaders() {
    this.headers.set('Authorization', 'Bearer ' + this.authService.getToken());
  }

  getAllTests() : Observable<Test[]>{
    return this.httpClient.get<Test[]>(environment.restBaseUrl + 'tests', {headers: this.headers})
      .pipe(
        map((tests: Test[]) => tests),
        catchError((error: HttpErrorResponse) => {
          return throwError(error);
        })
      );
  }
}
