import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import {NoticiaService} from '../noticia.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-noticia-edit',
  templateUrl: './noticia-edit.component.html',
  styleUrls: ['./noticia-edit.component.scss'],
})
export class NoticiaEditComponent implements OnInit {

  id: number = null;
  noticia: any = null;
  noticiaGroup: FormGroup;
  constructor(private route: ActivatedRoute,
              private fb: FormBuilder,
              private toastr: NbToastrService,
              private router: Router,
              private noticiaService: NoticiaService) {
  }

  ngOnInit() {
    this.route.params.subscribe((param: any) => {
      this.id = param.id;
      this.noticiaService.show(param.id)
        .subscribe((noticia: any) => {
          this.noticia = noticia;
          this.noticiaGroup = this.fb.group({
            titulo: new FormControl(noticia.titulo, [Validators.required]),
            contenido: new FormControl(noticia.contenido, [Validators.required]),
          });
        });
    });
  }

  update() {
    this.noticiaService.update(this.noticiaGroup.value, this.id)
      .subscribe((res: any) => {
        this.router.navigate(['/admin/noticias/listar']);
        this.toastr.success('Noticia actualizada exitosamente', 'Exito');
      });
  }

  cancel() {
    this.router.navigate(['/admin/noticias/listar']);
  }
}
