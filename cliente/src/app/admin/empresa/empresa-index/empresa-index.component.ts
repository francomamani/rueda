import {Component, Inject, OnInit} from '@angular/core';
import {EmpresaService} from '../empresa.service';
import {NbToastrService} from '@nebular/theme';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {RubroService} from '../../rubro/rubro.service';
import {environment} from '../../../../environments/environment.prod';
import {VoucherModalComponent} from '../../voucher-modal/voucher-modal.component';
import {ExcelServiceService} from './excel-service.service';
import {LoadModalComponent} from '../../../shared/load-modal/load-modal.component';
import {ReunionService} from '../../reunion/reunion.service';
import * as jsPDF from 'jspdf';
import {DateTime} from 'luxon';

@Component({
  selector: 'ngx-empresa-index',
  templateUrl: './empresa-index.component.html',
  styleUrls: ['./empresa-index.component.scss'],
  providers: [
    {provide: 'Window', useValue: window},
  ],
})
export class EmpresaIndexComponent implements OnInit {

  modalReference: any;
  agendasMesaFecha: string;
  buscarGroup: FormGroup;
  agendas: any = null;
  empresas: any = null;
  empresasBK: any = null;
  rubros: any = null;
  logo = environment.base + 'mostrar-logo/';
  logo_default = environment.base + environment.empresa_logo;
  lista: any[];
  cont = 0;

  rueda: {
    habilitado: boolean
  };

  constructor(private empresaService: EmpresaService,
              private reunionService: ReunionService,
              private rubroService: RubroService,
              private fb: FormBuilder,
              private modalService: NgbModal,
              private toastr: NbToastrService,
              private excelService: ExcelServiceService,
              @Inject('Window') private window: Window) {
    this.empresaService.ruedaMostrar().subscribe((rueda: any) => {
      this.rueda = rueda;
    });
    this.createForm();
    const loadModal = this.modalService.open(LoadModalComponent, {size: 'sm', container: 'nb-layout'});
    this.empresaService.empresasListar()
      .subscribe((res: any) => {
        this.empresas = res;
        this.empresasBK = this.empresas;
        loadModal.dismiss();
      }, error => {
        loadModal.dismiss();
      });
    this.rubroService.index()
      .subscribe((res: any) => {
        this.rubros = res;
      });
  }

  ngOnInit() {
  }

  createForm() {
    this.buscarGroup = this.fb.group({
      'rubro_id': new FormControl(0, [Validators.required]),
      'search': new FormControl('', [Validators.required]),
    });
  }

  habilitarRueda() {
    this.empresaService.ruedaHabilitar().subscribe((rueda: any) => {
      this.rueda = rueda;
    });
  }

  deshabilitarRueda() {
    this.empresaService.ruedaDeshabilitar().subscribe((rueda: any) => {
      this.rueda = rueda;
    });
  }

  buscar() {
    const search = this.buscarGroup.value.search;
    this.empresas = this.empresasBK;
    if (search === '') {
      this.empresaService.empresasListar()
        .subscribe((res: any) => {
          this.empresas = res;
          this.empresasBK = this.empresas;
        });
    } else {
      this.empresaService.buscar(this.buscarGroup.value)
        .subscribe((res: any) => {
          this.empresas = res;
        });
    }
  }

  reload() {
    this.empresaService.empresasListar()
      .subscribe((res: any) => {
        this.empresas = res;
      });
  }

  info(empresa) {
    const activeModal = this.modalService.open(EmpresaModalComponent, {size: 'lg', container: 'nb-layout'});
    activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
    activeModal.componentInstance.empresa = empresa;
  }

  cambiarLogo(event, empresa) {
    const formData = new FormData();
    if (event.srcElement.files[0]) {
      formData.append('logo', event.srcElement.files[0]);
    }
    this.empresaService
      .cambiarLogo(empresa.empresa_id, formData)
      .subscribe(res => {
        this.reload();
      });
  }

  onDeleteConfirm(empresa, index): void {
    if (window.confirm('¿Esta seguro que quiere eliminar este registro?')) {
      this.empresaService.destroy(empresa.empresa_id)
        .subscribe((res: any) => {
          this.empresas.splice(index, 1);
          this.toastr.success(res.mensaje, 'Exito');
        });
    }
  }

  comprobante(empresa) {
    const compModal = this.modalService.open(VoucherModalComponent, {size: 'lg', container: 'nb-layout'});
    compModal.componentInstance.id_empresa = empresa.empresa_id;
    if (empresa.voucher !== null)
      compModal.componentInstance.comp = environment.base + 'voucher/' + empresa.voucher.split('/')[1];
    compModal.result.then(() => {
      this.reload();
    });
  }

