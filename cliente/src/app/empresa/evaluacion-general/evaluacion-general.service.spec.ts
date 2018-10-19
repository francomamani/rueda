import { TestBed, inject } from '@angular/core/testing';

import { EvaluacionGeneralService } from './evaluacion-general.service';

describe('EvaluacionGeneralService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [EvaluacionGeneralService]
    });
  });

  it('should be created', inject([EvaluacionGeneralService], (service: EvaluacionGeneralService) => {
    expect(service).toBeTruthy();
  }));
});
