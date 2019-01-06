import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {UsuarioService} from '../usuario.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {NbToastrService} from '@nebular/theme';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {LoadModalComponent} from '../../../shared/load-modal/load-modal.component';

@Component({
  selector: 'ngx-usuario-index',
  templateUrl: './usuario-index.component.html',
  styleUrls: ['./usuario-index.component.scss'],
})
export class UsuarioIndexComponent implements OnInit {

    buscarGroup: FormGroup;
    usuarios: any;
    usuariosBK: any;
    constructor(private usuarioService: UsuarioService,
                private modalService: NgbModal,
                private fb: FormBuilder,
                private toastr: NbToastrService) {
        this.createForm();
        const loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
        this.usuarioService.index().subscribe((res: any) => {
            this.usuarios = res;
            this.usuariosBK = this.usuarios;
            loadModal.dismiss();
        },(error: any) => {
            loadModal.dismiss();
        });
    }

    ngOnInit() {
    }

    createForm() {
        this.buscarGroup = this.fb.group({
            'search': new FormControl('', [Validators.required]),
        });
    }
    buscar() {
      this.usuarios = this.usuariosBK;
      console.log(this.usuarios);
      const search = this.buscarGroup.value.search.toLowerCase();
      if ( search !== '') {
          this.usuarios = this.usuarios.filter((usuario: any) => {
            if (usuario.tipo_usuario === 'empresa') {
              return  usuario.nombres.toLowerCase().indexOf(search) >  -1 ||
                usuario.cuenta.toLowerCase().indexOf(search) >  -1 ||
                usuario.apellidos.toLowerCase().indexOf(search) >  -1 ||
                usuario.tipo_usuario.toLowerCase().indexOf(search) >  -1 ||
                usuario.empresa.nombre.toLowerCase().indexOf(search) >  -1;
            } else {
              return  usuario.nombres.toLowerCase().indexOf(search) >  -1 ||
                usuario.cuenta.toLowerCase().indexOf(search) >  -1 ||
                usuario.apellidos.toLowerCase().indexOf(search) >  -1 ||
                usuario.tipo_usuario.toLowerCase().indexOf(search) >  -1;
            }
          });
      }
    }
    info(empresa) {
        const activeModal = this.modalService.open(EmpresaModalComponent, { size: 'lg', container: 'nb-layout' });
        activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
        activeModal.componentInstance.empresa = empresa;
    }
    onDeleteConfirm(usuario, index): void {
        if (window.confirm('¿Esta seguro que quiere eliminar a ' + usuario.email + '?')) {
            this.usuarioService.destroy(usuario.usuario_id)
                .subscribe((res: any) => {
                    this.usuarios.splice(index, 1);
                    this.toastr.success(res.mensaje, 'Exito');
                });
        }
    }
    onResetConfirm(usuario): void {
        if (window.confirm('¿Esta seguro que desea restablecer la contraseña de ' + usuario.email + '?')) {
              this.usuarioService.reset(usuario.usuario_id)
                  .subscribe((res: any) => {
                      this.toastr.success('La nueva contraseña es su nombre de cuenta', res.mensaje);
                  });
        }
    }
}
