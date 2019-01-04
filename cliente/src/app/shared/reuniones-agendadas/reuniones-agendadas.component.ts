import { Component, OnInit } from '@angular/core';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {ActivatedRoute, Router} from '@angular/router';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {AuthService} from '../../auth.service';
import {EmpresaModalComponent} from '../empresa-modal/empresa-modal.component';
import {ReunionService} from '../../admin/reunion/reunion.service';
import * as jsPDF from 'jspdf'

@Component({
  selector: 'ngx-reuniones-agendadas',
  templateUrl: './reuniones-agendadas.component.html',
  styleUrls: ['./reuniones-agendadas.component.scss'],
  providers: [
      { provide: 'Window',  useValue: window },
  ],
})
export class ReunionesAgendadasComponent implements OnInit {

  reuniones: any = null;
  empresa_id = null;
  mi_empresa = null;
  habilitado = null;
  admin: boolean = null;
  constructor(private empresaService: EmpresaService,
              private route: ActivatedRoute,
              private reunionService: ReunionService,
              private router: Router,
              private authService: AuthService,
              private modalService: NgbModal) {
    this.route.params.subscribe(params => {
      if (params.empresa_id) {
        this.empresa_id = parseInt(params.empresa_id, 10);
        this.empresaService.show(parseInt(params.empresa_id, 10))
          .subscribe((res: any) => {
            this.mi_empresa = res.nombre;
            this.habilitado  = res.habilitado;
            this.admin = true;

          });
      } else {
        this.empresa_id = this.authService.getUsuario().empresa_id;
        this.mi_empresa = this.authService.getUsuario().nombre;
        this.habilitado = this.authService.getUsuario().habilitado;
        this.admin = false;
      }
    });


    this.empresaService.misReuniones(this.empresa_id)
      .subscribe((res: any) => {
        this.reuniones = res;
        console.log(this.reuniones);

      });
  }

  ngOnInit() {
  }

  info(empresa, fecha_hora_registro_reunion) {
    const activeModal = this.modalService.open(EmpresaModalComponent, { size: 'lg', container: 'nb-layout' });
    activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
    activeModal.componentInstance.empresa = empresa;
    activeModal.componentInstance.fecha_hora_registro_reunion = fecha_hora_registro_reunion;
  }

  go(reunion_id) {
    if (this.admin) {
      this.router.navigate(['/admin/evaluacion-reunion/' + reunion_id + '/' + this.empresa_id]);
    } else {
      this.router.navigate(['/empresa/evaluacion-reunion/' + reunion_id + '/' + this.empresa_id]);
    }
  }

  cancelar(reunion_id, index) {
    if ( confirm('¿Esta seguro de eliminar esta reunión?') ) {
      this.reunionService.destroy(reunion_id)
        .subscribe(res => {
          this.empresaService.misReuniones(this.empresa_id)
            .subscribe((res2: any) => {
              this.reuniones = res2;
            });
        });
    }
  }

  formatDate(date) {
      let dia = date.getDate();
      let mes = date.getMonth() + 1;
      const anio = date.getFullYear();
      if (mes < 10) {
          mes = '0' + mes;
      }
      if (dia < 10) {
          dia = '0' + dia;
      }
      return dia + '/' + mes + '/' + anio;
  }
  formatTime(time) {
      let horas = time.getHours();
      let minutos = time.getMinutes();
      if (horas < 10) {
          horas = '0' + horas;
      }
      if (minutos < 10) {
          minutos = '0' + minutos;
      }
      return horas + ':' + minutos;
  }

  pdf_agenda(){

    if(this.reuniones.length>0) {
        const doc = new jsPDF();

        doc.setFontSize(11);
        doc.setFontStyle('bold');
        doc.text('AGENDA', 100, 20);
        doc.text('EMPRESA', 25, 30);
        doc.setFontStyle('normal');
        doc.text(this.reuniones[0].empresa_solicitante.nombre.toUpperCase(), 50, 30);
        doc.setFontStyle('bold');
        //doc.text('RUBRO', 25, 40);
        doc.setFontStyle('normal');
       /* if (this.reuniones[0].empresa_solicitante.nombre.length < 50) {
            doc.text(agenda.empresa.rubro.toUpperCase(), 50, 40);
        } else {
            const parte1 = agenda.empresa.rubro.toUpperCase().substring(0, 53);
            const parte2 = agenda.empresa.rubro.toUpperCase().substring(53);
            doc.text(parte1, 50, 40);
            doc.text(parte2, 50, 48);
        }*/

        doc.setFontStyle('bold');
        doc.line(25, 55, 200, 55);
        doc.text('HORARIO', 30, 60);
        doc.text('MESA', 90, 60);
        doc.text('EMPRESA', 120, 60);
        doc.line(25, 65, 200, 65);
        const x = 30;
        let y = 70;
        doc.setFontStyle('normal');
        this.reuniones.forEach((reunion: any) => {
            doc.line(x - 5, y - 5, 200, y - 5);
            doc.text(this.formatDate(new Date(reunion.desde)) + ' ' +
                this.formatTime(new Date(reunion.desde)) + '-' +
                this.formatTime(new Date(reunion.hasta)), x, y);
            doc.text(reunion.mesa, x + 60, y);
            doc.text(reunion.empresa_demandada.nombre.toUpperCase(), x + 90, y);
            doc.line(x - 5, y + 5, 200, y + 5);
            y += 10;
        });
        doc.save('agenda.pdf');
    }
  }
}
