import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {NbToastrService} from '@nebular/theme';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {OpinionGeneralService} from './opinion-general.service';

@Component({
    selector: 'ngx-opinion-general',
    templateUrl: './opinion-general.component.html',
    styleUrls: ['./opinion-general.component.scss'],
})
export class OpinionGeneralComponent implements OnInit {

    buscarGroup: FormGroup;
    empresas: any;
    empresasAux: any;

    constructor(private opinionService: OpinionGeneralService,
                private modalService: NgbModal,
                private fb: FormBuilder,
                private toastr: NbToastrService) {
        this.createForm();
        this.opinionService.index().subscribe((res: any[]) => {
            this.empresas = res;
            this.empresasAux = res;
        });

    }

    ngOnInit() {
    }

    createForm() {
        this.buscarGroup = this.fb.group({
            'search': new FormControl('', [Validators.required]),
        });
    }

    word: String;

    buscar() {
        this.word = this.buscarGroup.value.search;
        this.word = this.word.toLowerCase();
        if (this.buscarGroup.value.search === '') {
            this.empresas = this.empresasAux;
        } else {
            this.empresas = [];
            this.empresasAux.forEach((item, index) => {
                if (item.nombre.toLowerCase().includes(this.word)) {
                    this.empresas.push(item);
                }
            });
        }
    }

    info(empresa) {
        const activeModal = this.modalService.open(EmpresaModalComponent, {size: 'lg', container: 'nb-layout'});
        activeModal.componentInstance.modalHeader = 'Empresa: ' + empresa.nombre;
        activeModal.componentInstance.empresa = empresa;
    }

}
