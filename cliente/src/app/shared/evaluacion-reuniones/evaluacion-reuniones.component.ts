import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {AuthService} from '../../auth.service';
import {NbToastrService} from '@nebular/theme';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'ngx-evaluacion-reuniones',
  templateUrl: './evaluacion-reuniones.component.html',
  styleUrls: ['./evaluacion-reuniones.component.scss']
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
                private empresaService: EmpresaService) {
        this.route.params.subscribe((params: any) => {
          this.empresa_id = params.empresa_id;
          this.reunion_id = params.reunion_id;
        });
        this.empresaService.empresasListar()
            .subscribe((res: any[]) => {
                this.empresas = res;
            });
        this.createForm();
    }

    createForm() {
        this.evaluacionGroup = this.fb.group({
            'empresa_id': this.authService.getUsuario().empresa_id,
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

    }
}
