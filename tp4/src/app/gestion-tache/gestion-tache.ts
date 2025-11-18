import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  selector: 'app-gestion-tache',
  imports: [CommonModule],
  templateUrl: './gestion-tache.html',
  styleUrl: './gestion-tache.css',
})
export class GestionTache {
   taches = [
    { description: 'Préparer le rapport', completee: false, priorite: 'haute' },
    { description: 'Envoyer les emails', completee: true, priorite: 'moyenne' },
    { description: 'Nettoyer la base de données', completee: false, priorite: 'basse' },
  ];

  toggleStatut(tache: any) {
    tache.completee = !tache.completee;
  }



}
