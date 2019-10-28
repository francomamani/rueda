import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment.prod';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class OfertaDemandaService {

  base = environment.base;
  constructor(private http: HttpClient) { }

  ofertas() {
    return this.http.get(`${this.base}ofertas`);
  }

  demandas() {
    return this.http.get(`${this.base}demandas`);
  }
  productoOfertas() {
    return this.http.get(`${this.base}producto-ofertas`);
  }
  productoDemandas() {
    return this.http.get(`${this.base}producto-demandas`);
  }
  servicioOfertas() {
    return this.http.get(`${this.base}servicio-ofertas`);
  }
  servicioDemandas() {
    return this.http.get(`${this.base}servicio-demandas`);
  }
  store(data: any) {
    return this.http.post(`${this.base}oferta-demandas`, data);
  }

  destroy(id: any) {
    return this.http.delete(`${this.base}oferta-demandas/${id}`);
  }
}
