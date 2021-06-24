import {Component, EventEmitter, Input, OnInit, Output, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NbToastrService} from '@nebular/theme';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import swal from 'sweetalert';

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
              private empresaService: EmpresaService) {
  }

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
      .subscribe((participante: any) => {
        swal('¡Participante actualizado!', `Participante ${participante.nombres} ${participante.apellidos} actualizado exitosamente`, 'success');
        /*        Swal.fire({
                  title: '¡Participante actualizado!',
                  html: `Participante <strong>${participante.nombres} ${participante.apellidos}</strong> actualizado exitosamente`,
                  icon: 'success',
                  confirmButtonText: 'Esta bien',
                });*/
        this.action.emit('index');
      });
  }

  cancelar() {
    this.action.emit('index');
  }
}
