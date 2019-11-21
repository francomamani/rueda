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
    administradores: any;
    constructor(private usuarioService: UsuarioService,
                private modalService: NgbModal,
                private fb: FormBuilder,
                private toastr: NbToastrService) {
        this.createForm();
        const loadModal = this.modalService.open(LoadModalComponent, { size: 'sm', container: 'nb-layout' });
        this.usuarioService.administradores()
          .subscribe((administradores: any) => {
            this.administradores = administradores;
            loadModal.dismiss();
          }, () => {
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
      if (this.buscarGroup.value.search === '') {
        this.usuarioService.administradores()
          .subscribe((administradores: any) => {
            this.administradores = administradores;
          });
      } else {
        this.usuarioService.searchAdministradores({
          value: this.buscarGroup.value.search,
        }).subscribe((administradores) => this.administradores = administradores);
      }
    }
    info(empresa) {
        const activeModal = this.modalService.open(EmpresaModalComponent, { size: 'lg', container: 'nb-layout' });
        activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
        activeModal.componentInstance.empresa = empresa;
    }
    onDeleteConfirm(usuario, index): void {
        if (window.confirm('¿Esta seguro que quiere eliminar a ' + usuario.cuenta + '?')) {
            this.usuarioService.destroy(usuario.usuario_id)
                .subscribe((res: any) => {
                    this.usuarios.splice(index, 1);
                    this.toastr.success(res.mensaje, 'Exito');
                });
        }
    }
    onResetConfirm(usuario): void {
        if (window.confirm(`¿Esta seguro que desea restablecer la contraseña de ${usuario.cuenta} a ${usuario.cuenta}?`)) {
              this.usuarioService.reset(usuario.usuario_id)
                  .subscribe((res: any) => {
                    alert(`La nueva contraseña es ${res.cuenta}`);
                  });
        }
    }
}
