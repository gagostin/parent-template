import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {AuthGuard} from "./guard/auth.guard";
import {AppComponent} from "./app.component";

const routes: Routes = [
  {
    path: '', component: AppComponent,
    canActivate: [AuthGuard],
    data: { roles: ['admin', 'user'] }
  },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
