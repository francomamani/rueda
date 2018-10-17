import { Component, OnInit } from '@angular/core';
import {AgendaService} from '../agenda.service';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-agenda-index',
  templateUrl: './agenda-index.component.html',
  styleUrls: ['./agenda-index.component.scss']
})
export class AgendaIndexComponent implements OnInit {

    agendas: any = null;
    constructor(private agendaService: AgendaService,
                private toastr: NbToastrService) {
        this.agendaService.index()
            .subscribe((res: any) => {
                this.agendas = res;
            });
    }
  ngOnInit() {
  }

  datos:any;
    aceptar(id_agenda) {
        if (window.confirm('¿Esta seguro aceptar esta cita?')) {
            this.datos = {
                agenda_id: id_agenda,
                estado: 'aceptado',
            }
            this.agendaService.cambiarEstado(this.datos)
                .subscribe((res: any) => {
                    this.cargar()
                });
        }

    }

    rechazar(id_agenda) {
        if (window.confirm('¿Esta seguro de rechazar esta cita?')) {
            this.datos = {
                agenda_id: id_agenda,
                estado: 'rechazado',
            }
            this.agendaService.cambiarEstado(this.datos)
                .subscribe((res: any) => {
                    this.cargar();
                });
        }
    }

    cargar(){
        this.agendaService.index()
            .subscribe((res: any) => {
                this.agendas = res;
            });
    }

}
