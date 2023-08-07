import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderlust_favourites/providers/user_locations.dart';
import 'package:wanderlust_favourites/widgets/image_input.dart';
// This code snippet defines a Flutter screen for adding a new location. It includes a text field for the location title and an image picker widget for selecting an image. The screen uses Flutter Riverpod for state management.

// The AddLocationScreen class extends ConsumerStatefulWidget, which allows it to access and update state using the Riverpod library. It has a single ConsumerState<AddLocationScreen> as its state class.

// The state class, _AddLocationScreenState, manages the state of the screen. It includes a TextEditingController for the title field and a File variable for storing the selected image. The _saveLocation method is called when the user taps the save button. It checks if the title and image are non-empty and then adds the location to the user's list of locations using the userLocationProvider. Finally, it closes the screen and returns to the previous screen.

// The build method constructs the UI of the screen using Flutter's widget tree. It includes a Scaffold widget with an AppBar and a body that contains a SingleChildScrollView. Inside the SingleChildScrollView, there is a Column widget with a TextField for the title, an ImageInput widget for selecting an image, and an ElevatedButton for saving the location.

// The dispose method is overridden to clean up resources when the screen is closed.


class AddLocationScreen extends ConsumerStatefulWidget {
  const AddLocationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends ConsumerState<AddLocationScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _saveLocation() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(userLocationProvider.notifier)
        .addLocation(enteredTitle, _selectedImage!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add A New Location"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            ElevatedButton.icon(
              onPressed: _saveLocation,
              icon: const Icon(Icons.add),
              label: const Text('Add A Location'),
            ),
          ],
        ),
      ),
    );
  }
}