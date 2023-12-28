import 'package:a_basic_prj/pages/containers/a_container1.dart';
import 'package:a_basic_prj/utils/constants.dart';
import 'package:a_basic_prj/widgets/navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: const Column(
            children: [
              NavBar(),
              Container1(),
            ],
          ),
      
        ),
      ),
    );
  }
}