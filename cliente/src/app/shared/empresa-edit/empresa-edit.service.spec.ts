import { TestBed, inject } from '@angular/core/testing';

import { EmpresaEditService } from './empresa-edit.service';

describe('EmpresaEditService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [EmpresaEditService]
    });
  });

  it('should be created', inject([EmpresaEditService], (service: EmpresaEditService) => {
    expect(service).toBeTruthy();
  }));
});
