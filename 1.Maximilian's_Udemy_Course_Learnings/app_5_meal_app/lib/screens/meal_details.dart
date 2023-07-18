import 'package:app_4_meal_app/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class MealDetailsScreen extends ConsumerWidget {
// StatelessWidget {
  // stateless is consumerwidget and stateful is consumerstatefulwidget

  const MealDetailsScreen({
    super.key,
    required this.meal,
    // required this.onToggleFavourite,
  });

  final Meal meal;

  // final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // when using riverpod, ref is also passed as a parameter
    // ref is used to listening to the state notifier provider
    // in state ful widget we add state class which make ref globally available but in stateless widget we have to pass it as a parameter in build method

    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isFavourite = favouriteMeals.contains(meal);

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton( 
              icon: AnimatedSwitcher(

                duration: const Duration(milliseconds: 300),
                transitionBuilder: ((child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                    // animation,
                    child: child ,
                    );
                }),
                child: Icon(
                  isFavourite?Icons.star_rounded: Icons.star_border_purple500_rounded,
                  key: ValueKey(isFavourite),
                  )

              ),
              onPressed: () {
                // onToggleFavourite(meal);
                final wasAdded= ref
                    .read(favouriteMealsProvider.notifier)
                    .toggleMealFavouriteStatus(meal);
                // inside onpressed /on tap prefer to use read method instead of watch method because we dont want to make a ongoing listener

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Meal Added to favourites'
                        : 'Meal Removed from favourites'),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(height: 24),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
            ],
          ),
        ));
  }
}
