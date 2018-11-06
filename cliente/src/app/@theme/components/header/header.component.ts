import { Component, Input, OnInit } from '@angular/core';

import { NbMenuService, NbSidebarService } from '@nebular/theme';
import { UserService } from '../../../@core/data/users.service';
import { AnalyticsService } from '../../../@core/utils/analytics.service';
import { LayoutService } from '../../../@core/data/layout.service';
import {AuthService} from '../../../auth.service';
import {Router} from '@angular/router';

@Component({
  selector: 'ngx-header',
  styleUrls: ['./header.component.scss'],
  templateUrl: './header.component.html',
})
export class HeaderComponent implements OnInit {

  @Input() position = 'normal';

  usuario = JSON.parse(atob(localStorage.getItem('rueda-usuario')));
  userMenu: any = null;
  url = null;
  constructor(private sidebarService: NbSidebarService,
              private menuService: NbMenuService,
              private userService: UserService,
              private router: Router,
              private authService: AuthService,
              private analyticsService: AnalyticsService,
              private layoutService: LayoutService) {

    this.url = this.authService.generarBackup();
    if ( this.usuario.tipo_usuario === 'administrador') {
      this.userMenu = [ { title: 'Perfil', link: '/admin/perfil' },
                        { title: 'Cambiar Contraseña', link: '/admin/cambiar-password' },
                        { title: 'Cerrar Sesion' , link: '/auth/login/logout' }];
    } else {
      this.userMenu = [ { title: 'Perfil', link: '/empresa/perfil' },
                        { title: 'Cambiar Contraseña', link: '/empresa/cambiar-password' },
                        { title: 'Cerrar Sesion' , link: '/auth/login/logout'}];
    }
  }

  ngOnInit() {
/*    this.userService.getUsers()
      .subscribe((users: any) => this.user = users.nick);*/
  }

  toggleSidebar(): boolean {
    this.sidebarService.toggle(true, 'menu-sidebar');
    this.layoutService.changeLayoutSize();

    return false;
  }

  toggleSettings(): boolean {
    this.sidebarService.toggle(false, 'settings-sidebar');

    return false;
  }

  goToHome() {
    this.menuService.navigateHome();
  }

  startSearch() {
    this.analyticsService.trackEvent('startSearch');
  }
}
