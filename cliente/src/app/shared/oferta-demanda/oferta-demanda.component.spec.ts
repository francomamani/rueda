import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OfertaDemandaComponent } from './oferta-demanda.component';

describe('OfertaDemandaComponent', () => {
  let component: OfertaDemandaComponent;
  let fixture: ComponentFixture<OfertaDemandaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OfertaDemandaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OfertaDemandaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
