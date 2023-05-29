import 'package:app_1_roll_dice_app/dice_roller.dart';
import 'package:flutter/material.dart';

@immutable
class GradientClass extends StatelessWidget {
  const GradientClass(this.c1, this.c2, this.c3, {super.key});

  final Color c1;
  final Color c2;
  final Color c3;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [c1, c2, c3],
        ),
      ),
      child: const Center(
        child: DiceRoller(),
        // Text_Style("helloworld"),
      ),
    );
  }
}
