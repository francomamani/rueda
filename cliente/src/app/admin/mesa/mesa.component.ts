import {Component, OnInit} from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {MesaService} from './mesa.service';
import {NbToastrService} from '@nebular/theme';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {LoadModalComponent} from '../../shared/load-modal/load-modal.component';

@Component({
    selector: 'ngx-mesa',
    templateUrl: './mesa.component.html',
    styleUrls: ['./mesa.component.scss'],
})
export class MesaComponent implements OnInit {

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
            numero: {
                title: 'Número de mesa',
                type: 'string',
            },
            url: {
                title: 'Reunión Zoom',
                type: 'string',
            },
        },
    };

    source: LocalDataSource = new LocalDataSource();

    ngOnInit() {
    }

    constructor(private mesaService: MesaService,
                private toastr: NbToastrService,
                private modalService: NgbModal) {
        this.mesaService.index().subscribe((data: any[]) => {
            this.source.load(data);
        });
    }


    onDeleteConfirm(event): void {
        const loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
        if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
            event.confirm.resolve();
            this.mesaService.destroy(event.data.mesa_id).subscribe((res: any) => {
                this.toastr.success(res.mensaje);
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
            this.mesaService.store(event.newData).subscribe((res: any) => {
                this.toastr.success('Se guardo con éxito');
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
            this.mesaService.update(event.newData, event.data.mesa_id).subscribe((res: any) => {
                this.toastr.success('Se edito con éxito');
                loadModal.dismiss();
            }, error => {
                loadModal.dismiss();
            });
        } else {
            event.confirm.reject();
        }
    }
}
