import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CalendarSnackbarComponent } from './calendar-snackbar.component';

describe('CalendarSnackbarComponent', () => {
  let component: CalendarSnackbarComponent;
  let fixture: ComponentFixture<CalendarSnackbarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CalendarSnackbarComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CalendarSnackbarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
