import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FormsModule } from '@angular/forms'; 
import { Utilisateur } from './utilisateur/utilisateur';
import { Profil } from './profil/profil';
import { AdresseComponent } from './adresse/adresse.component';
@Component({
  selector: 'app-root',
  imports: [RouterOutlet,FormsModule,Utilisateur,Profil,AdresseComponent],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('projet-evenement');
}
