import 'package:flutter/material.dart';

import 'package:wanderlust_favourites/models/location.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({super.key, required this.locations});
  final List<Location> locations;

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
              title: Text(
                locations[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ));
  }
}
