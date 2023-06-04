import 'package:app_3_expense_tracker/expenses_list.dart';
import 'package:app_3_expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
      title: 'udemy course',
      amount: 10.99,
      date: DateTime.now(),
      category: Category.work,
    ),Expense(
      title: 'movie ticket',
      amount: 5.8,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('chart'),
          Expanded(child: ExpensesList(expenses: registeredExpenses)),
        ],
      ),
    );
  }
}