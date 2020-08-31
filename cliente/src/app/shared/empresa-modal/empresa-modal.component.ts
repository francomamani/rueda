import {Component, OnInit} from '@angular/core';
import {NgbActiveModal} from '@ng-bootstrap/ng-bootstrap';
import {OfertaDemandaService} from '../oferta-demanda/oferta-demanda.service';
import {EmpresaService} from '../../admin/empresa/empresa.service';

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

  rueda: any;

  constructor(private activeModal: NgbActiveModal,
              private empresaService: EmpresaService,
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
    this.empresaService.ruedaMostrar()
      .subscribe((rueda: any) => {
        this.rueda = rueda;
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
