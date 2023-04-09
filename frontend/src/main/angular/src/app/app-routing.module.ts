import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {AuthGuard} from "./guard/auth.guard";
import {LoggedPageComponent} from "./features/structure/logged-page/logged-page.component";
import {ProfileComponent} from "./features/content/profile/profile.component";
import {HomeComponent} from "./features/content/home/home.component";
import {CommesseComponent} from "./features/content/commesse/commesse.component";

const routes: Routes = [
  {
    path: '', component: LoggedPageComponent,
    canActivate: [AuthGuard],
    data: { roles: ['admin', 'user'] },
    children: [
      { path: 'home', component: HomeComponent },
      { path: 'profile', component: ProfileComponent },
      { path: 'commesse', component: CommesseComponent }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
