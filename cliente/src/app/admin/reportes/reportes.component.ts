import {Component, OnInit} from '@angular/core';
import {EmpresaService} from '../empresa/empresa.service';
import {AgendaService} from '../agenda/agenda.service';
import {forEach} from "@angular/router/src/utils/collection";

@Component({
    selector: 'ngx-reportes',
    templateUrl: './reportes.component.html',
    styleUrls: ['./reportes.component.scss'],
})
export class ReportesComponent implements OnInit {

    empresas = 0;
    citas = 0;
    pendientes = 0;
    aceptados = 0;
    rechazados = 0;

    colorN = "{.progress-value { height: 0.6rem; background: #fff;}";
    colorA = '';
    colorP = '';
    colorR = '';

    constructor(private empresasService: EmpresaService,
                private agendaService: AgendaService) {
        this.empresasService.empresasListar().subscribe((res: any[]) => {
            this.empresas = res.length;
            this.change();
        });
        this.agendaService.index().subscribe((res: any[]) => {
            this.citas = res.length;
            for (let a of res) {
                if (a.estado === 'aceptado')
                    this.aceptados++;
                else if (a.estado === 'rechazado')
                    this.rechazados++;
                else if (a.estado === 'pendiente')
                    this.pendientes++;
            }
            this.change();
        });
    }

    ngOnInit() {
    }

    progressInfoData = [
        {
            title: 'Empresas participantes',
            value: this.empresas,
            activeProgress: 100,
            description: 'Cantidad de empresas participantes de la rueda de negocios',
        },
        {
            title: 'Citas',
            value: this.citas,
            activeProgress: 100,
            description: 'Cantidad de citas realizadas en total',
        },
        {
            title: 'Citas pendientes',
            value: this.pendientes,
            activeProgress: (this.pendientes / this.citas * 100),
            description: 'Cantidad de citas Pendientes',
        },
        {
            title: 'Citas Aceptadas',
            value: this.aceptados,
            activeProgress: (this.aceptados / this.citas * 100),
            description: 'Cantidad de citas Aceptadas',
        },
        {
            title: 'Citas Rechazadas',
            value: this.rechazados,
            activeProgress: (this.rechazados / this.citas * 100),
            description: 'Cantidad de citas REchazadas',
        },
    ];

    change() {
        this.progressInfoData = [
            {
                title: 'Empresas participantes',
                value: this.empresas,
                activeProgress: 100,
                description: 'Cantidad de empresas participantes de la rueda de negocios',
            },
            {
                title: 'Citas',
                value: this.citas,
                activeProgress: 100,
                description: 'Cantidad de citas realizadas en total',
            },
            {
                title: 'Citas pendientes',
                value: this.pendientes,
                activeProgress: (this.pendientes / this.citas * 100),
                description: 'Cantidad de citas Pendientes',
            },
            {
                title: 'Citas Aceptadas',
                value: this.aceptados,
                activeProgress: (this.aceptados / this.citas * 100),
                description: 'Cantidad de citas Aceptadas',
            },
            {
                title: 'Citas Rechazadas',
                value: this.rechazados,
                activeProgress: (this.rechazados / this.citas * 100),
                description: 'Cantidad de citas REchazadas',
            },
        ];
    }
}
