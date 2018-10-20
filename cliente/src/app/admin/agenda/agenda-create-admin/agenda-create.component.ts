import {Component, OnInit} from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {AgendaService} from '../agenda.service';
import {HorarioService} from '../../horario/horario.service';
import {EmpresaService} from '../../empresa/empresa.service';
import {MesaService} from '../../mesa/mesa.service';
import {NbToastrService} from '@nebular/theme';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {AuthService} from '../../../auth.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

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

    existe_empresa1 = false;
    existe_empresa2 = false;
    emp1: any;
    emp2: any;

  constructor(private agendaService: AgendaService,
              private horarioService: HorarioService,
              private empresaService: EmpresaService,
              private mesaService: MesaService,
              private fb: FormBuilder,
              private toastr: NbToastrService,
              private modalService: NgbModal) {
    this.createForm();
    this.empresaService.empresasListar()
      .subscribe((res: any[]) => {
        this.empresas = res;
      });

  }

  createForm() {
    this.agendaGroup = this.fb.group({
      'tipo_asignacion': new FormControl('administracion', Validators.required),
      'empresa_solicitante_id': new FormControl(0, Validators.required),
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
    this.id1 = this.agendaGroup.value.empresa_solicitante_id;
    this.id2 = this.agendaGroup.value.empresa_demandada_id;
    if (this.id1 !== 0 && this.id2 !== 0 && this.id1 !== this.id2) {
      this.horariosActive = true;
      this.horarioService.horarios_disponibles(this.id1, this.id2)
        .subscribe((res: any[]) => {
          this.horarios = res;
        });
    }
    else{
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
    onChange1(id) {
        this.existe_empresa1 = true;
        this.empresas.forEach((item, index) => {
            if (id == item.empresa_id) {
                this.emp1 = item;
            }
        });

    }
    onChange2(id) {
        this.existe_empresa2 = true;
        this.empresas.forEach((item, index) => {
            if (id == item.empresa_id) {
                this.emp2 = item;
            }
        });

    }

    masinfo1() {
        const activeModal = this.modalService.open(EmpresaModalComponent, {size: 'lg', container: 'nb-layout'});
        activeModal.componentInstance.modalHeader = 'Empresa: ' + this.emp1.nombre;
        activeModal.componentInstance.empresa = this.emp1;
    }
    masinfo2() {
        const activeModal = this.modalService.open(EmpresaModalComponent, {size: 'lg', container: 'nb-layout'});
        activeModal.componentInstance.modalHeader = 'Empresa: ' + this.emp2.nombre;
        activeModal.componentInstance.empresa = this.emp2;
    }

}
