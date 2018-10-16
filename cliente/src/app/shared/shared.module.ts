import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {PerfilComponent} from './perfil/perfil.component';
import {ThemeModule} from '../@theme/theme.module';
import { HorariosOcupadosComponent } from './horarios-ocupados/horarios-ocupados.component';
import { HorariosOcupadosIndexComponent } from './horarios-ocupados/horarios-ocupados-index/horarios-ocupados-index.component';
import { HorariosOcupadosCreateComponent } from './horarios-ocupados/horarios-ocupados-create/horarios-ocupados-create.component';
import {RouterModule} from '@angular/router';
import { ParticipanteComponent } from './participante/participante.component';
import {Ng2SmartTableModule} from 'ng2-smart-table';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {AngularDateTimePickerModule} from 'angular2-datetimepicker';
import { EmpresaModalComponent } from './empresa-modal/empresa-modal.component';
import { EvaluacionReunionesComponent } from './evaluacion-reuniones/evaluacion-reuniones.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule,
    ThemeModule,
    Ng2SmartTableModule,
    FormsModule,
    ReactiveFormsModule,
    AngularDateTimePickerModule,
  ],
  declarations: [ PerfilComponent,
                  HorariosOcupadosComponent,
                  HorariosOcupadosIndexComponent,
                  HorariosOcupadosCreateComponent,
                  ParticipanteComponent,
                  EmpresaModalComponent,
                  EvaluacionReunionesComponent],
  exports: [PerfilComponent,
            HorariosOcupadosComponent,
            HorariosOcupadosCreateComponent,
            HorariosOcupadosIndexComponent,
            ParticipanteComponent,
            EmpresaModalComponent,
            EvaluacionReunionesComponent],
})
export class SharedModule { }
