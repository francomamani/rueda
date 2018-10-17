import { Component, OnInit } from '@angular/core';
import {RubroService} from '../../../admin/rubro/rubro.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {EmpresaService} from '../../../admin/empresa/empresa.service';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'ngx-empresas-registradas',
  templateUrl: './empresas-registradas.component.html',
  styleUrls: ['./empresas-registradas.component.scss'],
})
export class EmpresasRegistradasComponent implements OnInit {

  rubros: any = null;
  buscarGroup: FormGroup;
  empresas: any = null;
  constructor(private rubroService: RubroService,
              private empresaService: EmpresaService,
              private modalService: NgbModal,
              private fb: FormBuilder) {
    this.createForm();
    this.rubroService.index().subscribe(res => {
      this.rubros = res;
    });
    this.empresaService.empresasListar()
      .subscribe((res: any) => {
        this.empresas = res;
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

}
