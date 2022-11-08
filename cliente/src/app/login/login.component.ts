import {Component, OnInit, ViewChild} from '@angular/core';
import {AuthService} from '../auth.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NbToastrService} from '@nebular/theme';
import {ActivatedRoute, Router} from '@angular/router';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {LoadModalComponent} from '../shared/load-modal/load-modal.component';
import {AyudaModalComponent} from '../shared/ayuda-modal/ayuda-modal.component';

@Component({
  selector: 'ngx-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent {
  @ViewChild('cuenta') cuenta;
  mensaje: string = '';
  loginGroup: FormGroup;

  /*  logo = environment.base + environment.usuario_logo;
    expoteco = environment.base + environment.load_logo + 'expoteco';
    campo_ferial = environment.base + environment.load_logo + 'campo_ferial';*/
  constructor(private authService: AuthService,
              private toastr: NbToastrService,
              private router: Router,
              private route: ActivatedRoute,
              private fb: FormBuilder,
              private modalService: NgbModal) {
    this.route.params
      .subscribe((param: any) => {
        if (authService.isLoggedIn()) {
          if (param.logout === 'logout') {
            this.authService.logout();
            this.router.navigate(['/auth']);
          } else {
            if (authService.getTipoUsuario() === 'administrador') {
              this.router.navigate(['/admin']);
            } else {
              this.router.navigate(['/empresa']);
            }
          }
        }

      });
    this.createForm();
  }

  createForm() {
    this.loginGroup = this.fb.group({
      'cuenta': new FormControl('', Validators.required),
      'password': new FormControl('', Validators.required),
    });
  }

  ayuda() {
    const modalAyuda = this.modalService.open(AyudaModalComponent, {size: 'lg', container: 'nb-layout'});
    modalAyuda
      .componentInstance
      .titulo = 'Olvide mi contraseña';
    modalAyuda
      .componentInstance
      .mensaje = 'Para reestablecer su contraseña comuníquese con la administración del Campo Ferial al número de celular';
    modalAyuda.componentInstance.mensaje_importante = '62809166';
  }

  login() {
    const activeModal = this.modalService.open(LoadModalComponent, {size: 'sm', container: 'nb-layout'});
    this.authService.login(this.loginGroup.value)
      .subscribe((res: any) => {
        if (res.usuario.tipo_usuario === 'administrador') {
          this.toastr.success(res.mensaje, 'Iniciando Sesion');
          this.router.navigate(['/admin']);
        } else {
          if (res.usuario.habilitado) {
            this.toastr.success(res.mensaje, 'Iniciando Sesion');
            this.router.navigate(['/empresa']);
          } else {
            this.toastr.warning(res.mensaje, 'No esta habilitado');
            this.router.navigate(['/auth/comprobante/' + res.usuario.empresa_id]);
          }
        }
        activeModal.dismiss();
      }, (error: any) => {
        this.mensaje = 'Las credenciales son incorrectas';
        /*          this.toastr.danger('Credenciales inválidas', 'Error de Autenticación');*/
        this.loginGroup.reset();
        this.cuenta.nativeElement.focus();
        activeModal.dismiss();
      });
  }

}
