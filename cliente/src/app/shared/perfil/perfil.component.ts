import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {environment} from '../../../environments/environment.prod';

@Component({
  selector: 'ngx-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.scss'],
})
export class PerfilComponent implements OnInit {

  logo = environment.base + environment.empresa_logo;
  usuarioLogo = environment.base + environment.usuario_logo;
  participantes: any = null;
  usuario = JSON.parse(atob(localStorage.getItem('rueda-usuario')));
  constructor(public router: Router) {
    if (this.usuario.tipo_usuario === 'empresa') {
      this.participantes = this.usuario.empresa.participantes;
    }
  }

  ngOnInit() {
  }

}
