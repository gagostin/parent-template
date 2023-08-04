import {Component, Inject} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {CommesseService} from "../../../services/commesse/commesse.service";
import {Commessa} from "../../../models/commessa";
import {MAT_DIALOG_DATA} from "@angular/material/dialog";

@Component({
  selector: 'app-commesse',
  templateUrl: './commesse.component.html',
  styleUrls: ['./commesse.component.scss']
})
export class CommesseComponent extends AbstractComponent {

  constructor(
    public commesseService : CommesseService,
    @Inject(MAT_DIALOG_DATA) public commesse: Commessa[],
  ) {
    super('commesseDialog')
  }

}
