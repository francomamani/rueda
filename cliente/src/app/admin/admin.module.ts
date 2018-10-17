import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { RubroComponent } from './rubro/rubro.component';
import { AdminComponent } from './admin.component';
import { RubroIndexComponent } from './rubro/rubro-index/rubro-index.component';
import {ThemeModule} from '../@theme/theme.module';
import {Ng2SmartTableModule} from 'ng2-smart-table';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {NgAutoCompleteModule} from 'ng-auto-complete';
import {SharedModule} from '../shared/shared.module';
import { AngularDateTimePickerModule } from 'angular2-datetimepicker';
import {DatePipe} from '@angular/common';

import {RubroService} from './rubro/rubro.service';

import { TipoUsuarioComponent } from './tipo-usuario/tipo-usuario.component';
import { EmpresaIndexComponent } from './empresa/empresa-index/empresa-index.component';
import { HorarioComponent } from './horario/horario.component';
import { HorarioCreateComponent } from './horario/horario-create/horario-create.component';
import { HorarioIndexComponent } from './horario/horario-index/horario-index.component';
import { MesaComponent } from './mesa/mesa.component';
import { ReunionComponent } from './reunion/reunion.component';
import { ReunionCreateComponent } from './reunion/reunion-create/reunion-create.component';
import { ReunionIndexComponent } from './reunion/reunion-index/reunion-index.component';
import {EmpresaComponent} from './empresa/empresa.component';
import { AgendaComponent } from './agenda/agenda.component';
import { AgendaIndexComponent } from './agenda/agenda-index/agenda-index.component';
import { AgendaCreateComponent } from './agenda/agenda-create-admin/agenda-create.component';
import { AgendaCreateContingenciaComponent } from './agenda/agenda-create-contingencia/agenda-create-contingencia.component';

@NgModule({
  imports: [
    CommonModule,
    NgAutoCompleteModule,
    ThemeModule,
    AdminRoutingModule,
    Ng2SmartTableModule,
    FormsModule,
    ReactiveFormsModule,
    SharedModule,
    AngularDateTimePickerModule,
  ],
  declarations: [RubroComponent,
                 AdminComponent,
                 RubroIndexComponent,
                 TipoUsuarioComponent,
                 EmpresaComponent,
                 EmpresaIndexComponent,
                 HorarioComponent,
                 HorarioCreateComponent,
                 HorarioIndexComponent,
                 MesaComponent,
                 ReunionComponent,
                 ReunionCreateComponent,
                 ReunionIndexComponent,
                 AgendaComponent,
                 AgendaIndexComponent,
                 AgendaCreateComponent,
                 AgendaCreateContingenciaComponent,
  ],
  providers: [ RubroService, DatePipe],
})
export class AdminModule { }
