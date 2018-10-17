import { Component, OnInit } from '@angular/core';
import {AuthService} from '../../auth.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-usuario-edit',
  templateUrl: './usuario-edit.component.html',
  styleUrls: ['./usuario-edit.component.scss'],
})
export class UsuarioEditComponent implements OnInit {

  usuario_id = null;
  usuarioGroup: FormGroup;
  usuario = null;

  constructor(private authService: AuthService,
              public fb: FormBuilder,
              private toastr: NbToastrService,
              private router: Router,
              private route: ActivatedRoute) {
    this.route.params.subscribe((param: any) => {
      this.usuario_id = param.usuario_id;
      this.authService.showUsuario(param.usuario_id)
        .subscribe((usuario: any) => {
          this.usuario = usuario;
          this.createForm(usuario);
        });
    });
  }

  ngOnInit() {
  }

  createForm(usuario) {
    this.usuarioGroup = this.fb.group({
      'nombres' : new FormControl(usuario.nombres, Validators.required),
      'apellidos' : new FormControl(usuario.apellidos, Validators.required),
      'email' : new FormControl(usuario.email, Validators.required),
    });
  }

  update() {
    this.authService.updateUsuario(this.usuario_id, this.usuarioGroup.value)
      .subscribe((res: any) => {
        this.authService.setUsuario(res);
        if ( this.router.url === '/admin/actualizar-usuario/' + this.usuario_id ) {
          this.router.navigate(['/admin/perfil']);
        } else {
          this.router.navigate(['/empresa/perfil']);
        }
        this.toastr.success(res.nombres  + ' ' + res.apellidos +
                      ' fue actualizado exitosamente', 'Usuario actualizado');
      });
  }

}
