import { Component, OnInit } from '@angular/core';
import {OfertaDemandaService} from './oferta-demanda.service';

@Component({
  selector: 'ngx-oferta-demanda',
  templateUrl: './oferta-demanda.component.html',
  styleUrls: ['./oferta-demanda.component.scss'],
})
export class OfertaDemandaComponent implements OnInit {

  tipo = 'oferta';
  descripcion = '';
  oferta_demandas = null;
  usuario = JSON.parse(atob(localStorage.getItem('rueda-usuario')));
  constructor(private ofertaDemandaService: OfertaDemandaService) {
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
    };
  }
}
