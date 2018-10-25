import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {UsuarioService} from '../usuario.service';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {NbToastrService} from '@nebular/theme';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';

@Component({
  selector: 'ngx-usuario-index',
  templateUrl: './usuario-index.component.html',
  styleUrls: ['./usuario-index.component.scss']
})
export class UsuarioIndexComponent implements OnInit {

    buscarGroup: FormGroup;
    usuarios: any;
    usuariosAux : any;
    constructor(private usuarioService: UsuarioService,
                private modalService: NgbModal,
                private fb: FormBuilder,
                private toastr: NbToastrService) {
        this.createForm();
        this.usuarioService.index().subscribe((res:any[])=>{
            this.usuarios=res;
            this.usuariosAux=res;
        });

    }

    ngOnInit() {
    }

    createForm() {
        this.buscarGroup = this.fb.group({
            'search': new FormControl('', [Validators.required]),
        });
    }
    word:String;
    buscar() {
        this.word = this.buscarGroup.value.search;
        this.word = this.word.toLowerCase();
        if ( this.buscarGroup.value.search == '' ) {
            this.usuarios = this.usuariosAux;
        }  else {
            this.usuarios = [];
            this.usuariosAux.forEach((item, index) => {
                if (item.nombres.toLowerCase().includes(this.word) ||
                    item.email.toLowerCase().includes(this.word) ||
                    item.apellidos.toLowerCase().includes(this.word) ||
                    (item.empresa != null && item.empresa.nombre.toLowerCase().includes(this.word))) {
                    this.usuarios.push(item);
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
