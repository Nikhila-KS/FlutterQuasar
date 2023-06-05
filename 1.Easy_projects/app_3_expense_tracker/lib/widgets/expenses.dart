import 'package:app_3_expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:app_3_expense_tracker/models/expense.dart';
import 'package:app_3_expense_tracker/widgets/new_expense.dart';
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

  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder:((context) => const SizedBox(height:300,child: NewExpense())),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, // it is a pointer, when we dont want to execure the function we just want to use it as a value for onPressed
            icon: const Icon(Icons.add),
            ),
        ],
      ),
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