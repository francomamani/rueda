import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {AgendaService} from '../agenda.service';
import {HorarioService} from '../../horario/horario.service';
import {EmpresaService} from '../../empresa/empresa.service';
import {MesaService} from '../../mesa/mesa.service';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-agenda-create-contingencia',
  templateUrl: './agenda-create-contingencia.component.html',
  styleUrls: ['./agenda-create-contingencia.component.scss']
})
export class AgendaCreateContingenciaComponent implements OnInit {


    tipo_asignacion='administracion';
    empresas: any = null;
    horarios: any = null;
    mesas: any = null;
    agendaGroup: FormGroup;

    horariosActive=false;
    mesasActive=false;

    id1:any;
    id2:any;

    constructor(private agendaService: AgendaService,
                private horarioService: HorarioService,
                private empresaService: EmpresaService,
                private mesaService: MesaService,
                private fb: FormBuilder,
                private toastr: NbToastrService) {
        this.createForm();
        this.empresaService.empresasListar()
            .subscribe((res: any[]) => {
                this.empresas = res;
            });
        this.horarioService.index()
            .subscribe((res: any[]) => {
                this.horarios = res;
            });
        this.mesaService.index()
            .subscribe((res: any[]) => {
                this.mesas = res;
            });

    }

    createForm() {
        this.agendaGroup = this.fb.group({
            'tipo_asignacion':new FormControl('cita_de_contingencia', Validators.required),
            'empresa_solicitante_id': new FormControl(0, Validators.required),
            'empresa_demandada_id': new FormControl(0, Validators.required),
            'horario_id': new FormControl(0, Validators.required),
            'mesa_id': new FormControl(0, Validators.required),
        });
    }

    ngOnInit() {
    }

    store() {
        this.agendaGroup.patchValue({
            'empresa_solicitante_id': parseInt(this.agendaGroup.value.empresa_solicitante_id, 10),
            'empresa_demandada_id': parseInt(this.agendaGroup.value.empresa_demandada_id, 10),
            'horario_id': parseInt(this.agendaGroup.value.horario_id, 10),
            'mesa_id': parseInt(this.agendaGroup.value.mesa_id, 10),
        });
        this.agendaService.store(this.agendaGroup.value)
            .subscribe((res: any) => {
                this.toastr.success('Registro en la agenda registrada', 'Aviso');
            });
    }
}
