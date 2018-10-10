import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../../environments/environment.prod';

@Injectable({providedIn: 'root'})
export class RubroService {

  base = environment.base;
  constructor(private http: HttpClient) { }

  index() {
    return this.http.get(this.base + 'rubros');
  }
  store(req) {
    return this.http.post(this.base + 'rubros', req);
  }
  update(req, id) {
    return this.http.put(this.base + 'rubros/' + id, req);
  }
  destroy(id) {
    return this.http.delete(this.base + 'rubros/' + id);
  }
}
