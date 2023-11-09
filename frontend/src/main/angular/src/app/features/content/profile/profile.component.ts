import {Component, OnInit} from '@angular/core';
import {Profile} from "../../../models/profile";
import {ActivatedRoute, Router} from "@angular/router";
import {AbstractComponent} from "../../../commons/abstract-component";
import {ProfileService} from "../../../services/profile/profile.service";
import {FormBuilder, FormGroup} from "@angular/forms";
import {DatePipe} from "@angular/common";
import {AuthService} from "../../../services/auth/auth.service";
import {environment} from "../../../../environments/environment";
import {GenericErrorService} from "../../../services/generic-error/generic-error.service";

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent extends AbstractComponent implements OnInit {

  sexList: any[] = [];
  ageList: any[] = []

  profile: Profile;
  personalInformation: FormGroup;
  passwordInformation: FormGroup;

  private accountManagementUrl : string = `${environment.keycloakConfig.url}/realms/${environment.keycloakConfig.realm}/account`;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private profileService : ProfileService,
    private authService: AuthService,
    private formBuilder: FormBuilder,
    private datePipe: DatePipe,
    private genericErrorService: GenericErrorService
  ) {
    super('profilePage')
  }

  ngOnInit(): void {
    this.sexList.push(
      { value: 'M', viewValue: 'Maschio' },
      { value: 'F', viewValue: 'Femmina' }
    )

    for(let i = 18; i < 75; i++) {
      this.ageList.push({ value: i, viewValue: i + '' })
    }

    this.profile = this.route.snapshot.data.profile;

    this.personalInformation = this.formBuilder.group({
      fiscalCode: this.profile.fiscalCode,
      address: this.profile.address,
      city: this.profile.city,
      postalCode: this.profile.postalCode,
      birthDate: new Date(this.profile.birthDate),
      age: this.profile.age,
      gender: this.profile.gender
    });

    this.passwordInformation = this.formBuilder.group({
      oldPassword: '',
      newPassword: '',
      newPasswordConfirmation: ''
    });

  }

  onUpdateProfile() {

    let birthDate = this.datePipe.transform(this.personalInformation.value.birthDate, 'MM/dd/yyyy');
    if(birthDate == null) birthDate = '';

    this.profileService.update(
      {
        fiscalCode: this.personalInformation.value.fiscalCode,
        address: this.personalInformation.value.address,
        city: this.personalInformation.value.city,
        postalCode: this.personalInformation.value.postalCode,
        birthDate: birthDate,
        age: this.personalInformation.value.age,
        gender: this.personalInformation.value.gender
      }
    ).toPromise().then(
      profile => console.log("profile correctly updated: response=[" + profile + "]"),
      error => this.genericErrorService.goToErrorPage(error)
    )
  }

  navigateToAccountManagement() {
    window.location.href = this.accountManagementUrl;
  }

}
