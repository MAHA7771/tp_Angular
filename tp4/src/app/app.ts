import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { LoginTest } from "./login-test/login-test";
import { Articles } from "./articles/articles";
import {List} from "./list/list"
import { GestionTache } from './gestion-tache/gestion-tache';
@Component({ 
  selector: 'app-root',
  imports: [RouterOutlet, LoginTest, Articles,List,GestionTache],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('tp4');
}
