import { Component, OnInit } from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {TipoUsuarioService} from './tipo-usuario.service';

@Component({
  selector: 'ngx-tipo-usuario',
  templateUrl: './tipo-usuario.component.html',
  styleUrls: ['./tipo-usuario.component.scss'],
})
export class TipoUsuarioComponent implements OnInit {

  constructor(private tipo_usuario: TipoUsuarioService) {
      this.tipo_usuario.index().subscribe((data: any[]) => {
        this.source.load(data);
      });
  }

  ngOnInit() {
  }

    settings = {
        add: {
            addButtonContent: '<i class="nb-plus"></i>',
            createButtonContent: '<i class="nb-checkmark"></i>',
            cancelButtonContent: '<i class="nb-close"></i>',
            confirmCreate: true,
        },
        edit: {
            editButtonContent: '<i class="nb-edit"></i>',
            saveButtonContent: '<i class="nb-checkmark"></i>',
            cancelButtonContent: '<i class="nb-close"></i>',
            confirmSave: true,
        },
        delete: {
            deleteButtonContent: '<i class="nb-trash"></i>',
            confirmDelete: true,
        },
        columns: {
            nombre: {
                title: 'Nombre',
                type: 'string',
            },
            descripcion: {
                title: 'Descripcion',
                type: 'string',
            },
        },
    };

    source: LocalDataSource = new LocalDataSource();


    onDeleteConfirm(event): void {
        if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
            event.confirm.resolve();
            this.tipo_usuario.destroy(event.data.tipo_usuario_id).subscribe();
        } else {
            event.confirm.reject();
        }
    }
    store(event): void {
        if (window.confirm('¿Esta seguro de crear nuevo registro?')) {
            event.confirm.resolve();
            this.tipo_usuario.store(event.newData).subscribe();
        } else {
            event.confirm.reject();
        }

    }

    update(event): void {
        if (window.confirm('¿Esta seguro de cambiar los datos de este registro?')) {
            event.confirm.resolve();
            this.tipo_usuario.update(event.newData, event.data.tipo_usuario_id).subscribe();
        } else {
            event.confirm.reject();
        }
    }

}
