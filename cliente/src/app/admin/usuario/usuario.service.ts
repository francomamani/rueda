import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment.prod';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

    base = environment.base;

    constructor(private http: HttpClient) {
    }

    index() {
        return this.http.get(this.base + 'usuarios');
    }
    store(req){
        return this.http.post(this.base + 'usuarios',req);
    }
    destroy(usuario_id){
        return this.http.delete(this.base + 'usuarios/'+usuario_id);
    }
    reset(id){
        return this.http.get(this.base + 'reset-password/'+id);
    }
}
