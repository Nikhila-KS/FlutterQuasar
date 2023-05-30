import 'package:app_2_quiz_app/buttons/ansbutton.dart';
import 'package:flutter/material.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("ques", style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
        const SizedBox(height: 30,),
        AnsButton(anstext:'1', onTap: (){}),
        const SizedBox(height: 20,),
        AnsButton(anstext:'2', onTap: (){}),
        const SizedBox(height: 20,),
        AnsButton(anstext:'3', onTap: (){}),
        const SizedBox(height: 20,),
        AnsButton(anstext:'4', onTap: (){}),
      ],
    );
  }
}