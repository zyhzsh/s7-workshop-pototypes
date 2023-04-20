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
