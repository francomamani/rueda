import {Component, OnInit, ViewChild} from '@angular/core';
import {RubroService} from '../../admin/rubro/rubro.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NbToastrService} from '@nebular/theme';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {Router} from '@angular/router';

@Component({
  selector: 'ngx-empresa-create',
  templateUrl: './empresa-create.component.html',
  styleUrls: ['./empresa-create.component.scss'],
})
export class EmpresaCreateComponent implements OnInit {
  rubros: any = null;
  empresaGroup: FormGroup;
  constructor(private rubroService: RubroService,
              private empresaService: EmpresaService,
              public router: Router,
              private fb: FormBuilder,
              private toastr: NbToastrService) {
    this.createForm();
    this.rubroService.index()
      .subscribe((res: any[]) => {
        this.rubros = res;
      });
  }

  createForm() {
    this.empresaGroup = this.fb.group({
      'rubro_id': new FormControl(0, Validators.required),
      'nombre': new FormControl('', Validators.required),
      'logo': new FormControl(''),
      'direccion': new FormControl('', Validators.required),
      'telefono': new FormControl('', Validators.required),
      'pagina_web': new FormControl('', Validators.required),
      'ciudad_localidad': new FormControl('', Validators.required),
      'nit': new FormControl('', Validators.required),
      'representante_legal': new FormControl('', Validators.required),
      'habilitado': new FormControl(true, Validators.required),
      'max_participantes': new FormControl(2, Validators.required),
      'oferta': new FormControl('', Validators.required),
      'demanda': new FormControl('', Validators.required),
      'especial': new FormControl(false, Validators.required),
      'nombres': new FormControl('', Validators.required),
      'apellidos': new FormControl('', Validators.required),
      'email': new FormControl('', Validators.required),
    });
  }
  ngOnInit() {
  }

  store() {
    this.empresaService.store(this.empresaGroup.value)
      .subscribe((res: any) => {
        this.toastr.success('La empresa ' + res.nombre + ' fue registrada', 'Registro exitoso');
        if (this.router.url === '/auth/signup') {
          this.router.navigate(['/auth/login']);
        }
      });
  }
}
