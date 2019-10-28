import { TestBed, inject } from '@angular/core/testing';

import { OfertaDemandaService } from './oferta-demanda.service';

describe('OfertaDemandaService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [OfertaDemandaService]
    });
  });

  it('should be created', inject([OfertaDemandaService], (service: OfertaDemandaService) => {
    expect(service).toBeTruthy();
  }));
});
