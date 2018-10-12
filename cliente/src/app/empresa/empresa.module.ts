import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmpresaRoutingModule } from './empresa-routing.module';
import { HomeComponent } from './home/home.component';
import { EmpresaComponent } from './empresa.component';
import {ThemeModule} from '../@theme/theme.module';

@NgModule({
  imports: [
    CommonModule,
    EmpresaRoutingModule,
    ThemeModule,
  ],
  declarations: [HomeComponent, EmpresaComponent],
})
export class EmpresaModule { }
