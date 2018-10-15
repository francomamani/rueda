import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {HomeComponent} from './home/home.component';
import {EmpresaComponent} from './empresa.component';
import {PerfilComponent} from '../shared/perfil/perfil.component';
import {HorariosOcupadosComponent} from '../shared/horarios-ocupados/horarios-ocupados.component';
import {HorariosOcupadosIndexComponent} from '../shared/horarios-ocupados/horarios-ocupados-index/horarios-ocupados-index.component';
import {HorariosOcupadosCreateComponent} from '../shared/horarios-ocupados/horarios-ocupados-create/horarios-ocupados-create.component';
import {ParticipanteComponent} from '../shared/participante/participante.component';
import {AgendaComponent} from './agenda/agenda.component';
import {SolicitudEntranteComponent} from './agenda/solicitud-entrante/solicitud-entrante.component';
import {SolicitudSalienteComponent} from './agenda/solicitud-saliente/solicitud-saliente.component';
import {ReunionesAgendadasComponent} from './agenda/reuniones-agendadas/reuniones-agendadas.component';

const routes: Routes = [
  {
    path: '',
    component: EmpresaComponent,
    children : [
      {
        path: 'home',
        component: HomeComponent,
      }, {
        path: 'mi-agenda',
        component: AgendaComponent,
        children: [
          {
            path: 'solicitudes-salientes',
            component: SolicitudSalienteComponent,
          }, {
            path: 'solicitudes-entrantes',
            component: SolicitudEntranteComponent,
          }, {
            path: 'reuniones-agendadas',
            component: ReunionesAgendadasComponent,
          }, {
            path: '',
            redirectTo: 'reuniones-agendadas',
            pathMatch: 'full',
          },
        ],
      },
      {
        path: 'mis-participantes/:empresa_id',
        component: ParticipanteComponent,
      },
      {
        path: 'perfil',
        component: PerfilComponent,
      }, {
        path: 'horarios-ocupados',
        component: HorariosOcupadosComponent,
        children: [
          {
            path: 'listar',
            component: HorariosOcupadosIndexComponent,
          }, {
            path: 'crear',
            component: HorariosOcupadosCreateComponent,
          }, {
            path: '',
            redirectTo: 'listar',
            pathMatch: 'full',
          },
        ],
      }, {
        path: '',
        redirectTo: 'home',
        pathMatch: 'full',
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class EmpresaRoutingModule { }
