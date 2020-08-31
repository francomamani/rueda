import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {OfertaDemandaService} from '../oferta-demanda/oferta-demanda.service';
import {NbToastrService} from '@nebular/theme';
import {from} from 'rxjs';
import {map} from 'rxjs/operators';

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

  @Output() ofertas_demandas = new EventEmitter<Array<any>>();
  @Input() list = null;
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
              private toastr: NbToastrService) {
  }

  ngOnInit() {
    if (this.list !== null) {
      const source = from(this.list);
      const mapped = source.pipe(map((item: any) => {
        return {
          oferta_demanda_id: item.oferta_demanda_id,
          tipo: item.tipo,
          descripcion: item.descripcion,
          producto_servicio: item.producto_servicio,
          empresa_id: item.empresa_id,
          edit: false,
        };
      }));
      mapped.subscribe((item: any) => {
        if (item.tipo === 'oferta') {
          if (item.producto_servicio === 'producto') {
            this.ofertas.productos.unshift(item);
          }
          if (item.producto_servicio === 'servicio') {
            this.ofertas.servicios.unshift(item);
          }
        }
        if (item.tipo === 'demanda') {
          if (item.producto_servicio === 'producto') {
            this.demandas.productos.unshift(item);
          }
          if (item.producto_servicio === 'servicio') {
            this.demandas.servicios.unshift(item);
          }
        }
      });
      if (this.tipo === 'oferta') {
        this.getOfertas();
      }
      if (this.tipo === 'demanda') {
        this.getDemandas();
      }

    }
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
    this.ofertas_demandas.emit(this.data.concat(this.ofertas.productos, this.ofertas.servicios, this.demandas.productos, this.demandas.servicios));
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

  remove(oferta_demanda: any, index: number) {
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
  }

  destroy(oferta_demanda: any, index: number) {
    if (confirm(`¿Esta seguro de eliminar la ${this.tipo}?`)) {
      if (oferta_demanda.oferta_demanda_id !== undefined) {
        this.ofertaDemandaService.destroy(oferta_demanda.oferta_demanda_id)
          .subscribe(() => {
            this.remove(oferta_demanda, index);
            if (this.tipo === 'oferta') {
              this.getOfertas();
            }
            if (this.tipo === 'demanda') {
              this.getDemandas();
            }
          });
      } else {
        this.remove(oferta_demanda, index);
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
