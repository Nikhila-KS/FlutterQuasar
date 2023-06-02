import 'package:app_2_quiz_app/data/questions.dart';
import 'package:app_2_quiz_app/screens/question_screen.dart';
import 'package:app_2_quiz_app/screens/result_screen.dart';
import 'package:app_2_quiz_app/screens/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  Widget? activeScreen;
  // var activeScreen='startscreen'; // another way to do it
  List<String> ans=[];
  @override
  void initState() {
    activeScreen=  Startscreen(Switchscreen);
    super.initState();
  }
  
  void Switchscreen(){
    activeScreen= QuestionScreen(onSelectans: onChoose,);
    //  activeScreen='quizscreen';  // another way to do it
    setState(() { 
    });
  }

  void RestartQuiz(){
    activeScreen=  Startscreen(Switchscreen);
    // activeScreen='startscreen';  // another way to do it
    setState(() { 
      ans=[];
    });
  }

  void onChoose(String answer){
    ans.add(answer);

    

    if(ans.length==questions.length){
      setState(() {
        activeScreen=  ResultScreen(chosenAns: ans,restartQuiz: RestartQuiz);
        // activeScreen='resultscreen';
        ans=[];
      });
    }
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
      child: activeScreen,
          // child: activeScreen=='startscreen'
          //         ?Startscreen(Switchscreen)  // a pointer to the function is passed to the constructor not the function itself
          //         :(activeScreen=='quizscreen'
          //         ?QuestionScreen(onSelectans: onChoose,):const ResultScreen()
          //         ),
        ) ,
      ),
    );
  }
}

