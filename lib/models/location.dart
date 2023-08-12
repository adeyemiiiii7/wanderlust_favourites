import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}

class Locations {
  Locations({
    required this.title,
    required this.image,
    // required this.locations,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final File image;
  // final PlaceLocation locations;
}
