import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";
import {EventImpl} from "@fullcalendar/core/internal";
import {Commessa} from "../../../models/commessa";
import {FormBuilder, FormGroup} from "@angular/forms";
import {AbstractComponent} from "../../../commons/abstract-component";

@Component({
  selector: 'app-modify-event',
  templateUrl: './modify-event.component.html',
  styleUrls: ['./modify-event.component.scss']
})
export class ModifyEventComponent extends AbstractComponent implements OnInit {

  event : EventImpl;
  commesse : Commessa[];

  updateEventForm: FormGroup;

  constructor(
      @Inject(MAT_DIALOG_DATA) public data,
      private dialogRef: MatDialogRef<ModifyEventComponent>,
      private formBuilder : FormBuilder
  ) {
    super('modifyEventDialog');
    this.event = data[0];
    this.commesse = data[1];
  }

  ngOnInit(): void {
    this.updateEventForm = this.formBuilder.group({
      eventId: +this.event.id,
      commessa: this.getCommessaKeyFromTitle(this.event),
      date: new Date(this.event.startStr),
      start: this.getEventTime(this.event, 'start'),
      end: this.getEventTime(this.event, 'end')
    });
  }

  getCommessaKeyFromTitle(event : EventImpl) {
    return event.title.split(': ')[0];
  }

  getEventTime(event : EventImpl, type : 'start' | 'end') {
    let time;
    switch (type) {
      case "start":
        time = event.startStr.split('T')[1];
        break;
      case "end":
        time = event.endStr.split('T')[1];
        break;
    }
    return time.split(':')[0] + ':' + time.split(':')[1];
  }

  onSubmit() {
    this.dialogRef.close(this.updateEventForm.value);
  }

  onClose() {
    this.dialogRef.close();
  }
}
