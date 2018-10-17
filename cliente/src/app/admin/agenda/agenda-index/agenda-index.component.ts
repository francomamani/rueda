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

}
