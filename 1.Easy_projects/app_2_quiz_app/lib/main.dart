import 'package:app_2_quiz_app/quiz.dart';
import 'package:app_2_quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Quiz();
  }
}


