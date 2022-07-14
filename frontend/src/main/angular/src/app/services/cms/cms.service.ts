import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class CmsService {

  private static pages: any;

  constructor(private http : HttpClient) {}

  initPages() {
    this.http.get('http://localhost:10008/wp-json/wp/v2/pages').subscribe(data => {
      CmsService.pages = data;
      console.log(CmsService.pages);
    });
  }

}
