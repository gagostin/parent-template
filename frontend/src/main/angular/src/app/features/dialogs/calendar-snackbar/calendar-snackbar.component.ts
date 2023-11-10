import {Component, Inject} from '@angular/core';
import {AbstractComponent} from "../../../commons/abstract-component";
import {MAT_SNACK_BAR_DATA} from "@angular/material/snack-bar";

@Component({
  selector: 'app-calendar-snackbar',
  templateUrl: './calendar-snackbar.component.html',
  styleUrls: ['./calendar-snackbar.component.scss']
})
export class CalendarSnackbarComponent extends AbstractComponent {

  constructor(@Inject(MAT_SNACK_BAR_DATA) public data: any) {
    super('calendarSnackbarDialog')
  }

}
