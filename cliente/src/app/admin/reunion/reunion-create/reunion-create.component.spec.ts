import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReunionCreateComponent } from './reunion-create.component';

describe('ReunionCreateComponent', () => {
  let component: ReunionCreateComponent;
  let fixture: ComponentFixture<ReunionCreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReunionCreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReunionCreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
