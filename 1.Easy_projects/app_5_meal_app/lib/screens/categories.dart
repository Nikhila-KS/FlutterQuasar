import 'package:app_4_meal_app/models/category.dart';
import 'package:app_4_meal_app/models/meal.dart';
import 'package:app_4_meal_app/screens/meals.dart';
import 'package:flutter/material.dart';
import 'package:app_4_meal_app/widgets/category_grid_item.dart';
import 'package:app_4_meal_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  // final void Function(Meal meal) onToggleFavourite;  //without riverpod we needed to pass the function down the tree
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals=availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>  MealsScreen(  // it acts as a loop and returns a list of meals
          title:  category.title, 
          meals:filteredMeals,
          // onToggleFavourite: onToggleFavourite, //without riverpod we needed to pass the function down the tree
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            // availablecategories.map((category) => CategoryGridItem(category: category)).toList(), // this is the same as the for loop below
            for( final category in availableCategories)
              CategoryGridItem(
                category: category, 
                onSelectCategory: () => _selectCategory(context,category)
                ),
          ],
        );
  }
}
