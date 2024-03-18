import 'package:flutter/material.dart';
import 'package:app_8_favorite_places_app/models/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbpath = await sql
      .getDatabasesPath(); // we will get the path where database will be stored
  final db = await sql.openDatabase(
      // if there exist a database/table it will be opened otherwsw a new one will be created
      path.join(dbpath, 'places_database.db'), onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT,image TEXT)');
  }, version: 1);
  return db;
}

class UserplacesNotifier extends StateNotifier<List<place>> {
  UserplacesNotifier() : super(const []);

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = data
        .map(
          (row) => place(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String),
          ),
        )
        .toList();
        state=places;
  }

  void addPlace(String title, File img) async {
    final appDirectory = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(img.path);
    final copiedImage = await img.copy(
        '${appDirectory.path}/$filename'); // copied image from temp storage to permanent memory

    final newPlace = place(title: title, image: copiedImage);

    final db = await _getDatabase();
    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });

    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserplacesNotifier, List<place>>(
  (ref) => UserplacesNotifier(),
);
