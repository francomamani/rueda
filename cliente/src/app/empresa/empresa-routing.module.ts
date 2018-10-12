import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {HomeComponent} from './home/home.component';
import {EmpresaComponent} from './empresa.component';
import {PerfilComponent} from '../shared/perfil/perfil.component';

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
