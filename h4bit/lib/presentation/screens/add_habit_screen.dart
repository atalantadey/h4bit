import 'package:flutter/material.dart';
import 'package:h4bit/domain/entities/habit.dart';
import 'package:h4bit/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';



class AddHabitScreen extends StatefulWidget {
  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  TimeOfDay _reminderTime = TimeOfDay.now();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final Habit newHabit = Habit(
        id: DateTime.now().toString(),
        title: _title,
        description: _description,
        reminderTime: _reminderTime,
        completionStatus: List.generate(7, (_) => false),
      );
      final userId = context.read<AuthProvider>().user?.uid;
      if (userId != null) {
        context.read<HabitProvider>().addHabit(userId, newHabit);
      } else {
        // Handle the case where the user is not logged in
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not logged in')),
        );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Habit')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) => _description = value!,
              ),
              ListTile(
                title: const Text('Reminder Time'),
                trailing: Text(_reminderTime.format(context)),
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: _reminderTime,
                  );
                  if (picked != null && picked != _reminderTime) {
                    setState(() {
                      _reminderTime = picked;
                    });
                  }
                },
              ),
             const  SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Add Habit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
