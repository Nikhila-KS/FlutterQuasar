import 'package:flutter/material.dart';
import 'package:app_4_meal_app/widgets/category_grid_item.dart';
import 'package:app_4_meal_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: GridView(
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
              CategoryGridItem(category: category),
          ],
        ));
  }
}
