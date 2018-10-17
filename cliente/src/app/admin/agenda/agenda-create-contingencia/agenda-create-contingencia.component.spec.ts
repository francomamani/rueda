import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AgendaCreateContingenciaComponent } from './agenda-create-contingencia.component';

describe('AgendaCreateContingenciaComponent', () => {
  let component: AgendaCreateContingenciaComponent;
  let fixture: ComponentFixture<AgendaCreateContingenciaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AgendaCreateContingenciaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AgendaCreateContingenciaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
