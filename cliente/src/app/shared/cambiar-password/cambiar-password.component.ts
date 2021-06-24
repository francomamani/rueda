import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {AuthService} from '../../auth.service';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-cambiar-password',
  templateUrl: './cambiar-password.component.html',
  styleUrls: ['./cambiar-password.component.scss'],
})
export class CambiarPasswordComponent implements OnInit {

  mensaje = '';
  usuarioGroup: FormGroup;
  constructor(private fb: FormBuilder,
              private toastr: NbToastrService,
              private authService: AuthService) {
    this.createForm();
  }

  ngOnInit() {
  }

  createForm() {
    this.usuarioGroup = this.fb.group({
      'current_password' : ['', Validators.required],
      'new_password' : ['', Validators.required],
      'repeat_new_password' : ['', Validators.required],
    });
  }
  update() {
    const usuario_id = this.authService.getUsuario().usuario_id;
    this.authService.cambiarPassword(usuario_id, this.usuarioGroup.value)
      .subscribe((res: any) => {
        this.mensaje = res.mensaje;
        if (res.mensaje === 'Contraseña actualizada exitosamente') {
          this.usuarioGroup.reset();
          this.toastr.success(res.mensaje, '¡Exito!');
        } else {
          this.toastr.danger(res.mensaje, 'Error');
        }
      });
  }
}
