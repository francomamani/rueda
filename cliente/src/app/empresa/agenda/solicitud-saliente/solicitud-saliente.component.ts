import { Component, OnInit } from '@angular/core';
import {AgendaService} from '../agenda.service';
import {AuthService} from '../../../auth.service';

@Component({
  selector: 'ngx-solicitud-saliente',
  templateUrl: './solicitud-saliente.component.html',
  styleUrls: ['./solicitud-saliente.component.scss'],
})
export class SolicitudSalienteComponent implements OnInit {

  solicitudes: any = null;
  constructor(private agendaService: AgendaService,
              private authService: AuthService) {
    const empresa_id = this.authService.getUsuario().empresa_id;
    this.agendaService
        .solicitudesSalientes(empresa_id)
        .subscribe((res: any) => {
          this.solicitudes = res;
        });
  }

  ngOnInit() {
  }

}
