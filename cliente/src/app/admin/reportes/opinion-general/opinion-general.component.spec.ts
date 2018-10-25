import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OpinionGeneralComponent } from './opinion-general.component';

describe('OpinionGeneralComponent', () => {
  let component: OpinionGeneralComponent;
  let fixture: ComponentFixture<OpinionGeneralComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OpinionGeneralComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OpinionGeneralComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
