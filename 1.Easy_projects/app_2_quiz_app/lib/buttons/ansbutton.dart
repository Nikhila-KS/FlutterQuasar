import 'package:flutter/material.dart';

class AnsButton extends StatelessWidget {
  const AnsButton({super.key,required this.anstext,required this.onTap});

  final String anstext;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      child: Text(anstext),
      style: ElevatedButton.styleFrom(
        backgroundColor:Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60), 
        ),
      );
  }
}