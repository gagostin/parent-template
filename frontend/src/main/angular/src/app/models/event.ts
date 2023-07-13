import {Commessa} from "./commessa";

export class Event {

  eventId: number;
  allDay: boolean;
  startDate: string;
  endDate: string;
  editable: boolean;
  userId: string;
  commessa: Commessa;

}
