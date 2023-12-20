import 'package:app_8_favorite_places_app/models/places.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// import 'package:app_8_favorite_places_app/models/places.dart';

class PlaceDetailScreen extends StatelessWidget{
  const PlaceDetailScreen({super.key,required this.p});
  final place p;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
      color: Theme.of(context).colorScheme.onBackground,),
    ),
      ),
      body: Stack(
        children: [
          Image.file(
            p.image,
            fit:BoxFit.cover ,
            width: double.infinity,
            height: double.infinity,
            ),
        ],
      ),
    //   Center(
    //     child: Text(p.title,
    // style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    // color: Theme.of(context).colorScheme.onBackground,),
    // ),
    //   ),

    );
  }
}