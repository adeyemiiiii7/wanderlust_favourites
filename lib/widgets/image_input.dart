import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
    File? _selectedImage;

    void _takePicture() async {
      final imagePicker = ImagePicker();
      final pickedImage = await imagePicker.pickImage(
          source: ImageSource.camera, maxWidth: 600);

      if (pickedImage == null) {
        return;
      }

      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }

    @override
    Widget build(BuildContext context) {
      Widget content = TextButton.icon(
        icon: const Icon(Icons.camera),
        label: const Text('Take Picture'),
        onPressed: _takePicture,
      );

      if (_selectedImage != null) {
        content = GestureDetector(
          onTap: _takePicture,
          child: Image.file(
            _selectedImage!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        );
      }

      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        child: content,
      );
    }
  }
}