import {Component, OnInit} from '@angular/core';
import {RestService} from "../../services/rest/rest.service";
import {Test} from "../../models/rest";
import {AbstractComponent} from "../../commons/abstract-component";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent extends AbstractComponent implements OnInit {

  public tests : Test[];

  constructor(
    private restService : RestService
  ) {
    super('home-page');
  }

  ngOnInit(): void {
    this.restService.getAllTests().toPromise().then(
      response => {
        if(response !== undefined) this.tests = response
      },
      errors => console.log(errors)
    );

  }

}
