import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

// This code snippet provides a stateful widget called ImageInput that allows the user to take a picture or select an image from the gallery. The selected image is then displayed in a container.

// Inputs:
// - File: A class from the 'dart:io' package that represents a file on the device.
// - ImagePicker: A class from the 'package:image_picker/image_picker.dart' package that provides methods for picking images from the device.
// - BuildContext: A class from the 'package:flutter/material.dart' package that represents the context of the current widget tree.

// Flow:
// 1. When the user taps on the 'Take Picture' button, an alert dialog appears with two options: 'Camera' and 'Gallery'.
// 2. The user selects an option, and the corresponding image source (camera or gallery) is passed to the ImagePicker.
// 3. The user takes a picture or selects an image from the gallery using the selected image source.
// 4. The selected image is displayed in a container widget.

// Outputs:
// - Container: A widget that displays the selected image in a bordered container with a specified height, width, and alignment.
// - TextButton: A widget that represents the 'Take Picture' button, which allows the user to initiate the image selection process.
// - GestureDetector: A widget that wraps the selected image and allows the user to tap on it to retake the picture.
// - Image: A widget that displays the selected image.

// Additional aspects:
// - The onPickImage function is called with the selected image as an argument.
// - The selected image is stored in the _selectedImage variable.
// - The maxWidth of the selected image is set to 600.

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(ImageSource.camera),
              child: Text('Camera',
                  style: Theme.of(context).textTheme.bodyLarge!
                  // .copyWith(
                  //       color: Theme.of(context).colorScheme.onBackground,
                  //     ),
                  ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
              child: Text('Gallery',
                  style: Theme.of(context).textTheme.bodyLarge!
                  // .copyWith(
                  //       color: Theme.of(context).colorScheme.onBackground,
                  //     ),
                  ),
            ),
          ],
        );
      },
    );

    if (pickedImage == null) {
      return;
    }

    final pickedImageFile = await imagePicker.pickImage(
      source: pickedImage,
      maxWidth: 600,
    );

    if (pickedImageFile == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImageFile.path);
    });

    widget.onPickImage(_selectedImage!);
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
