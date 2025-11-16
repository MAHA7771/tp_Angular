import { Component, EventEmitter, Output, Input} from '@angular/core';
import {FormsModule} from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Book } from '../book';
@Component({
  selector: 'app-book-form',
  imports: [FormsModule,CommonModule],
  templateUrl: './book-form.html',
  styleUrl: './book-form.css',
})
export class BookForm {
    @Input() bookToEdit: Book | null = null; // pour UPDATE
    @Output() bookAdded = new EventEmitter<Book>();
  book: Book = {
    id:0,
    title: '',
    author: '',
    publisherEmail: '',
    publisherPhone: '',
    releaseDate: '',
    category: '',
    isAvailable: false,
    stock: undefined
  };
   ngOnChanges() {
    if (this.bookToEdit) {
      this.book = { ...this.bookToEdit }; // précharger le formulaire
    }
  }

    onSubmit(form: any) {
    if (!form.valid) return;

    if (!this.book.id) {
      // CREATE
      this.book.id = Date.now(); // générer un id unique simple
      this.bookAdded.emit({...this.book});
    } else {
      // UPDATE, géré depuis le parent
      this.bookAdded.emit({...this.book});
    }

    form.resetForm(); // réinitialiser le formulaire
    this.book = {
      id: 0,
      title: '',
      author: '',
      publisherEmail: '',
      publisherPhone: '',
      releaseDate: '',
      category: '',
      isAvailable: false,
      stock: 0
    };
  }

}
