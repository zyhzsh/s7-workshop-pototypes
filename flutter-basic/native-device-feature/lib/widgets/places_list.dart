import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';
import '../screens/place_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({Key? key, required this.places}) : super(key: key);

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places yet, start adding some!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: FileImage(place.image),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return PlaceDetailScreen(
                place: place,
              );
            }));
          },
          title: Text(
            place.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        );
      },
    );
  }
}
