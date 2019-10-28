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
    if (confirm('¿Esta seguro de cambiar a ofertas?')) {
      this.tipo = 'oferta';
      this.ofertaDemandaService.ofertas()
        .subscribe((res: any) => {
          this.oferta_demandas = res;
        });
    }
  }
  getDemandas() {
    if (confirm('¿Esta seguro de cambiar a demandas?')) {
      this.tipo = 'demanda';
      this.ofertaDemandaService.demandas()
        .subscribe((res: any) => {
          this.oferta_demandas = res;
        });
    }
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
        this.toastr.primary(`Se registro exitosamente la ${this.tipo}`, `Registro de ${this.tipo}`);
      });
  }
}
