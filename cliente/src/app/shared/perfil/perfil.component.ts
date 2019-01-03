import {Component, OnInit, ViewChild} from '@angular/core';
import {Router} from '@angular/router';
import {environment} from '../../../environments/environment.prod';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {AuthService} from '../../auth.service';

@Component({
  selector: 'ngx-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.scss'],
})
export class PerfilComponent implements OnInit {
  @ViewChild('logoFile') logoFile;
  logo = null;
  usuarioLogo = environment.base + environment.usuario_logo;
  participantes: any = null;
  usuario = JSON.parse(atob(localStorage.getItem('rueda-usuario')));
  constructor(public router: Router,
              private authService: AuthService,
              private empresaService: EmpresaService) {
    if (this.usuario.tipo_usuario === 'empresa') {
      if (this.usuario.logo !== null) {
        const logo_path = environment.base  + 'mostrar-logo/' + this.usuario.logo.split('/')[1];
        this.logo = logo_path;
      } else {
        const logo_path = environment.base  + 'mostrar-logo/empresa.png';
        this.logo = logo_path;
      }
      this.empresaService.indexParticipantes(this.usuario.empresa.empresa_id)
        .subscribe(res => {
          this.participantes = res;
        });
    }
  }

  ngOnInit() {
  }

  cambiarLogo() {
    if (this.logoFile.nativeElement.files[0]) {
      const formData = new FormData();
      formData.append('logo', this.logoFile.nativeElement.files[0]);
      this.empresaService.cambiarLogo(this.usuario.empresa_id, formData)
        .subscribe((res: any) => {
          this.authService.setUsuario(res);
          this.logo = environment.base  + 'mostrar-logo/' + res.logo.split('/')[1];
        });
    }
  }

}
