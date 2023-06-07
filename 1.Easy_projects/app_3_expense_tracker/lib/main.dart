import 'package:app_3_expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kcolorscheme= ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kdarkcolorscheme= ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 99, 125),brightness: Brightness.dark).copyWith(brightness: Brightness.dark);
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kdarkcolorscheme,
        useMaterial3: true,
        // appBarTheme: const AppBarTheme().copyWith(
        //   backgroundColor: kdarkcolorscheme.onPrimaryContainer,
        //   foregroundColor: kdarkcolorscheme.primaryContainer,
        //   ),
          cardTheme: const CardTheme().copyWith(
            color: kdarkcolorscheme.secondaryContainer,
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: kdarkcolorscheme.onPrimaryContainer, backgroundColor: kdarkcolorscheme.primaryContainer,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        // scaffoldBackgroundColor: const Color.fromARGB(255, 241, 223, 255),
        colorScheme: kcolorscheme,
         appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolorscheme.onPrimaryContainer,
          foregroundColor: kcolorscheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kcolorscheme.secondaryContainer,
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: kcolorscheme.onPrimaryContainer, backgroundColor: kcolorscheme.primaryContainer,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: kcolorscheme.primaryContainer,
            ),
            ),

          

        ),
        themeMode: ThemeMode.dark, 
      home: const Expenses(),
      );
  }
}