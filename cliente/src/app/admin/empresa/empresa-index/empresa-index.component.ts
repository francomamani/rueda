import { Component, OnInit } from '@angular/core';
import {EmpresaService} from '../empresa.service';
import {ToasterService} from 'angular2-toaster';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-empresa-index',
  templateUrl: './empresa-index.component.html',
  styleUrls: ['./empresa-index.component.scss'],
})
export class EmpresaIndexComponent implements OnInit {

  empresas: any = null;
  constructor(private empresaService: EmpresaService,
              private toastr: NbToastrService) {
    this.empresaService.index()
      .subscribe((res: any) => {
        this.empresas = res.data;
      });
  }

  ngOnInit() {
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
