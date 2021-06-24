import { TestBed, inject } from '@angular/core/testing';

import { HorariosOcupadosService } from './horarios-ocupados.service';

describe('HorariosOcupadosService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [HorariosOcupadosService]
    });
  });

  it('should be created', inject([HorariosOcupadosService], (service: HorariosOcupadosService) => {
    expect(service).toBeTruthy();
  }));
});
