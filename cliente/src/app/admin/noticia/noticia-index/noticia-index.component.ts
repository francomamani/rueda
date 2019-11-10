import { Component, OnInit } from '@angular/core';
import {NoticiaService} from '../noticia.service';
import {NbToastrService} from '@nebular/theme';
import {LoadModalComponent} from '../../../shared/load-modal/load-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'ngx-noticia-index',
  templateUrl: './noticia-index.component.html',
  styleUrls: ['./noticia-index.component.scss'],
})
export class NoticiaIndexComponent implements OnInit {

  noticias: any = null;
  loadModal = null;
  constructor(private noticiaService: NoticiaService,
              private modalService: NgbModal,
              private toastr: NbToastrService) {
  }

  ngOnInit() {
    this.loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
    this.noticiaService.index()
      .subscribe((res: any) => {
        this.noticias = res;
        this.loadModal.dismiss();
      });
  }
  reset() {
    this.loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
    this.noticiaService.index()
      .subscribe((res: any) => {
        this.noticias = res;
        this.loadModal.dismiss();
      });
  }
  destroy(noticia: any) {
    if (confirm(`¿Esta seguro de eliminar: ${noticia.titulo}?`)) {
      this.noticiaService.destroy(noticia.id)
        .subscribe(() => {
          this.reset();
          this.toastr.success('Noticia eliminada exitosamente', 'Exito');
        });
    }
  }
}
