import {Component, OnInit} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {CommesseService} from "../../../services/commesse/commesse.service";
import {Commessa} from "../../../models/commessa";

@Component({
  selector: 'app-commesse',
  templateUrl: './commesse.component.html',
  styleUrls: ['./commesse.component.scss']
})
export class CommesseComponent extends AbstractComponent implements OnInit {

  commesse : Commessa[];
  default : Commessa;

  constructor(
      private commesseService : CommesseService
  ) {
    super('commessePage')
  }

  ngOnInit(): void {
    this.commesse = this.commesseService.getCommesse();
    this.default = this.commesseService.getDefault();
  }

  setDefault(commessa : Commessa) {
    this.commesseService.setDefault(commessa);
  }

  isDefault(commessa : Commessa) : boolean {
    return this.commesseService.getDefault() === commessa;
  }

}
