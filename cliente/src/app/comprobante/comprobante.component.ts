import {Component, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {EmpresaService} from '../admin/empresa/empresa.service';
import {ActivatedRoute, Router} from '@angular/router';
import {AuthService} from "../auth.service";
import {NgbModal} from "@ng-bootstrap/ng-bootstrap";
import {AyudaModalComponent} from "../shared/ayuda-modal/ayuda-modal.component";
import {LoadModalComponent} from "../shared/load-modal/load-modal.component";

@Component({
  selector: 'ngx-comprobante',
  templateUrl: './comprobante.component.html',
  styleUrls: ['./comprobante.component.scss'],
})
export class ComprobanteComponent implements OnInit {
  @ViewChild('comprobante') comprobante;
  compGroup: FormGroup;
  empresa_id = null;
  voucher =null;
  constructor(private fb: FormBuilder,
              private empresaService: EmpresaService,
              private route: ActivatedRoute,
              private authService: AuthService,
              private router: Router,
              private modalService: NgbModal) {

    this.route.params.subscribe((param) => {
      this.empresa_id = param.id_e;
    });
    console.log(this.authService.getUsuario());
    this.voucher = this.authService.getUsuario().voucher;
    this.authService.logout();
    this.createForm();
  }

  ngOnInit() {
  }
    createForm() {
        this.compGroup = this.fb.group({
            'comprobante': new FormControl('', Validators.required),
        });
    }

    subir() {
      if (this.comprobante.nativeElement.files[0]) {
        const formData = new FormData();
        formData.append('comprobante', this.comprobante.nativeElement.files[0]);
          const loadAyuda=this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
        this.empresaService.subirComprobante(this.empresa_id, formData)
          .subscribe(res => {
              this.router.navigate(['/auth']);
              loadAyuda.dismiss();
              this.ayuda('Se subió con éxito',
                  'Se subió su comprobante, espere a que lo revisemos y habilitemos su cuenta', '');
          }, error1 => {
              this.ayuda('Ocurrio un error', 'No se pudo subir el comprobante, intente nuevamente', '');
              loadAyuda.dismiss();
          });
      }
    }

  /**
   * titulo
   * mensaje
   * mensaje importante
   */

  ayuda(tit, mess, mess_i) {
        const modalAyuda = this.modalService.open(AyudaModalComponent, { size: 'sm', container: 'nb-layout' });
        modalAyuda.componentInstance.titulo = tit;
        modalAyuda.componentInstance.mensaje = mess;
        modalAyuda.componentInstance.mensaje_importante = mess_i;
  }
}
