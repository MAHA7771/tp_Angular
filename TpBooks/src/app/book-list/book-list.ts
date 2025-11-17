import { Component, Input, Output, EventEmitter  } from '@angular/core';
import {Book} from "../book";
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-book-list',
  imports: [CommonModule],
  templateUrl: './book-list.html',
  styleUrl: './book-list.css',
})
export class BookList {
  @Input() books: Book[] = [];
  @Output() editBook = new EventEmitter<Book>();
  @Output() deleteBook = new EventEmitter<number>();
  trackByBookId(index: number, book: Book): number {
  return book.id;
}
}
