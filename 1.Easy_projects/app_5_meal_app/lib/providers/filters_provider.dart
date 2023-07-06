import 'package:app_4_meal_app/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  // enum is a special data type that enables for a variable to be a set of predefined constants
  GlutenFree,
  LactoseFree,
  Vegetarian,
  Vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          // remember we had to initialize these values  when riverpod wast used similarly we are initializing here
          Filter.GlutenFree: false,
          Filter.LactoseFree: false,
          Filter.Vegetarian: false,
          Filter.Vegan: false,
        });

// Now again, as mentioned before, we must do this in a immutable way. So accessing state filter like this and setting it to the updated value would not be allowed because here we are mutating the state in memory
//and that's not allowed. Therefore, what you should do instead is you should set the state to a new map. And that should, in the end, be your old map with the updated key. And one way of creating such a new map
// here is to copy the existing map and its existing key-value pairs with the spread operator just as we did it for the list. This also works for maps, inside of maps. So this copies the existing maps key-value
//pairs into this new map. And then we can explicitly set one key, like here this filter to a new value, isActive. So that will then override the key-value pair with the same filter identifier that has been copied
//and all the other key value pairs will be kept along with this new setting here. And with that, we are creating a new map with the old key-value pairs and one new key-value pair that overrides the respective old
//key-value pair for the same filter.

  void setFilter(Filter filter, bool value) {
    // we cannot do state[filter] = value; as state is immutable so we have to create a new map and then assign it to state
    state = {
      ...state,
      filter: value,
    };
  }

  void setFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier,Map<Filter,bool>>((ref) => FilterNotifier());



final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilters = ref.watch(filterProvider);

  return meals.where((meal) {
      if (selectedFilters[Filter.GlutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.LactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.Vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.Vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});