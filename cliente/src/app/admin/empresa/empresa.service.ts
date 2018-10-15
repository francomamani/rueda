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
}
