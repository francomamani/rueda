import { Component, OnInit } from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {EmpresaService} from '../../empresa/empresa.service';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-reunion-index',
  templateUrl: './reunion-index.component.html',
  styleUrls: ['./reunion-index.component.scss'],
})
export class ReunionIndexComponent implements OnInit {
    ngOnInit(): void {
    }
    constructor() {}
}
