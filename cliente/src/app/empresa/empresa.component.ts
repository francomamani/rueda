import { Component, OnInit } from '@angular/core';
import {EMPRESA_ITEMS} from './empresa-menu';

@Component({
  selector: 'ngx-empresa',
  templateUrl: './empresa.component.html',
  styleUrls: ['./empresa.component.scss']
})
export class EmpresaComponent implements OnInit {

  menu = EMPRESA_ITEMS;
  constructor() { }

  ngOnInit() {
  }

}
