import 'package:flutter/material.dart';
import '../model/book.dart';
import '../widgets/date_form_field.dart';
import '../widgets/image_form_field.dart';
import '../widgets/single_text_form_field.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
    required this.title,
    required this.book,
  }) : super(key: key);

  final String title;
  final Book book;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context, widget.book);
                }
              },
              child: const Text('Save',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageFormField(
                path: widget.book.image,
                callback: (path) {
                  setState(() {
                    widget.book.image = path;
                  });
                },
              ),
              SingleTextFormField(
                icon: const Icon(Icons.book),
                title: 'Title',
                initialValue: widget.book.title,
                hintText: 'title',
                onChanged: (text) => widget.book.title = text,
              ),
              SingleTextFormField(
                icon: const Icon(Icons.person),
                title: 'Author',
                initialValue: widget.book.author,
                hintText: 'author',
                onChanged: (text) => widget.book.author = text,
              ),
              SingleTextFormField(
                icon: const Icon(Icons.filter),
                title: 'Type',
                initialValue: widget.book.type,
                hintText: 'type',
                onChanged: (text) => widget.book.type = text,
              ),
              DateFormField(
                icon: const Icon(Icons.calendar_today),
                title: 'Release day',
                date: widget.book.releaseDate,
                onSet: (newDate) {
                  setState(() {
                    widget.book.releaseDate = newDate;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
