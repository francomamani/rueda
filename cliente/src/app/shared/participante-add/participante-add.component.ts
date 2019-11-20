import {Component, EventEmitter, Input, OnInit, Output, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {EmpresaService} from '../../admin/empresa/empresa.service';
import {NbToastrService} from '@nebular/theme';
import Swal from 'sweetalert2';

@Component({
  selector: 'ngx-participante-add',
  templateUrl: './participante-add.component.html',
  styleUrls: ['./participante-add.component.scss'],
})
export class ParticipanteAddComponent implements OnInit {

  @Input() empresa;
  @Input() cantidad: number;
  @Output() action = new EventEmitter<string>();
  @ViewChild('nombres') nombres;
  participanteGroup: FormGroup;
  constructor(private fb: FormBuilder,
              private toastr: NbToastrService,
              private empresaService: EmpresaService) { }

  ngOnInit() {
    this.participanteGroup = this.fb.group({
      empresa_id: new FormControl(this.empresa.empresa_id, Validators.required),
      nombres: new FormControl('', Validators.required),
      apellidos: new FormControl('', Validators.required),
      carnet: new FormControl('', Validators.required),
      celular: new FormControl('', Validators.required),
      cargo: new FormControl('', Validators.required),
    });
    this.nombres.nativeElement.focus();
  }

  store() {
    if (this.cantidad < this.empresa.max_participantes) {
      this.empresaService.storeParticipantes(this.participanteGroup.value)
        .subscribe(() => {
          this.action.emit('index');
          this.toastr.success(`${this.participanteGroup.value.nombres} ${this.participanteGroup.value.apellidos} REGISTRADO EXITOSAMENTE.`, 'Participante registrado');
        });
    } else {
      Swal.fire({
        title: '¡Máximo de participantes lleno!',
        html: `Su empresa <strong>${this.empresa.nombre}</strong> ya tiene el máximo de participantes permitidos </strong><br/>
               Si desea registrar más participantes, comuniquese con administración al <strong>52 66111</strong>`,
        icon: 'error',
        confirmButtonText: 'Esta bien',
      });
    }
  }

  cancelar() {
    this.action.emit('index');
  }
}
