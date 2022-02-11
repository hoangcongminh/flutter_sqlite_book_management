import 'dart:async';

import '../model/book.dart';
import '../repository/book_repository.dart';

class BookBloc {
  final _repository = BookRepository();
  final _streamController = StreamController<List<Book>>.broadcast();

  get books => _streamController.stream;

  BookBloc() {
    getBooks();
  }

  void getBooks() async {
    _streamController.sink.add(await _repository.get());
  }

  void addBooks(Book book) async {
    await _repository.create(book);
    getBooks();
  }

  void updateBooks(Book book) async {
    await _repository.update(book);
    getBooks();
  }

  void deleteBooks(int id) async {
    await _repository.delete(id);
    getBooks();
  }

  void dispose() {
    _streamController.close();
  }
}
