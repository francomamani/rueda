import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {NbToastrService} from '@nebular/theme';
import {EmpresaModalComponent} from '../../../shared/empresa-modal/empresa-modal.component';
import {OpinionReunionService} from './opinion-reunion.service';

@Component({
  selector: 'ngx-opinion-reunion',
  templateUrl: './opinion-reunion.component.html',
  styleUrls: ['./opinion-reunion.component.scss'],
})
export class OpinionReunionComponent implements OnInit {

    buscarGroup: FormGroup;
    empresas: any;
    empresasAux: any;

    constructor(private opinionService: OpinionReunionService,
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
                if (item.empresa.toLowerCase().includes(this.word) ||
                    item.reunion_con.toLowerCase().includes(this.word)) {
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
