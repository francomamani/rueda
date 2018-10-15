import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment.prod';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class HorariosOcupadosService {

    base = environment.base;

    constructor(private http: HttpClient) {
    }

    index(id_empresa) {
        return this.http.get(this.base + 'mis-horarios-ocupados/' + id_empresa);
    }

    store(req) {
        return this.http.post(this.base + 'horarios-ocupados', req);
    }


    destroy(id) {
        return this.http.delete(this.base + 'horarios-ocupados/' + id);
    }
}
