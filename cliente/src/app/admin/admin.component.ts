import { Component, OnInit } from '@angular/core';
import {ADMIN_ITEMS} from './admin-menu';

@Component({
  selector: 'ngx-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss'],
})
export class AdminComponent implements OnInit {

  menu = ADMIN_ITEMS;
  constructor() { }

  ngOnInit() {
  }

}
