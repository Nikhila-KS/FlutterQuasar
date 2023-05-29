import 'package:flutter/material.dart';
import 'package:app_1_roll_dice_app/gradient.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientClass( 
                 Color.fromARGB(255, 15, 4, 86),
                 Color.fromARGB(210, 54, 5, 63),
                 Color.fromARGB(255, 15, 4, 86)
                ),
      ),
    );
  }
}
