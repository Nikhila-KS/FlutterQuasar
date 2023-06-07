import 'package:app_3_expense_tracker/models/expense.dart';
import 'package:app_3_expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses,required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]), 

        onDismissed:((direction) {
          onRemoveExpense(expenses[index]);
        }),
        // ((direction) => onRemoveExpense(expenses[index])),  // alternative way of writing the above line

        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.1),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          child: const Icon(Icons.delete),
        ),

        child: ExpenseItem(e: expenses[index],),
        ),
    );
  }
}