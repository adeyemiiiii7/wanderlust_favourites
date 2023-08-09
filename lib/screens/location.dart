import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderlust_favourites/providers/user_locations.dart';
import 'package:wanderlust_favourites/screens/add_location.dart';
import 'package:wanderlust_favourites/widgets/location_list.dart';

class LocationsScreen extends ConsumerWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocations = ref.watch(userLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wanderlust Favourites'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const AddLocationScreen()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LocationsList(locations: userLocations),
      ),
    );
  }
}
