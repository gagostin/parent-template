import {Component, OnInit} from '@angular/core';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {

  selectedSex: string;
  sexList: any[] = [];
  ageList: any[] = []

  constructor(
  ) { }

  ngOnInit(): void {
    this.sexList.push(
      { value: 'M', viewValue: 'Maschio' },
      { value: 'F', viewValue: 'Femmina' }
    )

    for(let i = 18; i < 75; i++){
      this.ageList.push({ value: i, viewValue: i + '' },)
    }
  }

}
