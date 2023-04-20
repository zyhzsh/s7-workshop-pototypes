import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({required this.expense ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$ ${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(expenseTypeIcons[expense.type]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
