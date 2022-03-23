import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {MatToolbarModule} from "@angular/material/toolbar";
import {MatSidenavModule} from "@angular/material/sidenav";
import {MatButtonModule} from "@angular/material/button";
import {MatIconModule} from "@angular/material/icon";
import {MatDividerModule} from "@angular/material/divider";
import { HeaderToolbarComponent } from './design-system/header-toolbar/header-toolbar.component';
import { SidebarContainerComponent } from './design-system/sidebar-container/sidebar-container.component';
import {SidebarService} from "./services/sidebar/sidebar.service";
import {FeaturesModule} from "./features/features.module";

@NgModule({
  declarations: [
    AppComponent,
    HeaderToolbarComponent,
    SidebarContainerComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    MatSidenavModule,
    MatButtonModule,
    MatIconModule,
    MatDividerModule,
    FeaturesModule
  ],
  providers: [SidebarService],
  bootstrap: [AppComponent]
})
export class AppModule { }
