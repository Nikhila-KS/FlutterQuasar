import 'package:a_basic_prj/utils/colors.dart';
import 'package:a_basic_prj/utils/constants.dart';
import 'package:a_basic_prj/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) => mobileNavBar() ,
        desktop: (BuildContext context) =>  desktopNavBar(),
        );
  }
  
// =========MOBILE==============

  Widget mobileNavBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu_rounded),
          navLogo(),
        ],
      ),
    );
  }

// =========DESKTOP==============
  Widget desktopNavBar() {
    return Container(
      margin : const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navLogo(),
          Row(
            children: [
              navButton("Features"),
              navButton("About us"),
              navButton("Pricing"),
              navButton("Feedback"),
            ],
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              style: borderedButtonStyle,
              onPressed: (){}, 
              child:  Text("Request a Demo",
              style: TextStyle(color: AppColors.primary,),
              ),
              ),
          ),

        ],
        ),
    );
  }

  Widget navButton(String text){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(onPressed: (){}, 
      child: Text(text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      ),
      ),
    );
  }
  Widget navLogo(){
    return Container(
      width: 110,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(logo))
      ),
    );
  }
}
