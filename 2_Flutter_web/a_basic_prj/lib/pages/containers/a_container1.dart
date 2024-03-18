import 'package:a_basic_prj/utils/colors.dart';
import 'package:a_basic_prj/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Container1 extends StatefulWidget {
  const Container1({super.key});

  @override
  State<Container1> createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => mobileContainer1(),
      desktop: (BuildContext context) => desktopContainer1(),
    );
  }

// =============DESKTOP============
  Widget desktopContainer1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w!/10,vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Track your \nExpenses to \nSave Money',
                    style: TextStyle(
                      fontSize: w! / 20,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Help you organise your income and expenses',
                    style: TextStyle(
                      color: Color.fromRGBO(189, 189, 189, 1),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 45,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.primary),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_down),
                            label: const Text('Try Free Demo')),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '-Web,IOS and Android',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child:Container(
              height: 530,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:AssetImage(illustration1),fit: BoxFit.contain,
                  ),
              ),
            ), 
            ),
        ],
      ),
    );
  }

  // ============== MOBILE======================

  Widget mobileContainer1() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: w!/10,vertical: 20),
      child: Column(
        children: [
          Container(
              height: w!/1.5,
              width: w!/1.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:AssetImage(illustration1),fit: BoxFit.contain,
                  ),
              ),
            ), 
            const SizedBox(height: 20,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Track your \nExpenses to \nSave Money',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: w! / 13,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Help you organise your\n income and expenses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(189, 189, 189, 1),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primary),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down),
                      label: const Text('Try Free Demo')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '-Web,IOS and Android',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
          
        ],
      ),
    );
 
  }
}
