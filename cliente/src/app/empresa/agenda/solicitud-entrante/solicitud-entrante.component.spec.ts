import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SolicitudEntranteComponent } from './solicitud-entrante.component';

describe('SolicitudEntranteComponent', () => {
  let component: SolicitudEntranteComponent;
  let fixture: ComponentFixture<SolicitudEntranteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SolicitudEntranteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SolicitudEntranteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
