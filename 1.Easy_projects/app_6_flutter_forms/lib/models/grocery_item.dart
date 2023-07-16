import 'package:app_6_flutter_forms/models/categories.dart';

class GroceryItem{
  final String id;
  final String name;
  final int quantity;
  final Category category;

  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

}