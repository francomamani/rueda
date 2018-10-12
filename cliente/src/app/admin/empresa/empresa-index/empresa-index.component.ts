import { Component, OnInit } from '@angular/core';
import {EmpresaService} from '../empresa.service';
import {LocalDataSource} from 'ng2-smart-table';
import {ToasterService} from 'angular2-toaster';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-empresa-index',
  templateUrl: './empresa-index.component.html',
  styleUrls: ['./empresa-index.component.scss'],
})
export class EmpresaIndexComponent implements OnInit {

  empresas: any = null;
  settings = {
    actions: {
      columnTitle: 'Eliminar',
      add: false,
      edit: false,
    },
    delete: {
      deleteButtonContent: '<i class="nb-trash"></i>',
      confirmDelete: true,
    },
    columns: {
      rubro: {
        title: 'Rubro',
        type: 'string',
      },
      nombre: {
        title: 'Empresa',
        type: 'string',
      },
    },
  };
  source: LocalDataSource = new LocalDataSource();
  constructor(private empresaService: EmpresaService,
              private toastr: NbToastrService) {
    this.empresaService.index()
      .subscribe((data: any[]) => {
        this.source.load(data);
      });
  }

  ngOnInit() {
  }

  onDeleteConfirm(event): void {
    if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
      event.confirm.resolve();
      this.empresaService.destroy(event.data.empresa_id)
        .subscribe((res: any) => {
          this.toastr.success(res.mensaje, 'Exito');
        });
    } else {
      event.confirm.reject();
    }
  }

}
