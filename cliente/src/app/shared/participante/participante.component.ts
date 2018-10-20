import { Component, OnInit } from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {ActivatedRoute} from '@angular/router';
import {EmpresaService} from '../../admin/empresa/empresa.service';

@Component({
  selector: 'ngx-participante',
  templateUrl: './participante.component.html',
  styleUrls: ['./participante.component.scss'],
})
export class ParticipanteComponent implements OnInit {

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
  empresa: any = null;
  constructor(private empresaService: EmpresaService,
              private route: ActivatedRoute) {

    this.id_empresa = this.route.snapshot.paramMap.get('empresa_id');
    this.empresaService.show(this.id_empresa)
      .subscribe((res: any) => {
        this.empresa = res;
      });
    this.empresaService.indexParticipantes(this.id_empresa).subscribe((data: any[]) => {
      this.source.load(data);
    });
  }

  ngOnInit() {
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
      this.datos = {
        empresa_id: this.id_empresa,
        nombres: event.newData.nombres,
        apellidos: event.newData.apellidos,
        carnet: event.newData.carnet,
        celular: event.newData.celular,
        cargo: event.newData.cargo,
      };
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
      };
      this.empresaService.updateParticipantes(event.newData, event.data.participante_id).subscribe();
    } else {
      event.confirm.reject();
    }
  }
}
