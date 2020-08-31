import {Component, OnInit} from '@angular/core';
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
    {provide: 'Window', useValue: window},
  ],
})
export class ReunionesAgendadasComponent implements OnInit {

  reuniones: any = null;
  empresa_id = null;
  mi_empresa = null;
  rubro = null;
  habilitado = null;
  admin: boolean = null;

  constructor(private empresaService: EmpresaService,
              private route: ActivatedRoute,
              private reunionService: ReunionService,
              private router: Router,
              private authService: AuthService,
              private modalService: NgbModal) {
  }

  ngOnInit() {
    this.route.params.subscribe(params => {
      if (params.empresa_id) {
        this.empresa_id = parseInt(params.empresa_id, 10);
        this.empresaService.mostrar(parseInt(params.empresa_id, 10))
          .subscribe((res: any) => {
            this.mi_empresa = res.nombre;
            this.rubro = res.rubro;
            this.habilitado = res.habilitado;
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
      });
  }

  info(empresa, fecha_hora_registro_reunion) {
    const activeModal = this.modalService.open(EmpresaModalComponent, {size: 'lg', container: 'nb-layout'});
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
    if (confirm('¿Esta seguro de eliminar esta reunión?')) {
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

  pdf_agenda() {
    this.empresaService.mostrar(this.empresa_id)
      .subscribe((empresa: any) => {
        if (this.reuniones.length > 0) {
          const doc = new jsPDF('landscape', 'mm', 'letter');

          const logo = new Image();
          /*          logo.src = 'assets/images/fimem.jpeg';*/
          logo.src = 'assets/images/bioseguridad.jpeg';
          doc.addImage(logo, 'JPEG', 215, 22, 45, 15);
          /*          doc.addImage(logo, 'JPEG', 220, 15, 35, 20);*/


          doc.setFontSize(10);
          doc.setFontStyle('bold');

          /*          doc.text('AGENDA DE REUNIONES FIMEM BOLIVIA', 20, 20);*/
          doc.text('AGENDA DE REUNIONES BIOSEGURIDAD 2020', 20, 20);
          doc.text('EMPRESA', 20, 30);
          doc.setFontStyle('normal');
          doc.text(this.mi_empresa.toUpperCase(), 50, 30);
          doc.setFontStyle('bold');
          doc.text('RUBRO', 20, 37);

          doc.setFontStyle('bold');
          doc.text('REUNIONES', 139.7, 44, 'center');
          doc.setFontStyle('normal');

          if (empresa.rubro.nombre.toUpperCase().length < 50) {
            doc.text(empresa.rubro.nombre.toUpperCase(), 50, 37);
          } else {
            const parte1 = empresa.rubro.nombre.toUpperCase().substring(0, 53);
            const parte2 = empresa.rubro.nombre.toUpperCase().substring(53);
            doc.text(parte1, 50, 37);
            doc.text(parte2, 50, 44);
          }

          doc.setFontStyle('bold');
          doc.line(20, 50, 259.4, 50);
          doc.text('HORARIO', 25, 57);
          doc.text('MESA', 65, 57);
          doc.text('SOLICITANTE', 80, 57);
          doc.text('DEMANDADA', 135, 57);
          doc.text('REUNIÓN ZOOM', 205, 57);
          doc.line(20, 62, 259.4, 62);
          /*          doc.line(x - 5, y - 5, 259.4, y - 5);*/
          let x = 25;
          let y = 68;
          let ln = false;
          /*test*/
          /*          const reunionesBK = this.reuniones[0];
                    for (let i = 0; i < 100; i++) {
                      this.reuniones.push(reunionesBK);
                    }*/
          /*end test*/
          doc.setFontStyle('normal');
          let page = 1;
          this.reuniones.forEach((reunion: any) => {
            doc.setTextColor(0, 0, 0);
            doc.setFontStyle('normal');
            doc.text(this.formatDate(new Date(reunion.desde)) + ' ' +
              this.formatTime(new Date(reunion.desde)) + '-' +
              this.formatTime(new Date(reunion.hasta)), x, y);
            doc.text(reunion.mesa, x + 45, y);

            ln = false;
            const yBase = y;
            if (reunion.empresa_solicitante.nombre.length < 25) {
              doc.text(reunion.empresa_solicitante.nombre.toUpperCase(), x + 55, y);
            } else {
              doc.text(reunion.empresa_solicitante.nombre.toUpperCase().substring(0, 24), x + 55, y);
              doc.text(reunion.empresa_solicitante.nombre.toUpperCase().substring(24), x + 55, y + 7);
              ln = true;
            }

            if (reunion.empresa_demandada.nombre.length < 25) {
              doc.text(reunion.empresa_demandada.nombre.toUpperCase(), x + 110, y);
            } else {
              doc.text(reunion.empresa_demandada.nombre.toUpperCase().substring(0, 24), x + 110, y);
              doc.text(reunion.empresa_demandada.nombre.toUpperCase().substring(24), x + 110, y + 7);
              ln = true;
            }

            if (ln) {
              y += 7;
            }

            doc.setTextColor(0, 0, 255);
            doc.setFontStyle('bold');
            doc.setFontSize(8);
            doc.text(reunion.url, x + 180, yBase);
            doc.setFontSize(10);
            doc.setTextColor(0, 0, 0);
            doc.line(x - 5, y + 4, 259.4, y + 4);
            y += 10;
            doc.text(`${page}`, 255, 205.9);
            if (y >= 195.9) {
              doc.addPage();
              page++;
              /*begin*/
              /*          logo.src = 'assets/images/fimem.jpeg';*/
              doc.addImage(logo, 'JPEG', 215, 22, 45, 15);
              /*          doc.addImage(logo, 'JPEG', 220, 15, 35, 20);*/


              doc.setFontSize(10);
              doc.setFontStyle('bold');

              /*          doc.text('AGENDA DE REUNIONES FIMEM BOLIVIA', 20, 20);*/
              doc.text('AGENDA DE REUNIONES BIOSEGURIDAD 2020', 20, 20);
              doc.text('EMPRESA', 20, 30);
              doc.setFontStyle('normal');
              doc.text(this.mi_empresa.toUpperCase(), 50, 30);
              doc.setFontStyle('bold');
              doc.text('RUBRO', 20, 37);

              doc.setFontStyle('bold');
              doc.text('REUNIONES', 139.7, 44, 'center');
              doc.setFontStyle('normal');

              if (empresa.rubro.nombre.toUpperCase().length < 50) {
                doc.text(empresa.rubro.nombre.toUpperCase(), 50, 37);
              } else {
                const parte1 = empresa.rubro.nombre.toUpperCase().substring(0, 53);
                const parte2 = empresa.rubro.nombre.toUpperCase().substring(53);
                doc.text(parte1, 50, 37);
                doc.text(parte2, 50, 44);
              }

              doc.setFontStyle('bold');
              doc.line(20, 50, 259.4, 50);
              doc.text('HORARIO', 25, 57);
              doc.text('MESA', 65, 57);
              doc.text('SOLICITANTE', 80, 57);
              doc.text('DEMANDADA', 135, 57);
              doc.text('REUNIÓN ZOOM', 205, 57);
              doc.line(20, 62, 259.4, 62);
              /*          doc.line(x - 5, y - 5, 259.4, y - 5);*/
              x = 25;
              y = 68;
              ln = false;

              doc.setFontStyle('normal');

              /*end*/
            }
          });
          doc.save(`AGENDA ${this.mi_empresa.toUpperCase()}.pdf`);
        }
      });
  }
}
