import 'package:flutter/material.dart';
import 'package:presentation_app/providers/lesson_provider.dart';
import 'package:provider/provider.dart';
import 'screens/presentation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LessonProvider(),
      child: MaterialApp(
        title: 'Presentation App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFE6E6E6)
        ),
        home: const PresentationScreen(),
      ),
    );
  }
}

