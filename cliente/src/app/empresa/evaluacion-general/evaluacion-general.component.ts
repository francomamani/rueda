import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {EvaluacionGeneralService} from './evaluacion-general.service';
import {NbToastrService} from '@nebular/theme';
import {AuthService} from '../../auth.service';

@Component({
  selector: 'ngx-evaluacion-general',
  templateUrl: './evaluacion-general.component.html',
  styleUrls: ['./evaluacion-general.component.scss'],
})
export class EvaluacionGeneralComponent implements OnInit {

  evaluacionOrg= [
      {value: 'Muy malo'},
      {value: 'Malo'},
      {value: 'Regular'},
      {value: 'Bueno'},
      {value: 'Muy bueno'},
  ];

  medios = [
    {value: 'Periodicos'},
    {value: 'Revistas'},
    {value: 'Invitacion directa'},
    {value: 'Correo Electronico'},
    {value: 'Web'},
    {value: 'TV'},
    {value: 'Radio'},
    {value: 'Whatsapp'},
    {value: 'Facebook'},
    {value: 'Otro'},
  ];

  tipo_empresa: any = null;
  medio_comunicacion: any = null;
  evaluacionGroup: FormGroup;

  empresa_id = 0;
  registrado = false;
  constructor(private fb: FormBuilder,
              private toastr: NbToastrService,
              private authService: AuthService,
              private evaluacionGeneralService: EvaluacionGeneralService) {
    this.empresa_id = this.authService.getUsuario().empresa_id;
    this.evaluacionGeneralService.evaluacionRegistrada(this.empresa_id)
      .subscribe((res: any) => {
        this.registrado = res.registrado;
      });
    this.createForm();
  }

    createForm() {
        this.evaluacionGroup = this.fb.group({
            'empresa_id': this.authService.getUsuario().empresa_id,
            'uno': new FormControl('', Validators.required),
            'dos': new FormControl('', Validators.required),
            'tres': new FormControl('', Validators.required),
            'cuatro': new FormControl('', Validators.required),
            'cinco': new FormControl('', Validators.required),
            'seis': new FormControl('', Validators.required),
            'siete': new FormControl('', Validators.required),
            'ocho': new FormControl('', Validators.required),
            'nueve': new FormControl('', Validators.required),
        });
    }

  ngOnInit() {
  }

  store() {
    this.evaluacionGeneralService.store(this.evaluacionGroup.value)
      .subscribe((res: any) => {
        if (res.data === null) {
          this.toastr.danger(res.mensaje, 'Error');
        } else {
          this.toastr.success(res.mensaje, 'Registro exitoso');
        }
      });
  }
}
