import 'package:flutter/material.dart';
import 'package:h4bit/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/habit.dart';
import '../providers/habit_provider.dart';


class HabitDetailsScreen extends StatelessWidget {
  final String habitId;

  const HabitDetailsScreen({required this.habitId});

  @override
  Widget build(BuildContext context) {
    final habit = context.select<HabitProvider, Habit>(
      (provider) => provider.habits.firstWhere((h) => h.id == habitId),
    );

    return Scaffold(
      appBar: AppBar(title: Text(habit.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${habit.description}'),
            const SizedBox(height: 20),
            Text('Reminder Time: ${habit.reminderTime.format(context)}'),
            const SizedBox(height: 20),
            const Text('Completion Status:'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (index) {
                return GestureDetector(
                  onTap: () {
                   context.read<HabitProvider>().toggleHabitCompletion(
                          context.read<AuthProvider>().user?.uid ?? '',
                          habit.id,
                          index,
                        );
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: habit.completionStatus[index]
                          ? Colors.green
                          : Colors.grey,
                    ),
                    child: Center(child: Text('${index + 1}')),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
