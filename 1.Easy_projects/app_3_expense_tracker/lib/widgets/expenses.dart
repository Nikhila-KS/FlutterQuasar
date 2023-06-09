import 'package:app_3_expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:app_3_expense_tracker/models/expense.dart';
import 'package:app_3_expense_tracker/widgets/new_expense.dart';
import 'package:app_3_expense_tracker/widgets/zchart/chart.dart';
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
    ),
    Expense(
      title: 'movie ticket',
      amount: 5.8,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _addExpense(Expense e) {
    setState(() {
      registeredExpenses.add(e);
    });
  }

  void _removeExpense(Expense e) {
    final eindex= registeredExpenses.indexOf(e);
    setState(() {
      registeredExpenses.remove(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('expense removed'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              registeredExpenses.insert(eindex, e);
            });
          },
        ),
    ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: ((context) => SizedBox(
            height: 300,
            child: NewExpense(addExpense: _addExpense),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(child: Text('No expense found.Start adding some!'),);
    if(registeredExpenses.isNotEmpty){
      maincontent = ExpensesList(
            expenses: registeredExpenses,
            onRemoveExpense: _removeExpense,
          );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed:
                _openAddExpenseOverlay, // it is a pointer, when we dont want to execure the function we just want to use it as a value for onPressed
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Chart(expenses: registeredExpenses),
          Expanded(
              child: maincontent,
          ),
        ],
      ),
    );
  }
}
