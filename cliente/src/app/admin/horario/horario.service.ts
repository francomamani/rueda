import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../../environments/environment.prod';

@Injectable({
  providedIn: 'root',
})
export class HorarioService {

  base = environment.base;
  constructor(private http: HttpClient) { }

    index() {
        return this.http.get(this.base + 'horarios');
    }

    store(req) {
        return this.http.post(this.base + 'horarios', req);
    }

    update(req, id) {
        return this.http.put(this.base + 'horarios/' + id, req);
    }
    destroy(id) {
        return this.http.delete(this.base + 'horarios/' + id);
    }
}
