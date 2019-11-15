import {Component, EventEmitter, OnInit, Output} from '@angular/core';
import {OfertaDemandaService} from '../oferta-demanda/oferta-demanda.service';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-ofertademanda',
  templateUrl: './ofertademanda.component.html',
  styles: [`
      .btn-acciones {
          text-align: center;
          width: 220px;
      }
      .btn-acciones a {
          display: inline-block;
          font-size: 1.3em;
          padding: 0 0.1em;
          cursor: pointer;
      }
  `],
})
export class OfertademandaComponent implements OnInit {

  @Output () ofertas_demandas = new EventEmitter<any>();
  tipo: string = 'oferta';
  descripcion = '';
  producto_servicio = 'producto';
  productos = null;
  servicios = null;
  usuario = null;

  ofertas = {
    productos: [],
    servicios: [],
  };
  demandas = {
    productos: [],
    servicios: [],
  };
  data = null;
  constructor(private ofertaDemandaService: OfertaDemandaService,
              private toastr: NbToastrService) {}
  ngOnInit() {
  }

  getOfertas() {
    this.tipo = 'oferta';
    this.productos = this.ofertas.productos;
    this.servicios = this.ofertas.servicios;
  }
  getDemandas() {
    this.tipo = 'demanda';
    this.productos = this.demandas.productos;
    this.servicios = this.demandas.servicios;
  }

  send() {
    this.data = [];
    this.data.concat(this.ofertas.productos);
    this.data.concat(this.ofertas.servicios);
    this.data.concat(this.demandas.productos);
    this.data.concat(this.demandas.servicios);
    this.ofertas_demandas.emit(this.data);
  }
  store() {
    const data = {
      tipo: this.tipo,
      descripcion: this.descripcion,
      producto_servicio: this.producto_servicio,
      edit: false,
    };

    if (this.tipo === 'oferta') {
      if (this.producto_servicio === 'producto') {
        this.ofertas.productos.unshift(data);
        this.productos = this.ofertas.productos;
        this.send();
      }
      if (this.producto_servicio === 'servicio') {
        this.ofertas.servicios.unshift(data);
        this.servicios = this.ofertas.servicios;
        this.send();
      }
    }
    if (this.tipo === 'demanda') {
      if (this.producto_servicio === 'producto') {
        this.demandas.productos.unshift(data);
        this.productos = this.demandas.productos;
        this.send();
      }
      if (this.producto_servicio === 'servicio') {
        this.demandas.servicios.unshift(data);
        this.servicios = this.demandas.servicios;
        this.send();
      }
    }
    this.descripcion = '';
    this.toastr.primary(`Se registro exitosamente la ${this.tipo}`, `Registro de ${this.tipo}`);

    /*    this.ofertaDemandaService.store(data)
      .subscribe((res: any) => {
        if (this.tipo === 'oferta') {
          this.getOfertas();
        } else {
          this.getDemandas();
        }
        this.descripcion = '';
        this.toastr.primary(`Se registro exitosamente la ${this.tipo}`, `Registro de ${this.tipo}`);
      });*/
  }
  edit(oferta_demanda: any) {
    oferta_demanda.edit = true;
  }
  update(oferta_demanda: any) {
    oferta_demanda.edit = false;
    this.send();
    this.toastr.success('', `${this.tipo} actualizada exitosamente`);
/*    this.ofertaDemandaService.update(oferta_demanda)
      .subscribe((res: any) => {
        this.toastr.success('', `${this.tipo} actualizada exitosamente`);
      });*/
  }
  destroy(oferta_demanda: any, index: number ) {
    if (confirm(`¿Esta seguro de eliminar la ${this.tipo}?`)) {
      if (oferta_demanda.tipo === 'oferta') {
        if (oferta_demanda.producto_servicio === 'producto') {
          this.ofertas.productos.splice(index, 1);
          this.productos = this.ofertas.productos;
          this.send();
        }
        if (oferta_demanda.producto_servicio === 'servicio') {
          this.ofertas.servicios.splice(index, 1);
          this.servicios = this.ofertas.productos;
          this.send();
        }
      }
      if (oferta_demanda.tipo === 'demanda') {
        if (oferta_demanda.producto_servicio === 'producto') {
          this.demandas.productos.splice(index, 1);
          this.productos = this.demandas.productos;
          this.send();
        }
        if (oferta_demanda.producto_servicio === 'servicio') {
          this.demandas.servicios.splice(index, 1);
          this.servicios = this.demandas.servicios;
          this.send();
        }
      }
/*      this.ofertaDemandaService.destroy(oferta_demanda_id)
        .subscribe((res: any) => {
          if (this.tipo === 'oferta') {
            this.getOfertas();
          } else {
            this.getDemandas();
          }
          this.descripcion = '';
          this.toastr.success('', `${this.tipo} eliminado exitosamente`);
        });*/
    }
  }
}
