import { Component, OnInit } from '@angular/core';
import {NgbActiveModal} from '@ng-bootstrap/ng-bootstrap';
import {OfertaDemandaService} from '../oferta-demanda/oferta-demanda.service';

@Component({
  selector: 'ngx-empresa-modal',
  templateUrl: './empresa-modal.component.html',
  styleUrls: ['./empresa-modal.component.scss'],
})
export class EmpresaModalComponent implements OnInit {

  modalHeader = '';
  empresa: any = null;
  fecha_hora_registro_reunion: any = null;
  productos = null;
  servicios = null;
  tipo = 'oferta';
  constructor(private activeModal: NgbActiveModal,
              private ofertaDemandaService: OfertaDemandaService) {
    this.ofertaDemandaService.productoOfertas()
      .subscribe((res: any) => {
        this.productos = res;
      });
    this.ofertaDemandaService.servicioOfertas()
      .subscribe((res: any) => {
        this.servicios = res;
      });
  }

  ngOnInit() {
  }
  closeModal() {
    this.activeModal.close();
  }
  getOfertas() {
    this.tipo = 'oferta';
    this.ofertaDemandaService.productoOfertas()
      .subscribe((res: any) => {
        this.productos = res;
      });
    this.ofertaDemandaService.servicioOfertas()
      .subscribe((res: any) => {
        this.servicios = res;
      });
  }
  getDemandas() {
    this.tipo = 'demanda';
    this.ofertaDemandaService.productoDemandas()
      .subscribe((res: any) => {
        this.productos = res;
      });
    this.ofertaDemandaService.servicioDemandas()
      .subscribe((res: any) => {
        this.servicios = res;
      });
  }

}
