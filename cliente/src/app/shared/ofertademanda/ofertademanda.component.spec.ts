import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OfertademandaComponent } from './ofertademanda.component';

describe('OfertademandaComponent', () => {
  let component: OfertademandaComponent;
  let fixture: ComponentFixture<OfertademandaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OfertademandaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OfertademandaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
