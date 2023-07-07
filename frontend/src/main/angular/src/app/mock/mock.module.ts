import { NgModule } from "@angular/core";
import { environment } from "src/environments/environment";

import { makeServer } from './mirage';

if (environment.stub) {
  makeServer({ environment: "development" });
}

@NgModule({})
export class MockModule {}
