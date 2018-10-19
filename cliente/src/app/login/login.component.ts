import {Component, OnInit, ViewChild} from '@angular/core';
import {AuthService} from '../auth.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NbToastrService} from '@nebular/theme';
import {ActivatedRoute, Router} from '@angular/router';
import {environment} from '../../environments/environment.prod';

@Component({
  selector: 'ngx-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent {
  @ViewChild('email') email;
  loginGroup: FormGroup;
  logo = environment.base + environment.usuario_logo;
  expoteco = environment.base + environment.load_logo + 'expoteco';
  campo_ferial = environment.base + environment.load_logo + 'campo_ferial';
  constructor(private authService: AuthService,
              private toastr: NbToastrService,
              private router: Router,
              private route: ActivatedRoute,
              private fb: FormBuilder) {
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
      'email': new FormControl('', Validators.required),
      'password': new FormControl('', Validators.required),
    });
  }

  login() {
    this.authService.login(this.loginGroup.value)
      .subscribe((res: any) => {
        this.toastr.success(res.mensaje, 'Iniciando Sesion');
        if (res.usuario.tipo_usuario === 'administrador') {
          this.router.navigate(['/admin']);
        } else {
          this.router.navigate(['/empresa']);
        }
      }, (error: any) => {
          this.toastr.danger(error.error.mensaje, 'Error de Autenticación');
          this.loginGroup.reset();
          this.email.nativeElement.focus();
      });
  }
}
