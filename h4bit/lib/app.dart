import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import 'services/auth_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, _) {
        return MaterialApp(
          title: 'Habit Tracker',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system, // This will respect the system theme
          initialRoute: authService.currentUser == null
              ? RouteNames.login
              : RouteNames.home,
          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}
