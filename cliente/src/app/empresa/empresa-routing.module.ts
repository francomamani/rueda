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
import {SolicitudEntranteComponent} from '../shared/solicitud-entrante/solicitud-entrante.component';
import {ReunionesAgendadasComponent} from './agenda/reuniones-agendadas/reuniones-agendadas.component';
import {EvaluacionGeneralComponent} from './evaluacion-general/evaluacion-general.component';
import {EmpresasRegistradasComponent} from './agenda/empresas-registradas/empresas-registradas.component';
import {SolicitudSalienteComponent} from '../shared/solicitud-saliente/solicitud-saliente.component';
import {AgendaCreateComponent} from './agenda/agenda-create/agenda-create.component';
import {UsuarioEditComponent} from '../shared/usuario-edit/usuario-edit.component';

const routes: Routes = [
  {
    path: '',
    component: EmpresaComponent,
    children : [
      {
        path: 'home',
        component: HomeComponent,
      },
      {
        path: 'actualizar-usuario/:usuario_id',
        component: UsuarioEditComponent,
      },
      {
        path: 'mi-agenda',
        component: AgendaComponent,
        children: [
          {
            path: 'empresas-registradas',
            component: EmpresasRegistradasComponent,
          },
          {
            path: 'solicitudes-salientes',
            component: SolicitudSalienteComponent,
          },
          {
            path: 'solicitudes-entrantes',
            component: SolicitudEntranteComponent,
          },
          {
            path: 'reuniones-agendadas',
            component: ReunionesAgendadasComponent,
          },
          {
              path: 'crear',
              component: AgendaCreateComponent,
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
            path: 'listar/:tipo_ruta/:id_empresa',
            component: HorariosOcupadosIndexComponent,
          }, {
            path: 'crear/:tipo_ruta/:id_empresa',
            component: HorariosOcupadosCreateComponent,
          }, {
            path: '',
            redirectTo: 'listar',
            pathMatch: 'full',
          },
        ],
      }, {
          path: 'evaluacion-general',
          component: EvaluacionGeneralComponent
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
