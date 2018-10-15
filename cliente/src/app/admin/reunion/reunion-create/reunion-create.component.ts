import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {EmpresaService} from '../../empresa/empresa.service';
import {NbToastrService} from '@nebular/theme';
import {HorarioService} from '../../horario/horario.service';
import {MesaService} from '../../mesa/mesa.service';
import {ReunionService} from '../reunion.service';

@Component({
    selector: 'ngx-reunion-create',
    templateUrl: './reunion-create.component.html',
    styleUrls: ['./reunion-create.component.scss'],
})
export class ReunionCreateComponent implements OnInit {

    empresas: any = null;
    horarios: any = null;
    mesas: any = null;
    reunionGroup: FormGroup;

    constructor(private reunionService: ReunionService,
                private horarioService: HorarioService,
                private empresaService: EmpresaService,
                private mesaService: MesaService,
                private fb: FormBuilder,
                private toastr: NbToastrService) {
        this.createForm();
        this.horarioService.index()
            .subscribe((res: any[]) => {
                this.horarios = res;
            });
        this.empresaService.empresasListar()
            .subscribe((res: any[]) => {
                this.empresas = res;
            });
        this.mesaService.index()
            .subscribe((res: any[]) => {
                this.mesas = res;
            });
    }

    createForm() {
        this.reunionGroup = this.fb.group({
            'empresa_solicitante_id': new FormControl(0, Validators.required),
            'empresa_demandada_id': new FormControl(0, Validators.required),
            'horario_id': new FormControl(0, Validators.required),
            'mesa_id': new FormControl(0, Validators.required),
        });
    }

    ngOnInit() {
    }

    store() {
        this.reunionGroup.patchValue({
          'empresa_solicitante_id': parseInt(this.reunionGroup.value.empresa_solicitante_id, 10),
          'empresa_demandada_id': parseInt(this.reunionGroup.value.empresa_demandada_id, 10),
          'horario_id': parseInt(this.reunionGroup.value.horario_id, 10),
          'mesa_id': parseInt(this.reunionGroup.value.mesa_id, 10),
        });
        this.reunionService.store(this.reunionGroup.value)
            .subscribe((res: any) => {
                this.toastr.success('Reunion registrada', 'Aviso');
            });
    }

}
