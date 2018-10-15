import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HorariosOcupadosComponent } from './horarios-ocupados.component';

describe('HorariosOcupadosComponent', () => {
  let component: HorariosOcupadosComponent;
  let fixture: ComponentFixture<HorariosOcupadosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HorariosOcupadosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HorariosOcupadosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
