import {Component, OnInit} from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {AgendaService} from '../agenda.service';
import {HorarioService} from '../../../admin/horario/horario.service';
import {EmpresaService} from '../../../admin/empresa/empresa.service';
import {MesaService} from '../../../admin/mesa/mesa.service';
import {NbToastrService} from '@nebular/theme';
import {AuthService} from '../../../auth.service';

@Component({
  selector: 'ngx-agenda-create',
  templateUrl: './agenda-create.component.html',
  styleUrls: ['./agenda-create.component.scss'],
})
export class AgendaCreateComponent implements OnInit {

  tipo_asignacion = 'administracion';
  empresas: any = null;
  horarios: any = null;
  mesas: any = null;
  agendaGroup: FormGroup;

  horariosActive = false;
  mesasActive = false;

  id1: any;
  id2: any;

  constructor(private agendaService: AgendaService,
              private horarioService: HorarioService,
              private empresaService: EmpresaService,
              private mesaService: MesaService,
              private fb: FormBuilder,
              private toastr: NbToastrService,
              private authService: AuthService) {
    this.createForm();
    this.empresaService.empresasListar()
      .subscribe((res: any[]) => {
        this.empresas = res;
      });

    this.id1 = this.authService.getUsuario().empresa_id;

  }

  createForm() {
    this.agendaGroup = this.fb.group({
      'tipo_asignacion': new FormControl('pre_agendado', Validators.required),
      'empresa_solicitante_id': new FormControl(this.authService.getUsuario().empresa_id, Validators.required),
      'empresa_demandada_id': new FormControl(0, Validators.required),
      'horario_id': new FormControl(0, Validators.required),
      'mesa_id': new FormControl(0, Validators.required),
      'estado': new FormControl('pendiente', Validators.required),
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

  buscarHorarios() {
    this.id2 = this.agendaGroup.value.empresa_demandada_id;
    if (this.id1 !== 0 && this.id2 !== 0 && this.id1 !== this.id2) {
      this.horariosActive = true;
      this.horarioService.horarios_disponibles(this.id1, this.id2)
        .subscribe((res: any[]) => {
          this.horarios = res;
        });
    }
    else {
      this.horariosActive = false;
      this.toastr.danger('No se puede conseguir los horarios disponibles', 'Error');
    }
  }

  horarioChange(value) {
    this.mesasActive = true;
    this.mesaService.mesas_dis(value)
      .subscribe((res: any[]) => {
        this.mesas = res;
      });
  }

}
