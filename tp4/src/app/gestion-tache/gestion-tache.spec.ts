import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionTache } from './gestion-tache';

describe('GestionTache', () => {
  let component: GestionTache;
  let fixture: ComponentFixture<GestionTache>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GestionTache]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GestionTache);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
