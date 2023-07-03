import 'package:app_4_meal_app/models/meal.dart';
import 'package:app_4_meal_app/screens/categories.dart';
import 'package:app_4_meal_app/screens/meals.dart';
import 'package:app_4_meal_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _showInfoMessageSnackbar(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void toggleMealFavouriteStatus(Meal meal){
    final isExisting = _favouriteMeals.contains(meal);

    if(isExisting){
      setState(() {
        _favouriteMeals.remove(meal);
       _showInfoMessageSnackbar('Removed from favourites');
      });
     
    }else{
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showInfoMessageSnackbar('Added to favourites');
    }
  }

  void _selectpage(int index){
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier){
    if(identifier==)
  }

  @override


  Widget build(BuildContext context) {
    Widget activeScreen =   CategoriesScreen(onToggleFavourite: toggleMealFavouriteStatus,);
    var activeScreenTitle = 'Categories';

    if(selectedPageIndex==1){
      activeScreen =   MealsScreen(meals: _favouriteMeals, onToggleFavourite: toggleMealFavouriteStatus,);
      activeScreenTitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: MainDrawer(onSeletScreen: _setScreen,),
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