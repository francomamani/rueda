import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { RubroComponent } from './rubro/rubro.component';
import { AdminComponent } from './admin.component';
import { RubroIndexComponent } from './rubro/rubro-index/rubro-index.component';
import {ThemeModule} from '../@theme/theme.module';
import {Ng2SmartTableModule} from 'ng2-smart-table';
import {RubroService} from './rubro/rubro.service';

@NgModule({
  imports: [
    CommonModule,
    ThemeModule,
    AdminRoutingModule,
    Ng2SmartTableModule,
  ],
  declarations: [RubroComponent, AdminComponent, RubroIndexComponent],
  providers: [ RubroService ],
})
export class AdminModule { }