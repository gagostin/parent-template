import { environment } from 'src/environments/environment';
import { Directive } from '@angular/core';
import {CmsService} from "../services/cms/cms.service";

@Directive()
export class AbstractComponent {

  public fields: any = {};
  public env: any;

  constructor(public slug?: string) {
    this.env = environment;

    if (this.slug) {
      this.fields = CmsService.getPageFields(this.slug);
    } else {
      this.fields = CmsService.getPageFields();
    }
  }
}
