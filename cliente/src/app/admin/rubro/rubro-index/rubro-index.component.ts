import {Component, OnInit, ViewChild} from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {SmartTableService} from '../../../@core/data/smart-table.service';
import {RubroService} from '../rubro.service';

@Component({
  selector: 'ngx-rubro-index',
  templateUrl: './rubro-index.component.html',
  styleUrls: ['./rubro-index.component.scss'],
})
export class RubroIndexComponent implements OnInit {



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

  constructor(private rubroService: RubroService) {
    this.rubroService.index().subscribe((data: any[]) => {
      this.source.load(data);
    });
  }


  onDeleteConfirm(event): void {
    if (window.confirm('Are you sure you want to delete?')) {
      event.confirm.resolve();
      this.rubroService.destroy(event.data.rubro_id)
        .subscribe(res => {
          console.log(res);
        });
    } else {
      event.confirm.reject();
    }
  }
  store(event): void {
    if (window.confirm('Esta seguro de crear?')) {
      event.confirm.resolve();
      this.rubroService.store(event.newData)
        .subscribe(res => {
          console.log(res);
        });
    } else {
      event.confirm.reject();
    }

  }

}
