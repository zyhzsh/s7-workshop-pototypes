import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_feature/models/place.dart';
import 'dart:io';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image,PlaceLocation location) {
    final place = Place(title: title, image: image, location: location);
    state = [...state, place];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
