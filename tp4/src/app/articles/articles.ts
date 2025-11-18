import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-articles',
  imports: [CommonModule,FormsModule],
  templateUrl: './articles.html',
  styleUrl: './articles.css',
})
export class Articles {
  articles=[
    {
      titre: "Introduction à Angular",
      contenu: "Angular est un framework puissant utilisé pour créer des applications web modernes.",
      importance:'élevée'
    },
    {
      titre: "TypeScript",
      contenu: "TypeScript ajoute une couche de typage statique à JavaScript, ce qui rend le code plus robuste.",
      importance:'moyenne'
    },
  ];
   // Champs pour ajouter un article
  newTitle = "";
  newContent = "";
  newImportance = "moyenne"; // valeur par défaut
  addArticle() {
    if (this.newTitle.trim() !== "" && this.newContent.trim() !== "") {
      this.articles.push({
        titre: this.newTitle,
        contenu: this.newContent,
        importance: this.newImportance
      });
   
      // Effacer les champs après ajout
      this.newTitle = "";
      this.newContent = "";
      this.newImportance = "moyenne";
    } else {
      alert("Veuillez remplir le titre et le contenu !");
    }
  }


}
