import { Injectable } from '@angular/core';
import {Router} from "@angular/router";

@Injectable({
  providedIn: 'root'
})
export class GenericErrorService {

  constructor(
    private router : Router
  ) { }

  goToErrorPage(message : string | null) {
    if(message === null) {
      this.router.navigate(['/error']);
    } else {
      this.router.navigate(['/error', {message: message}]);
    }
  }

}
