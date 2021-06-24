import {Component, OnInit} from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {AyudaModalComponent} from '../ayuda-modal/ayuda-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {LoadModalComponent} from '../load-modal/load-modal.component';
import {AuthService} from '../../auth.service';
import {NbToastrService} from '@nebular/theme';
import swal from 'sweetalert';

@Component({
  selector: 'ngx-participante',
  templateUrl: './participante.component.html',
  styleUrls: ['./participante.component.scss'],
})
export class ParticipanteComponent implements OnInit {

  id_empresa: any;
  empresa: any = null;
  participante: any = null;
  participantes: any = null;
  state = 'index';
  datos: any;

  constructor(private empresaService: EmpresaService,
              private route: ActivatedRoute,
              private modalService: NgbModal,
              private toastr: NbToastrService,
              private authService: AuthService) {
    if (this.authService.getTipoUsuario() === 'administrador') {
      this.id_empresa = this.route.snapshot.paramMap.get('empresa_id');
    } else {
      this.id_empresa = this.authService.getUsuario().empresa_id;
    }
  }

  ngOnInit() {
    this.empresaService.show(this.id_empresa)
      .subscribe((res: any) => {
        this.empresa = res;
      });
    this.empresaService.indexParticipantes(this.id_empresa).subscribe((data: any[]) => {
      this.participantes = data;
    });
  }

  loadParticipantes() {
    this.empresaService.indexParticipantes(this.id_empresa).subscribe((data: any[]) => {
      this.participantes = data;
    });
  }

  setUsuario(participante: any) {
    const req = {
      participante_id: participante.participante_id,
      empresa_id: this.id_empresa,
    };
    this.authService.setUsuarioParticipante(req)
      .subscribe(() => {
        this.loadParticipantes();
        alert(`El participante ${participante.nombres} ${participante.apellidos} es su nuevo usuario`);
      });
  }

  reducer(action: string) {
    this.state = action;
  }

  destroy(participante: any) {
    if (confirm(`¿Esta seguro de eliminar al participante ${participante.nombres} ${participante.apellidos}?`)) {
      if (participante.es_usuario) {
        swal('¡El participante es un usuario!', `El participante ${participante.nombres} ${participante.apellidos} es usuario de la empresa y no puede ser eliminado>. Seleccione otro participante como usuario antes de eliminarlo.`, 'error');
        /*        Swal.fire({
                  title: '¡El participante es un usuario!',
                  html: `El participante <strong>${participante.nombres} ${participante.apellidos}</strong> es usuario de la empresa y
                        <strong> no puede ser eliminado></strong>.<br/>
                       Seleccione otro participante como usuario antes de eliminarlo.`,
                  icon: 'error',
                  confirmButtonText: '',
                });*/
      } else {
        this.empresaService.destroyParticipantes(participante.participante_id)
          .subscribe(() => {
            this.loadParticipantes();
          });
      }
    }
  }

  setState(event) {
    this.state = event;
    this.loadParticipantes();
  }

  edit(participante: any) {
    this.state = 'edit';
    this.participante = participante;
  }
}
