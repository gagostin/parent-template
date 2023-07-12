import {Component, OnInit} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {CommesseService} from "../../../services/commesse/commesse.service";
import {Commessa} from "../../../models/commessa";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-commesse',
  templateUrl: './commesse.component.html',
  styleUrls: ['./commesse.component.scss']
})
export class CommesseComponent extends AbstractComponent implements OnInit {

  commesse : Commessa[];

  constructor(
    private route: ActivatedRoute,
    public commesseService : CommesseService
  ) {
    super('commessePage')
  }

  ngOnInit(): void {
    this.commesse = this.route.snapshot.data.commesse;
    this.commesseService.setDefault(this.commesse[0]);
  }

}
