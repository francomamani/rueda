import { TestBed, inject } from '@angular/core/testing';

import { EvaluacionReunionesService } from './evaluacion-reuniones.service';

describe('EvaluacionReunionesService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [EvaluacionReunionesService]
    });
  });

  it('should be created', inject([EvaluacionReunionesService], (service: EvaluacionReunionesService) => {
    expect(service).toBeTruthy();
  }));
});
