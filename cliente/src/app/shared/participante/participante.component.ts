import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {AyudaModalComponent} from '../ayuda-modal/ayuda-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {LoadModalComponent} from '../load-modal/load-modal.component';
import {AuthService} from '../../auth.service';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-participante',
  templateUrl: './participante.component.html',
  styleUrls: ['./participante.component.scss'],
})
export class ParticipanteComponent implements OnInit {

  id_empresa: any;
  empresa: any = null;
  participantes: any = null;
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
/*  onDeleteConfirm(event): void {
    if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
      event.confirm.resolve();
      this.empresaService.destroyParticipantes(event.data.participante_id).subscribe(res=>{
          this.empresaService.indexParticipantes(this.id_empresa).subscribe((data: any[]) => {
              this.participantes = data.length;
              this.source.load(data);
          });
      });
    } else {
      event.confirm.reject();
    }
  }*/

  datos: any;

  store(event): void {
    if(this.participantes < this.empresa.max_participantes) {
        if (window.confirm('¿Esta seguro de crear nuevo registro?')) {
            event.confirm.resolve();
            const loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
            this.datos = {
                empresa_id: this.id_empresa,
                nombres: event.newData.nombres,
                apellidos: event.newData.apellidos,
                carnet: event.newData.carnet,
                celular: event.newData.celular,
                cargo: event.newData.cargo,
            };
            this.empresaService.storeParticipantes(this.datos).subscribe(res => {
                this.empresaService.indexParticipantes(this.id_empresa).subscribe((data: any[]) => {
                    this.participantes = data.length;
                });
                loadModal.dismiss();
            }, error1 => {
                loadModal.dismiss();
            });
        } else {
            event.confirm.reject();
        }
    } else {
        const modalAyuda=this.modalService.open(AyudaModalComponent, { size: 'lg', container: 'nb-layout' });
        modalAyuda.componentInstance.titulo = 'Cantidad de participantes';
        modalAyuda.componentInstance.mensaje= `
        El número de participantes excedió su límite de ${this.empresa.max_participantes} participantes, 
        Para incrementar la cantidad de participantes comuniquese con la administración del campo ferial al número de teléfono
        `;
        modalAyuda.componentInstance.mensaje_importante = '52 66111';
    }

  }
  update(event): void {
    if (window.confirm(`
    ¿Esta seguro de cambiar los datos de ${event.newData.nombres} ${event.newData.apellidos}?
    `)) {
      event.confirm.resolve();
      this.datos = {
        empresa_id: this.id_empresa,
        nombres: event.newData.nombres,
        apellidos: event.newData.apellidos,
        carnet: event.newData.carnet,
        celular: event.newData.celular,
        cargo: event.newData.cargo,
      };
      this.empresaService.updateParticipantes(event.newData, event.data.participante_id).subscribe();
    } else {
      event.confirm.reject();
    }
  }

  setUsuario(participante: any) {
    const req = {
      participante_id: participante.participante_id,
    };
    this.authService.setUsuarioParticipante(req)
      .subscribe(() => {
        this.loadParticipantes();
        this.toastr.success(`El participante ${participante.nombres} ${participante.apellidos}
        se definió como usuario de la empresa`, 'Usuario establecido');
      });
  }
}
