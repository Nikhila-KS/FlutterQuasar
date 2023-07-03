import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.lable});

  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14,color: const Color.fromARGB(202, 255, 255, 255),),
        const SizedBox(
          width: 6,
        ),
        Text(lable, style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          ),
          ),
      ],
    );
  }
}