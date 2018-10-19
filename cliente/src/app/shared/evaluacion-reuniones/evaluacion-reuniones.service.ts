import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment.prod';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class EvaluacionReunionesService {

  base = environment.base;
  constructor(private http: HttpClient) { }

  store(req) {
    return this.http.post(this.base + 'evaluacion-reuniones', req);
  }
  registrado(reunion_id, empresa_id) {
    return this.http.get(this.base + 'evaluacion-reunion-registrada/' + reunion_id + '/' + empresa_id);
  }
}
