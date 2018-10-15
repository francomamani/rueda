import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RubroComponent } from './rubro/rubro.component';
import { AdminComponent } from './admin.component';
import {RubroIndexComponent} from './rubro/rubro-index/rubro-index.component';
import {EmpresaComponent} from './empresa/empresa.component';
import {EmpresaIndexComponent} from './empresa/empresa-index/empresa-index.component';
import {EmpresaCreateComponent} from './empresa/empresa-create/empresa-create.component';
import {PerfilComponent} from '../shared/perfil/perfil.component';
import {HorarioComponent} from './horario/horario.component';
import {HorarioCreateComponent} from './horario/horario-create/horario-create.component';
import {HorarioIndexComponent} from './horario/horario-index/horario-index.component';
import {MesaComponent} from './mesa/mesa.component';
import {ReunionComponent} from './reunion/reunion.component';
import {ReunionIndexComponent} from './reunion/reunion-index/reunion-index.component';
import {ReunionCreateComponent} from './reunion/reunion-create/reunion-create.component';
import {EmpresaParticipanteComponent} from './empresa/empresa-participante/empresa-participante.component';

const routes: Routes = [
  {
    path: '',
    component: AdminComponent,
    children: [
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
            path: 'perfil',
            component: PerfilComponent,
        }, {
            path: 'participantes/:empresa_id',
            component: EmpresaParticipanteComponent,
        }, {
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
