import 'package:app_2_quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Container(
          width: double.infinity,
          decoration:const BoxDecoration(
        gradient: LinearGradient(
          colors: [
             Color.fromARGB(255, 4, 95, 159),
            Color.fromARGB(255, 9, 22, 144),
            Color.fromARGB(255, 4, 125, 155),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
          child: Startscreen(),
        ) ,
      ),
    );
  }
}


