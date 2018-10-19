import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {AuthService} from '../../auth.service';
import {NbToastrService} from '@nebular/theme';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {ActivatedRoute, Router} from '@angular/router';
import {EvaluacionReunionesService} from './evaluacion-reuniones.service';

@Component({
  selector: 'ngx-evaluacion-reuniones',
  templateUrl: './evaluacion-reuniones.component.html',
  styleUrls: ['./evaluacion-reuniones.component.scss'],
})
export class EvaluacionReunionesComponent implements OnInit {

    empresas: any = null;
    medio_comunicacion: any = null;
    evaluacionGroup: FormGroup;

    empresa_id = 0;
    reunion_id = 0;
    registrado = false;
    constructor(private fb: FormBuilder,
                private toastr: NbToastrService,
                private authService: AuthService,
                private route: ActivatedRoute,
                private router: Router,
                private evaluacionReunionesService: EvaluacionReunionesService,
                private empresaService: EmpresaService) {
        this.route.params.subscribe((params: any) => {
          this.reunion_id = params.reunion_id;
          this.empresa_id = params.empresa_id;
          this.evaluacionReunionesService
              .registrado(params.reunion_id, params.empresa_id)
              .subscribe((res: any) => {
                this.registrado = res.registrado;
                setTimeout(() => {
                  this.router.navigate(['/empresa/mi-agenda/reuniones-agendadas']);
                }, 3500);
              });
        });
        this.empresaService.empresasListar()
            .subscribe((res: any[]) => {
                this.empresas = res;
            });
        this.createForm();
    }

    createForm() {
        this.evaluacionGroup = this.fb.group({
            'empresa_id': this.empresa_id,
            'reunion_id': this.reunion_id,
            'uno': new FormControl('', Validators.required),
            'dos': new FormControl('', Validators.required),
            'tres': new FormControl('', Validators.required),
            'cuatro': new FormControl('', Validators.required),
            'cinco': new FormControl('', Validators.required),
            'seis': new FormControl('', Validators.required),
            'siete': new FormControl('', Validators.required),
        });
    }

    ngOnInit() {
    }

    store() {
      this.evaluacionReunionesService.store(this.evaluacionGroup.value)
        .subscribe((res: any) => {
          this.toastr.success('Se registro exitosamente su evaluacion', '¡Gracias!');
          if (this.router.url === '/empresa/evaluacion-reunion/' + this.reunion_id + '/' + this.empresa_id) {
            this.router.navigate(['/empresa']);
          }
        });
      }
}
