import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {HorarioService} from '../horario.service';
import {NbToastrService} from '@nebular/theme';
import { DateFormatter } from 'gb-date-formatter';
import {DatePipe} from '@angular/common';


@Component({
    selector: 'ngx-horario-create',
    templateUrl: './horario-create.component.html',
    styleUrls: ['./horario-create.component.scss'],
})
export class HorarioCreateComponent implements OnInit {

    ini: Date = new Date();
    fi: Date = new Date();
    iii: Date = this.ini;
    fff: Date = this.fi;
    settings = {
        bigBanner: true,
        timePicker: true,
        format: 'dd/MM/yyyy HH:mm',
        defaultOpen: false,
        closeOnSelect: false,
    };

    constructor(private horarioService: HorarioService,
                private toastr: NbToastrService,
                private datePipe: DatePipe) {
    }

    ngOnInit() {
    }

    store() {
        if (this.iii.getTime() > this.fff.getTime()) {
            this.toastr.warning('La fecha de inicio debe ser menor a la fecha final');
            return;
        }
        this.datos = {
            inicio: this.datePipe.transform(this.ini, 'yyyy-MM-dd HH:mm:ss'),
            fin: this.datePipe.transform(this.fi, 'yyyy-MM-dd HH:mm:ss'),
        };
        this.horarioService.store(this.datos)
            .subscribe((res: any) => {
                this.toastr.success('Se registró el nuevo horario', 'Éxito');
                this.ini = new Date();
                this.fi = new Date();
                this.iii = this.ini;
                this.fff = this.fi;
            });
    }

    format: DateFormatter= new DateFormatter();
    onInicio(event): void {
        this.iii = event;
        if (this.fff != null) {
            if (this.iii.getTime() > this.fff.getTime())
                this.toastr.warning('La fecha de inicio debe ser menor a la fecha final');
        }
    }
    onFin(event): void {
        this.fff = event;
        if (this.iii != null) {
            if (this.iii.getTime() > this.fff.getTime())
                this.toastr.warning('La fecha de inicio debe ser menor a la fecha final');
        }
    }

}
