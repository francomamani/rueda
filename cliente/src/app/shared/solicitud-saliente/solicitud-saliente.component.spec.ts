import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SolicitudSalienteComponent } from './solicitud-saliente.component';

describe('SolicitudSalienteComponent', () => {
  let component: SolicitudSalienteComponent;
  let fixture: ComponentFixture<SolicitudSalienteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SolicitudSalienteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SolicitudSalienteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
