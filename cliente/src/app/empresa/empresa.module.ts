import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmpresaRoutingModule } from './empresa-routing.module';
import { HomeComponent } from './home/home.component';
import { EmpresaComponent } from './empresa.component';
import {ThemeModule} from '../@theme/theme.module';
import {SharedModule} from '../shared/shared.module';

@NgModule({
  imports: [
    CommonModule,
    EmpresaRoutingModule,
    ThemeModule,
    SharedModule,
  ],
  declarations: [HomeComponent, EmpresaComponent],
})
export class EmpresaModule { }
