import { Component, OnInit } from '@angular/core';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {ActivatedRoute, Router} from '@angular/router';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {AuthService} from '../../auth.service';
import {EmpresaModalComponent} from '../empresa-modal/empresa-modal.component';
import {ReunionService} from '../../admin/reunion/reunion.service';

@Component({
  selector: 'ngx-reuniones-agendadas',
  templateUrl: './reuniones-agendadas.component.html',
  styleUrls: ['./reuniones-agendadas.component.scss'],
})
export class ReunionesAgendadasComponent implements OnInit {

  reuniones: any = null;
  empresa_id = null;
  mi_empresa = null;
  habilitado = null;
  admin: boolean = null;
  constructor(private empresaService: EmpresaService,
              private route: ActivatedRoute,
              private reunionService: ReunionService,
              private router: Router,
              private authService: AuthService,
              private modalService: NgbModal) {
    this.route.params.subscribe(params => {
      if (params.empresa_id) {
        this.empresa_id = parseInt(params.empresa_id, 10);
        this.empresaService.show(parseInt(params.empresa_id, 10))
          .subscribe((res: any) => {
            this.mi_empresa = res.nombre;
            this.habilitado  = res.habilitado;
            this.admin = true;
          });
      } else {
        this.empresa_id = this.authService.getUsuario().empresa_id;
        this.mi_empresa = this.authService.getUsuario().nombre;
        this.habilitado = this.authService.getUsuario().habilitado;
        this.admin = false;
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
    if (this.admin) {
      this.router.navigate(['/admin/evaluacion-reunion/' + reunion_id + '/' + this.empresa_id]);
    } else {
      this.router.navigate(['/empresa/evaluacion-reunion/' + reunion_id + '/' + this.empresa_id]);
    }
  }

  cancelar(index) {
    /*console.log(reunion_id);*/
    this.reuniones.splice(1, index);
/*    this.reunionService.destroy(reunion_id)
      .subscribe(res => {
        console.log(res);
        this.empresaService.misReuniones(this.empresa_id)
          .subscribe((res2: any) => {
            this.reuniones = res2;
          });
      });*/
  }
}
