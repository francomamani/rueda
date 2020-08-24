import {Injectable} from '@angular/core';
import {environment} from '../../../environments/environment.prod';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class ReunionService {

  base = environment.base;

  constructor(private http: HttpClient) {
  }

  index() {
    return this.http.get(this.base + 'reuniones');
  }

  store(req) {
    return this.http.post(this.base + 'reuniones', req);
  }

  update(req, id) {
    return this.http.put(this.base + 'reuniones/' + id, req);
  }

  destroy(id) {
    return this.http.delete(this.base + 'reuniones/' + id);
  }

  /*
  * Emrpesas
  * */
  agendasMesa(data: {
    fecha: string
  }) {
    return this.http.post(`${this.base}agendas-mesa`, data);
  }
}
