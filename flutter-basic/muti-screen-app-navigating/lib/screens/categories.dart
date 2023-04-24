import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muti_screen_app_navigating/data/dummay_data.dart';
import 'package:muti_screen_app_navigating/models/category.dart';
import 'package:muti_screen_app_navigating/widgets/category_grid_item.dart';
import '../models/meal.dart';
import 'meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, required this.onToggleFavorite}) : super(key: key);

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                MealsScreen(title: category.title, meals: filteredMeals, onToggleFavorite: onToggleFavorite,)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              onSelectedCategory: () {
                _selectCategory(context, category);
              })
      ],
    );
  }
}
