import {Injectable} from '@angular/core';
import {environment} from '../../../environments/environment.prod';
import {HttpClient} from '@angular/common/http';

@Injectable({
    providedIn: 'root',
})
export class EmpresaService {

    base = environment.base;

    constructor(private http: HttpClient) {
    }

    index() {
        return this.http.get(this.base + 'empresas');
    }

    empresasListar() {
        return this.http.get(this.base + 'empresas-listar');
    }

    store(req) {
        return this.http.post(this.base + 'empresas', req);
    }

    update(req, id) {
        return this.http.put(this.base + 'empresas/' + id, req);
    }

    destroy(id) {
        return this.http.delete(this.base + 'empresas/' + id);
    }


    indexParticipantes(id_empresa) {
        return this.http.get(this.base + 'empresa/' + id_empresa + '/participantes');
    }

    storeParticipantes(req) {
        return this.http.post(this.base + 'participantes', req);
    }

    updateParticipantes(req, id) {
        return this.http.put(this.base + 'participantes/' + id, req);
    }

    destroyParticipantes(id) {
        return this.http.delete(this.base + 'participantes/' + id);
    }
    misReuniones(empresa_id) {
      return this.http.get(this.base + 'mis-reuniones/' + empresa_id);
    }
    buscar(req) {
      return this.http.post(this.base + 'buscar-empresas', req);
    }
}
