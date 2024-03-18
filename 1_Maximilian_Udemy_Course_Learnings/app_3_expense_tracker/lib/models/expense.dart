
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter= DateFormat.yMd();

enum Category{ food, leisure, travel,work}

const CategoryIcons ={
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie_filter,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

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

  String get formattedDate{
    // return '${date.day}-${date.month}-${date.year}';
    return formatter.format(date);
  }
}


class ExpenseBucket{

  ExpenseBucket({     /// first constructor- named constructor normal constructor
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense>allExpense,     /// second constructor
  this.category): expenses = allExpense.where((e) => e.category == category).toList(); // this constructor is used to filter the expenses based on category

  final Category category;
  final List<Expense> expenses;

  double get totalExpense{
    var total = 0.0;
    for (final e in expenses) {
      total += e.amount;
    }
    return total;
  }
}
