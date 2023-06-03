import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category{ food, leisure, travel,work}

class Expense {
  Expense({
    required this.amount, 
    required this.title, 
    required this.date,
    required this.category,
    }): id = uuid.v4();

  final String id;
  final double amount;
  final String title;
  final DateTime date;
  final Category category;
}
