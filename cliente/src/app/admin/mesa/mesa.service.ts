import { Injectable } from '@angular/core';
import {environment} from "../../../environments/environment.prod";
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class MesaService {

    base = environment.base;
    constructor(private http: HttpClient) { }

    index() {
        return this.http.get(this.base + 'mesas');
    }
    store(req) {
        return this.http.post(this.base + 'mesas', req);
    }
    update(req, id) {
        return this.http.put(this.base + 'mesas/' + id, req);
    }
    destroy(id) {
        return this.http.delete(this.base + 'mesas/' + id);
    }

    mesas_dis(id_h){
        return this.http.get(this.base + 'mesas-disponibles/'+id_h);
    }
}
