import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReunionesAgendadasComponent } from './reuniones-agendadas.component';

describe('ReunionesAgendadasComponent', () => {
  let component: ReunionesAgendadasComponent;
  let fixture: ComponentFixture<ReunionesAgendadasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReunionesAgendadasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReunionesAgendadasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
