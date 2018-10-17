import {Component, OnInit} from '@angular/core';
import {AgendaService} from '../../empresa/agenda/agenda.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {ActivatedRoute} from '@angular/router';
import {AuthService} from '../../auth.service';
import {EmpresaModalComponent} from '../empresa-modal/empresa-modal.component';

@Component({
  selector: 'ngx-solicitud-entrante',
  templateUrl: './solicitud-entrante.component.html',
  styleUrls: ['./solicitud-entrante.component.scss'],
})
export class SolicitudEntranteComponent implements OnInit {
  mi_empresa = null;
  solicitudes: any = null;
  empresa_id = null;

  constructor(private agendaService: AgendaService,
              private modalService: NgbModal,
              private empresaService: EmpresaService,
              private route: ActivatedRoute,
              private authService: AuthService ) {

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
      .solicitudesEntrantes(this.empresa_id)
      .subscribe((res: any) => {
        this.solicitudes = res;
      });
  }

  ngOnInit() {
  }

  info(empresa) {
    const activeModal = this.modalService.open(EmpresaModalComponent, {size: 'lg', container: 'nb-layout'});
    activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
    activeModal.componentInstance.empresa = empresa;
  }

  datos: any;

  aceptar(id_agenda) {
    if (window.confirm('¿Esta seguro aceptar esta cita?')) {
      this.datos = {
        agenda_id: id_agenda,
        estado: 'aceptado',
      };
      this.agendaService.cambiarEstado(this.datos)
        .subscribe((res: any) => {
          this.cargar();
        });
    }

  }

  rechazar(id_agenda) {
    if (window.confirm('¿Esta seguro de rechazar esta cita?')) {
      this.datos = {
        agenda_id: id_agenda,
        estado: 'rechazado',
      }
      this.agendaService.cambiarEstado(this.datos)
        .subscribe((res: any) => {
          this.cargar();
        });
    }
  }

  cargar() {
    this.agendaService
      .solicitudesEntrantes(this.empresa_id)
      .subscribe((res: any) => {
        this.solicitudes = res;
      });
  }


}
