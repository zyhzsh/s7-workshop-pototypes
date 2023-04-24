import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muti_screen_app_navigating/data/dummay_data.dart';

final mealsProvider = Provider((ref){
  return dummyMeals;
});

