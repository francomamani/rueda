import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {HomeComponent} from './home/home.component';
import {EmpresaComponent} from './empresa.component';
import {PerfilComponent} from '../shared/perfil/perfil.component';
import {HorariosOcupadosComponent} from '../shared/horarios-ocupados/horarios-ocupados.component';
import {HorariosOcupadosIndexComponent} from '../shared/horarios-ocupados/horarios-ocupados-index/horarios-ocupados-index.component';
import {HorariosOcupadosCreateComponent} from '../shared/horarios-ocupados/horarios-ocupados-create/horarios-ocupados-create.component';

const routes: Routes = [
  {
    path: '',
    component: EmpresaComponent,
    children : [
      {
        path: 'home',
        component: HomeComponent,
      }, {
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
