import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environments/environment";
import {Profile} from "../../models/profile";
import {ActivatedRouteSnapshot, Resolve, RouterStateSnapshot} from "@angular/router";

@Injectable({
  providedIn: 'root'
})
export class ProfileService implements Resolve<any> {

  constructor(
    private http: HttpClient
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    return this.find();
  }

  exists() {
    return this.http.head<Profile>(environment.restBaseUrl + 'profiles');
  }

  find() {
    return this.http.get<Profile>(environment.restBaseUrl + 'profiles');
  }

  create(profileRequest: { fiscalCode: string; address: string; city: string; postalCode: string; birthDate: string, age: number, gender: string }) {
    return this.http.post<Profile>(environment.restBaseUrl + 'profiles', profileRequest);
  }

  update(profileRequest: { fiscalCode: string; address: string; city: string; postalCode: string; birthDate: string, age: number, gender: string }) {
    return this.http.patch<Profile>(environment.restBaseUrl + 'profiles', profileRequest);
  }

}
