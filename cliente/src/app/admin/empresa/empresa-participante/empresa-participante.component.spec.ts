import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmpresaParticipanteComponent } from './empresa-participante.component';

describe('EmpresaParticipanteComponent', () => {
  let component: EmpresaParticipanteComponent;
  let fixture: ComponentFixture<EmpresaParticipanteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmpresaParticipanteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmpresaParticipanteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
