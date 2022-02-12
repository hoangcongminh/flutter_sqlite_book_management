import 'package:flutter/material.dart';

class SingleTextFormField extends StatelessWidget {
  const SingleTextFormField({
    Key? key,
    required this.icon,
    required this.title,
    required this.initialValue,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final Icon icon;
  final String title;
  final String initialValue;
  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "$title field can't be empty";
          }
          return null;
        },
        initialValue: initialValue,
        onChanged: (text) => onChanged(text),
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
