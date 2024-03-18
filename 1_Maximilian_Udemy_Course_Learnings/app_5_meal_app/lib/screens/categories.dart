import 'package:app_4_meal_app/models/category.dart';
import 'package:app_4_meal_app/models/meal.dart';
import 'package:app_4_meal_app/screens/meals.dart';
import 'package:flutter/material.dart';
import 'package:app_4_meal_app/widgets/category_grid_item.dart';
import 'package:app_4_meal_app/data/dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  // final void Function(Meal meal) onToggleFavourite;  //without riverpod we needed to pass the function down the tree
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
// in the above line we are merging the state with mixin and we are using the ticker provider mixin to provide the animation controller with the state of the widget
 // if we only have one animation controller we can use the single ticker provider mixin and if multiple use ticker provider mixin
 late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController= AnimationController(
      vsync : this,  // vsync ensures the animation executes for every frame
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );
 
    _animationController.forward(); // this starts the animation
  }

  // animation controller update the state and calls the build method again and again
  // like the above is not technically correct.. as only the part changing gets updated

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals=widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
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
    return AnimatedBuilder(                // explicit animation example
      animation: _animationController,
      builder:(
        (context, child) =>  SlideTransition(
          position:  Tween(
              begin: const Offset(0,0.3),
              end: const Offset(0,0),
            ).animate(
              CurvedAnimation(
                parent: _animationController, 
                curve: Curves.easeInOut,
                )),
          // _animationController.drive(
          //   Tween(
          //     begin: const Offset(0,0.3),
          //     end: const Offset(0,0),
          //   ),
          // ),
          child: child,
          )
        // Padding(
        // padding: EdgeInsets.only(top: 100 - _animationController.value * 100), 
        // child: child, 
        // )
      ), 
      child: GridView(
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
        )
    );
  }
}
