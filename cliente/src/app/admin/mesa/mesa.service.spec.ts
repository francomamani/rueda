import { TestBed, inject } from '@angular/core/testing';

import { MesaService } from './mesa.service';

describe('MesaService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [MesaService]
    });
  });

  it('should be created', inject([MesaService], (service: MesaService) => {
    expect(service).toBeTruthy();
  }));
});
