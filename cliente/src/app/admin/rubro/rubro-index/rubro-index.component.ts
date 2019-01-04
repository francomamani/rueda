import {Component, OnInit, ViewChild} from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {SmartTableService} from '../../../@core/data/smart-table.service';
import {RubroService} from '../rubro.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {LoadModalComponent} from '../../../shared/load-modal/load-modal.component';

@Component({
    selector: 'ngx-rubro-index',
    templateUrl: './rubro-index.component.html',
    styleUrls: ['./rubro-index.component.scss'],
})
export class RubroIndexComponent implements OnInit {


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

    constructor(private rubroService: RubroService,
                private modalService: NgbModal) {
        this.rubroService.index().subscribe((data: any[]) => {
            this.source.load(data);
        });
    }


    onDeleteConfirm(event): void {
        const loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });

        if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
            event.confirm.resolve();
            this.rubroService.destroy(event.data.rubro_id).subscribe(res=>{
                loadModal.dismiss();
            }, error => {
                loadModal.dismiss();
            });
        } else {
            event.confirm.reject();
        }
    }

    store(event): void {
        const loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
        if (window.confirm('¿Esta seguro de crear nuevo registro?')) {
            event.confirm.resolve();
            this.rubroService.store(event.newData).subscribe(res=>{
                loadModal.dismiss();
            }, error => {
                loadModal.dismiss();
            });
        } else {
            event.confirm.reject();
        }

    }

    update(event): void {
        const loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
        if (window.confirm('¿Esta seguro de cambiar los datos de este registro?')) {
            event.confirm.resolve();
            this.rubroService.update(event.newData, event.data.rubro_id).subscribe(res=>{
                loadModal.dismiss();
            }, error => {
                loadModal.dismiss()
            });
        } else {
            event.confirm.reject();
        }
    }

}
