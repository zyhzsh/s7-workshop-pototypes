import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum ExpenseType {
  food,
  travel,
  leisure,
  work,
}

const expenseTypeIcons = {
  ExpenseType.food: Icons.fastfood,
  ExpenseType.travel: Icons.flight,
  ExpenseType.leisure: Icons.videogame_asset,
  ExpenseType.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType type;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.type,
    required this.expenses,
  });

  final ExpenseType type;
  final List<Expense> expenses;


  ExpenseBucket.forType( List<Expense> expenses,this.type,)
      : expenses = expenses.where((expense) => expense.type == type).toList();

  double get totalExpenses {
    double total = 0;
    for (final expense in expenses) {
      total += expense.amount;
    }
    return total;

    //return expenses.fold(0, (sum, expense) => sum + expense.amount);
  }


}