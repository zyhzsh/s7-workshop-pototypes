import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/categories.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _list = [];
  var _isLoading = true;
  String? _error;

  void _loadItem() async {
    final url = Uri.https(
        'shopinglist-f06e4-default-rtdb.europe-west1.firebasedatabase.app',
        'shopping-list.json');

    try {
      final response = await http.get(url);
      if (response.statusCode > 400) {
        setState(() {
          _error = 'Something went wrong';
        });
      }
      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> tempList = [];
      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere(
                (element) => element.value.name == item.value['category'])
            .value;
        tempList.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ));
        setState(() {
          _list = tempList;
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _error = 'Something went wrong';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));
    if (newItem != null) {
      setState(() {
        _list.add(newItem);
      });
    }
  }

  void _removeItem(GroceryItem item) async {
    final index = _list.indexOf(item);
    setState(() {
      _list.remove(item);
    });
    final id = item.id;
    final url = Uri.https(
        'shopinglist-f06e4-default-rtdb.europe-west1.firebasedatabase.app',
        'shopping-list/$id.json');
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _list.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: const Text('No items yet.'));
    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if (_list.length != 0) {
      content = ListView.builder(
          itemCount: _list.length,
          itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_list[index].id),
                onDismissed: (direction) {
                  _removeItem(_list[index]);
                },
                child: ListTile(
                  title: Text(_list[index].name),
                  leading: Container(
                      width: 24,
                      height: 24,
                      color: _list[index].category.color),
                  trailing: Text(_list[index].quantity.toString()),
                ),
              ));
    }
    if (_error != null) {
      content = Center(child: Text(_error!));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Grocery List'),
          actions: [
            IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
          ],
        ),
        body: content);
  }
}
