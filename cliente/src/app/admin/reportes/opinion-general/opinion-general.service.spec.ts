import { TestBed, inject } from '@angular/core/testing';

import { OpinionGeneralService } from './opinion-general.service';

describe('OpinionGeneralService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [OpinionGeneralService]
    });
  });

  it('should be created', inject([OpinionGeneralService], (service: OpinionGeneralService) => {
    expect(service).toBeTruthy();
  }));
});
