import {Component, OnInit, ViewChild} from '@angular/core';
import {RubroService} from '../../admin/rubro/rubro.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NbToastrService} from '@nebular/theme';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {Router} from '@angular/router';
import {AuthService} from '../../auth.service';

@Component({
  selector: 'ngx-empresa-create',
  templateUrl: './empresa-create.component.html',
  styleUrls: ['./empresa-create.component.scss'],
})
export class EmpresaCreateComponent implements OnInit {
  @ViewChild('logo') logo;
  rubros: any = null;
  empresaGroup: FormGroup;
  mensaje = '';
  error = '';
  constructor(private rubroService: RubroService,
              private empresaService: EmpresaService,
              private authService: AuthService,
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
      'pagina_web': new FormControl(''),
      'ciudad_localidad': new FormControl('', Validators.required),
      'nit': new FormControl('', Validators.required),
      'representante_legal': new FormControl('', Validators.required),
      'habilitado': new FormControl(1, Validators.required),
      'max_participantes': new FormControl(2, Validators.required),
      'oferta': new FormControl('', Validators.required),
      'demanda': new FormControl('', Validators.required),
      'especial': new FormControl(0, Validators.required),
      'nombres': new FormControl('', Validators.required),
      'apellidos': new FormControl('', Validators.required),
      'email': new FormControl('', Validators.required),
      'password': new FormControl('', Validators.required),
      'repeated_password': new FormControl('', Validators.required),

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

    if (this.logo.nativeElement.files[0]) {
        const formData = new FormData();
        formData.append('rubro_id', this.empresaGroup.value.rubro_id);
        formData.append('nombre', this.empresaGroup.value.nombre);
        formData.append('logo', this.logo.nativeElement.files[0]);
        formData.append('direccion', this.empresaGroup.value.direccion);
        formData.append('telefono', this.empresaGroup.value.telefono);
        formData.append('pagina_web', this.empresaGroup.value.pagina_web);
        formData.append('ciudad_localidad', this.empresaGroup.value.ciudad_localidad);
        formData.append('nit', this.empresaGroup.value.nit);
        formData.append('representante_legal', this.empresaGroup.value.representante_legal);
        formData.append('habilitado', this.empresaGroup.value.habilitado === true ? '1' : '0');
        formData.append('max_participantes', this.empresaGroup.value.max_participantes);
        formData.append('oferta', this.empresaGroup.value.oferta);
        formData.append('demanda', this.empresaGroup.value.demanda);
        formData.append('especial', this.empresaGroup.value.especial === true ? '1' : '0');
        formData.append('nombres', this.empresaGroup.value.nombres);
        formData.append('apellidos', this.empresaGroup.value.apellidos);
        formData.append('email', this.empresaGroup.value.email);
        formData.append('password', this.empresaGroup.value.password);
        formData.append('repeated_password', this.empresaGroup.value.repeated_password);

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
            this.toastr.success('La empresa ' + res.nombre + ' fue registrada', 'Registro exitoso');
            if (this.router.url === '/signup') {
              this.router.navigate(['/login']);
            }
          });
    } else {
      this.empresaGroup.patchValue({
        'habilitado' : this.empresaGroup.value.habilitado === true ? '1' : '0',
        'especial' : this.empresaGroup.value.especial === true ? '1' : '0',
      });
      this.empresaService.store(this.empresaGroup.value)
        .subscribe((res: any) => {
          if ( this.empresaGroup.value.password === this.empresaGroup.value.repeated_password) {
            this.mensaje = 'La empresa ' + res.nombre + ' fue registrada';
            this.error = '';
            this.toastr.success('La empresa ' + res.nombre + ' fue registrada', 'Registro exitoso');
            if ( !this.authService.isLoggedIn()) {
              this.authService.login({
                email: this.empresaGroup.value.email,
                password: this.empresaGroup.value.password,
              }).subscribe((resLogin: any) => {
                this.toastr.success(resLogin.mensaje, 'Iniciando Sesion');
                if (resLogin.usuario.tipo_usuario === 'administrador') {
                  this.router.navigate(['/admin']);
                } else {
                  this.router.navigate(['/empresa']);
                }
              });
              this.empresaGroup.reset();
            } else {
              this.empresaGroup.reset();
              this.router.navigate(['/empresa']);
            }
          } else {
            this.mensaje = '';
            this.error = 'Las contraseñas no coinciden';
            this.toastr.danger('Las contraseñas no coinciden', 'Error de Registro');
          }
        });
    }
  }
}
