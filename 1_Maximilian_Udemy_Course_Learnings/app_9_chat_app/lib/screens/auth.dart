import 'package:app_9_chat_app/widgets/user_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  var _islogin = true;
  final _formKey = GlobalKey<FormState>();
  var _enteredemail = '';
  var _enteredpassword = '';
  File? _selectedImage;
  var _isauthenthicating=false;
  var _enteredUsername='';

  void _submit() async {
    final isvalid = _formKey.currentState!.validate();

    if(!isvalid || !_islogin && _selectedImage==null){ 
      return;
    }

    _formKey.currentState!.save();
    // print("pppppp${_enteredemail}pppppppp$_enteredpassword");
    try {
      setState(() {
        
        _isauthenthicating=true;
      });
      if (_islogin) {
        final userCredential = await _firebase.signInWithEmailAndPassword(
            email: _enteredemail, password: _enteredpassword);
        print('$userCredential');
      } else {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
            email: _enteredemail, password: _enteredpassword);

        final storageRef=FirebaseStorage.instance.ref().child('user_images').child('${userCredential.user!.uid}.jpg');
        await storageRef.putFile(_selectedImage!);
        final imageUrl= await storageRef.getDownloadURL();
        print("------$userCredential------");

        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'username':_enteredUsername,
          'email':_enteredemail,
          'image_url':imageUrl,

        });

      }
    } on FirebaseException catch (error) {
      print("****************$error**********");
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error.message ?? 'Auth-failed')));
      setState(() {
        _isauthenthicating=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 5,
                  right: 5,
                ),
                // width: 800,
                child: Image.asset('assets/images/chatty2.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min, 
                        children: [
                          if(!_islogin) UserImagePicker(
                            onpickimage: (pickedimage) {
                            _selectedImage=pickedimage;
                          },),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Enter Valid Email Address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredemail = value!;
                          },
                        ),
                        if(!_islogin)
                        const SizedBox(height: 6,),
                        if(!_islogin)
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Username',),
                          enableSuggestions: false,
                          validator: (value){
                            if(value==null || value.trim().length < 4){
                              return 'please enter atleast 4 characters';
                            }
                            return null;
                          },
                          onSaved: (value){
                            _enteredUsername = value!;
                          },
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must be atleast 6 characters long';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredpassword = value!;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if(_isauthenthicating) const CircularProgressIndicator(),
                        if(!_isauthenthicating)
                        ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Text(_islogin ? 'Login' : 'Signup')),
                        if(!_isauthenthicating)
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _islogin = !_islogin;
                              });
                            },
                            child: Text(_islogin
                                ? 'Create an account'
                                : 'I have an account!')),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
