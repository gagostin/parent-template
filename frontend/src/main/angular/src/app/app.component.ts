import {Component, OnInit} from '@angular/core';
import {NgxUiLoaderService} from "ngx-ui-loader";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {

  constructor(private ngxService: NgxUiLoaderService) {}

  ngOnInit(): void {
    this.ngxService.start();

    setTimeout(() => {
      this.ngxService.stop();
    }, 2000);
  }

}
