import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {environment} from "../../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class CmsService {

  private static pages: any;
  private pagesUrl: string = environment.cmsConfig.baseUrl + environment.cmsConfig.pages;

  constructor(private http : HttpClient) {}

  initPages() {
    this.http.get(this.pagesUrl).subscribe(data => {
      CmsService.pages = data;
    });
  }

  public static getPageFields(slug?: string) {
    if(slug) {
      const fields = CmsService.pages.find((page: any) => page.slug === slug);
      if ( fields === undefined ) {
        throw new Error('Page ' + slug + ' not found');
      }
      return fields.acf;
    } else return this.pages;
  }

}
