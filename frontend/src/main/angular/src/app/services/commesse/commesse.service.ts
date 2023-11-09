import {Injectable} from '@angular/core';
import {Commessa} from "../../models/commessa";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environments/environment";
import {ActivatedRouteSnapshot, Resolve, RouterStateSnapshot} from "@angular/router";
import {GenericErrorService} from "../generic-error/generic-error.service";

@Injectable({
  providedIn: 'root'
})
export class CommesseService implements Resolve<any> {

  private default : Commessa;

  constructor(
    private http: HttpClient,
    private genericErrorService: GenericErrorService
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    return this.list();
  }

  list() {
    return this.http.get<Commessa[]>(environment.restBaseUrl + 'commesse').toPromise()
      .then(
        response => response,
        error => this.genericErrorService.goToErrorPage(error)
      )
  }

  getDefault() : Commessa {
    return this.default;
  }

  setDefault(commessa : Commessa) {
    this.default = commessa;
  }

  isDefault(commessa : Commessa) {
    return commessa === this.default;
  }

}
