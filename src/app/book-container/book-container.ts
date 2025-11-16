import { Component } from '@angular/core';
import {Book} from "../book";
import {BookList} from "../book-list/book-list";
import { BookForm } from '../book-form/book-form';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-book-container',
  imports: [FormsModule,BookList,BookForm,CommonModule],
  templateUrl: './book-container.html',
  styleUrl: './book-container.css',
})
export class BookContainer {
  bookToEdit: Book | null = null; 
  filterText: string = ''; // texte de recherche
  Books:Book[]=[{
       id : 1,
       title : "the Book of evil",
       author : "Jane Ellewood",
       publisherEmail : "janeElle@gmail.com",
       publisherPhone : "22147896",
       releaseDate : "19/1995",
       category : "Fiction",
       isAvailable : true,
   },
   {
    id: 1,
    title: 'Le Petit Prince',
    author: 'Antoine de Saint-Exupéry',
    publisherEmail : "janeElle@gmail.com",
    publisherPhone : "22147896",
    releaseDate : "19/1995",
    category: 'Roman',
    isAvailable: true
   }  
  
  ];

  tab : String[]=["Roman","Science","Histoire","Informatique","Art","Autres"];

   // CREATE / UPDATE
  addOrUpdateBook(book: Book) {
    const index = this.Books.findIndex(b => b.id === book.id);
    if (index > -1) {
      this.Books[index] = book; // UPDATE
    } else {
      this.Books.push(book); // CREATE
    }
    this.bookToEdit = null;
  }
    // DELETE
  deleteBook(id:number){
    this.Books = this.Books.filter(b => b.id !== id);

  }
  // EDIT
 editBook(book: Book) {
  this.bookToEdit = { ...book }; // précharge le formulaire
}
  // FILTER
  filteredBooks() {
    return this.Books.filter(b => 
      b.title.toLowerCase().includes(this.filterText.toLowerCase())
    );
  }

  // SORT
  sortByCategory() {
    this.Books.sort((a, b) => a.category.localeCompare(b.category));
  }

  sortByAvailable() {
    this.Books.sort((a, b) => Number(b.isAvailable) - Number(a.isAvailable));
  }


}
