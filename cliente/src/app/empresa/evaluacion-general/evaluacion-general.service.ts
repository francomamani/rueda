import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../../environments/environment.prod';

@Injectable({
  providedIn: 'root',
})
export class EvaluacionGeneralService {

  base = environment.base;
  constructor(private http: HttpClient) { }

  store(req) {
    return this.http.post(this.base + 'evaluaciones-generales', req);
  }

  evaluacionRegistrada(empresa_id) {
    return this.http.get(this.base + 'evaluacion-registrada/' + empresa_id);
  }
}
