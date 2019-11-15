import {Component, OnInit, ViewChild} from '@angular/core';
import {RubroService} from '../../admin/rubro/rubro.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NbToastrService} from '@nebular/theme';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {Router} from '@angular/router';
import {AuthService} from '../../auth.service';
import {LoadModalComponent} from '../load-modal/load-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {AyudaModalComponent} from '../ayuda-modal/ayuda-modal.component';
import Swal from 'sweetalert2';
@Component({
  selector: 'ngx-empresa-create',
  templateUrl: './empresa-create.component.html',
  styleUrls: ['./empresa-create.component.scss'],
})
export class EmpresaCreateComponent implements OnInit {
  @ViewChild('logo') logo;
  @ViewChild('voucher') voucher;
  rubros: any = null;
  empresaGroup: FormGroup;
  mensaje = null;
  error = null;
  constructor(private rubroService: RubroService,
              private empresaService: EmpresaService,
              private authService: AuthService,
              public router: Router,
              private fb: FormBuilder,
              private toastr: NbToastrService,
              private modalService: NgbModal) {
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
      'voucher': new FormControl(''),
      'direccion': new FormControl('', Validators.required),
      'pagina_web': new FormControl(''),
      'ciudad_localidad': new FormControl('', Validators.required),
      'nit': new FormControl('', Validators.required),
      'representante_legal': new FormControl('', Validators.required),
      'habilitado': new FormControl(false, Validators.required),
      'max_participantes': new FormControl(2, Validators.required),
      'oferta': new FormControl('ofertas'),
      'demanda': new FormControl('demandas'),
      'especial': new FormControl(0, Validators.required),
      'email': new FormControl(''),

      'p1_nombres': new FormControl('', Validators.required),
      'p1_apellidos': new FormControl('', Validators.required),
      'p1_carnet': new FormControl('', Validators.required),
      'p1_celular': new FormControl('', Validators.required),
      'p1_cargo': new FormControl('', Validators.required),

      'p2_nombres': new FormControl(''),
      'p2_apellidos': new FormControl(''),
      'p2_carnet': new FormControl(''),
      'p2_celular': new FormControl(''),
      'p2_cargo': new FormControl(''),

    });
  }
  ngOnInit() {
  }

  store() {
      const activeModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
      if ( this.empresaGroup.value.password === this.empresaGroup.value.repeated_password) {
          this.empresaGroup.patchValue({
              'habilitado': this.empresaGroup.value.habilitado === 1 ? '1' : '0',
              'especial': this.empresaGroup.value.especial === 1 ? '1' : '0',
          });
        if (this.logo.nativeElement.files[0]) {
          const formData = new FormData();
          if (this.voucher.nativeElement.files[0]) {
            formData.append('voucher', this.voucher.nativeElement.files[0]);
          } else {
            formData.append('voucher', this.empresaGroup.value.voucher);
          }
              formData.append('rubro_id', this.empresaGroup.value.rubro_id);
              formData.append('nombre', this.empresaGroup.value.nombre);
              formData.append('logo', this.logo.nativeElement.files[0]);
              formData.append('direccion', this.empresaGroup.value.direccion);
              formData.append('pagina_web', this.empresaGroup.value.pagina_web);
              formData.append('ciudad_localidad', this.empresaGroup.value.ciudad_localidad);
              formData.append('nit', this.empresaGroup.value.nit);
              formData.append('representante_legal', this.empresaGroup.value.representante_legal);
              formData.append('habilitado', this.empresaGroup.value.habilitado);
              formData.append('max_participantes', this.empresaGroup.value.max_participantes);
              formData.append('oferta', this.empresaGroup.value.oferta);
              formData.append('demanda', this.empresaGroup.value.demanda);
              formData.append('especial', this.empresaGroup.value.especial);
              formData.append('email', this.empresaGroup.value.email);

              formData.append('p1_nombres', this.empresaGroup.value.p1_nombres);
              formData.append('p1_apellidos', this.empresaGroup.value.p1_apellidos);
              formData.append('p1_carnet', this.empresaGroup.value.p1_carnet);
              formData.append('p1_celular', this.empresaGroup.value.p1_celular);
              formData.append('p1_cargo', this.empresaGroup.value.p1_cargo);

              formData.append('p2_nombres', this.empresaGroup.value.p2_nombres);
              formData.append('p2_apellidos', this.empresaGroup.value.p2_apellidos);
              formData.append('p2_carnet', this.empresaGroup.value.p2_carnet);
              formData.append('p2_celular', this.empresaGroup.value.p2_celular);
              formData.append('p2_cargo', this.empresaGroup.value.p2_cargo);

              this.empresaService.store(formData)
                  .subscribe((res: any) => {
                      this.mensaje = 'La empresa ' + res.nombre + ' fue registrada exitosamente';
                      this.toastr.success('La empresa ' + res.nombre + ' fue registrada', 'Registro exitoso');
                      const credenciales = {
                          cuenta: this.empresaGroup.value.cuenta,
                          password: this.empresaGroup.value.password,
                      };
                      if (this.router.url === '/auth/signup') {
                        Swal.fire({
                          title: '¡Empresa registrada!',
html: `Su cuenta es: <strong> ${this.empresaGroup.value.p1_nombres.toLowerCase().split(' ')[0]}</strong> y su contraseña es: <strong>${this.empresaGroup.value.p1_carnet}</strong>`,
                          icon: 'success',
                          confirmButtonText: 'Esta bien',
                        });
                        this.router.navigate(['/auth/login']);
/*                        this.ayuda('Usuario creado',
                          'La cuenta para su empresa fue creada exitosamente', '');*/
                      } else {
                          this.router.navigate(['/admin/empresa/listar']);
                      }
                      this.empresaGroup.reset();
                      activeModal.dismiss();
                  }, (error: any) => {
                    this.toastr.danger('La cuenta ya existe', 'Registro duplicado');
                    activeModal.dismiss();
                  });
          } else {
              this.empresaService.store(this.empresaGroup.value)
                  .subscribe((res: any) => {
                      if (this.router.url === '/auth/signup') {
                          this.mensaje = 'La empresa ' + res.nombre + ' fue registrada';
                          this.error = '';
                          this.toastr.success('La empresa ' + res.nombre + ' fue registrada', 'Registro exitoso');
                          this.router.navigate(['/auth']);
                          this.ayuda('Usuario creado',
                            'La cuenta para su empresa fue creada exitosamente', '');
                      } else {
                          this.router.navigate(['/admin/empresa/listar']);
                      }
                      activeModal.dismiss();
                  }, (error: any) => {
                    this.toastr.danger('La cuenta ya existe', 'Registro duplicado');
                    activeModal.dismiss();
                  });
          }
      } else {
          this.mensaje = '';
          this.error = 'Las contraseñas no coinciden';
          this.toastr.danger('Las contraseñas no coinciden', 'Error de Registro');
          activeModal.dismiss();
      }
  }
  ayuda(tit, mess, mess_i) {
    const modalAyuda = this.modalService.open(AyudaModalComponent, { size: 'sm', container: 'nb-layout' });
    modalAyuda.componentInstance.titulo = tit;
    modalAyuda.componentInstance.mensaje = mess;
    modalAyuda.componentInstance.mensaje_importante = mess_i;
  }

}
