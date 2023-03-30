import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {ProfileComponent} from './content/profile/profile.component';
import {HomeComponent} from './content/home/home.component';
import {FullCalendarModule} from "@fullcalendar/angular";

@NgModule({
    declarations: [
        HomeComponent,
        ProfileComponent
    ],
    exports: [
        HomeComponent
    ],
    imports: [
        CommonModule,
        FullCalendarModule
    ]
})
export class FeaturesModule { }
