import {Component, OnInit} from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';
import {RubroService} from '../../admin/rubro/rubro.service';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {Router, ActivatedRoute} from '@angular/router';
import {NbToastrService} from '@nebular/theme';
import {AuthService} from '../../auth.service';

@Component({
    selector: 'ngx-empresa-edit',
    templateUrl: './empresa-edit.component.html',
    styleUrls: ['./empresa-edit.component.scss'],
})
export class EmpresaEditComponent implements OnInit {

    rubros: any = null;
    empresaGroup: FormGroup;
    emp: any = null;
    empresa_id: any;

    ruta_admin = '';

    constructor(private rubroService: RubroService,
                private empresaService: EmpresaService,
                public router: Router,
                public route: ActivatedRoute,
                private authService: AuthService,
                private fb: FormBuilder,
                private toastr: NbToastrService) {

        this.empresa_id = this.route.snapshot.paramMap.get('empresa_id');
        this.ruta_admin = '/admin/empresa/editar/' + this.empresa_id;

        this.rubroService.index()
            .subscribe((res: any[]) => {
                this.rubros = res;
            });
        this.empresaService.show(this.empresa_id)
            .subscribe((res: any) => {
                this.emp = res;
                this.createForm();
            });
    }

    createForm() {
        this.empresaGroup = this.fb.group({
            'rubro_id': new FormControl(this.emp.rubro_id, Validators.required),
            'nombre': new FormControl(this.emp.nombre, Validators.required),
            'logo': new FormControl(this.emp.logo),
            'direccion': new FormControl(this.emp.direccion, Validators.required),
            'telefono': new FormControl(this.emp.telefono, Validators.required),
            'pagina_web': new FormControl(this.emp.pagina_web),
            'ciudad_localidad': new FormControl(this.emp.ciudad_localidad, Validators.required),
            'nit': new FormControl(this.emp.nit, Validators.required),
            'representante_legal': new FormControl(this.emp.representante_legal, Validators.required),
            'habilitado': new FormControl(this.emp.habilitado, Validators.required),
            'max_participantes': new FormControl(this.emp.max_participantes, Validators.required),
            'oferta': new FormControl(this.emp.oferta, Validators.required),
            'demanda': new FormControl(this.emp.demanda, Validators.required),
            'especial': new FormControl(this.emp.especial, Validators.required),
        });
    }

    ngOnInit() {
    }

    store() {
        this.empresaService.update(this.empresaGroup.value, this.empresa_id)
            .subscribe((res: any) => {
                this.toastr.success(
                           'Los datos de la empresa '
                                  + res.nombre + ' fueron actualizadas',
                              'Actualización exitoss');
                if (this.router.url === this.ruta_admin) {
                    this.router.navigate(['/admin/empresa/listar']);
                } else {
                  this.authService.setUsuario(res);
                  this.router.navigate(['/empresa/perfil']);
                }
            });

    }
    cancelar() {
        if (this.router.url === this.ruta_admin) {
            this.router.navigate(['/admin/empresa/listar']);
        } else {
            this.router.navigate(['/empresa/perfil']);
        }
    }

}
