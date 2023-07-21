import 'package:favourite_places/models/place_model.dart';
import 'package:riverpod/riverpod.dart';


class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []); 

  void addPlace(String title){
    final newPlace= Place(title: title);
    state= [newPlace,...state];
  }

  void deletePlace(Place place){
    state= state.where((element) => element.id != place.id).toList();
  }

}


final userPlaceProvider = StateNotifierProvider<UserPlaceNotifier,List<Place>>( 
  (ref) => UserPlaceNotifier()
  );

