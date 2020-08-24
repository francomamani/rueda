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

  constructor(private empresaService: EmpresaService,
              private reunionService: ReunionService,
              private rubroService: RubroService,
              private fb: FormBuilder,
              private modalService: NgbModal,
              private toastr: NbToastrService,
              private excelService: ExcelServiceService,
              @Inject('Window') private window: Window) {
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
          doc.addImage(logo, 'JPEG', 190, 15, 65, 20);
          doc.setFontStyle('bold');
          doc.text('AGENDA RUEDA DE NEGOCIOS BIOSEGURIDAD', 20, 20);
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
          doc.text('REUNIÓN DE ZOOM', 200, 61);
          doc.line(20, 64, 259.4, 64);
          const x = 25;
          let y = 70;
          doc.setFontStyle('normal');
          doc.setFontSize(9);
          agenda.reuniones.forEach((reunion: any) => {
            /*            doc.line(x - 5, y - 6, 259.4, y - 6);*/
            doc.text(this.formatDate(new Date(reunion.desde)) + ' ' +
              this.formatTime(new Date(reunion.desde)) + '-' +
              this.formatTime(new Date(reunion.hasta)), x, y);
            doc.text(reunion.mesa, x + 45, y);
            doc.text(reunion.empresa_solicitante, x + 65, y);
            doc.text(reunion.empresa_demandada, x + 120, y);
            doc.setTextColor(0, 0, 255);
            doc.setFontStyle('bold');
            doc.text(`${reunion.url}`, x + 175, y);
            doc.setFontStyle('normal');
            doc.setTextColor(0, 0, 0);
            doc.line(x - 5, y + 4, 259.4, y + 4);
            y += 10;
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
          doc.text('REUNIONES DE LA RUEDA DE NEGOCIOS DE BIOSEGURIDAD', 20, 15);
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
          doc.addImage(logo, 'JPEG', 190, 15, 65, 20);
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
          agenda.reuniones.map((reunion: any, index: number) => {
            doc.text(`${index + 1}`, 25, y);
            doc.text(`${DateTime.fromSQL(reunion.desde).toLocaleString(DateTime.TIME_24_SIMPLE)} - ${DateTime.fromSQL(reunion.hasta).toLocaleString(DateTime.TIME_24_SIMPLE)}`, 35, y);
            doc.text(`${reunion.empresa_solicitante.nombre.toUpperCase()}`, 70, y);
            doc.text(`${reunion.empresa_demandada.nombre.toUpperCase()}`, 140, y);
            doc.text('', 210, y);
            doc.line(20, y + 5, 260, y + 5);
            y += 12;
          });
          console.log(responses);
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
