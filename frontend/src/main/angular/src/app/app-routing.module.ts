import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {AuthGuard} from "./guard/auth.guard";
import {LoggedPageComponent} from "./design-system/logged-page/logged-page.component";
import {ProfileComponent} from "./features/profile/profile.component";
import {HomeComponent} from "./features/home/home.component";

const routes: Routes = [
  {
    path: '', component: LoggedPageComponent,
    canActivate: [AuthGuard],
    data: { roles: ['admin', 'user'] },
    children: [
      { path: 'home', component: HomeComponent },
      { path: 'profile', component: ProfileComponent }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
