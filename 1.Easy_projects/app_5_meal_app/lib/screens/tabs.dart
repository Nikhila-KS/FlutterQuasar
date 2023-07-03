import 'package:app_4_meal_app/models/meal.dart';
import 'package:app_4_meal_app/screens/categories.dart';
import 'package:app_4_meal_app/screens/meals.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void toggleMealFavouriteStatus(Meal meal){
    final isExisting = _favouriteMeals.contains(meal);

    if(isExisting){
      _favouriteMeals.remove(meal);
    }else{
      _favouriteMeals.add(meal);
    }
  }

  void _selectpage(int index){
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override


  Widget build(BuildContext context) {
    Widget activeScreen =  const CategoriesScreen();
    var activeScreenTitle = 'Categories';

    if(selectedPageIndex==1){
      activeScreen =  const MealsScreen(meals: []);
      activeScreenTitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),

      body: activeScreen,

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_purple500_rounded),
            label: 'Favorites',
          ),
        ],
      )
    );
  }
}