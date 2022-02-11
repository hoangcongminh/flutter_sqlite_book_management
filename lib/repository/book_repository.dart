import '../dao/book_dao.dart';
import '../model/book.dart';

class BookRepository {
  final dao = BookDAO();

  Future<List<Book>> get() => dao.get();
  Future<int> create(book) => dao.create(book);
  Future<int> update(book) => dao.create(book);
  Future<int> delete(id) => dao.delete(id);
}
