import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment.prod';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class NoticiaService {


  base = environment.base;
  constructor(private http: HttpClient) { }

  index() {
    return this.http.get(this.base + 'noticias');
  }
  show(id: number) {
    return this.http.get(`${this.base}noticias/${id}`);
  }
  store(req) {
    return this.http.post(this.base + 'noticias', req);
  }
  update(req, id) {
    return this.http.put(this.base + 'noticias/' + id, req);
  }
  destroy(id) {
    return this.http.delete(this.base + 'noticias/' + id);
  }
}
