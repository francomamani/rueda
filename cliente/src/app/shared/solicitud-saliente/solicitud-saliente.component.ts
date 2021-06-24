import { Component, OnInit } from '@angular/core';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {ActivatedRoute} from '@angular/router';
import {AgendaService} from '../../empresa/agenda/agenda.service';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {AuthService} from '../../auth.service';
import {EmpresaModalComponent} from '../empresa-modal/empresa-modal.component';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-solicitud-saliente',
  templateUrl: './solicitud-saliente.component.html',
  styleUrls: ['./solicitud-saliente.component.scss'],
})
export class SolicitudSalienteComponent implements OnInit {
  mi_empresa = null;
  solicitudes: any = null;
  empresa_id = null;
  constructor(private agendaService: AgendaService,
              private modalService: NgbModal,
              private toastr: NbToastrService,
              private empresaService: EmpresaService,
              private route: ActivatedRoute,
              private authService: AuthService) {

    this.route.params.subscribe(params => {
        if (params.empresa_id) {
          this.empresa_id = parseInt(params.empresa_id, 10);
          this.empresaService.show(parseInt(params.empresa_id, 10))
            .subscribe((res: any) => {
              this.mi_empresa = res.nombre;
            });
        } else {
          this.empresa_id = this.authService.getUsuario().empresa_id;
          this.mi_empresa = this.authService.getUsuario().nombre;
        }
    });

    this.agendaService
        .solicitudesSalientes(this.empresa_id)
        .subscribe((res: any) => {
          this.solicitudes = res;
        });
  }

  ngOnInit() {
  }

  info(empresa) {
    const activeModal = this.modalService.open(EmpresaModalComponent, { size: 'lg', container: 'nb-layout' });
    activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
    activeModal.componentInstance.empresa = empresa;
  }

  reload() {
    this.agendaService
      .solicitudesSalientes(this.empresa_id)
      .subscribe((res: any) => {
        this.solicitudes = res;
      });
  }
  cancelar(solicitud) {
    if (window.confirm('¿Esta seguro de cancelar la cita con ' + solicitud.nombre + '?')) {
      this.agendaService.cancelarCita(solicitud.agenda_id)
        .subscribe((response: any) => {
          this.toastr.success('Cita cancelada con exito', '¡Exito!')
          this.reload();
        });
    }
  }

}
