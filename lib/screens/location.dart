import 'package:flutter/material.dart';
import 'package:wanderlust_favourites/widgets/location_list.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wanderlust Favourites'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: LocationsList(locations: []),
    );
  }
}