import 'dart:convert';

import 'package:app_6_flutter_forms/data/categories.dart';
import 'package:app_6_flutter_forms/models/grocery_item.dart';
import 'package:app_6_flutter_forms/widgets/new_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadItems();
  }

  void _loadItems() async {

    try {
      final url = Uri.https(
          'shopping-list-udemy-95eae-default-rtdb.firebaseio.com',
          'shoppingList-nikki-behappy.json');
      final response = await http.get(url);

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> firbaseloadedItems = [];

      for (final items in listData.entries) {
        final categoryy = categories.entries
            .firstWhere(
                (element) => element.value.title == items.value['category'])
            .value;
        firbaseloadedItems.add(GroceryItem(
          id: items.key,
          name: items.value['name'],
          quantity: items.value['quantity'],
          category: categoryy,
        ));
      }
      setState(() {
        _groceryItems = firbaseloadedItems;
        _isLoading = false;
      });

      print(
          "========================================================================");
      print(response.body);
      print(
          "========================================================================");
    } catch (error) {

        setState(() {
          _error = 'Something went wrong.Please try again later.';
        });

    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });

    //  _loadItems();
  }

  void removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    final url = Uri.https(
        'shopping-list-udemy-95eae-default-rtdb.firebaseio.com',
        'shoppingList-nikki-behappy/${item.id}.json');
    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items yet!'),
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_groceryItems[index].id),
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

    if (_error != null) {
      content = Center(
        child: Text(_error!),
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
