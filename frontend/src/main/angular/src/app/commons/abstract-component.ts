import {environment} from 'src/environments/environment';
import * as fields from 'src/lang/it.json';
import {Directive} from '@angular/core';

@Directive()
export class AbstractComponent {

  public fields: any;
  public env: any;

  constructor(public slug : string) {
    this.env = environment;

    this.fields = fields[slug];
  }

}
