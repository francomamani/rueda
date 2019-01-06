import { Component, OnInit } from '@angular/core';
import {EvaluacionReunionesService} from '../../../shared/evaluacion-reuniones/evaluacion-reuniones.service';
import { ReportesService } from '../reportes.service'

@Component({
  selector: 'ngx-evaluacion-reunion',
  templateUrl: './evaluacion-reunion.component.html',
  styleUrls: ['./evaluacion-reunion.component.scss'],
})
export class EvaluacionReunionComponent implements OnInit {
  preguntas = [
    {
      key: 'dos',
      value: '¿Se efectuó su reunión?: ',
    },
    {
      key: 'tres',
      value: 'La posibilidad de concretar operaciones comerciales con la empresa es: ',
    },
    {
      key: 'cuatro',
      value: '¿Qué operaciones realizo en su transacción?',
    },
    {
      key: 'cinco',
      value: 'Monto estimado de la operacion en dolares americanos',
    },
    {
      key: 'seis',
      value: 'Plazo estimado de la operación (meses)',
    },
  ];
  chart = {
    title: 'Estadisticas por Pregunta',
    type: 'BarChart',
    width: 950,
    data: [],
    columnNames: [
      'Pregunta',
      'Total',
    ],
    roles: [],
    options: {
      animation: {
        duration: 250,
        easing: 'ease-in-out',
        startup: true,
      },
    },
  };
  parametro = null;

  constructor(private evaluacionReunionesService: EvaluacionReunionesService,
              private reporteService: ReportesService) { }

  ngOnInit() {
  }

  loadChart(parametro) {
    this.evaluacionReunionesService.reporteReunion(parametro)
      .subscribe((res: any) => {
        this.chart.data = res;
      });
  }
  descargar() {
    this.evaluacionReunionesService.excelReunion()
      .subscribe((json: any) => {
        this.reporteService.exportAsExcelFile(json,'Evaluación de Reuniones');
      });
  }
}
