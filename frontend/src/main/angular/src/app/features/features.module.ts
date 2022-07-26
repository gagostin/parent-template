import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {ProfileComponent} from './content/profile/profile.component';
import {HomeComponent} from './content/home/home.component';


@NgModule({
  declarations: [
    HomeComponent,
    ProfileComponent
  ],
  imports: [
    CommonModule
  ]
})
export class FeaturesModule { }
