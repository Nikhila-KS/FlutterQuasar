import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class Text_Style extends StatelessWidget {
  Text_Style(this.textstring,{super.key});
  String textstring;
  @override
  Widget build(BuildContext context) {
    return Text(
      textstring,
      style:const  TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}