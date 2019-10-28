import { Component } from '@angular/core';

@Component({
  selector: 'ngx-footer',
  styleUrls: ['./footer.component.scss'],
  template: `
    <span class="created-by">
      Copyright &copy; 2019 <b>Rueda de Negocios </b> | <b><a href="https://www.campoferial3dejulio.com" target="_blank">Campo Ferial 3 de Julio</a></b>
    </span>
    <div class="developed_by">
      Desarrollado por <b><a href="https://www.facebook.com/mamanipozofrancojesus" target="_blank">Franco Mamani</a></b>
      y <b><a href="https://www.facebook.com/Matt2393" target="_blank">Antonio Callisaya</a></b>
    </div>
    <div class="socials">
      <a href="https://www.facebook.com/campoferial3dejuliooficial" target="_blank" class="ion ion-social-facebook"></a>
    </div>
  `,
})
export class FooterComponent {
}
