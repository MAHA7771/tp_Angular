import { Component, signal,ViewChild  } from '@angular/core';
import { BienvenueComponent } from './bienvenue/bienvenue';
import {Produit } from './produit/produit'
import { FormsModule } from '@angular/forms';
import { Utilisateur } from './utilisateur/utilisateur';
import { Panier } from './panier/panier';
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [FormsModule,BienvenueComponent,Produit,Utilisateur,Panier],
  templateUrl: './app.html',
  styleUrls: ['./app.css']
})
export class App {
  protected readonly title = signal('project0');
  // Accès au composant enfant Panier
   @ViewChild(Panier) Panier!: Panier;
   gererAjoutPanier(nomProduit: string) {
    this.Panier.ajouterProduit(nomProduit);
  }
}
