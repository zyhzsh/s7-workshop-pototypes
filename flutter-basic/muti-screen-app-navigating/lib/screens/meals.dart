import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muti_screen_app_navigating/widgets/meal_item.dart';
import '../models/meal.dart';
import 'meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {Key? key,
      this.title,
      required this.meals})
      : super(key: key);

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MealDetailsScreen(
        meal: meal,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(meal: meals[index], onSelectedMeal: selectMeal);
      },
      itemCount: meals.length,
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh ho! No meals found!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    if (title == null) return content;

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
