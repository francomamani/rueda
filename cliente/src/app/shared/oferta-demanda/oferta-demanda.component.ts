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
  productos = null;
  servicios = null;
  usuario = JSON.parse(atob(localStorage.getItem('rueda-usuario')));
  constructor(private ofertaDemandaService: OfertaDemandaService,
              private toastr: NbToastrService) {
    this.ofertaDemandaService.productoOfertas()
      .subscribe((res: any) => {
        this.productos = res;
        this.productos.forEach((record) => {
          record.edit = false;
        });
      });
    this.ofertaDemandaService.servicioOfertas()
      .subscribe((res: any) => {
        this.servicios = res;
        this.servicios.forEach((record) => {
          record.edit = false;
        });
      });
  }
  ngOnInit() {
  }
  getOfertas() {
    this.tipo = 'oferta';
    this.ofertaDemandaService.productoOfertas()
      .subscribe((res: any) => {
        this.productos = res;
        this.productos.forEach((record) => {
          record.edit = false;
        });
      });
    this.ofertaDemandaService.servicioOfertas()
      .subscribe((res: any) => {
        this.servicios = res;
        this.servicios.forEach((record) => {
          record.edit = false;
        });
      });
  }
  getDemandas() {
    this.tipo = 'demanda';
    this.ofertaDemandaService.productoDemandas()
      .subscribe((res: any) => {
        this.productos = res;
        this.productos.forEach((record) => {
          record.edit = false;
        });
      });
    this.ofertaDemandaService.servicioDemandas()
      .subscribe((res: any) => {
        this.servicios = res;
        this.servicios.forEach((record) => {
          record.edit = false;
        });
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
  edit(oferta_demanda: any) {
    oferta_demanda.edit = true;
  }
  update(oferta_demanda: any) {
    oferta_demanda.edit = false;
    this.ofertaDemandaService.update(oferta_demanda)
      .subscribe((res: any) => {
        this.toastr.success('', `${this.tipo} actualizada exitosamente`);
      });
  }
  destroy(oferta_demanda_id: number) {
    if (confirm(`¿Esta seguro de eliminar la ${this.tipo}?`)) {
      this.ofertaDemandaService.destroy(oferta_demanda_id)
        .subscribe((res: any) => {
          if (this.tipo === 'oferta') {
            this.getOfertas();
          } else {
            this.getDemandas();
          }
          this.descripcion = '';
          this.toastr.success('', `${this.tipo} eliminado exitosamente`);
        });
    }
  }
}
