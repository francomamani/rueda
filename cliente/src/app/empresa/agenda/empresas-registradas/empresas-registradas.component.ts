import {Component, OnInit} from '@angular/core';
import {RubroService} from '../../../admin/rubro/rubro.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {EmpresaService} from '../../../admin/empresa/empresa.service';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {environment} from '../../../../environments/environment.prod';
import {AuthService} from '../../../auth.service';

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
  logo = environment.base + environment.empresa_logo;

  constructor(private rubroService: RubroService,
              private empresaService: EmpresaService,
              private modalService: NgbModal,
              private authService: AuthService,
              private fb: FormBuilder) {
    this.createForm();
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
          return (empresa.nombre.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id) ||
            (empresa.direccion.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id) ||
            (empresa.nit.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id) ||
            (empresa.telefono.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id);
        });
      }
    }
  }

  info(empresa) {
    const activeModal = this.modalService.open(EmpresaModalComponent, {size: 'lg', container: 'nb-layout'});
    activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
    activeModal.componentInstance.empresa = empresa;
  }

  agendar(empresa_id) {
    const data = {
      empresa_solicitante_id: this.authService.getUsuario().empresa_id,
      empresa_demandada_id: empresa_id,
    };
    this.empresaService.agendar(data)
      .subscribe(res => {
      });
  }

}
