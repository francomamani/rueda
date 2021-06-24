import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HorariosOcupadosCreateComponent } from './horarios-ocupados-create.component';

describe('HorariosOcupadosCreateComponent', () => {
  let component: HorariosOcupadosCreateComponent;
  let fixture: ComponentFixture<HorariosOcupadosCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HorariosOcupadosCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HorariosOcupadosCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
