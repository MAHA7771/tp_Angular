import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-panier',
  imports: [CommonModule],
  templateUrl: './panier.html',
  styleUrl: './panier.css'
})
export class Panier {
  produitsDansPanier: string[] = [];
  ajouterProduit(nomProduit: string) {
    this.produitsDansPanier.push(nomProduit);
  }

}
