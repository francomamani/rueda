import { Component, OnInit } from '@angular/core';
import {EmpresaService} from '../../../admin/empresa/empresa.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';

@Component({
  selector: 'ngx-reuniones-agendadas',
  templateUrl: './reuniones-agendadas.component.html',
  styleUrls: ['./reuniones-agendadas.component.scss'],
})
export class ReunionesAgendadasComponent implements OnInit {

  reuniones: any = null;
  empresa_id = JSON.parse(atob(localStorage.getItem('rueda-usuario'))).empresa.empresa_id;
  constructor(private empresaService: EmpresaService,
              private modalService: NgbModal) {
    this.empresaService.misReuniones(this.empresa_id)
      .subscribe((res: any) => {
        this.reuniones = res;
      });
  }

  ngOnInit() {
  }

  info(empresa, fecha_hora_registro_reunion) {
    const activeModal = this.modalService.open(EmpresaModalComponent, { size: 'lg', container: 'nb-layout' });
    activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
    activeModal.componentInstance.empresa = empresa;
    activeModal.componentInstance.fecha_hora_registro_reunion = fecha_hora_registro_reunion;
  }

}
