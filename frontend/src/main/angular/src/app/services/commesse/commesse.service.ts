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
      color: 'red',
      image: 'home.jpeg'
    },
    {
      key: 'SED',
      description: 'Lavoro in sede',
      color: 'blue',
      image: 'ags-italia.jpeg'
    },
    {
      key: 'CLI',
      description: 'Lavoro dal cliente',
      color: 'yellow',
      image: 'mobilize-fs.jpeg'
    },
    {
      key: 'PAR',
      description: 'Permesso annuo retribuito',
      color: 'green',
      image: 'permesso.jpeg'
    },
    {
      key: 'FER',
      description: 'Giornata di ferie',
      color: 'white',
      image: 'ferie.jpeg'
    },
    {
      key: 'MAL',
      description: 'Malattia',
      color: 'black',
      image: 'malattia.jpeg'
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
