import {Component, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {EmpresaService} from '../admin/empresa/empresa.service';
import {ActivatedRoute, Router} from '@angular/router';

@Component({
  selector: 'ngx-comprobante',
  templateUrl: './comprobante.component.html',
  styleUrls: ['./comprobante.component.scss'],
})
export class ComprobanteComponent implements OnInit {
  @ViewChild('comprobante') comprobante;
  compGroup: FormGroup;
  empresa_id = null;
  constructor(private fb: FormBuilder,
              private empresaService: EmpresaService,
              private route: ActivatedRoute) {

    this.route.params.subscribe((param) => {
      this.empresa_id = param.id_e;
    });
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
        this.empresaService.subirComprobante(this.empresa_id, formData)
          .subscribe(res => {
            console.log(res);
            alert('Se subio el voucher');
          });
      }
    }

}
