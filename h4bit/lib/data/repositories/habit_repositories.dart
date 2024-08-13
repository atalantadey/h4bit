import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/habit.dart';
import '../../core/utils/constants.dart';

class HabitRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Habit>> getHabits(String userId) async {
    try {
      final habitDocs = await _firestore
          .collection(Constants.USERS_COLLECTION)
          .doc(userId)
          .collection(Constants.HABITS_COLLECTION)
          .get();

      return habitDocs.docs.map((doc) => Habit.fromMap(doc.data())).toList();
    } catch (e) {
      print('Error fetching habits: $e');
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
    } catch (e) {
      print('Error adding habit: $e');
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
    } catch (e) {
      print('Error updating habit: $e');
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
    } catch (e) {
      print('Error deleting habit: $e');
      rethrow;
    }
  }

  Stream<List<Habit>> streamHabits(String userId) {
    return _firestore
        .collection(Constants.USERS_COLLECTION)
        .doc(userId)
        .collection(Constants.HABITS_COLLECTION)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Habit.fromMap(doc.data())).toList());
  }
}
