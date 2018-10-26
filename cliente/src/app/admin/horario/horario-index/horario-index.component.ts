import { Component, OnInit } from '@angular/core';
import {LocalDataSource} from 'ng2-smart-table';
import {HorarioService} from '../horario.service';
import {NbToastrService} from '@nebular/theme';
import 'rxjs/add/operator/map';
import {FormBuilder, FormGroup} from '@angular/forms';
@Component({
  selector: 'ngx-horario-index',
  templateUrl: './horario-index.component.html',
  styleUrls: ['./horario-index.component.scss'],
})
export class HorarioIndexComponent implements OnInit {
    horarios = null;
    horariosBk = null;
    buscarGroup: FormGroup;
  constructor(private horarioService: HorarioService,
              private fb: FormBuilder,
              private toastr: NbToastrService) {
      this.createForm();
      this.horarioService.index()
          .subscribe((data: any[]) => {
            this.horarios = data.map(res => {
              res.edit = false;
              return res;
            });
            this.horariosBk = this.horarios;
          });
  }

  createForm() {
    this.buscarGroup = this.fb.group({
      'search' : [''],
    });
  }
  ngOnInit() {
  }
  buscar() {
    this.horarios = this.horariosBk;
    if ( this.buscarGroup.value.search.length > 0) {
      this.horarios = this.horarios.filter((horario: any) => {
        return horario.inicio.toString().indexOf(this.buscarGroup.value.search) > 1 ||
          horario.fin.toString().indexOf(this.buscarGroup.value.search) > 1;
      });
    } else {
      this.horarios = this.horariosBk;
    }
  }

  update(horario) {
    this.horarioService.update(horario, horario.horario_id)
      .subscribe(res => {
        horario.edit = false;
        this.toastr.success('Horario actualizado', 'Exito');
      });
  }
  destroy(horario, index): void {
      if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
          this.horarioService.destroy(horario.horario_id)
              .subscribe((res: any) => {
                  this.toastr.success(res.mensaje, 'Exito');
                  this.horarios.splice(index, 1);
              });
      }
  }

}
