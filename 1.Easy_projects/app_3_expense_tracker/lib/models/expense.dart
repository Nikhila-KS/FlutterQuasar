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
