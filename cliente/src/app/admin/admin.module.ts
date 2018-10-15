import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { RubroComponent } from './rubro/rubro.component';
import { AdminComponent } from './admin.component';
import { RubroIndexComponent } from './rubro/rubro-index/rubro-index.component';
import {ThemeModule} from '../@theme/theme.module';
import {Ng2SmartTableModule} from 'ng2-smart-table';
import {RubroService} from './rubro/rubro.service';
import { TipoUsuarioComponent } from './tipo-usuario/tipo-usuario.component';
import { EmpresaComponent } from './empresa/empresa.component';
import { EmpresaIndexComponent } from './empresa/empresa-index/empresa-index.component';
import { EmpresaCreateComponent } from './empresa/empresa-create/empresa-create.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {NgAutoCompleteModule} from 'ng-auto-complete';
import {SharedModule} from '../shared/shared.module';
import { HorarioComponent } from './horario/horario.component';
import { HorarioCreateComponent } from './horario/horario-create/horario-create.component';

import { AngularDateTimePickerModule } from 'angular2-datetimepicker';
import {DatePipe} from '@angular/common';
import { HorarioIndexComponent } from './horario/horario-index/horario-index.component';
import { MesaComponent } from './mesa/mesa.component';
import { ReunionComponent } from './reunion/reunion.component';
import { ReunionCreateComponent } from './reunion/reunion-create/reunion-create.component';
import { ReunionIndexComponent } from './reunion/reunion-index/reunion-index.component';
import { EmpresaParticipanteComponent } from './empresa/empresa-participante/empresa-participante.component';


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
                 EmpresaCreateComponent,
                 HorarioComponent,
                 HorarioCreateComponent,
                 HorarioIndexComponent,
                 MesaComponent,
                 ReunionComponent,
                 ReunionCreateComponent,
                 ReunionIndexComponent,
                 EmpresaParticipanteComponent,
  ],
  providers: [ RubroService, DatePipe],
})
export class AdminModule { }
