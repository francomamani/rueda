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
  }

  ngOnInit() {
    this.ofertaDemandaService.productoOfertas(this.empresa.empresa_id)
      .subscribe((res: any) => {
        this.productos = res;
      });
    this.ofertaDemandaService.servicioOfertas(this.empresa.empresa_id)
      .subscribe((res: any) => {
        this.servicios = res;
      });
  }
  closeModal() {
    this.activeModal.close();
  }
  getOfertas() {
    this.tipo = 'oferta';
    this.ofertaDemandaService.productoOfertas(this.empresa.empresa_id)
      .subscribe((res: any) => {
        this.productos = res;
      });
    this.ofertaDemandaService.servicioOfertas(this.empresa.empresa_id)
      .subscribe((res: any) => {
        this.servicios = res;
      });
  }
  getDemandas() {
    this.tipo = 'demanda';
    this.ofertaDemandaService.productoDemandas(this.empresa.empresa_id)
      .subscribe((res: any) => {
        this.productos = res;
      });
    this.ofertaDemandaService.servicioDemandas(this.empresa.empresa_id)
      .subscribe((res: any) => {
        this.servicios = res;
      });
  }

}
