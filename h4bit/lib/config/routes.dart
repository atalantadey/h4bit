import 'package:flutter/material.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/signup_screen.dart';
import '../presentation/screens/add_habit_screen.dart';
import '../presentation/screens/habit_details_screen.dart';
import '../presentation/screens/settings_screen.dart';

class RouteNames {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String addHabit = '/add-habit';
  static const String habitDetails = '/habit-details';
  static const String settings = '/settings';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.home:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case RouteNames.login:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case RouteNames.signup:
      return MaterialPageRoute(builder: (_) => SignupScreen());
    case RouteNames.addHabit:
      return MaterialPageRoute(builder: (_) => AddHabitScreen());
    case RouteNames.habitDetails:
      final habitId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => HabitDetailsScreen(habitId: habitId));
    case RouteNames.settings:
      return MaterialPageRoute(builder: (_) => SettingsScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
