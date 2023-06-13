import 'package:flutter/material.dart';

import 'package:app_4_meal_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.30),
      borderRadius: BorderRadius.circular(10), // the splash effect will be clipped by the border radius
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.2),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child:
            Text(category.title, 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize! * 0.8),
            ),
      ),
    );
  }
}
