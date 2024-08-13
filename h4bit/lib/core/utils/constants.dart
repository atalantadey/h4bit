class Constants {
  // Firebase collections
  static const String USERS_COLLECTION = 'users';
  static const String HABITS_COLLECTION = 'habits';

  // Shared Preferences keys
  static const String DARK_MODE_KEY = 'darkMode';
  static const String LANGUAGE_KEY = 'language';

  // App-wide constants
  static const int MAX_HABIT_TITLE_LENGTH = 50;
  static const int MAX_HABIT_DESCRIPTION_LENGTH = 200;

  // Error messages
  static const String NETWORK_ERROR =
      'Network error occurred. Please try again.';
  static const String UNKNOWN_ERROR =
      'An unknown error occurred. Please try again.';

  // Success messages
  static const String HABIT_ADDED = 'Habit added successfully!';
  static const String HABIT_UPDATED = 'Habit updated successfully!';
  static const String HABIT_DELETED = 'Habit deleted successfully!';

  // Screen titles
  static const String HOME_SCREEN_TITLE = 'Habit Tracker';
  static const String ADD_HABIT_SCREEN_TITLE = 'Add New Habit';
  static const String EDIT_HABIT_SCREEN_TITLE = 'Edit Habit';
  static const String SETTINGS_SCREEN_TITLE = 'Settings';

  // Button texts
  static const String SAVE_BUTTON = 'Save';
  static const String CANCEL_BUTTON = 'Cancel';
  static const String DELETE_BUTTON = 'Delete';
}
