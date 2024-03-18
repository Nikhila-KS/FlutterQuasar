import 'dart:convert';

import 'package:app_6_flutter_forms/data/categories.dart';
import 'package:app_6_flutter_forms/models/categories.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
  // State<NewItem> createState(){
  //   return _NewItemState();
  // }
}

class _NewItemState extends State<NewItem> {
  var _isSending = false;
  var _itemName = '';
  var enteredQuantity = 1;
  var _selectedCategory = categories[Categories.fruit]!;
  final _formkey = GlobalKey<FormState>();
  // difference between gloabal key and value key is that global key is used to access the state of the widget and value key is used to access the widget itself
  // the internal structure is not rebuild when the key is changed if global key is used

  void _saveItem() async{
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      final url = Uri.https('shopping-list-udemy-95eae-default-rtdb.firebaseio.com','shoppingList-nikki-behappy.json');
       final response = await http.post(
        url,
        headers: {
          'Content-Type' : 'application/json',
        },
        body: json.encode(
          {
          'name' : _itemName, 
          'quantity' : enteredQuantity, 
          'category' : _selectedCategory.title,
          }
        ),
        );

        print(response.body);
        print(response.statusCode);
        if(response.statusCode >= 400){
          return;
        }
        // Navigator.of(context).pop();

        final Map<String, dynamic> resData = json.decode(response.body);

      Navigator.of(context).pop(
        GroceryItem(
          id: resData['name'], 
          name: _itemName, 
          quantity: enteredQuantity, 
          category: _selectedCategory,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Please enter a valid item name';
                  }
                  return null;
                },
                onSaved: (value) {
                  // if(value==null) return;
                  _itemName = value!;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                      ),
                      initialValue: enteredQuantity.toString(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Please enter a valid positive number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // if(value==null) return;
                        enteredQuantity = int.parse(value!);
                      },
                      // diff between parse and tryparse gives null if wrong input is given but paese gives error
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: category.value.color,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(category.value.title),
                            ]),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: _isSending? null : () {
                        _formkey.currentState!.reset();
                      },
                      child: const Text('Reset')),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: _isSending? null: _saveItem,
                    child: _isSending
                    ? const SizedBox(height: 16,width: 16,child: CircularProgressIndicator()) 
                    :const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
