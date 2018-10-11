import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../../environments/environment.prod';


@Injectable({
  providedIn: 'root',
})
export class TipoUsuarioService {

  base = environment.base;

  constructor(private http: HttpClient) { }

    index() {
        return this.http.get(this.base + 'tipo_usuarios');
    }
    store(req) {
        return this.http.post(this.base + 'tipo_usuarios', req);
    }
    update(req, id) {
        return this.http.put(this.base + 'tipo_usuarios/' + id, req);
    }
    destroy(id) {
        return this.http.delete(this.base + 'tipo_usuarios/' + id);
    }

}
