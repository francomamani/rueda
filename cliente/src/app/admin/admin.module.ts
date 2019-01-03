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
import { ReportesComponent } from './reportes/reportes.component';
import {ChartModule} from 'angular2-chartjs';
import {NgxEchartsModule} from 'ngx-echarts';
import {NgxChartsModule} from '@swimlane/ngx-charts';
import {LeafletModule} from '@asymmetrik/ngx-leaflet';
import { EvaluacionGeneralComponent } from './reportes/evaluacion-general/evaluacion-general.component';
import { ReunionesComponent } from './reportes/reuniones/reuniones.component';
import {GoogleChartsModule} from 'angular-google-charts';
import { EvaluacionReunionComponent } from './reportes/evaluacion-reunion/evaluacion-reunion.component';
import { UsuarioComponent } from './usuario/usuario.component';
import { UsuarioIndexComponent } from './usuario/usuario-index/usuario-index.component';
import { UsuarioCreateComponent } from './usuario/usuario-create/usuario-create.component';
import { OpinionGeneralComponent } from './reportes/opinion-general/opinion-general.component';
import { OpinionReunionComponent } from './reportes/opinion-reunion/opinion-reunion.component';
import { VoucherModalComponent } from './voucher-modal/voucher-modal.component';
import {EmpresaModalComponent} from '../shared/empresa-modal/empresa-modal.component';
import {LoadModalComponent} from '../shared/load-modal/load-modal.component';
import {AyudaModalComponent} from '../shared/ayuda-modal/ayuda-modal.component';

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
      ChartModule,
      NgxEchartsModule,
      NgxChartsModule,
      LeafletModule,
      GoogleChartsModule,
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
                 ReportesComponent,
                 EvaluacionGeneralComponent,
                 ReunionesComponent,
                 EvaluacionReunionComponent,
                 UsuarioComponent,
                 UsuarioIndexComponent,
                 UsuarioCreateComponent,
                 OpinionGeneralComponent,
                 OpinionReunionComponent,
                 VoucherModalComponent,
  ],
  providers: [ RubroService, DatePipe],
    entryComponents: [EmpresaModalComponent, LoadModalComponent,AyudaModalComponent,VoucherModalComponent],
})
export class AdminModule { }
