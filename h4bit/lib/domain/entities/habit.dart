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

  Habit copyWith({
    String? id,
    String? title,
    String? description,
    TimeOfDay? reminderTime,
    List<bool>? completionStatus,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      reminderTime: reminderTime ?? this.reminderTime,
      completionStatus: completionStatus ?? this.completionStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'reminderTime': '${reminderTime.hour}:${reminderTime.minute}',
      'completionStatus': completionStatus,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    final timeParts = map['reminderTime'].split(':');
    return Habit(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      reminderTime: TimeOfDay(
          hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1])),
      completionStatus: List<bool>.from(map['completionStatus']),
    );
  }
}
