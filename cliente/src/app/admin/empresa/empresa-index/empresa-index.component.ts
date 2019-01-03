import {Component, OnInit, ViewChild} from '@angular/core';
import {EmpresaService} from '../empresa.service';
import {NbToastrService} from '@nebular/theme';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {RubroService} from '../../rubro/rubro.service';
import {environment} from '../../../../environments/environment.prod';
import {VoucherModalComponent} from '../../voucher-modal/voucher-modal.component';
import {ExcelServiceService} from './excel-service.service';

@Component({
  selector: 'ngx-empresa-index',
  templateUrl: './empresa-index.component.html',
  styleUrls: ['./empresa-index.component.scss'],
})
export class EmpresaIndexComponent implements OnInit {

  buscarGroup: FormGroup;
  empresas: any = null;
  empresasBK: any = null;
  rubros: any = null;
  logo = environment.base + 'mostrar-logo/';
  logo_default = environment.base + environment.empresa_logo;
  constructor(private empresaService: EmpresaService,
              private rubroService: RubroService,
              private modalService: NgbModal,
              private fb: FormBuilder,
              private toastr: NbToastrService,
              private excelService: ExcelServiceService) {
    this.createForm();
    this.empresaService.empresasListar()
      .subscribe((res: any) => {
        this.empresas = res;
        this.empresasBK = this.empresas;
      });
    this.rubroService.index()
      .subscribe((res: any) => {
        this.rubros = res;
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
/*  buscar() {
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

  reload() {
    this.empresaService.empresasListar()
      .subscribe((res: any) => {
        this.empresas = res;
      });
  }
  info(empresa) {
    const activeModal = this.modalService.open(EmpresaModalComponent, { size: 'lg', container: 'nb-layout' });
    activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
    activeModal.componentInstance.empresa = empresa;
  }
  cambiarLogo(event, empresa) {
    const formData = new FormData();
    if (event.srcElement.files[0]) {
      formData.append('logo', event.srcElement.files[0]);
    }
    this.empresaService
        .cambiarLogo(empresa.empresa_id, formData)
      .subscribe(res => {
        this.reload();
      });
  }
  onDeleteConfirm(empresa, index): void {
    if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
      this.empresaService.destroy(empresa.empresa_id)
        .subscribe((res: any) => {
          this.empresas.splice(index, 1);
          this.toastr.success(res.mensaje, 'Exito');
        });
    }
  }

  comprobante(empresa) {
      const compModal = this.modalService.open(VoucherModalComponent, { size: 'lg', container: 'nb-layout' });
      compModal.componentInstance.id_empresa = empresa.empresa_id;
      if (empresa.voucher !== null)
        compModal.componentInstance.comp = environment.base + 'voucher/' + empresa.empresa_id;
      compModal.result.then(() => {
        this.reload();
      });
  }

    descargar() {
      const copia = this.empresas;
      this.excelService.exportAsExcelFile(copia, 'empresas-registradas');
    }

}
