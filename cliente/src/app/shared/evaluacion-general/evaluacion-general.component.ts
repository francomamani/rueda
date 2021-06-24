import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {NbToastrService} from '@nebular/theme';
import {ActivatedRoute, Router} from '@angular/router';
import {EvaluacionGeneralService} from './evaluacion-general.service';
import {AuthService} from '../../auth.service';

@Component({
  selector: 'ngx-evaluacion-general',
  templateUrl: './evaluacion-general.component.html',
  styleUrls: ['./evaluacion-general.component.scss'],
})
export class EvaluacionGeneralEmpresaComponent implements OnInit {

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
  admin: boolean = null;
  constructor(private fb: FormBuilder,
              private toastr: NbToastrService,
              private authService: AuthService,
              private router: Router,
              private route: ActivatedRoute,
              private evaluacionGeneralService: EvaluacionGeneralService) {
    this.route.params.subscribe( (param: any) => {
      if (param.empresa_id) {
        this.empresa_id = param.empresa_id;
        this.admin = true;
      } else {
        this.empresa_id = this.authService.getUsuario().empresa_id;
        this.admin = false;
      }
      this.createForm();
    });
    this.evaluacionGeneralService.evaluacionRegistrada(this.empresa_id)
      .subscribe((res: any) => {
        this.registrado = res.registrado;
        if (this.registrado) {
          setTimeout(() => {
            if (this.admin) {
              this.router.navigate(['/admin/empresa/listar']);
            } else {
              this.router.navigate(['/empresa']);
            }
          }, 3500);
        }
      });
  }

    createForm() {
        this.evaluacionGroup = this.fb.group({
            'empresa_id': this.empresa_id,
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
        if (res.mensaje === 'La empresa ya lleno la evaluacion general') {
          this.toastr.danger(res.mensaje, 'Error');
        } else {
          this.toastr.success(res.mensaje, 'Registro exitoso');
        }
        if (this.admin) {
          this.router.navigate(['/admin/empresa/listar']);
        } else {
          this.router.navigate(['/empresa']);
        }
      });
  }
}
