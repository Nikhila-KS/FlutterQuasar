import 'package:app_3_expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key,required this.e});

  final Expense e;
  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(e.title, style: const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Row(
              children:[
                Text('\$${e.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[e.category]),
                     const SizedBox(width: 6,),
                    Text(e.formattedDate),
                   
                   
                  ],
                )
              ]
            ),
          ]
        ),
      ),
    );
  }
}