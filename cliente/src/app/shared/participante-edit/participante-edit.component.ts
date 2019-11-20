import {Component, EventEmitter, Input, OnInit, Output, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NbToastrService} from '@nebular/theme';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'ngx-participante-edit',
  templateUrl: './participante-edit.component.html',
  styleUrls: ['./participante-edit.component.scss'],
})
export class ParticipanteEditComponent implements OnInit {

  @Input() participante;
  @Output() action = new EventEmitter<string>();
  @ViewChild('nombres') nombres;
  participanteGroup: FormGroup;
  constructor(private fb: FormBuilder,
              private toastr: NbToastrService,
              private empresaService: EmpresaService) { }

  ngOnInit() {
    this.participanteGroup = this.fb.group({
      empresa_id: new FormControl(this.participante.empresa_id, Validators.required),
      nombres: new FormControl(this.participante.nombres, Validators.required),
      apellidos: new FormControl(this.participante.apellidos, Validators.required),
      carnet: new FormControl(this.participante.carnet, Validators.required),
      celular: new FormControl(this.participante.celular, Validators.required),
      cargo: new FormControl(this.participante.cargo, Validators.required),
    });
    this.nombres.nativeElement.focus();
  }

  update() {
    this.empresaService.updateParticipantes(this.participanteGroup.value, this.participante.participante_id)
      .subscribe(() => {

      });
/*
    Swal.fire({
      title: '¡Máximo de participantes lleno!',
      html: `Su empresa <strong>${this.empresa.nombre}</strong> ya tiene el máximo de participantes permitidos </strong><br/>
               Si desea registrar más participantes, comuniquese con administración al <strong>52 66111</strong>`,
      icon: 'error',
      confirmButtonText: 'Esta bien',
    });
*/
  }

  cancelar() {
    this.action.emit('index');
  }
}
