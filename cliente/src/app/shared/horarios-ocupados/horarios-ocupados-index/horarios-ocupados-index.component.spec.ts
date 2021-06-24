import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HorariosOcupadosIndexComponent } from './horarios-ocupados-index.component';

describe('HorariosOcupadosIndexComponent', () => {
  let component: HorariosOcupadosIndexComponent;
  let fixture: ComponentFixture<HorariosOcupadosIndexComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HorariosOcupadosIndexComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HorariosOcupadosIndexComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
