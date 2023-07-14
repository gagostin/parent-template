import {Injectable} from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {AuthService} from "../auth/auth.service";

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

}
