import { Component, OnInit } from '@angular/core';
/*
import './ckeditor.loader';
*/
import 'ng2-ckeditor';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NoticiaService} from '../noticia.service';
import {NbToastrService} from '@nebular/theme';
import {Router} from '@angular/router';

@Component({
  selector: 'ngx-noticia-create',
  templateUrl: './noticia-create.component.html',
  styleUrls: ['./noticia-create.component.scss'],
})
export class NoticiaCreateComponent implements OnInit {

  noticiaGroup: FormGroup;
  constructor(private fb: FormBuilder,
              private toastr: NbToastrService,
              private router: Router,
              private noticiaService: NoticiaService) {}

  ngOnInit() {
    this.noticiaGroup = this.fb.group({
      'titulo': new FormControl('', [Validators.required]),
      'contenido': new FormControl('', [Validators.required]),
    });
  }


  store() {
    this.noticiaService.store(this.noticiaGroup.value)
      .subscribe((res: any) => {
        this.router.navigate(['/admin/noticias']);
        this.toastr.success('Noticia registrada', 'Exito');
      });
  }

  cancelar() {
    this.router.navigate(['/admin/noticias/listar']);
  }
}
