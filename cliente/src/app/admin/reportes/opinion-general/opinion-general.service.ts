import { Injectable } from '@angular/core';
import {environment} from '../../../../environments/environment.prod';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class OpinionGeneralService {

  base = environment.base;
  constructor(private http: HttpClient) { }
    index() {
        return this.http.get(this.base + 'comentarios-generales');
    }
}
