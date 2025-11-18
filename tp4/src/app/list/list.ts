import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';


@Component({
  selector: 'app-list',
  imports: [CommonModule],
  templateUrl: './list.html',
  styleUrl: './list.css',
})
export class List {
  produit=[
    { nom: 'Ordinateur portable', stock: 70 },
    { nom: 'Smartphone', stock: 30 },
    { nom: 'Casque audio', stock: 15 },
    { nom: 'Clavier mécanique', stock: 10 }

  ]

}
