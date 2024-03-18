import 'package:flutter/material.dart';

class AnsButton extends StatelessWidget {
  const AnsButton({super.key,required this.anstext,required this.onTap});

  final String anstext;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,

      style: ElevatedButton.styleFrom(
        backgroundColor:Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        // minimumSize: const Size(250,40),
        // maximumSize: const Size(750,50),
        ), 
      child: Text(anstext,textAlign: TextAlign.center,),
      );
  }
}