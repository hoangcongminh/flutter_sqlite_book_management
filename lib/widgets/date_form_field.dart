import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormField extends StatelessWidget {
  const DateFormField({
    Key? key,
    required this.icon,
    required this.title,
    required this.date,
    required this.onSet,
  }) : super(key: key);

  final Icon icon;
  final String title;
  final String date;
  final Function onSet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.parse(date),
            firstDate: DateTime(1900),
            lastDate: DateTime(2030),
          );

          final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
          final String formattedDate =
              dateFormat.format(selectedDate ?? DateTime.now());
          onSet(formattedDate);
        },
        child: ListTile(
          leading: icon,
          title: Text(title),
          subtitle: Text(date),
        ));
  }
}
