import { TestBed, inject } from '@angular/core/testing';

import { OpinionReunionService } from './opinion-reunion.service';

describe('OpinionReunionService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [OpinionReunionService]
    });
  });

  it('should be created', inject([OpinionReunionService], (service: OpinionReunionService) => {
    expect(service).toBeTruthy();
  }));
});
