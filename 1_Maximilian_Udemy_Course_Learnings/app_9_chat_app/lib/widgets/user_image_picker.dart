import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key,required this.onpickimage});

  final void Function(File pickedimage) onpickimage;

  @override
  State<UserImagePicker> createState() {
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
   
   File? _pickedImageFile;

  void _pickImage() async{
    final pickedImage= await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 50,maxWidth: 150);
    if(pickedImage==null){
      return;
    }
    setState(() {
      _pickedImageFile=File(pickedImage.path);
      widget.onpickimage(_pickedImageFile!);
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: const Color.fromARGB(95, 38, 4, 65),
          foregroundImage: _pickedImageFile !=null? FileImage(_pickedImageFile!):null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: Text('Add Image',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
        ),
      ],
    );
  }
}
