import {Component, OnInit} from '@angular/core';
import {RestService} from "../../services/rest/rest.service";
import {Test} from "../../models/rest";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  public tests : Test[];

  constructor(
    private restService : RestService
  ) { }

  ngOnInit(): void {
    this.restService.getAllTests().toPromise().then(
      response => {
        if(response !== undefined) this.tests = response
      },
      errors => console.log(errors)
    );

  }

}
