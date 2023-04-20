import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interactivity_theming/models/expense.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;
  const NewExpense({required this.onAddExpense,Key? key}) : super(key: key);

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  ExpenseType _selectedType = ExpenseType.work;


  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsValid = enteredAmount == null || enteredAmount <= 0;

    if(_titleController.text.isEmpty || amountIsValid || _selectedDate == null){
      showDialog(context: context, builder: (ctx)=>AlertDialog(
        title:const Text('Invalid Input'),
        content: const Text('Please enter a valid title, amount and date'),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(ctx), child: const Text('Okay'))
        ],
      ));
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount!,
        date: _selectedDate!,
        type: _selectedType,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16,16),
        child: Column(children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Enter the title of the expense',
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text('\$ '),
                  labelText: 'Amount',
                ),
              )),
              const SizedBox(width: 16),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Date Chosen'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_today))
                ],
              ))
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedType,
                items: ExpenseType.values
                    .map((type) => DropdownMenuItem(
                          child: Text(type.name.toUpperCase()),
                          value: type,
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Add Expense'),
              ),
            ],
          )
        ]));
  }
}
