import 'package:flutter/material.dart';
import 'package:app_2_quiz_app/quiz.dart';


class Startscreen extends StatelessWidget {
  const Startscreen(this.StartQuiz,{super.key});

  final void Function() StartQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       Color.fromARGB(255, 2, 33, 15),
      //       Color.fromARGB(255, 7, 77, 10),
      //     ],
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
        Image.asset('assets/images/quiz-logo.png',width: 200,color: Color.fromARGB(210, 255, 255, 255),),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Learn Flutter the fun Way",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15,),
        ElevatedButton.icon(
          // onPressed: Switchscreen(), 
          onPressed: StartQuiz,
          style: ElevatedButton.styleFrom(       // simple path
            alignment:Alignment.center,
            backgroundColor: const Color.fromARGB(255, 15, 108, 214),
            shadowColor: const Color.fromARGB(255, 24, 3, 66)
          ),
          // style: ButtonStyle(
            // alignment:Alignment.center,
            // backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 15, 108, 214)),
            // shadowColor: MaterialStateProperty.all(Color.fromARGB(255, 24, 3, 66))
          //    ),
              label: const Text("Start"),
              icon: Icon(Icons.arrow_forward_ios_rounded),
          ),
      ]),
    );
  }
}