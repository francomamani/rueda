import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmpresaRoutingModule } from './empresa-routing.module';
import { HomeComponent } from './home/home.component';
import { EmpresaComponent } from './empresa.component';
import {ThemeModule} from '../@theme/theme.module';
import {SharedModule} from '../shared/shared.module';
import { AgendaComponent } from './agenda/agenda.component';
import { SolicitudSalienteComponent } from './agenda/solicitud-saliente/solicitud-saliente.component';
import { SolicitudEntranteComponent } from './agenda/solicitud-entrante/solicitud-entrante.component';
import { ReunionesAgendadasComponent } from './agenda/reuniones-agendadas/reuniones-agendadas.component';
import {EmpresaModalComponent} from '../shared/empresa-modal/empresa-modal.component';

@NgModule({
  imports: [
    CommonModule,
    EmpresaRoutingModule,
    ThemeModule,
    SharedModule,
  ],
  declarations: [HomeComponent,
                EmpresaComponent,
                AgendaComponent,
                SolicitudSalienteComponent,
                SolicitudEntranteComponent,
                ReunionesAgendadasComponent],
  entryComponents: [EmpresaModalComponent],
})
export class EmpresaModule { }
