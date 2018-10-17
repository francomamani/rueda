import {Injectable} from '@angular/core';
import {environment} from '../../../environments/environment.prod';
import {HttpClient} from '@angular/common/http';

@Injectable({
    providedIn: 'root'
})
export class AgendaService {

    base = environment.base;

    constructor(private http: HttpClient) {
    }

    index() {
        return this.http.get(this.base + 'agendas');
    }

    store(req) {
        return this.http.post(this.base + 'agendas', req);
    }
}
