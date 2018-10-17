import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmpresaRoutingModule } from './empresa-routing.module';
import { HomeComponent } from './home/home.component';
import { EmpresaComponent } from './empresa.component';
import {ThemeModule} from '../@theme/theme.module';
import {SharedModule} from '../shared/shared.module';
import { AgendaComponent } from './agenda/agenda.component';
import { ReunionesAgendadasComponent } from './agenda/reuniones-agendadas/reuniones-agendadas.component';
import {EmpresaModalComponent} from '../shared/empresa-modal/empresa-modal.component';
import { EvaluacionGeneralComponent } from './evaluacion-general/evaluacion-general.component';
import {FormsModule} from '@angular/forms';
import { EmpresasRegistradasComponent } from './agenda/empresas-registradas/empresas-registradas.component';
import {AgendaService} from './agenda/agenda.service';

@NgModule({
  imports: [
    CommonModule,
    EmpresaRoutingModule,
    ThemeModule,
    SharedModule,
      FormsModule,
  ],
  declarations: [HomeComponent,
                EmpresaComponent,
                AgendaComponent,
                ReunionesAgendadasComponent,
                EvaluacionGeneralComponent,
                EmpresasRegistradasComponent],
  entryComponents: [EmpresaModalComponent],
  providers: [AgendaService],
})
export class EmpresaModule { }
