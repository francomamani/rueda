import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmpresasRegistradasComponent } from './empresas-registradas.component';

describe('EmpresasRegistradasComponent', () => {
  let component: EmpresasRegistradasComponent;
  let fixture: ComponentFixture<EmpresasRegistradasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmpresasRegistradasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmpresasRegistradasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
