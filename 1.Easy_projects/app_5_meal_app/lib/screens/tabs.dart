import 'package:app_4_meal_app/data/dummy_data.dart';
import 'package:app_4_meal_app/models/meal.dart';
import 'package:app_4_meal_app/screens/categories.dart';
import 'package:app_4_meal_app/screens/filters.dart';
import 'package:app_4_meal_app/screens/meals.dart';
import 'package:app_4_meal_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';


const kInitialFilter={
  Filter.GlutenFree : false,
  Filter.LactoseFree : false,
  Filter.Vegetarian : false,
  Filter.Vegan : false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  Map<Filter,bool> _selectedFilters = kInitialFilter;

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

  void _setScreen(String identifier) async{
    Navigator.of(context).pop();
    if(identifier=='filters'){
      final result = await Navigator.of(context).push<Map<Filter,bool>>(   // we need to store the data that we get from the filter screen
        MaterialPageRoute(
          builder: (ctx) =>  FilterScreen(currentFilters: _selectedFilters,),
        )
      );
      // print('oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo\n$result\noooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo');
     
      setState(() {
        _selectedFilters = result??kInitialFilter;
      });
    }
  }

  @override


  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal){
       if(_selectedFilters[Filter.GlutenFree]! && !meal.isGlutenFree){
         return false;
       }
        if(_selectedFilters[Filter.LactoseFree]! && !meal.isLactoseFree){
          return false;
        }
        if(_selectedFilters[Filter.Vegetarian]! && !meal.isVegetarian){
          return false;
        }
        if(_selectedFilters[Filter.Vegan]! && !meal.isVegan){
          return false;
        }
        return true;
    }).toList();
    Widget activeScreen =   CategoriesScreen(
      onToggleFavourite: toggleMealFavouriteStatus,
      availableMeals: availableMeals,
      );
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