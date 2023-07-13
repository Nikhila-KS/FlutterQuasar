import 'package:flutter/material.dart';
import 'package:app_6_flutter_forms/data/dummy_items.dart';

class GroceryList extends StatelessWidget{
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index)=> ListTile(
          leading: Container(
            height: 20,
            width: 20,
            color :groceryItems[index].category.color,
            
            // decoration:  BoxDecoration(
            //   color: groceryItems[index].category.color, 
            //   borderRadius: const BorderRadius.all(Radius.circular(50)),
            // ),
          ),
         title: Text(groceryItems[index].name),
          subtitle: Text(groceryItems[index].category.title),
          trailing: Text(groceryItems[index].quantity.toString(),
          ),
        ),
      ),
    );
  }
}