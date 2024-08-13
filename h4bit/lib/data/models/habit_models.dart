import 'package:flutter/material.dart';

class Habit {
  final String id;
  final String title;
  final String description;
  final TimeOfDay reminderTime;
  final List<bool> completionStatus;

  Habit({
    required this.id,
    required this.title,
    required this.description,
    required this.reminderTime,
    required this.completionStatus,
  });

  // Add toJson and fromJson methods for Firestore integration
}
