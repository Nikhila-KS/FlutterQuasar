import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../buttons/question_identifier.dart';

class QuesSummary extends StatelessWidget {
  const QuesSummary({super.key, required this.summaryData});

  final List<Map<String,Object>>summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data){
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(17, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(((data['question_index'] as int ) + 1).toString()),
                    IsCorrectButton(
                      questionIndex:(data['question_index'] as int ),
                      isCorrect:((data['chosen_answer']== data['correct_answer']))
                      ),
                      const SizedBox(width: 12,),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'].toString(),
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(200, 255, 255, 255),
                              ),
                            ),
                          ),
                          if(data['chosen_answer']==data['correct_answer'])
                              Text(
                            "correct answer : ${data['correct_answer'].toString()}",
                            style: const TextStyle(
                              color: Color.fromARGB(212, 49, 205, 248),
                            ),
                            ),
                          if(data['chosen_answer']!=data['correct_answer'])
                               Text(
                                "your answer : ${data['chosen_answer'].toString()} \ncorrect answer: ${data['correct_answer'].toString()}",
                                style: const TextStyle(
                              color: Color.fromARGB(212, 49, 205, 248),
                              fontWeight: FontWeight.w500,
                            ),
                                ),
                        ],
                      ),
                    ),
                   
                  ],
                ),
              );
            }).toList(),
          ),
      ),
    );
  }
}