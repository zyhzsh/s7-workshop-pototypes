import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interactivity_theming/widgets/expenses_list/expense_item.dart';

import '../../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  const ExpenseList({Key? key, required this.expenses, required this.onRemoveExpense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
            key: ValueKey(expenses[index].id),
            background: Container(
              color: Theme.of(context).colorScheme.error,
              child: const Icon(Icons.delete, color: Colors.white),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
            ),
            onDismissed: (direction){
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(
              expense: expenses[index],
            ));
      },
    );
  }
}
