import { Component, EventEmitter, Output ,Input, importProvidersFrom} from '@angular/core';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-produit',
  imports: [CommonModule],
  templateUrl: './produit.html',
  styleUrl: './produit.css'
})
export class Produit {
   message: string = 'Bienvenue sur notre site Produit !';
   imageUrl: string = 'assets/produit.webp';
   enStock:boolean=true;
   @Output() ajouterAuPanier = new EventEmitter<string>();
   @Input() nomProduit: string = '';
   prix:number=50;
   
   
   afficherAlerte(){
    alert("Produit ajouté au panier");
   }

     toggleStock() {
    this.enStock = !this.enStock;
  }
   ajouter() {
    this.ajouterAuPanier.emit(this.nomProduit);
  }

}
