import 'package:book_management/model/book.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_provider.dart';

class BookDAO {
  final databaseProvider = DatabaseProvider.provider;
  static const BOOK_TABLE = 'books';

  //create
  Future<int> create(Book book) async {
    final database = await databaseProvider.database;
    final result = database.insert(
      BOOK_TABLE,
      bookToRecord(book),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  //read
  Future<List<Book>> get() async {
    final database = await databaseProvider.database;
    List<Map<String, dynamic>> result = await database.query(BOOK_TABLE);
    return List.generate(
      result.length,
      (index) => recordToBook(result[index]),
    );
  }

  //create
  Future<int> update(Book book) async {
    final database = await databaseProvider.database;
    final result = database.update(
      BOOK_TABLE,
      bookToRecord(book),
      where: 'id=?',
      whereArgs: [book.id],
    );
    return result;
  }

  //delete
  Future<int> delete(int id) async {
    final database = await databaseProvider.database;
    final result = database.delete(
      BOOK_TABLE,
      where: 'id=?',
      whereArgs: [id],
    );
    return result;
  }

  Map<String, dynamic> bookToRecord(Book book) {
    return {
      'id': book.id,
      'title': book.title,
      'releaseDate': book.releaseDate,
      'author': book.author,
      'image': book.image,
      'type': book.type,
    };
  }

  Book recordToBook(Map<String, dynamic> record) {
    final id = record['id'] as int;
    final title = record['title'] as String;
    final releaseDate = record['releaseDate'] as String;
    final author = record['author'] as String;
    final image = record['image'] as String;
    final type = record['type'] as String;
    return Book(id, title, releaseDate, author, image, type);
  }
}
