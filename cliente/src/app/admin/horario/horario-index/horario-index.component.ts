import { Component, OnInit } from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {HorarioService} from '../horario.service';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-horario-index',
  templateUrl: './horario-index.component.html',
  styleUrls: ['./horario-index.component.scss'],
})
export class HorarioIndexComponent implements OnInit {

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
            inicio: {
                title: 'Inicio',
                type: 'string',
            },
            fin: {
                title: 'Fin',
                type: 'string',
            },
        },
    };
    source: LocalDataSource = new LocalDataSource();
  constructor(private horarioService: HorarioService,
              private toastr: NbToastrService) {
      this.horarioService.index()
          .subscribe((data: any[]) => {
              this.source.load(data);
          });
  }

  ngOnInit() {
  }
    onDeleteConfirm(event): void {
        if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
            event.confirm.resolve();
            this.horarioService.destroy(event.data.horario_id)
                .subscribe((res: any) => {
                    this.toastr.success(res.mensaje, 'Exito');
                });
        } else {
            event.confirm.reject();
        }
    }

}
