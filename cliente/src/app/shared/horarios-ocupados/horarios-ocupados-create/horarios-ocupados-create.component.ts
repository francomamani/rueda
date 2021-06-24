import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {HorarioService} from '../../../admin/horario/horario.service';
import {NbToastrService} from '@nebular/theme';
import {HorariosOcupadosService} from '../horarios-ocupados.service';
import {ActivatedRoute, Router} from '@angular/router';

@Component({
  selector: 'ngx-horarios-ocupados-create',
  templateUrl: './horarios-ocupados-create.component.html',
  styleUrls: ['./horarios-ocupados-create.component.scss'],
})
export class HorariosOcupadosCreateComponent implements OnInit {

    horarios: any = null;
    horarioOcGroup: FormGroup;
    tipo_ruta: any;
    id_empresa: any;
    ruta: any;
    constructor(private horarioService: HorarioService,
                private fb: FormBuilder,
                private toastr: NbToastrService,
                private horarioOcService: HorariosOcupadosService,
                private route: ActivatedRoute,
                private _router:Router) {
        this.id_empresa = this.route.snapshot.paramMap.get('id_empresa');
        this.tipo_ruta = this.route.snapshot.paramMap.get('tipo_ruta');
        this.ruta = '/' + this.tipo_ruta + '/horarios-ocupados/listar/'+this.tipo_ruta+'/' + this.id_empresa;
        this.createForm();
        this.horarioService.index()
            .subscribe((res: any[]) => {
                this.horarios = res;
            });
    }

    createForm() {
        this.horarioOcGroup = this.fb.group({
            'empresa_id': new FormControl(0, Validators.required),
            'horario_id': new FormControl(0, Validators.required),
        });
    }

    ngOnInit() {
    }

    store() {
        this.horarioOcGroup.patchValue({
            'empresa_id': parseInt(this.id_empresa, 10),
            'horario_id': parseInt(this.horarioOcGroup.value.horario_id, 10),
        });
        this.horarioOcService.store(this.horarioOcGroup.value)
            .subscribe((res: any) => {
                this.toastr.success('Horario registrado', 'Aviso');
                this._router.navigate([this.ruta]);
            });
    }
}
