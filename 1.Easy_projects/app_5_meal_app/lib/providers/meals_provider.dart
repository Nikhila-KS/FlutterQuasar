import 'package:app_4_meal_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // riverpod is a state management 


final mealsProvider = Provider((ref){
  return dummyMeals;
});