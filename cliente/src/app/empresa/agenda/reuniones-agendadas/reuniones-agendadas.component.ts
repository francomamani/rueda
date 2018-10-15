import { Component, OnInit } from '@angular/core';
import {EmpresaService} from '../../../admin/empresa/empresa.service';

@Component({
  selector: 'ngx-reuniones-agendadas',
  templateUrl: './reuniones-agendadas.component.html',
  styleUrls: ['./reuniones-agendadas.component.scss'],
})
export class ReunionesAgendadasComponent implements OnInit {

  reuniones: any = null;
  empresa_id = JSON.parse(atob(localStorage.getItem('rueda-usuario'))).empresa.empresa_id;
  constructor(private empresaService: EmpresaService) {
    this.empresaService.misReuniones(this.empresa_id)
      .subscribe((res: any) => {
        this.reuniones = res;
      });
  }

  ngOnInit() {
  }
  info() {
    
  }

}
