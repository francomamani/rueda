import { Component, OnInit } from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {EmpresaService} from '../empresa.service';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'ngx-empresa-participante',
  templateUrl: './empresa-participante.component.html',
  styleUrls: ['./empresa-participante.component.scss'],
})
export class EmpresaParticipanteComponent implements OnInit {

    ngOnInit() {
    }

    settings = {
        actions: {
            columnTitle: '',
        },
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
            nombres: {
                title: 'Nombres',
                type: 'string',
            },
            apellidos: {
                title: 'Apellidos',
                type: 'string',
            },
            carnet: {
                title: 'Carnet',
                type: 'string',
            },
            celular: {
                title: 'Celular',
                type: 'string',
            },
            cargo: {
                title: 'Cargo',
                type: 'string',
            },
        },
    };

    source: LocalDataSource = new LocalDataSource();
    id_empresa: any;

    constructor(private empresaService: EmpresaService,
                private route: ActivatedRoute) {

        this.id_empresa = this.route.snapshot.paramMap.get('empresa_id');
        console.log(this.id_empresa);
        this.empresaService.indexParticipantes(this.id_empresa).subscribe((data: any[]) => {
            this.source.load(data);
        });
    }


    onDeleteConfirm(event): void {
        if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
            event.confirm.resolve();
            this.empresaService.destroyParticipantes(event.data.participante_id).subscribe();
        } else {
            event.confirm.reject();
        }
    }

    datos: any;

    store(event): void {
        if (window.confirm('¿Esta seguro de crear nuevo registro?')) {
            event.confirm.resolve();
            console.log(event);
            this.datos = {
                empresa_id: this.id_empresa,
                nombres: event.newData.nombres,
                apellidos: event.newData.apellidos,
                carnet: event.newData.carnet,
                celular: event.newData.celular,
                cargo: event.newData.cargo,
            }
            console.log(this.datos);
            this.empresaService.storeParticipantes(this.datos).subscribe();
        } else {
            event.confirm.reject();
        }

    }

    update(event): void {
        if (window.confirm('¿Esta seguro de cambiar los datos de este registro?')) {
            event.confirm.resolve();
            this.datos = {
                empresa_id: this.id_empresa,
                nombres: event.newData.nombres,
                apellidos: event.newData.apellidos,
                carnet: event.newData.carnet,
                celular: event.newData.celular,
                cargo: event.newData.cargo,
            }
            this.empresaService.updateParticipantes(event.newData, event.data.participante_id).subscribe();
        } else {
            event.confirm.reject();
        }
    }

}
