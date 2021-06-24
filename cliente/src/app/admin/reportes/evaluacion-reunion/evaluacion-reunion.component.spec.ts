import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EvaluacionReunionComponent } from './evaluacion-reunion.component';

describe('EvaluacionReunionComponent', () => {
  let component: EvaluacionReunionComponent;
  let fixture: ComponentFixture<EvaluacionReunionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EvaluacionReunionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EvaluacionReunionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
