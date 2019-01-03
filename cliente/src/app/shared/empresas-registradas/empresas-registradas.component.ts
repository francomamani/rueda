import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {environment} from '../../../environments/environment.prod';
import {RubroService} from '../../admin/rubro/rubro.service';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AuthService} from '../../auth.service';
import {EmpresaModalComponent} from '../empresa-modal/empresa-modal.component';
import {ActivatedRoute} from '@angular/router';
import {AyudaModalComponent} from '../ayuda-modal/ayuda-modal.component';
import {LoadModalComponent} from '../load-modal/load-modal.component';

@Component({
  selector: 'ngx-empresas-registradas',
  templateUrl: './empresas-registradas.component.html',
  styleUrls: ['./empresas-registradas.component.scss'],
})
export class EmpresasRegistradasComponent implements OnInit {

    rubros: any = null;
    buscarGroup: FormGroup;
    empresas: any = null;
    empresasBK: any = null;
    empresa_id: any;
    emp: any = null;
    logo = environment.base + environment.empresa_logo;
    constructor(private rubroService: RubroService,
                private empresaService: EmpresaService,
                private modalService: NgbModal,
                private authService: AuthService,
                private fb: FormBuilder,
                public route: ActivatedRoute) {
        this.createForm();

        if (this.authService.getTipoUsuario() === 'administrador') {
            this.empresa_id = this.route.snapshot.paramMap.get('empresa_id');
            this.empresaService.show(this.empresa_id).subscribe(res => {
                this.emp = res;
            });
        } else {
            this.empresa_id = this.authService.getUsuario().empresa_id;
        }
        this.rubroService.index().subscribe(res => {
            this.rubros = res;
        });
        const empresa_id = this.authService.getUsuario().empresa_id;
        this.empresaService.miListaHabilitados(empresa_id)
          .subscribe((res: any) => {
            this.empresas = res;
            this.empresasBK = this.empresas;
          });
    }

    ngOnInit() {
    }

    createForm() {
        this.buscarGroup = this.fb.group({
            'rubro_id': new FormControl(0, [Validators.required]),
            'search': new FormControl('', [Validators.required]),
        });
    }

/*    buscar() {
        this.empresaService.buscar(this.buscarGroup.value)
            .subscribe((res: any) => {
                this.empresas = res;
            });
    }*/
    buscar() {
      const search = this.buscarGroup.value.search;
      const rubro_id = Number(this.buscarGroup.value.rubro_id);
      this.empresas = this.empresasBK;
      if (search === '') {
        if (rubro_id === 0) {
          this.empresas = this.empresasBK;
        } else {
          this.empresas = this.empresas.filter((empresa) => {
            return empresa.rubro_id === rubro_id;
          });
        }
      } else {
        if (rubro_id === 0) {
          this.empresas = this.empresas.filter((empresa) => {
            return empresa.nombre.toLowerCase().indexOf(search) > -1 ||
              empresa.direccion.toLowerCase().indexOf(search) > -1 ||
              empresa.nit.toLowerCase().indexOf(search) > -1 ||
              empresa.telefono.toLowerCase().indexOf(search) > -1;
          });
        } else {
          this.empresas = this.empresas.filter((empresa) => {
            return (empresa.nombre.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id ) ||
              (empresa.direccion.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id) ||
              (empresa.nit.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id) ||
              (empresa.telefono.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id);
          });
        }
      }
    }

    info(empresa) {
        const activeModal = this.modalService.open(EmpresaModalComponent, { size: 'lg', container: 'nb-layout' });
        activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
        activeModal.componentInstance.empresa = empresa;
    }

    agendar(empresa_id) {
        const loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
        const data = {
            empresa_solicitante_id : this.empresa_id,
            empresa_demandada_id : empresa_id,
        };
        this.empresaService.agendar(data)
            .subscribe((res: any) => {
                loadModal.dismiss();
                let message = '';
                res.message.forEach(m => {
                  message = m + '. ';
                });
                if (res.status) {
                  this.ayuda('Reunión agendada', res.message, '');
                  const mi_empresa_id = this.authService.getUsuario().empresa_id;
                  this.empresaService.miListaHabilitados(mi_empresa_id)
                    .subscribe((response: any) => {
                      this.empresas = response;
                      this.empresasBK = this.empresas;
                    });
                } else {
                  this.ayuda('No fue posible agendar', message, '');
                }
            }, (error: any) => {
                    this.ayuda('No se puedo agendar',
                                  'No se pudo agendar la reunión con esta empresa', '');
            });
    }

    ayuda(tit, mess, mess_i) {
        const modalAyuda = this.modalService.open(AyudaModalComponent, { size: 'lg', container: 'nb-layout' });
        modalAyuda.componentInstance.titulo = tit;
        modalAyuda.componentInstance.mensaje = mess;
        modalAyuda.componentInstance.mensaje_importante = mess_i;
    }
}
