import 'dart:io';

import 'package:nanoid/nanoid.dart';

class Place {
  final String id;
  final String title;
  final File image;

  Place({
    required this.title,
    required this.image,
  }) : id = nanoid(10);
}
