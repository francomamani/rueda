import {Component, OnInit} from '@angular/core';
import {NbToastrService} from '@nebular/theme';
import {HorariosOcupadosService} from '../horarios-ocupados.service';
import {ActivatedRoute, Router} from '@angular/router';

@Component({
    selector: 'ngx-horarios-ocupados-index',
    templateUrl: './horarios-ocupados-index.component.html',
    styleUrls: ['./horarios-ocupados-index.component.scss'],
})
export class HorariosOcupadosIndexComponent implements OnInit {

    horarios: any = null;
    tipo_ruta: any;
    id_empresa: any;
    ruta: any;

    constructor(private horarioOcService: HorariosOcupadosService,
                private toastr: NbToastrService,
                private route: ActivatedRoute,
                private _router: Router) {
        this.id_empresa = this.route.snapshot.paramMap.get('id_empresa');
        this.tipo_ruta = this.route.snapshot.paramMap.get('tipo_ruta');
        this.ruta = '/' + this.tipo_ruta + '/horarios-ocupados/crear/'+this.tipo_ruta+'/' + this.id_empresa;
        this.horarioOcService.index(this.id_empresa)
            .subscribe((res: any) => {
                this.horarios = res;
            });
    }

    ngOnInit() {
    }

    onDeleteConfirm(horario, index): void {
        if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
            this.horarioOcService.destroy(horario.horario_ocupado_id)
                .subscribe((res: any) => {
                    this.horarios.splice(index, 1);
                    this.toastr.success(res.mensaje, 'Exito');
                });
        }
    }

    crear() {
        this._router.navigate([this.ruta]);
    }

    updateHorario(horario) {
      const data = {
        horario_id: horario.horario_id,
        empresa_id: this.id_empresa
      };
      this.horarioOcService.updateHorarioOcupado(data).subscribe(res => {
        console.log(res);
        this.horarioOcService.index(this.id_empresa)
          .subscribe((res2: any) => {
            this.horarios = res2;
          });
      });
    }

}
