import 'package:flutter/material.dart';

import '../bloc/book_bloc.dart';
import '../model/book.dart';
import 'edit_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final BookBloc bloc = BookBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
        stream: bloc.books,
        builder: (context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final books = snapshot.data;
          return ListView.builder(
            itemCount: books!.length,
            itemBuilder: (context, index) {
              final book = books[index];

              return Dismissible(
                onDismissed: (direction) => bloc.deleteBooks(book.id!),
                key: Key('${book.id}'),
                child: GestureDetector(
                  onTap: () async {
                    final editedBook = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditPage(title: 'Edit Book', book: book),
                      ),
                    );
                    bloc.updateBooks(editedBook);
                  },
                  child: ListTile(
                    // leading: Container(
                    //         alignment: Alignment.bottomRight,
                    //         width: 70,
                    //         height: 70,
                    // ),
                    title: Text(book.title),
                    subtitle: Text(book.author),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final newBook = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditPage(
                        title: 'Add Book',
                        book: Book.bookDefault(),
                      )));
          bloc.addBooks(newBook);
        },
      ),
    );
  }
}
