import 'package:a_basic_prj/utils/colors.dart';
import 'package:a_basic_prj/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class container2 extends StatefulWidget {
  const container2({super.key});

  @override
  State<container2> createState() => _container2State();
}

class _container2State extends State<container2> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => mobilecontainer2(),
      desktop: (BuildContext context) => desktopcontainer2(),
    );
  }

// =============DESKTOP============
  Widget desktopcontainer2() {
    return Container(
      height: 900,
      width: double.infinity,
      decoration:BoxDecoration(
        color: AppColors.primary,
      ) ,
      child: const Column(
        children: [
          Expanded(
            child:Stack(
              children: [
                // Positioned(child: ),
              ],
            ), 
          ),
      ],
      ),
    );
  }

  // ============== MOBILE======================

  Widget mobilecontainer2() {
    return Container(

    );
  }
}
