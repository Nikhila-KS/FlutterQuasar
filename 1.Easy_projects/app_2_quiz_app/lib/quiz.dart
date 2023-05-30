import 'package:app_2_quiz_app/question_screen.dart';
import 'package:app_2_quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget{
  Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  // Widget? activeScreen;
  var activeScreen='startscreen';
  @override
  // void initState() {
  //   activeScreen=  Startscreen(Switchscreen);
  //   super.initState();
  // }
  
  void Switchscreen(){
    // activeScreen= const QuestionScreen();
     activeScreen='quizscreen';
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context){
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
          child: activeScreen=='startscreen'
          ?Startscreen(Switchscreen)
          :QuestionScreen(),
        ) ,
      ),
    );
  }
}

