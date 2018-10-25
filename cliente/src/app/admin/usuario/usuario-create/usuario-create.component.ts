import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {Router, ActivatedRoute} from '@angular/router';
import {NbToastrService} from '@nebular/theme';
import {UsuarioService} from '../usuario.service';

@Component({
  selector: 'ngx-usuario-create',
  templateUrl: './usuario-create.component.html',
  styleUrls: ['./usuario-create.component.scss'],
})
export class UsuarioCreateComponent implements OnInit {

    usuarioGroup: FormGroup;
    mensaje = '';
    error = '';
    usuario: any = null;
    constructor(public usuarioService: UsuarioService,
                public router: Router,
                private fb: FormBuilder,
                private toastr: NbToastrService) {
        this.createForm();

    }

    createForm() {
        this.usuarioGroup = this.fb.group({
            'nombres': new FormControl('', Validators.required),
            'apellidos': new FormControl('', Validators.required),
            'email': new FormControl('', Validators.required),
            'password': new FormControl('', Validators.required),
            'repeated_password': new FormControl('', Validators.required),
        });
    }
    ngOnInit() {
    }

    store() {
        if ( this.usuarioGroup.value.password === this.usuarioGroup.value.repeated_password) {
        this.usuarioService.store(this.usuarioGroup.value)
            .subscribe((res: any) => {

                    this.mensaje = 'El usuario ' + res.email + ' fue registrado';
                    this.error = '';
                    this.toastr.success('El usuario ' + res.email + ' fue registrado', 'Registro exitoso');
                    this.router.navigate(['/admin/usuario/listar']);

            });
        } else {
            this.mensaje = '';
            this.error = 'Las contraseñas no coinciden';
            this.toastr.danger('Las contraseñas no coinciden', 'Error de Registro');
        }

    }

}
