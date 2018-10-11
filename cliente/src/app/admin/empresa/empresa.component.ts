import { Component, OnInit } from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {EmpresaService} from './empresa.service';
import {RubroService} from "../rubro/rubro.service";

@Component({
  selector: 'ngx-empresa',
  templateUrl: './empresa.component.html',
  styleUrls: ['./empresa.component.scss'],
})
export class EmpresaComponent implements OnInit {


    rubros: any[];


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
            rubro_id: {
                title: 'Rubro',
                editor: {
                    type: 'completer',
                    config: {
                      completer: {
                        data: null,
                        searchFields: 'nombre,descripcion',
                        titleField: 'nombre',
                        descriptionField: 'description',
                      },
                    },
                },
            },
            nombre: {
                title: 'Nombre',
                type: 'string',
            },
            direccion: {
                title: 'Dirección',
                type: 'string',
            },
            ciudad_localidad: {
                title: 'Ciudad/Localidad',
                type: 'string',
            },
            nit: {
                title: 'Nit',
                type: 'string',
            },
            representante_legal: {
                title: 'Representante Legal',
                type: 'string',
            },
            habilitado: {
                title: 'Habilitado',
                type: 'string',
                editor: {
                    type: 'checkbox',
                    config: true,
                },
            },
            max_participantes: {
                title: 'Maximo de participantes',
                type: 'string',
            },
            oferta: {
                title: 'Oferta',
                type: 'string',
            },
            demanda: {
                title: 'Demanda',
                type: 'string',
            },
            especial: {
                title: 'Empresa especial',
                type: 'string',
                editor: {
                    type: 'checkbox',
                    config: true,
                },
            },
            nombres: {
                title: 'Nombres del Usuario',
                type: 'string',
            },
            apellidos: {
                title: 'Apellidos del Usuario',
                type: 'string',
            },
            email: {
                title: 'Correo electronico',
                type: 'string',
            },

        },
    };

    constructor(private empresa: EmpresaService, private rubroService: RubroService) {
        /* this.empresa.index().subscribe((data: any[]) => {
             this.source.load(data);
         });*/
        this.rubroService.index().subscribe((data:any[]) => {
            this.rubros = data;
            this.settings.columns.rubro_id.editor.config.completer.data=data;
            console.log(data);
        });
    }

    source: LocalDataSource = new LocalDataSource();


    onDeleteConfirm(event): void {
        if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
            event.confirm.resolve();
            this.empresa.destroy(event.data.empresa_id).subscribe();
        } else {
            event.confirm.reject();
        }
    }
    store(event): void {
        if (window.confirm('¿Esta seguro de crear una nueva empresa?')) {
            event.confirm.resolve();
            this.empresa.store(event.newData).subscribe();
        } else {
            event.confirm.reject();
        }

    }

    update(event): void {
        if (window.confirm('¿Esta seguro de cambiar los datos de esta empresa?')) {
            event.confirm.resolve();
            this.empresa.update(event.newData, event.data.empresa_id).subscribe();
        } else {
            event.confirm.reject();
        }
    }

}
