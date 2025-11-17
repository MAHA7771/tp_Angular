import { Routes } from '@angular/router';
import { BookList } from './book-list/book-list';
import { BookForm } from './book-form/book-form';
import { BookContainer } from './book-container/book-container';
export const routes: Routes = [
    { path: '', component: BookContainer},

];
