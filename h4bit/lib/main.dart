import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:h4bit/firebase_options.dart';
import 'package:h4bit/presentation/providers/habit_provider.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
         ChangeNotifierProvider(create: (_) => HabitProvider()),
        // Add other providers here
      ],
      child: MyApp(),
    ),
  );
}
