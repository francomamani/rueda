import { Component, OnInit } from '@angular/core';
import {EmpresaService} from '../empresa/empresa.service';
import {NgbActiveModal, NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {RubroService} from '../rubro/rubro.service';
import {LoadModalComponent} from '../../shared/load-modal/load-modal.component';
import {AyudaModalComponent} from '../../shared/ayuda-modal/ayuda-modal.component';
import {NbToastrService} from '@nebular/theme';

@Component({
  selector: 'ngx-voucher-modal',
  templateUrl: './voucher-modal.component.html',
  styleUrls: ['./voucher-modal.component.scss'],
})
export class VoucherModalComponent implements OnInit {

  id_empresa: any;
  comp = null;
  constructor(private empresaService: EmpresaService,
              private toastr: NbToastrService,
              private activeModal: NgbActiveModal,
              private modalService: NgbModal) {
  }

  ngOnInit() {
  }
  habilitar() {
      const loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
    this.empresaService.empresaHabilitar(this.id_empresa).subscribe(res => {
      loadModal.dismiss();
      this.activeModal.close();
    }, error1 => {
      loadModal.dismiss();
        const messModal = this.modalService.open(AyudaModalComponent, { size: 'sm', container: 'nb-layout' });
        messModal.componentInstance.titulo = 'Ocurrio un error';
        messModal.componentInstance.mensaje = 'no se puedo habilitar esta empresa, intente nuevamente';
        messModal.componentInstance.mensaje_importante = '';
    });
  }

  closeModal() {
    this.activeModal.close();
  }

  uploadVoucher(event) {
    const formData = new FormData();
    if (event.srcElement.files[0]) {
      formData.append('voucher', event.srcElement.files[0]);
      this.empresaService.uploadVoucher(this.id_empresa, formData)
        .subscribe((res: any) => {
          this.toastr.success('Voucher subido exitosamente', 'Éxito');
          this.activeModal.close();
        });
    }
  }
}
