import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muti_screen_app_navigating/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal}) : super(key: key);

  final Meal meal;


  String get complexityText{
    return meal.complexity.name[0].toUpperCase()+ meal.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase()+ meal.affordability.name.substring(1);
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        // style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        //   color: Theme.of(context).colorScheme.onBackground,
                        // )
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: meal.duration.toString()),
                        const SizedBox(width: 12),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(width: 12),
                        MealItemTrait(icon: Icons.attach_money, label: complexityText),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
