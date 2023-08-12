import 'package:flutter/material.dart';

import 'package:wanderlust_favourites/models/location.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({
    super.key,
    required this.location,
  });

  final Locations location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(location.title),
        ),
        body: Stack(
          children: [
            Image.file(
              location.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )
          ],
        ));
  }
}
