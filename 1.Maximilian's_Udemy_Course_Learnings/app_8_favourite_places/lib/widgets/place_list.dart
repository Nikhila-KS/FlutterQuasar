import 'package:favourite_places/models/place_model.dart';
import 'package:flutter/material.dart'; 
import 'package:lottie/lottie.dart';


class PlacesList extends StatelessWidget {
  const PlacesList({super.key,required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if(places.isEmpty){
      return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/empty_animation.json',
              width: 250,
              height:  250,
            ),
            Text(
              'No places yet, start adding some!',
              style : Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder:(ctx,index){
        return ListTile(
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
        );
      }
    );
  }
}