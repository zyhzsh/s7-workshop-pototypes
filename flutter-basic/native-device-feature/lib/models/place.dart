import 'package:nanoid/nanoid.dart';


class Place{
  final String id;
  final String title;

  Place({
    required this.title,
  }): id = nanoid(10);
}