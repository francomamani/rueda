import {Component, OnInit, ViewChild} from '@angular/core';
import {EmpresaService} from '../empresa.service';
import {NbToastrService} from '@nebular/theme';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {RubroService} from '../../rubro/rubro.service';
import {environment} from '../../../../environments/environment.prod';

@Component({
  selector: 'ngx-empresa-index',
  templateUrl: './empresa-index.component.html',
  styleUrls: ['./empresa-index.component.scss'],
})
export class EmpresaIndexComponent implements OnInit {

  buscarGroup: FormGroup;
  empresas: any = null;
  rubros: any = null;
  logo = environment.base + environment.empresa_logo;
  constructor(private empresaService: EmpresaService,
              private rubroService: RubroService,
              private modalService: NgbModal,
              private fb: FormBuilder,
              private toastr: NbToastrService) {
    this.createForm();
    this.empresaService.empresasListar()
      .subscribe((res: any) => {
        this.empresas = res;
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
  buscar() {
    this.empresaService.buscar(this.buscarGroup.value)
      .subscribe((res: any) => {
        this.empresas = res;
      });
  }
  info(empresa) {
    const activeModal = this.modalService.open(EmpresaModalComponent, { size: 'lg', container: 'nb-layout' });
    activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
    activeModal.componentInstance.empresa = empresa;
  }
  cambiarLogo(empresa) {
/*    const empresa_logo = document.getElementById(empresa.empresa_id);
    console.log(empresa_logo);
    const formData = new FormData();
    if (empresa_logo.files[0]) {
      formData.append('logo', empresa_logo.files[0]);
    }
    this.empresaService
        .cambiarLogo(empresa.empresa_id, formData)
      .subscribe(res => {
        console.log(res);
      });*/
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

}
