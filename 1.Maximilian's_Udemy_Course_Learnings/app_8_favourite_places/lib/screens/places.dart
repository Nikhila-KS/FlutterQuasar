import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/screens/add_place.dart';
import 'package:favourite_places/widgets/place_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userplaces = ref.watch(userPlaceProvider);


    return Scaffold(
      
      appBar:AppBar(
        title: const Text('Great Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()),);
            },
          ),
        ],
      ),
      body: PlacesList(
        places: userplaces,
      ),
    );
  }
}