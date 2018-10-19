/**
 * @license
 * Copyright Akveo. All Rights Reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 */
import { APP_BASE_HREF } from '@angular/common';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { CoreModule } from './@core/core.module';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { ThemeModule } from './@theme/theme.module';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import {NbToastrModule} from '@nebular/theme';
import { LoginComponent } from './login/login.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {SharedModule} from './shared/shared.module';
import { AutenticacionComponent } from './autenticacion/autenticacion.component';

@NgModule({
  declarations: [AppComponent, LoginComponent, AutenticacionComponent],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    AppRoutingModule,
    NbToastrModule.forRoot(),
    NgbModule.forRoot(),
    ThemeModule.forRoot(),
    CoreModule.forRoot(),
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
  ],
  bootstrap: [AppComponent],
  providers: [
    { provide: APP_BASE_HREF, useValue: '/' },
  ],
})
export class AppModule {
}
