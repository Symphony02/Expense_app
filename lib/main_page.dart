import 'package:flutter/material.dart';

List<Map<String, dynamic>> expenses = [
  {'title': 'Groceries', 'amount': 50.0, 'date': DateTime.now()},
  {'title': 'Internet', 'amount': 30.0, 'date': DateTime.now()},
  {'title': 'Rent', 'amount': 300.0, 'date': DateTime.now()},
];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
      ),
      body: ExpenseList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Add new expense functionality
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (selectedDate != null) {
              // Logic to add a new expense with selected date
          }
        },
          child: Icon(Icons.add),
        ),
    );
  }
}

class ExpenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ExpenseTile(expense: expenses[index]);
      },
    );
  }
}

class ExpenseTile extends StatelessWidget {
  final Map<String, dynamic> expense;

  ExpenseTile({required this.expense});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(expense['title']),
      subtitle: Text('Amount: ${expense['amount']}'),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // Delete expense functionality
        },
      ),
    );
  }
}
