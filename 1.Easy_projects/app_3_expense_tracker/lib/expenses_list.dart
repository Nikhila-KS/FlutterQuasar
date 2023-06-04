import 'package:app_3_expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: 1,
      itemBuilder: (context, index) => ListTile(
        title: Text(expenses[index].title.toString()),
        subtitle: Text(expenses[index].category.toString()),
        trailing: Text(expenses[index].amount.toString()),
      ),
    );
  }
}