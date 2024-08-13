import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h4bit/domain/entities/habit.dart';

import '../../core/utils/constants.dart';


class HabitProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  Future<void> fetchHabits(String userId) async {
    try {
      final habitDocs = await _firestore
          .collection(Constants.USERS_COLLECTION)
          .doc(userId)
          .collection(Constants.HABITS_COLLECTION)
          .get();

      _habits = habitDocs.docs.map((doc) => Habit.fromMap(doc.data())).toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> addHabit(String userId, Habit habit) async {
    try {
      await _firestore
          .collection(Constants.USERS_COLLECTION)
          .doc(userId)
          .collection(Constants.HABITS_COLLECTION)
          .doc(habit.id)
          .set(habit.toMap());

      _habits.add(habit);
      notifyListeners();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> updateHabit(String userId, Habit habit) async {
    try {
      await _firestore
          .collection(Constants.USERS_COLLECTION)
          .doc(userId)
          .collection(Constants.HABITS_COLLECTION)
          .doc(habit.id)
          .update(habit.toMap());

      final index = _habits.indexWhere((h) => h.id == habit.id);
      if (index != -1) {
        _habits[index] = habit;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> deleteHabit(String userId, String habitId) async {
    try {
      await _firestore
          .collection(Constants.USERS_COLLECTION)
          .doc(userId)
          .collection(Constants.HABITS_COLLECTION)
          .doc(habitId)
          .delete();

      _habits.removeWhere((habit) => habit.id == habitId);
      notifyListeners();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> toggleHabitCompletion(
      String userId, String habitId, int dayIndex) async {
    try {
      final habit = _habits.firstWhere((h) => h.id == habitId);
      final updatedCompletionStatus = List<bool>.from(habit.completionStatus);
      updatedCompletionStatus[dayIndex] = !updatedCompletionStatus[dayIndex];

      final updatedHabit =
          habit.copyWith(completionStatus: updatedCompletionStatus);

      await updateHabit(userId, updatedHabit);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
