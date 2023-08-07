import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderlust_favourites/models/location.dart';

/// A class that manages a list of user locations and allows adding new locations to the list.
///
/// This class extends the 'StateNotifier' class and manages the state of the list of locations.
/// The state is represented by a list of 'Location' objects.
///
/// To add a new location, use the 'addLocation' method and provide the title and image file of the location.
/// The method creates a new 'Location' object with the provided title and image, and adds it to the beginning of the list.
///
/// Example usage:
/// ```dart
/// final userLocations = useProvider(userLocationProvider);
///
/// userLocations.addLocation('New York', File('new_york.jpg'));
/// ```

class UserLocationsNotifier extends StateNotifier<List<Location>> {
  UserLocationsNotifier() : super(const []);

  void addLocation(String title, File image) {
    final newLocation = Location(title: title, image: image);
    state = [newLocation, ...state];
  }
}

final userLocationProvider =
    StateNotifierProvider<UserLocationsNotifier, List<Location>>(
  (ref) => UserLocationsNotifier(),
);
