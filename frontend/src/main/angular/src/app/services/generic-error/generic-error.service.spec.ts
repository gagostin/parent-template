import { TestBed } from '@angular/core/testing';

import { GenericErrorService } from './generic-error.service';

describe('GenericErrorService', () => {
  let service: GenericErrorService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(GenericErrorService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
