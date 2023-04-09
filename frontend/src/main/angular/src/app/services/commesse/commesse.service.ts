import { Injectable } from '@angular/core';
import {Commessa} from "../../models/commessa";

@Injectable({
  providedIn: 'root'
})
export class CommesseService {

  default : Commessa;
  commesse : Commessa[] = [
    {
      key: 'SMW',
      description: 'Smart Working',
      color: 'red'
    },
    {
      key: 'SED',
      description: 'Lavoro in sede',
      color: 'blue'
    },
    {
      key: 'CLI',
      description: 'Lavoro dal cliente',
      color: 'yellow'
    },
    {
      key: 'PAR',
      description: 'Permesso annuo retribuito',
      color: 'green'
    },
    {
      key: 'FER',
      description: 'Giornata di ferie',
      color: 'white'
    },
    {
      key: 'MAL',
      description: 'Malattia',
      color: 'black'
    }
  ]

  constructor() {
    this.setDefault(this.commesse[0])
  }

  getCommesse() : Commessa[] {
    return this.commesse;
  }

  getDefault() : Commessa {
    return this.default;
  }

  setDefault(commessa : Commessa) {
    this.default = commessa;
  }
}
