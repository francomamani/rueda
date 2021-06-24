import { TestBed, inject } from '@angular/core/testing';

import { ReunionService } from './reunion.service';

describe('ReunionService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ReunionService]
    });
  });

  it('should be created', inject([ReunionService], (service: ReunionService) => {
    expect(service).toBeTruthy();
  }));
});
