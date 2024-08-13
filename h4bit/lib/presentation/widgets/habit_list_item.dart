import 'package:flutter/material.dart';
import '../../domain/entities/habit.dart';


class HabitListItem extends StatelessWidget {
  final Habit habit;

  HabitListItem({required this.habit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(habit.title),
        subtitle: Text(habit.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(habit.reminderTime.format(context)),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Navigate to edit habit screen
                Navigator.pushNamed(context, '/edit-habit',
                    arguments: habit.id);
              },
            ),
          ],
        ),
        onTap: () {
          // Navigate to habit details screen
          Navigator.pushNamed(context, '/habit-details', arguments: habit.id);
        },
        leading: CircleAvatar(
          backgroundColor: _getCompletionColor(habit.completionStatus),
          child: Text(
            '${habit.completionStatus.where((status) => status).length}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Color _getCompletionColor(List<bool> completionStatus) {
    int completedDays = completionStatus.where((status) => status).length;
    if (completedDays >= 6) return Colors.green;
    if (completedDays >= 4) return Colors.orange;
    return Colors.red;
  }
}
