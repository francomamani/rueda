import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'ngx-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.scss'],
})
export class PerfilComponent implements OnInit {

  usuario = JSON.parse(atob(localStorage.getItem('rueda-usuario')));
  constructor() { }

  ngOnInit() {
  }

}