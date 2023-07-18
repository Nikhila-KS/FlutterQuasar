import 'package:flutter/material.dart';

class IsCorrectButton extends StatelessWidget {
  const IsCorrectButton({super.key,required this.questionIndex,required this.isCorrect});
  final int questionIndex;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    final quesIndex=questionIndex+1;
    return Container(
      width: 25,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect?const Color.fromARGB(221, 61, 228, 247):const Color.fromARGB(255, 251, 43, 241),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        quesIndex.toString(),
        style: const TextStyle(
          color: Color.fromARGB(208, 255, 255, 255),
          fontWeight: FontWeight.w700,
        ),
      ),

    );
  }
}