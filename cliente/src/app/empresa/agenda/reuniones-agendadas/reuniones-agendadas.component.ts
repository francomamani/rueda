import { Component, OnInit } from '@angular/core';
import {EmpresaService} from '../../../admin/empresa/empresa.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {ActivatedRoute, Router} from '@angular/router';
import {AuthService} from '../../../auth.service';

@Component({
  selector: 'ngx-reuniones-agendadas',
  templateUrl: './reuniones-agendadas.component.html',
  styleUrls: ['./reuniones-agendadas.component.scss'],
})
export class ReunionesAgendadasComponent implements OnInit {

  reuniones: any = null;
  empresa_id = null;
  mi_empresa = null;
  constructor(private empresaService: EmpresaService,
              private route: ActivatedRoute,
              private router: Router,
              private authService: AuthService,
              private modalService: NgbModal) {
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

  go(reunion_id) {
    this.router.navigate(['/empresa/evaluacion-reunion/' + reunion_id + '/' + this.empresa_id]);
  }

}
