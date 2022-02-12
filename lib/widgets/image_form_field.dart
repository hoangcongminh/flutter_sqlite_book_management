import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageFormField extends StatelessWidget {
  const ImageFormField({
    Key? key,
    required this.path,
    required this.callback,
  }) : super(key: key);

  final String path;
  final Function(String path) callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () async {
            final permission = await Permission.photos.status;
            if (!permission.isGranted) {
              await Permission.photos.request();
            }

            final imagePicker = ImagePicker();
            final image =
                await imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              final path = image.path;
              callback(path);
            }
          },
          child: Container(
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: path.isNotEmpty
                    ? FileImage(File(path)) as ImageProvider
                    : const AssetImage('assets/images/book_cover.png'),
                fit: BoxFit.fill,
              ),
            ),
            width: 70,
            height: 70,
            child: const Icon(Icons.camera_alt_rounded),
          ),
        ),
      ),
    );
  }
}
