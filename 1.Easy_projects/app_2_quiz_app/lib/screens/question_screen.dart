import 'package:app_2_quiz_app/buttons/ansbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectans});
  final void Function(String answer) onSelectans;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentquestionindex ;
  
  @override
  void initState() {
    currentquestionindex = 0;
    super.initState();
  }
  void answerquestion(String selectedAnswer){
    setState(() {
      currentquestionindex++;
      widget.onSelectans(selectedAnswer);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final currentques= questions[currentquestionindex];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentques.question,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize:22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 170, 182, 241),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),


          ...currentques.getSuffledlist().map((answer){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnsButton(
                  anstext: answer, 
                  onTap: (){
                    answerquestion(answer);  // anonymous function declaration
                  }
                  ),
                const SizedBox(height: 15,)
              ],
            );
          }),

          // AnsButton(anstext: currentques.ans[0], onTap: () {}), // hard coded
          // const SizedBox(
          //   height: 20,
          // ),
          // AnsButton(anstext: currentques.ans[1], onTap: () {}),
          // const SizedBox(
          //   height: 20,
          // ),
          // AnsButton(anstext: currentques.ans[2], onTap: () {}),
          // const SizedBox(
          //   height: 20,
          // ),
          // AnsButton(anstext: currentques.ans[3], onTap: () {}),
        ],
      ),
    );
  }
}
