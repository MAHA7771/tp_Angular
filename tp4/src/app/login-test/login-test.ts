import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import {FormsModule} from '@angular/forms'
@Component({
  selector: 'app-login-test',
  imports: [CommonModule,FormsModule],
  templateUrl: './login-test.html',
  styleUrl: './login-test.css',
})
export class LoginTest {
   isLoggedIn=false;
   inputName = '';
   myName = 'Maha';
    
  login() {
    if (this.inputName === this.myName) {
      this.isLoggedIn = true;
    } else {
      alert("Nom incorrect. Réessayez !");
    }
  }
   afficher(){
    console.log("Bienvenue, utilisateur!");

   }

}
