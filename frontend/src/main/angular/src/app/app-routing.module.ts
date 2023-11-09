import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {AuthGuard} from "./guard/auth.guard";
import {LoggedPageComponent} from "./features/structure/logged-page/logged-page.component";
import {ProfileComponent} from "./features/content/profile/profile.component";
import {HomeComponent} from "./features/content/home/home.component";
import {CommesseService} from "./services/commesse/commesse.service";
import {EventsService} from "./services/events/events.service";
import {ProfileService} from "./services/profile/profile.service";
import {GenericErrorComponent} from "./features/content/generic-error/generic-error.component";

const routes: Routes = [
  {
    path: '', component: LoggedPageComponent,
    canActivate: [AuthGuard],
    data: { roles: ['admin', 'user'] },
    children: [
      {
        path: 'home',
        component: HomeComponent,
        resolve: {
          events : EventsService,
          commesse : CommesseService
        },
      },
      {
        path: 'profile',
        component: ProfileComponent,
        resolve: {
          profile : ProfileService
        },
      },
      {
        path: 'error',
        component: GenericErrorComponent
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
