import { Component, OnInit } from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {SmartTableService} from '../../../@core/data/smart-table.service';
import {RubroService} from '../rubro.service';

@Component({
  selector: 'ngx-rubro-index',
  templateUrl: './rubro-index.component.html',
  styleUrls: ['./rubro-index.component.scss'],
})
export class RubroIndexComponent implements OnInit {



  constructor(private rubroService: RubroService) {
    this.rubroService.index().subscribe((data: any[]) => {
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
    },
    edit: {
      editButtonContent: '<i class="nb-edit"></i>',
      saveButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
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
    if (window.confirm('Are you sure you want to delete?')) {
      event.confirm.resolve();
    } else {
      event.confirm.reject();
    }
  }

}
