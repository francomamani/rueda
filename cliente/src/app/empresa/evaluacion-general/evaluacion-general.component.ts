import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, FormControl, Validators} from '@angular/forms';

@Component({
  selector: 'ngx-evaluacion-general',
  templateUrl: './evaluacion-general.component.html',
  styleUrls: ['./evaluacion-general.component.scss']
})
export class EvaluacionGeneralComponent implements OnInit {

  evaluacionOrg=[
      {id:1,value:'Muy malo'},
      {id:2,value:'Malo'},
      {id:3,value:'Regular'},
      {id:4,value:'Bueno'},
      {id:5,value:'Muy bueno'},

  ]

  tipo_empresa:any;
    medio_comunic: any;


    evaluacionGroup: FormGroup;

  constructor(private fb: FormBuilder,) {
    this.createForm()
  }

    createForm() {
        this.evaluacionGroup = this.fb.group({
            'atencion': new FormControl(0, Validators.required),
            'acreditacion': new FormControl(0, Validators.required),
            'reuniones': new FormControl(0, Validators.required),
            'info_antes': new FormControl(0, Validators.required),
            'info_durante': new FormControl(0, Validators.required),
            'tipo_empresa': new FormControl(0, Validators.required),
            'medio_com': new FormControl('', Validators.required),
            'volver_participar': new FormControl('', Validators.required),
            'opinion': new FormControl('', Validators.required),
        });
    }

  ngOnInit() {
  }

}
