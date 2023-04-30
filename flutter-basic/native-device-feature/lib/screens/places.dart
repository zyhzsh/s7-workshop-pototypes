import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_feature/widgets/places_list.dart';

import '../providers/user_places.dart';
import 'add_place.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final places = ref.watch(userPlacesProvider);


    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Great Places',
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const AddPlaceScreen()));
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlacesList(
            places: places,
          ),
        ));
  }
}
