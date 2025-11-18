import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LoginTest } from './login-test';

describe('LoginTest', () => {
  let component: LoginTest;
  let fixture: ComponentFixture<LoginTest>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [LoginTest]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LoginTest);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
