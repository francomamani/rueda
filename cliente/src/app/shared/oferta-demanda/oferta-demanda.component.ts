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
    console.log(this.usuario);
  }
  getOfertas() {
    this.ofertaDemandaService.ofertas()
      .subscribe((res: any) => {
        this.oferta_demandas = res;
      });
  }
  getDemandas() {
    this.ofertaDemandaService.demandas()
      .subscribe((res: any) => {
        this.oferta_demandas = res;
      });
  }
}
