import 'package:flutter/material.dart';

import '../model/book.dart';

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
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title field can't be empty";
                  }
                  return null;
                },
                initialValue: widget.book.title,
                onChanged: (text) => widget.book.title = text,
                decoration: const InputDecoration(
                  hintText: 'title',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
