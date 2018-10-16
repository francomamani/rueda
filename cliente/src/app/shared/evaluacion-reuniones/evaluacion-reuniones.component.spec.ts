import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EvaluacionReunionesComponent } from './evaluacion-reuniones.component';

describe('EvaluacionReunionesComponent', () => {
  let component: EvaluacionReunionesComponent;
  let fixture: ComponentFixture<EvaluacionReunionesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EvaluacionReunionesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EvaluacionReunionesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
