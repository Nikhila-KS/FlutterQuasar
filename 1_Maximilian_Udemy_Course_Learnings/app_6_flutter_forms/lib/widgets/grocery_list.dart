import 'package:app_6_flutter_forms/models/grocery_item.dart';
import 'package:app_6_flutter_forms/widgets/new_item.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];


  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem())
        );

        if(newItem==null ) return; // user pressed back button or error
        
        setState(() {
          _groceryItems.add(newItem);
        });
  }

  void removeItem(GroceryItem item){
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items yet!'),
    );

    if(_groceryItems.isNotEmpty){

      content= ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key : ValueKey(_groceryItems[index].id),
          onDismissed: (direction) {
            removeItem(_groceryItems[index]);
          },
          child: ListTile(
            leading: Container(
              height: 20,
              width: 20,
              color: _groceryItems[index].category.color,
        
              // decoration:  BoxDecoration(
              //   color: groceryItems[index].category.color,
              //   borderRadius: const BorderRadius.all(Radius.circular(50)),
              // ),
            ),
            title: Text(_groceryItems[index].name),
            subtitle: Text(_groceryItems[index].category.title),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
          ),
        ],
      ),
      body: content,
    );
  }
}
