import { Component, OnInit } from '@angular/core';
import {NgbActiveModal} from "@ng-bootstrap/ng-bootstrap";

@Component({
  selector: 'ngx-ayuda-modal',
  templateUrl: './ayuda-modal.component.html',
  styleUrls: ['./ayuda-modal.component.scss'],
})
export class AyudaModalComponent implements OnInit {

  titulo = '';
  mensaje = '';
  mensaje_importante = '';
  constructor(private activeModal: NgbActiveModal) { }

  ngOnInit() {
  }

  closeModal() {
    this.activeModal.close();
  }
}
