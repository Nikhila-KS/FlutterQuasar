import 'package:flutter/material.dart';
import 'package:app_8_favorite_places_app/models/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class UserplacesNotifier extends StateNotifier<List<place>>{
  UserplacesNotifier():super(const []);

  void addPlace(String title,File img){
     final newPlace=place(title: title,image: img);
     state=[newPlace,...state];
  }
}

final userPlacesProvider=StateNotifierProvider<UserplacesNotifier,List<place>>(
      (ref) => UserplacesNotifier(),
);