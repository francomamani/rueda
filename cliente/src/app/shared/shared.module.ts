import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {PerfilComponent} from './perfil/perfil.component';
import {ThemeModule} from '../@theme/theme.module';
import { HorariosOcupadosComponent } from './horarios-ocupados/horarios-ocupados.component';
import { HorariosOcupadosIndexComponent } from './horarios-ocupados/horarios-ocupados-index/horarios-ocupados-index.component';
import { HorariosOcupadosCreateComponent } from './horarios-ocupados/horarios-ocupados-create/horarios-ocupados-create.component';
import {RouterModule} from '@angular/router';
import { ParticipanteComponent } from './participante/participante.component';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AngularDateTimePickerModule } from 'angular2-datetimepicker';
import { EmpresaModalComponent } from './empresa-modal/empresa-modal.component';
import { SolicitudSalienteComponent } from './solicitud-saliente/solicitud-saliente.component';
import { SolicitudEntranteComponent } from './solicitud-entrante/solicitud-entrante.component';
import { EmpresaCreateComponent } from './empresa-create/empresa-create.component';
import { UsuarioEditComponent } from './usuario-edit/usuario-edit.component';
import { EmpresaEditComponent } from './empresa-edit/empresa-edit.component';
import { CambiarPasswordComponent } from './cambiar-password/cambiar-password.component';
import { RegistroExitosoComponent } from './registro-exitoso/registro-exitoso.component';
import {ReunionesAgendadasComponent} from './reuniones-agendadas/reuniones-agendadas.component';
import {EvaluacionReunionesComponent} from './evaluacion-reuniones/evaluacion-reuniones.component';
import {EvaluacionGeneralEmpresaComponent} from './evaluacion-general/evaluacion-general.component';
import { LoadModalComponent } from './load-modal/load-modal.component';
import { LottieAnimationViewModule } from 'ng-lottie';
import { AyudaModalComponent } from './ayuda-modal/ayuda-modal.component';
import { EmpresasRegistradasComponent } from './empresas-registradas/empresas-registradas.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule,
    ThemeModule,
    Ng2SmartTableModule,
    FormsModule,
    ReactiveFormsModule,
    AngularDateTimePickerModule,
    LottieAnimationViewModule.forRoot(),
  ],
  declarations: [ PerfilComponent,
                  HorariosOcupadosComponent,
                  HorariosOcupadosIndexComponent,
                  HorariosOcupadosCreateComponent,
                  ParticipanteComponent,
                  EmpresaModalComponent,
                  EmpresaCreateComponent,
                  SolicitudSalienteComponent,
                  SolicitudEntranteComponent,
                  EvaluacionReunionesComponent,
                  EvaluacionGeneralEmpresaComponent,
                  UsuarioEditComponent,
                  EmpresaEditComponent,
                  CambiarPasswordComponent,
                  ReunionesAgendadasComponent,
                  RegistroExitosoComponent,
                  LoadModalComponent,
                  AyudaModalComponent,
                  EmpresasRegistradasComponent],
  exports: [PerfilComponent,
            HorariosOcupadosComponent,
            HorariosOcupadosCreateComponent,
            HorariosOcupadosIndexComponent,
            ParticipanteComponent,
            EmpresaModalComponent,
            EmpresaCreateComponent,
            SolicitudSalienteComponent,
            SolicitudEntranteComponent,
            EvaluacionReunionesComponent,
            EvaluacionGeneralEmpresaComponent,
            UsuarioEditComponent,
            EmpresaEditComponent,
            ReunionesAgendadasComponent,
            CambiarPasswordComponent,
            EmpresasRegistradasComponent],
  entryComponents: [EmpresaModalComponent, AyudaModalComponent],
})
export class SharedModule { }
