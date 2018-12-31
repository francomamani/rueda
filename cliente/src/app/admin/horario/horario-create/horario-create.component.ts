import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {HorarioService} from '../horario.service';
import {NbToastrService} from '@nebular/theme';
import { DateFormatter } from 'gb-date-formatter';
import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';


@Component({
    selector: 'ngx-horario-create',
    templateUrl: './horario-create.component.html',
    styleUrls: ['./horario-create.component.scss'],
})
export class HorarioCreateComponent implements OnInit {

    ini: string= this.datePipe.transform(new Date(), 'yyyy-MM-ddThh:mm');
    fi: string= this.datePipe.transform(new Date(), 'yyyy-MM-ddThh:mm');
    iii: Date;
    fff: Date;
    datos = null;
    settings = {
        bigBanner: true,
        timePicker: true,
        format: 'dd/MM/yyyy HH:mm',
        defaultOpen: false,
        closeOnSelect: false,
    };

    constructor(private horarioService: HorarioService,
                private toastr: NbToastrService,
                private datePipe: DatePipe,
                public router: Router) {
    }

    ngOnInit() {
    }

    store() {
        this.iii = new Date(this.ini);
        this.fff = new Date(this.fi);
        if (this.iii.getTime() > this.fff.getTime()) {
            this.toastr.warning('La fecha de inicio debe ser menor a la fecha final');
            return;
        }
        this.datos = {
            inicio: this.datePipe.transform(this.iii, 'yyyy-MM-dd HH:mm:ss'),
            fin: this.datePipe.transform(this.fff, 'yyyy-MM-dd HH:mm:ss'),
        };
        this.horarioService.store(this.datos)
            .subscribe((res: any) => {
                this.toastr.success('Se registró el nuevo horario', 'Éxito');
                this.router.navigate(['/admin/horario/listar']);
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
