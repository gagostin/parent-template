import {Component, OnInit} from '@angular/core';
import {ActivatedRoute} from "@angular/router";
import {AbstractComponent} from "../../../commons/abstract-component";

@Component({
  selector: 'app-generic-error',
  templateUrl: './generic-error.component.html',
  styleUrls: ['./generic-error.component.scss']
})
export class GenericErrorComponent extends AbstractComponent implements OnInit {

  /**
   * Come invocare la pagina di error:
   *
   * Messaggi custom:
   * this.router.navigate(['/error', {message: 'Custom message here...'}]);
   *
   * Messaggio generico
   * this.router.navigate(['/error']);
   *
   * Per facilitare il tutto usare: GenericErrorService.goToErrorPage(message)
   * */

  errorText;

  constructor(
    private route: ActivatedRoute
  ) {
    super('genericErrorPage')
  }

  ngOnInit(): void {
    if(this.route.snapshot.paramMap.has('message')) {
      this.errorText = this.route.snapshot.paramMap.get('message')
    } else {
      this.errorText = this.fields.genericErrorText;
    }
  }

}
