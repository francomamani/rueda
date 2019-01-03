import {Component, OnInit, ViewChild, Inject} from '@angular/core';
import {EmpresaService} from '../empresa.service';
import {NbToastrService} from '@nebular/theme';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {RubroService} from '../../rubro/rubro.service';
import {environment} from '../../../../environments/environment.prod';
import {VoucherModalComponent} from '../../voucher-modal/voucher-modal.component';
import {ExcelServiceService} from './excel-service.service';
import * as jsPDF from 'jspdf'

@Component({
  selector: 'ngx-empresa-index',
  templateUrl: './empresa-index.component.html',
  styleUrls: ['./empresa-index.component.scss'],
  providers: [
      { provide: 'Window',  useValue: window },
  ],
})
export class EmpresaIndexComponent implements OnInit {

  buscarGroup: FormGroup;
  agendas: any = null;
  empresas: any = null;
  empresasBK: any = null;
  rubros: any = null;
  logo = environment.base + 'mostrar-logo/';
  logo_default = environment.base + environment.empresa_logo;
  constructor(private empresaService: EmpresaService,
              private rubroService: RubroService,
              private modalService: NgbModal,
              private fb: FormBuilder,
              private toastr: NbToastrService,
              private excelService: ExcelServiceService,
              @Inject('Window') private window: Window,) {
    this.createForm();
    this.empresaService.empresasListar()
      .subscribe((res: any) => {
        this.empresas = res;
        this.empresasBK = this.empresas;
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
/*  buscar() {
    this.empresaService.buscar(this.buscarGroup.value)
      .subscribe((res: any) => {
        this.empresas = res;
      });
  }*/
  buscar() {
    const search = this.buscarGroup.value.search;
    const rubro_id = Number(this.buscarGroup.value.rubro_id);
    this.empresas = this.empresasBK;
    if (search === '') {
      if (rubro_id === 0) {
        this.empresas = this.empresasBK;
      } else {
        this.empresas = this.empresas.filter((empresa) => {
          return empresa.rubro_id === rubro_id;
        });
      }
    } else {
      if (rubro_id === 0) {
        this.empresas = this.empresas.filter((empresa) => {
          return empresa.nombre.toLowerCase().indexOf(search) > -1 ||
            empresa.direccion.toLowerCase().indexOf(search) > -1 ||
            empresa.nit.toLowerCase().indexOf(search) > -1 ||
            empresa.telefono.toLowerCase().indexOf(search) > -1;
        });
      } else {
        this.empresas = this.empresas.filter((empresa) => {
          return (empresa.nombre.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id ) ||
            (empresa.direccion.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id) ||
            (empresa.nit.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id) ||
            (empresa.telefono.toLowerCase().indexOf(search) > -1 && empresa.rubro_id === rubro_id);
        });
      }
    }
  }

  reload() {
    this.empresaService.empresasListar()
      .subscribe((res: any) => {
        this.empresas = res;
      });
  }
  info(empresa) {
    const activeModal = this.modalService.open(EmpresaModalComponent, { size: 'lg', container: 'nb-layout' });
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
      const compModal = this.modalService.open(VoucherModalComponent, { size: 'lg', container: 'nb-layout' });
      compModal.componentInstance.id_empresa = empresa.empresa_id;
      if (empresa.voucher !== null)
        compModal.componentInstance.comp = environment.base + 'voucher/' + empresa.empresa_id;
      compModal.result.then(() => {
        this.reload();
      });
  }

    descargar() {
      const copia = this.empresas;
      this.excelService.exportAsExcelFile(copia, 'empresas-registradas');
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
        this.empresaService.agendas()
          .subscribe(res => {
            this.agendas = res;
            const doc = new jsPDF();
            const lista = this.agendas.agendas;
            lista.forEach(( agenda: any ) => {
              doc.setFontSize(11);
              doc.setFontStyle('bold');
              doc.text('AGENDA', 100, 20);
              doc.text('EMPRESA', 25, 30);
              doc.setFontStyle('normal');
              doc.text(agenda.empresa.nombre.toUpperCase(), 50, 30);
              doc.setFontStyle('bold');
              doc.text('RUBRO', 25, 40);
              doc.setFontStyle('normal');
              if (agenda.empresa.rubro.length < 50) {
                doc.text(agenda.empresa.rubro.toUpperCase(), 50, 40);
              }  else {
                const parte1 = agenda.empresa.rubro.toUpperCase().substring(0, 53);
                const parte2 = agenda.empresa.rubro.toUpperCase().substring(53);
                doc.text(parte1, 50, 40);
                doc.text(parte2, 50, 48);
              }

              doc.setFontStyle('bold');
              doc.line(25, 55, 200, 55);
              doc.text('HORARIO', 30, 60);
              doc.text('MESA', 90, 60);
              doc.text('EMPRESA', 120, 60);
              doc.line(25, 65, 200, 65);
              const x = 30;
              let y = 70;
              doc.setFontStyle('normal');
              agenda.reuniones.forEach((reunion: any) => {
                doc.line(x - 5, y - 5, 200, y - 5);
                doc.text(this.formatDate(new Date(reunion.desde)) + ' ' +
                  this.formatTime(new Date(reunion.desde)) + '-' +
                  this.formatTime(new Date(reunion.hasta)) , x, y);
                doc.text(reunion.mesa, x + 60, y);
                doc.text(reunion.empresa.toUpperCase(), x + 90, y);
                doc.line(x - 5, y + 5, 200, y + 5);
                y += 10;
              });

              doc.addPage();
            });

            doc.save('agendas.pdf');
            /*end subscribe*/
          });
    }

}
