import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../../environments/environment.prod';

@Injectable({
  providedIn: 'root',
})
export class AgendaService {

  base = environment.base;
  constructor(private http: HttpClient) { }

  solicitudesSalientes(empresa_id) {
    return this.http.get(this.base + 'solicitudes-salientes/' + empresa_id);
  }

  solicitudesEntrantes(empresa_id) {
    return this.http.get(this.base + 'solicitudes-entrantes/' + empresa_id);
  }
}
