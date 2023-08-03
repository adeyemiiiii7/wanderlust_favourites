import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderlust_favourites/models/location.dart';

class UserLocationsNotifier extends StateNotifier<List<Location>> {
  UserLocationsNotifier() : super(const []);

  void addLocation(String title) {
    final newLocation = Location(title: title);
    state = [newLocation, ...state];
  }
}

final userLocationProvider = StateNotifierProvider(
  (ref) => UserLocationsNotifier(),
);
