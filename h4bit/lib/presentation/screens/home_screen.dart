import 'package:flutter/material.dart';
import 'package:h4bit/presentation/providers/habit_provider.dart';
import 'package:h4bit/presentation/widgets/habit_list_item.dart';
import 'package:h4bit/presentation/widgets/habit_progress_cahrt.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: Column(
        children: [
          HabitProgressChart(),
          Expanded(
            child: Consumer<HabitProvider>(
              builder: (context, habitProvider, child) {
                return ListView.builder(
                  itemCount: habitProvider.habits.length,
                  itemBuilder: (context, index) {
                    final habit = habitProvider.habits[index];
                    return HabitListItem(habit: habit);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/add-habit'),
      ),
    );
  }
}
