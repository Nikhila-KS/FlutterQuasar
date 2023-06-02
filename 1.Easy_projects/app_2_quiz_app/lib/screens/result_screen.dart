import 'package:app_2_quiz_app/data/questions.dart';
import 'package:app_2_quiz_app/model/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.chosenAns,required this.restartQuiz});

  final List<String> chosenAns;
  final void Function() restartQuiz;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];

    for(int i=0;i<chosenAns.length;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].question.toString(),
        'correct_answer':questions[i].ans[0].toString(),
        'chosen_answer':chosenAns[i].toString(),
        // 'is_correct':questions[i].ans[0]==chosenAns[i]?'Correct':'incorrect',
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();
    final totalQues=questions.length;
    final answeredCorrectly = summaryData.where((data){
      return data['correct_answer']==data['chosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,

      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("You answered $answeredCorrectly out of $totalQues questions correctly",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              textAlign: TextAlign.center,
              ), 
            const SizedBox(
              height: 15,
            ),
            QuesSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon:const Icon(Icons.refresh),
              onPressed: restartQuiz, 
              label: Text("Restart Quiz", 
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(236, 255, 255, 255)),
                foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 14, 5, 140))
              ),
            ),
          ],
        ),
      ),
    );
  }
}