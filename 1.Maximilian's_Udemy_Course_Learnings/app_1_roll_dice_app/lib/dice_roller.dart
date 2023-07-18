import 'package:app_1_roll_dice_app/text_style.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState(){
    return _DiceRoller();
  }
}

class _DiceRoller extends State<DiceRoller>{

  var activeImage ='assets/images/dice-2.png';
  void rollDice(){
    var randomNum= Random().nextInt(6)+1;
    setState(() {
      activeImage='assets/images/dice-$randomNum.png';
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(activeImage,width: 150,height: 150,),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: rollDice, // pointer
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all(Colors.deepPurple),
                padding:  MaterialStateProperty.all(const EdgeInsets.fromLTRB(13, 13, 13, 16)),
                shadowColor:  MaterialStateProperty.all(const Color.fromARGB(255, 67, 7, 73)),
              ), 
              child: Text_Style("press"),),
          ],
        );
  } 
}

//...................
// class DiceRoller extends StatefulWidget {
//   const DiceRoller({super.key});

//   @override
//   State<DiceRoller> createState() => _DiceRollerState();
// }

// class _DiceRollerState extends State<DiceRoller> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }