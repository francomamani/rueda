import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {PerfilComponent} from './perfil/perfil.component';
import {ThemeModule} from '../@theme/theme.module';

@NgModule({
  imports: [
    CommonModule,
    ThemeModule,
  ],
  declarations: [PerfilComponent],
  exports: [PerfilComponent],
})
export class SharedModule { }
