import { Component, OnInit } from '@angular/core';
import {OfertaDemandaService} from './oferta-demanda.service';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-oferta-demanda',
  templateUrl: './oferta-demanda.component.html',
  styleUrls: ['./oferta-demanda.component.scss'],
})
export class OfertaDemandaComponent implements OnInit {

  tipo = 'oferta';
  descripcion = '';
  producto_servicio = 'producto';
  oferta_demandas = null;
  usuario = JSON.parse(atob(localStorage.getItem('rueda-usuario')));
  constructor(private ofertaDemandaService: OfertaDemandaService,
              private toastr: NbToastrService) {
    this.ofertaDemandaService.ofertas()
      .subscribe((res: any) => {
        this.oferta_demandas = res;
      });
  }
  ngOnInit() {
  }
  getOfertas() {
    this.tipo = 'oferta';
    this.ofertaDemandaService.ofertas()
      .subscribe((res: any) => {
        this.oferta_demandas = res;
      });
  }
  getDemandas() {
    this.tipo = 'demanda';
    this.ofertaDemandaService.demandas()
      .subscribe((res: any) => {
        this.oferta_demandas = res;
      });
  }

  store() {
    const data = {
      empresa_id: this.usuario.empresa_id,
      tipo: this.tipo,
      descripcion: this.descripcion,
      producto_servicio: this.producto_servicio,
    };
    this.ofertaDemandaService.store(data)
      .subscribe((res: any) => {
        if (this.tipo === 'oferta') {
          this.getOfertas();
        } else {
          this.getDemandas();
        }
        this.toastr.primary(`Se registro exitosamente la ${this.tipo}`, `Registro de ${this.tipo}`);
      });
  }
  destroy(oferta_demanda_id: number) {
    if (`¿Esta seguro de eliminar la ${this.tipo}?`) {
      this.ofertaDemandaService.destroy(oferta_demanda_id)
        .subscribe((res: any) => {
          if (this.tipo === 'oferta') {
            this.getOfertas();
          } else {
            this.getDemandas();
          }
          this.toastr.success('', `${this.tipo} eliminado exitosamente`);
        });
    }
  }
}
