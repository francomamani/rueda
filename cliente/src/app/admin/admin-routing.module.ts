import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RubroComponent } from './rubro/rubro.component';
import { AdminComponent } from './admin.component';
import {RubroIndexComponent} from './rubro/rubro-index/rubro-index.component';
import {EmpresaComponent} from './empresa/empresa.component';
import {EmpresaIndexComponent} from './empresa/empresa-index/empresa-index.component';
import {EmpresaCreateComponent} from '../shared/empresa-create/empresa-create.component';
import {PerfilComponent} from '../shared/perfil/perfil.component';
import {HorarioComponent} from './horario/horario.component';
import {HorarioCreateComponent} from './horario/horario-create/horario-create.component';
import {HorarioIndexComponent} from './horario/horario-index/horario-index.component';
import {MesaComponent} from './mesa/mesa.component';
import {ReunionComponent} from './reunion/reunion.component';
import {ReunionIndexComponent} from './reunion/reunion-index/reunion-index.component';
import {ReunionCreateComponent} from './reunion/reunion-create/reunion-create.component';
import {HorariosOcupadosComponent} from '../shared/horarios-ocupados/horarios-ocupados.component';
import {HorariosOcupadosCreateComponent} from '../shared/horarios-ocupados/horarios-ocupados-create/horarios-ocupados-create.component';
import {HorariosOcupadosIndexComponent} from '../shared/horarios-ocupados/horarios-ocupados-index/horarios-ocupados-index.component';
import {ParticipanteComponent} from '../shared/participante/participante.component';
import {SolicitudSalienteComponent} from '../shared/solicitud-saliente/solicitud-saliente.component';
import {SolicitudEntranteComponent} from '../shared/solicitud-entrante/solicitud-entrante.component';
import {AgendaComponent} from './agenda/agenda.component';
import {AgendaCreateComponent} from './agenda/agenda-create-admin/agenda-create.component';
import {AgendaIndexComponent} from './agenda/agenda-index/agenda-index.component';
import {AgendaCreateContingenciaComponent} from './agenda/agenda-create-contingencia/agenda-create-contingencia.component';
import {ReportesComponent} from './reportes/reportes.component';
import {UsuarioEditComponent} from '../shared/usuario-edit/usuario-edit.component';
import {ReunionesComponent} from './reportes/reuniones/reuniones.component';
import {EvaluacionGeneralComponent} from './reportes/evaluacion-general/evaluacion-general.component';
import {EvaluacionReunionComponent} from './reportes/evaluacion-reunion/evaluacion-reunion.component';

const routes: Routes = [
  {
    path: '',
    component: AdminComponent,
    children: [
      {
        path: 'perfil',
        component: PerfilComponent,
      },
      {
        path: 'actualizar-usuario/:usuario_id',
        component: UsuarioEditComponent,
      },
      {
        path: 'rubro',
        component: RubroComponent,
        children: [{
            path: '',
            component: RubroIndexComponent,
          },
        ],
      },
      {
        path: 'empresa',
        component: EmpresaComponent,
        children: [{
          path: 'listar',
          component: EmpresaIndexComponent,
        }, {
          path: 'crear',
          component: EmpresaCreateComponent,
        }, {
            path: 'participantes/:empresa_id',
            component: ParticipanteComponent,
        },
        {
          path: 'solicitudes-salientes/:empresa_id',
          component: SolicitudSalienteComponent,
        },
        {
          path: 'solicitudes-entrantes/:empresa_id',
          component: SolicitudEntranteComponent,
        },
        {
          path: '',
          redirectTo: 'listar',
          pathMatch: 'full',
        }],
      },
      {
        path: 'horario',
        component: HorarioComponent,
        children: [
            {
              path: 'listar',
              component: HorarioIndexComponent,
            },
            {
              path: 'crear',
              component: HorarioCreateComponent,
            },
        ],
      },
      {
        path: 'horarios-ocupados',
        component: HorariosOcupadosComponent,
        children: [
          {
            path: 'listar/:tipo_ruta/:id_empresa',
            component: HorariosOcupadosIndexComponent,
          },
          {
            path: 'crear/:tipo_ruta/:id_empresa',
            component: HorariosOcupadosCreateComponent,
          },
          {
            path: '',
            redirectTo: 'listar',
          },
        ],
      },
      {
          path: 'mesa',
          component: MesaComponent,
      },
      {
          path: 'reuniones',
          component: ReunionComponent,
          children: [
              {
                  path: 'listar',
                  component: ReunionIndexComponent,
              },
              {
                  path: 'crear',
                  component: ReunionCreateComponent,
              },
          ],
      },

    {
        path: 'agenda',
        component: AgendaComponent,
        children: [
            {
                path: 'listar',
                component: AgendaIndexComponent,
            },
            {
                path: 'crear-admin',
                component: AgendaCreateComponent,
            },
            {
                path: 'crear-contingencia',
                component: AgendaCreateContingenciaComponent,
            },
        ],
    },
    {
        path: 'reportes',
        component: ReportesComponent,
        children: [{
          path: 'reuniones',
          component: ReunionesComponent,
        }, {
          path: 'evaluaciones-generales',
          component: EvaluacionGeneralComponent,
        }, {
          path: 'evaluaciones-reuniones',
          component: EvaluacionReunionComponent,
        }],
    },
      {
        path: '',
        redirectTo: 'rubro',
        pathMatch: 'full',
      },
    ],
  }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AdminRoutingModule { }
