import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {PerfilComponent} from './perfil/perfil.component';
import {ThemeModule} from '../@theme/theme.module';
import { HorariosOcupadosComponent } from './horarios-ocupados/horarios-ocupados.component';
import { HorariosOcupadosIndexComponent } from './horarios-ocupados/horarios-ocupados-index/horarios-ocupados-index.component';
import { HorariosOcupadosCreateComponent } from './horarios-ocupados/horarios-ocupados-create/horarios-ocupados-create.component';
import {RouterModule} from '@angular/router';

@NgModule({
  imports: [
    CommonModule,
    RouterModule,
    ThemeModule,
  ],
  declarations: [ PerfilComponent,
                  HorariosOcupadosComponent,
                  HorariosOcupadosIndexComponent,
                  HorariosOcupadosCreateComponent],
  exports: [PerfilComponent,
            HorariosOcupadosComponent,
            HorariosOcupadosCreateComponent,
            HorariosOcupadosIndexComponent],
})
export class SharedModule { }
