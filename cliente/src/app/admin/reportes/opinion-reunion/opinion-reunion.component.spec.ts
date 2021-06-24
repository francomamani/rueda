import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OpinionReunionComponent } from './opinion-reunion.component';

describe('OpinionReunionComponent', () => {
  let component: OpinionReunionComponent;
  let fixture: ComponentFixture<OpinionReunionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OpinionReunionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OpinionReunionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
