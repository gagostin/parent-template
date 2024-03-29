import {APP_INITIALIZER, NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {MatToolbarModule} from "@angular/material/toolbar";
import {MatSidenavModule} from "@angular/material/sidenav";
import {MatButtonModule} from "@angular/material/button";
import {MatIconModule} from "@angular/material/icon";
import {MatDividerModule} from "@angular/material/divider";
import {HeaderToolbarComponent} from './features/bars/header-toolbar/header-toolbar.component';
import {SidebarContainerComponent} from './features/bars/sidebar-container/sidebar-container.component';
import {FeaturesModule} from "./features/features.module";
import {KeycloakAngularModule, KeycloakService} from "keycloak-angular";
import {initializeKeycloak} from "./init/keycloak-init";
import {AuthService} from "./services/auth/auth.service";
import {LoggedPageComponent} from './features/structure/logged-page/logged-page.component';
import {HttpClientModule} from "@angular/common/http";

@NgModule({
  declarations: [
    AppComponent,
    HeaderToolbarComponent,
    SidebarContainerComponent,
    LoggedPageComponent,
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
    FeaturesModule,
    KeycloakAngularModule,
    HttpClientModule
  ],
  providers: [
    KeycloakService,
    {
      provide: APP_INITIALIZER,
      useFactory: initializeKeycloak,
      multi: true,
      deps: [ KeycloakService ]
    },
    AuthService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
