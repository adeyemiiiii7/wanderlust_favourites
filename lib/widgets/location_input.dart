import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
// This code snippet defines a Flutter widget called 'LocationInput' that displays a button with an icon and label to get the current location.
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  Location? _pickedLocation;
  var _isGettingLocation = false;
  void _getCurrentLocation() async {
    Location location = new Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    // print(locationData.latitude);
    // print(locationData.longitude);
    final url = Uri.parse(
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$lng,$lat.json?access_token=pk.eyJ1IjoiYWRleWVtaTA1IiwiYSI6ImNsbDRiYTJnODAza2MzZG82cXc1MWZmYXoifQ.1vtATMhAEeYNqeFS30EZuQ');
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData['type'][0]['formatted_features'];
    setState(() {
      _isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No Location chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          )),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on_rounded),
              label: const Text('Get Current Location'),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
