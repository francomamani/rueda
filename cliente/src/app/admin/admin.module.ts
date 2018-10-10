import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { RubroComponent } from './rubro/rubro.component';
import { AdminComponent } from './admin.component';
import { RubroIndexComponent } from './rubro/rubro-index/rubro-index.component';
import {ThemeModule} from '../@theme/theme.module';

@NgModule({
  imports: [
    CommonModule,
    ThemeModule,
    AdminRoutingModule,
  ],
  declarations: [RubroComponent, AdminComponent, RubroIndexComponent]
})
export class AdminModule { }
