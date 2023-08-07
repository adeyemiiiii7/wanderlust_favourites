import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderlust_favourites/models/location.dart';

/// A class that manages a list of user locations.
///
/// This class allows adding new locations to the list.
class UserLocationsNotifier extends StateNotifier<List<Location>> {
  UserLocationsNotifier() : super(const []);

  void addLocation(String title, File image) {
    final newLocation = Location(title: title, image: image);
    state = [newLocation, ...state];
  }
}
//<UserLocationsNotifier, List> telling the provider the kind of data that would be managed

final userLocationProvider =
    StateNotifierProvider<UserLocationsNotifier, List<Location>>(
  (ref) => UserLocationsNotifier(),
);