  descargar() {
    const copia = this.empresas;
    const empresas = [];
    let i = 1;
    copia.forEach((empresa: any) => {
      empresas.push({
        n: i,
        rubro: empresa.rubro,
        empresa: empresa.nombre,
        cuenta: empresa.usuario.cuenta,
        direccion: empresa.direccion,
        telefono: empresa.telefono,
        ciudad_localidad: empresa.ciudad_localidad,
        nit: empresa.nit,
        pagina_web: empresa.pagina_web,
        representante_legal: empresa.representante_legal,
        habilitado: empresa.habilitado === 1 ? 'si' : 'no',
        max_participantes: empresa.max_participantes,
        oferta: empresa.oferta,
        demanda: empresa.demanda,
        fecha_hora_registro: empresa.created_at,
        fecha_hora_edicion_registro: empresa.updated_at,
      });
      i++;
    });
    this.excelService.exportAsExcelFile(empresas, 'empresas-registradas');
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

  pdf_agendas() {
    this.lista = [];
    this.cont = 0;
    this.empresaService.agendas()
      .subscribe(res => {
        const logo = new Image();
        /*        logo.src = 'assets/images/fimem.jpeg';*/
        logo.src = 'assets/images/bioseguridad.jpeg';
        this.agendas = res;
        const doc = new jsPDF('landscape', 'mm', 'letter');
        const ll = this.agendas.agendas;
        ll.forEach((l: any) => {
          this.empresas.forEach((em: any) => {
            if (l.empresa.empresa_id === em.empresa_id) {
              this.lista.push(l);
              return true;
            }
          });
        });
        this.lista.forEach((agenda: any) => {
          if (this.cont > 0)
            doc.addPage();
          doc.setFontSize(10);
          /*          doc.addImage(logo, 'JPEG', 220, 15, 50, 20);*/
          doc.addImage(logo, 'JPEG', 215, 25, 45, 15);
          doc.setFontStyle('bold');
          /*          doc.text('AGENDA RUEDA DE NEGOCIOS FIMEM BOLIVIA', 20, 20);*/
          doc.text('AGENDA RUEDA DE NEGOCIOS DE BIOSEGURIDAD 2020', 20, 20);
          doc.text('EMPRESA', 20, 30);
          doc.setFontStyle('normal');
          doc.text(agenda.empresa.nombre.toUpperCase(), 50, 30);
          doc.setFontStyle('bold');
          doc.text('RUBRO', 20, 37);
          doc.setFontStyle('bold');
          doc.text('REUNIONES', 139.7, 50, 'center');
          doc.setFontStyle('normal');
          if (agenda.empresa.rubro.nombre.length < 50) {
            doc.text(agenda.empresa.rubro.nombre.toUpperCase(), 50, 37);
          } else {
            const parte1 = agenda.empresa.rubro.nombre.toUpperCase().substring(0, 53);
            const parte2 = agenda.empresa.rubro.nombre.toUpperCase().substring(53);
            doc.text(parte1, 50, 37);
            doc.text(parte2, 50, 42);
          }
          doc.setFontStyle('bold');
          doc.line(20, 55, 259.4, 55);
          doc.text('HORARIO', 25, 61);
          doc.text('MESA', 70, 61);
          doc.text('SOLICITANTE', 90, 61);
          doc.text('DEMANDADA', 145, 61);
          doc.text('REUNIÓN DE ZOOM', 205, 61);
          doc.line(20, 64, 259.4, 64);
          let x = 25;
          let y = 70;
          doc.setFontStyle('normal');
          doc.setFontSize(9);
          /*test*/
          /*          const reunion = agenda.reuniones[0];
                    for (let i = 0; i < 100; i++) {
                      agenda.reuniones.push(reunion);
                    }*/
          /*end test*/
          let page = 1;
          agenda.reuniones.forEach((reunion: any) => {
            /*            doc.line(x - 5, y - 6, 259.4, y - 6);*/
            let ln = false;

            doc.text(this.formatDate(new Date(reunion.desde)) + ' ' +
              this.formatTime(new Date(reunion.desde)) + '-' +
              this.formatTime(new Date(reunion.hasta)), x, y);
            doc.text(reunion.mesa, x + 45, y);
            if (reunion.empresa_solicitante.length < 25) {
              doc.text(reunion.empresa_solicitante, x + 65, y);
            } else {
              ln = true;
              doc.text(reunion.empresa_solicitante.substring(0, 24), x + 65, y);
              doc.text(reunion.empresa_solicitante.substring(24), x + 65, y + 7);
            }
            if (reunion.empresa_demandada.length < 25) {
              doc.text(reunion.empresa_demandada, x + 120, y);
            } else {
              ln = true;
              doc.text(reunion.empresa_demandada.substring(0, 24), x + 120, y);
              doc.text(reunion.empresa_demandada.substring(24), x + 120, y + 7);
            }
            let yBase = y;
            if (ln) {
              y += 7;
            }

            doc.setTextColor(0, 0, 255);
            doc.setFontStyle('bold');
            doc.setFontSize(8);
            doc.text(`${reunion.url}`, x + 180, yBase);
            doc.setFontSize(9);
            doc.setFontStyle('normal');
            doc.setTextColor(0, 0, 0);
            doc.line(x - 5, y + 4, 259.4, y + 4);
            y += 10;
            doc.text(`${page}`, 255, 205.9);
            if (y >= 195.9) {
              doc.addPage();
              page++;
              /*start*/
              doc.setFontSize(10);
              /*          doc.addImage(logo, 'JPEG', 220, 15, 50, 20);*/
              doc.addImage(logo, 'JPEG', 215, 25, 45, 15);
              doc.setFontStyle('bold');
              /*          doc.text('AGENDA RUEDA DE NEGOCIOS FIMEM BOLIVIA', 20, 20);*/
              doc.text('AGENDA RUEDA DE NEGOCIOS DE BIOSEGURIDAD 2020', 20, 20);
              doc.text('EMPRESA', 20, 30);
              doc.setFontStyle('normal');
              doc.text(agenda.empresa.nombre.toUpperCase(), 50, 30);
              doc.setFontStyle('bold');
              doc.text('RUBRO', 20, 37);
              doc.setFontStyle('bold');
              doc.text('REUNIONES', 139.7, 50, 'center');
              doc.setFontStyle('normal');
              if (agenda.empresa.rubro.nombre.length < 50) {
                doc.text(agenda.empresa.rubro.nombre.toUpperCase(), 50, 37);
              } else {
                const parte1 = agenda.empresa.rubro.nombre.toUpperCase().substring(0, 53);
                const parte2 = agenda.empresa.rubro.nombre.toUpperCase().substring(53);
                doc.text(parte1, 50, 37);
                doc.text(parte2, 50, 42);
              }
              doc.setFontStyle('bold');
              doc.line(20, 55, 259.4, 55);
              doc.text('HORARIO', 25, 61);
              doc.text('MESA', 70, 61);
              doc.text('SOLICITANTE', 90, 61);
              doc.text('DEMANDADA', 145, 61);
              doc.text('REUNIÓN DE ZOOM', 205, 61);
              doc.line(20, 64, 259.4, 64);
              x = 25;
              y = 70;
              doc.setFontStyle('normal');
              doc.setFontSize(9);

              /*end*/
            }
          });
          this.cont++;
        });
        doc.save('agendas-bioseguridad.pdf');
        /*end subscribe*/
      });
  }

  agendasMesaOpen(content) {
    this.modalReference = this.modalService.open(content, {
      size: 'sm',
      container: 'nb-layout'
    });
  }

  agendasMesa() {
    const logo = new Image();
    /*    logo.src = 'assets/images/fimem.jpeg';*/
    logo.src = 'assets/images/bioseguridad.jpeg';

    this.reunionService.agendasMesa({
      fecha: this.agendasMesaFecha
    })
      .subscribe((responses: any[]) => {
        const doc = new jsPDF('landscape', 'mm', 'letter');
        let count = 0;
        responses.map((agenda: any) => {
          count++;
          doc.setFontSize(10);
          doc.setFontStyle('bold');
          /*          doc.text('REUNIONES DE LA RUEDA DE NEGOCIOS DE FIMEM BOLIVIA', 20, 15);*/
          doc.text('REUNIONES DE LA RUEDA DE NEGOCIOS DE BIOSEGURIDAD 2020', 20, 15);
          doc.text('MESA', 20, 22);
          doc.text('REUNIÓN DE ZOOM', 20, 29);
          doc.text('FECHA', 20, 36);
          doc.text('HORARIOS', 139.7, 45, 'center');
          doc.setFontStyle('normal');
          doc.text(`: ${agenda.numero}`, 55, 22);
          doc.setTextColor(0, 0, 255);
          doc.setFontStyle('bold');
          doc.text(`: ${agenda.url}`, 55, 29);
          doc.setFontStyle('normal');
          doc.setTextColor(0, 0, 0);
          doc.text(`: ${DateTime.fromSQL(agenda.fecha).toLocaleString(DateTime.DATE_HUGE)}`, 55, 36);
          /*          doc.addImage(logo, 'JPEG', 220, 15, 50, 20);*/
          doc.addImage(logo, 'JPEG', 215, 15, 45, 15);
          doc.line(20, 50, 260, 50);
          doc.setFontStyle('bold');
          doc.text('N.', 25, 56);
          doc.text('HORARIO', 35, 56);
          doc.text('EMPRESA SOLICITANTE', 70, 56);
          doc.text('EMPRESA DEMANDADA', 140, 56);
          doc.text('OBSERVACIONES', 210, 56);
          doc.setFontStyle('normal');
          doc.line(20, 60, 260, 60);
          let x = 22.5;
          let y = 67;
          /*test*/
          /*          if (agenda.reuniones.length > 0) {
                      const reunionBK = agenda.reuniones[0];
                      for (let i = 0; i < 100; i++) {
                        agenda.reuniones.push(reunionBK);
                      }
                    }*/
          /*end test*/
          let page = 1;
          let ln = false;
          agenda.reuniones.map((reunion: any, index: number) => {
            doc.text(`${index + 1}`, 24, y);
            doc.text(`${DateTime.fromSQL(reunion.desde).toLocaleString(DateTime.TIME_24_SIMPLE)} - ${DateTime.fromSQL(reunion.hasta).toLocaleString(DateTime.TIME_24_SIMPLE)}`, 35, y);

            ln = false;
            if (reunion.empresa_solicitante.nombre.length < 25) {
              doc.text(`${reunion.empresa_solicitante.nombre.toUpperCase()}`, 70, y);
            } else {
              ln = true;
              doc.text(`${reunion.empresa_solicitante.nombre.toUpperCase().substring(0, 24)}`, 70, y);
              doc.text(`${reunion.empresa_solicitante.nombre.toUpperCase().substring(24)}`, 70, y + 7);
            }

            if (reunion.empresa_demandada.nombre.length < 25) {
              doc.text(`${reunion.empresa_demandada.nombre.toUpperCase()}`, 140, y);
            } else {
              ln = true;
              doc.text(`${reunion.empresa_demandada.nombre.toUpperCase().substring(0, 24)}`, 140, y);
              doc.text(`${reunion.empresa_demandada.nombre.toUpperCase().substring(24)}`, 140, y + 7);
            }

            if (ln) {
              y += 7;
            }

            doc.line(20, y + 5, 260, y + 5);
            y += 12;
            doc.text(`${page}`, 255, 205.9);
            /*            doc.text(`${index + 1}`, 25, y);*/
            if (y >= 195.9) {
              doc.addPage();
              page++;
              /*begin*/
              doc.setFontSize(10);
              doc.setFontStyle('bold');
              /*          doc.text('REUNIONES DE LA RUEDA DE NEGOCIOS DE FIMEM BOLIVIA', 20, 15);*/
              doc.text('REUNIONES DE LA RUEDA DE NEGOCIOS DE BIOSEGURIDAD 2020', 20, 15);
              doc.text('MESA', 20, 22);
              doc.text('REUNIÓN DE ZOOM', 20, 29);
              doc.text('FECHA', 20, 36);
              doc.text('HORARIOS', 139.7, 45, 'center');
              doc.setFontStyle('normal');
              doc.text(`: ${agenda.numero}`, 55, 22);
              doc.setTextColor(0, 0, 255);
              doc.setFontStyle('bold');
              doc.text(`: ${agenda.url}`, 55, 29);
              doc.setFontStyle('normal');
              doc.setTextColor(0, 0, 0);
              doc.text(`: ${DateTime.fromSQL(agenda.fecha).toLocaleString(DateTime.DATE_HUGE)}`, 55, 36);
              /*          doc.addImage(logo, 'JPEG', 220, 15, 50, 20);*/
              doc.addImage(logo, 'JPEG', 215, 15, 45, 15);
              doc.line(20, 50, 260, 50);
              doc.setFontStyle('bold');
              doc.text('N.', 25, 56);
              doc.text('HORARIO', 35, 56);
              doc.text('EMPRESA SOLICITANTE', 70, 56);
              doc.text('EMPRESA DEMANDADA', 140, 56);
              doc.text('OBSERVACIONES', 210, 56);
              doc.setFontStyle('normal');
              doc.line(20, 60, 260, 60);
              x = 22.5;
              y = 67;

              /*end*/
            }

          });
          if (count < responses.length) {
            doc.addPage();
          }
        });
        doc.save(`agendas-mesa-${DateTime.fromSQL(this.agendasMesaFecha).toLocaleString(DateTime.DATE_FULL)}.pdf`);
        this.modalReference.close();
      });
  }

  conMaterial(empresa: any) {
    if (empresa.con_material === 'si') {
      if (confirm(`¿Esta seguro de la devolución de material de ${empresa.nombre}?`)) {
        this.empresaService.conMaterial(empresa.empresa_id)
          .subscribe((res: any) => {
            this.reload();
            this.toastr.success('Devolución exitosa de materiales', 'Éxito');
          });
      }
    } else {
      if (confirm(`¿Esta seguro de asignar materiales a ${empresa.nombre}?`)) {
        this.empresaService.conMaterial(empresa.empresa_id)
          .subscribe((res: any) => {
            this.reload();
            this.toastr.success('Asignación exitosa de materiales', 'Éxito');
          });
      }
    }
  }

}
