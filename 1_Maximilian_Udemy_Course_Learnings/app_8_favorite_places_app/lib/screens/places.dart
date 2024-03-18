import 'package:app_8_favorite_places_app/Provider/user_places.dart';
import 'package:app_8_favorite_places_app/screens/add_places.dart';
import 'package:app_8_favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class placesScreen extends ConsumerStatefulWidget {
  const placesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _placesScreenState();
  }
}

class _placesScreenState extends ConsumerState<placesScreen>{
  
  late Future<void> _placesFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placesFuture=ref.read(userPlacesProvider.notifier).loadPlaces();
  }
  
  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Great Places'), actions: [
        IconButton(
          icon: const Icon(Icons.add_photo_alternate),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const addPlaceScreen()),
            );
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: _placesFuture,
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : placesList(places: userPlaces)),
      ),
    );
  }
}
