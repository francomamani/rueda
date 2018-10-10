import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RubroIndexComponent } from './rubro-index.component';

describe('RubroIndexComponent', () => {
  let component: RubroIndexComponent;
  let fixture: ComponentFixture<RubroIndexComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RubroIndexComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RubroIndexComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
