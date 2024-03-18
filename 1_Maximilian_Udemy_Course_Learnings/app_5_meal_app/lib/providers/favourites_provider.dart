import 'package:app_4_meal_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavouriteMealNotifier extends StateNotifier<List<Meal>>{
  
  FavouriteMealNotifier() : super([]); 
  // super is used to call the constructor of the parent class

  bool toggleMealFavouriteStatus(Meal meal){
    final mealIsExisiting = state.contains(meal);

// using StateNotifier, you're not allowed to edit an existing value in memory, instead you must always create a new one. That's simply a pattern enforced by this package. Therefore, we're not allowed to reach out to this list and call add or remove as we did before. This would not be allowed. Instead we have to replace it. Now to replace it, there is this globally available state property. This property is made available by the StateNotifier class. Now this state property holds your data, so in this case a list of meals. And, again, calling add or remove on that would not be allowed. Instead, you have to reassign it by using the assignment operator to a new list. So a new list, no matter if you are adding a meal or removing a meal. Therefore, what we have to do here is we first of all have to find out whether a meal is part of that list or not, and then thereafter we have to create a new list based on that information. Now, for that we can of course, again, use state contains meal though, because that will not edit the state it will just look into the state, and that of course is allowed. And this will tell us whether a meal is a favorite or not. So that's how we get this information, but then if a meal is a favorite we'll have to remove it from that list without using the remove method. And this can be achieved by setting state equal to state where, because, remember, with where we filter a list and we get a new list or a new iterable, which we can convert to a list by calling toList. So where gives us a new list, and that's of course exactly what we need here, a new list. So where then gets a function where we get the current list items, item after item, and we have to return true to keep it or false to drop it,

    if(mealIsExisiting){
      state = state.where((m) => m.id!=meal.id).toList();
      //  state = [...state.where((m) => m.id!=meal.id).toList()];

      return false;

      }
      else{
        state = [...state,meal]; 
        // spread operator allows us to pull all the values out of a list and add them as individual values to a new list
        return true;
      }


  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealNotifier,List<Meal>>((
  (ref) {
  return FavouriteMealNotifier();
}
));

// normal provider used when static data is used/ returned
// StateNotifierProvider used when dynamic data is used/ returned, 
//this class is optimised for data that can change over time, and notifies its listeners when the data changes.