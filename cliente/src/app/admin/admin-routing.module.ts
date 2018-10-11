import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RubroComponent } from './rubro/rubro.component';
import { AdminComponent } from './admin.component';
import {RubroIndexComponent} from './rubro/rubro-index/rubro-index.component';
import {EmpresaComponent} from './empresa/empresa.component';

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
