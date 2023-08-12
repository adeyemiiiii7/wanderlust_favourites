import 'package:flutter/material.dart';

import 'package:wanderlust_favourites/models/location.dart';
import 'package:wanderlust_favourites/screens/location_detail.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({super.key, required this.locations});
  final List<Locations> locations;

  @override
  Widget build(BuildContext context) {
    if (locations.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return ListView.builder(
        itemCount: locations.length,
        itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(
                radius: 26,
                backgroundImage: FileImage(locations[index].image),
              ),
              title: Text(
                locations[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => LocationDetailScreen(
                      location: locations[index],
                    ),
                  ),
                );
              },
            ));
  }
}
