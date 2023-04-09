import { TestBed } from '@angular/core/testing';

import { CommesseService } from './commesse.service';

describe('CommesseService', () => {
  let service: CommesseService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CommesseService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
