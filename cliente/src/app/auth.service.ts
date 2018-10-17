import { Injectable } from '@angular/core';
import {environment} from '../environments/environment.prod';
import {HttpClient} from '@angular/common/http';
import 'rxjs/add/operator/map';
@Injectable({
  providedIn: 'root',
})
export class AuthService {
  base = environment.base;
  constructor(private http: HttpClient) { }
  login(req) {
    return this.http.post(this.base + 'login', req)
      .map((data: any) => {
        let usuario, token;
        if (data.token) {
          usuario = btoa(JSON.stringify(data.usuario));
          token = btoa(JSON.stringify(data.token));
          localStorage.setItem('rueda-usuario', usuario);
          localStorage.setItem('rueda-token', token);
        }
        return data;
      });
  }
  logout() {
    localStorage.removeItem('rueda-token');
    localStorage.removeItem('rueda-usuario');
  }
  getTipoUsuario() {
    return JSON.parse(atob(localStorage.getItem('rueda-usuario'))).tipo_usuario;
  }
  getUsuario() {
    return JSON.parse(atob(localStorage.getItem('rueda-usuario')));
  }
  isLoggedIn() {
    if (localStorage.getItem('rueda-token')) {
      return true;
    } else {
      return false;
    }
  }
  setUsuario(req) {
    const usuario = btoa(JSON.stringify(req));
    localStorage.removeItem('rueda-usuario');
    localStorage.setItem('rueda-usuario', usuario);
  }
  showUsuario(id) {
    return this.http.get(this.base + 'usuarios/' + id);
  }
  updateUsuario(id, req) {
    return this.http.put(this.base + 'usuarios/' + id, req);
  }
}
