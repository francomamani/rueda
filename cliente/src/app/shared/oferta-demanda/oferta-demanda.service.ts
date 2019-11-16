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
  productoOfertas(id: number) {
    return this.http.get(`${this.base}producto-ofertas/${id}`);
  }
  productoDemandas(id: number) {
    return this.http.get(`${this.base}producto-demandas/${id}`);
  }
  servicioOfertas(id: number) {
    return this.http.get(`${this.base}servicio-ofertas/${id}`);
  }
  servicioDemandas(id: number) {
    return this.http.get(`${this.base}servicio-demandas/${id}`);
  }
  store(data: any) {
    return this.http.post(`${this.base}oferta-demandas`, data);
  }
  update(data: any) {
    return this.http.put(`${this.base}oferta-demandas/${data.oferta_demanda_id}`, data);
  }
  destroy(id: any) {
    return this.http.delete(`${this.base}oferta-demandas/${id}`);
  }
  list(empresa_id: number) {
    return this.http.get(`${this.base}mis-ofertas-demandas/${empresa_id}`);
  }
}
