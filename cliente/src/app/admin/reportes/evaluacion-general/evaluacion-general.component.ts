import { Component, OnInit } from '@angular/core';
import {EvaluacionGeneralService} from '../../../empresa/evaluacion-general/evaluacion-general.service';

@Component({
  selector: 'ngx-evaluacion-general',
  templateUrl: './evaluacion-general.component.html',
  styleUrls: ['./evaluacion-general.component.scss'],
})
export class EvaluacionGeneralComponent implements OnInit {

  preguntas = [
    {
      key: 'uno',
      value: '1. Atencion brindada por los organizadores es: ',
    },
    {
      key: 'dos',
      value: '2. El servicio de acreditacion es: ',
    },
    {
      key: 'tres',
      value: '3. La organizacion de las reuniones es: ',
    },
    {
      key: 'cuatro',
      value: '4. La calidad de la informacion recibida antes del evento es: ',
    },
    {
      key: 'cinco',
      value: '5. La calidad de la informacion recibida durante el evento es: ',
    },
    {
      key: 'seis',
      value: '6. Su empresa es: ',
    },
    {
      key: 'siete',
      value: '7. ¿De qué medio de comunicación se enteró de este evento?',
    },
    {
      key: 'ocho',
      value: '8. ¿Participaría nuevamente en un evento de este tipo?',
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

  constructor(private evaluacionGeneralService: EvaluacionGeneralService) { }

  ngOnInit() {
  }

  loadChart(parametro) {
    this.evaluacionGeneralService.reporteGeneral(parametro)
      .subscribe((res: any) => {
        this.chart.data = res;
      });
  }
}
