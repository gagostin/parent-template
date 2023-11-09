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
import {DatePipe} from "@angular/common";
import {MatSelectModule} from "@angular/material/select";
import {MatInputModule} from "@angular/material/input";
import {CommesseComponent} from './features/dialogs/commesse/commesse.component';
import {MatCardModule} from "@angular/material/card";
import {ScrollingModule} from "@angular/cdk/scrolling";
import {MatRadioModule} from "@angular/material/radio";
import {FlexLayoutModule} from '@angular/flex-layout';
import {NgxUiLoaderHttpModule, NgxUiLoaderModule} from "ngx-ui-loader";
import {MatDialogModule} from "@angular/material/dialog";
import {ModifyEventComponent} from './features/dialogs/modify-event/modify-event.component';
import {MatDatepickerModule} from "@angular/material/datepicker";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {MAT_DATE_LOCALE} from "@angular/material/core";
import {GenericErrorComponent} from './features/content/generic-error/generic-error.component';

@NgModule({
    declarations: [
        AppComponent,
        HeaderToolbarComponent,
        SidebarContainerComponent,
        LoggedPageComponent,
        CommesseComponent,
        ModifyEventComponent,
        GenericErrorComponent
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
        MatSelectModule,
        MatInputModule,
        MatCardModule,
        MatRadioModule,
        MatDatepickerModule,
        ScrollingModule,
        FlexLayoutModule,
        FeaturesModule,
        KeycloakAngularModule,
        HttpClientModule,
        NgxUiLoaderModule.forRoot(
            {
                bgsColor: "#004a9f",
                bgsOpacity: 0.5,
                bgsPosition: "bottom-right",
                bgsSize: 60,
                bgsType: "ball-spin-clockwise",
                blur: 5,
                delay: 0,
                fastFadeOut: true,
                fgsColor: "#004a9f",
                fgsPosition: "center-center",
                fgsSize: 60,
                fgsType: "ball-spin-clockwise",
                gap: 24,
                logoPosition: "center-center",
                logoSize: 120,
                logoUrl: "",
                masterLoaderId: "master",
                overlayBorderRadius: "0",
                overlayColor: "rgba(40, 40, 40, 0.8)",
                pbColor: "#004a9f",
                pbDirection: "ltr",
                pbThickness: 3,
                hasProgressBar: true,
                text: "Caricamento in corso",
                textColor: "#FFFFFF",
                textPosition: "center-center",
                maxTime: -1,
                minTime: 300
            }),
        NgxUiLoaderHttpModule.forRoot({
            showForeground: true
        }),
        MatDialogModule,
        FormsModule,
        ReactiveFormsModule
    ],
    providers: [
        KeycloakService,
        {
            provide: APP_INITIALIZER,
            useFactory: initializeKeycloak,
            multi: true,
            deps: [ KeycloakService ]
        },
        { provide: MAT_DATE_LOCALE, useValue: 'en-GB' },
        AuthService,
        DatePipe
    ],
    bootstrap: [AppComponent]
})
export class AppModule { }
