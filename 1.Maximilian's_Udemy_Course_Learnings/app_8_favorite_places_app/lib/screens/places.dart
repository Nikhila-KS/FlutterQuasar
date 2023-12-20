import 'package:app_8_favorite_places_app/Provider/user_places.dart';
import 'package:app_8_favorite_places_app/screens/add_places.dart';
import 'package:app_8_favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class placesScreen extends ConsumerWidget {
  const placesScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userPlaces=ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Great Places'), actions: [
        IconButton(
          icon: const Icon(Icons.add_photo_alternate),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx)=>const addPlaceScreen()
                ),
              );
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: placesList(places: userPlaces),
      ),
    );
  }
}
