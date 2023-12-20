 import 'package:app_8_favorite_places_app/Provider/user_places.dart';
import 'package:app_8_favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_8_favorite_places_app/Provider/user_places.dart';
import 'package:app_8_favorite_places_app/widgets/image_input.dart';
import 'dart:io';

class addPlaceScreen extends ConsumerStatefulWidget{
  const addPlaceScreen({super.key});

  @override 
  ConsumerState<addPlaceScreen> createState(){
    return _addPlaceScreenState();
  }
}

class _addPlaceScreenState extends ConsumerState<addPlaceScreen>{
  final _titlecontroller=TextEditingController();
  File? _selectedImage;

  void savePlace(){
    final enteredtitle=_titlecontroller.text;
    if(enteredtitle.isEmpty || _selectedImage==null){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Some error occured"),
      ));
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredtitle,_selectedImage!);
    Navigator.of(context).pop();
    return;
  }
  @override
  void dispose(){
    _titlecontroller.dispose();
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration:const InputDecoration(labelText: 'Title'),
              controller: _titlecontroller,
              style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
              ),
              // Image input
              const SizedBox(height: 17,),
              ImageInput(
                onPickImage: (image){
                  _selectedImage=image;
                },
              ),
              const SizedBox(height: 17,),
              const locationInput(),
              const SizedBox(height: 17,),
              ElevatedButton.icon(
                icon: const Icon(Icons.add_photo_alternate_outlined),
                onPressed: savePlace,
                label: const Text('Add place'),
                ),
        ],
        ),
      ),
    );
  }
}