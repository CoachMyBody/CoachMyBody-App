import 'package:flutter/material.dart';

class Sample with ChangeNotifier {

  final String id;
  final String description;

  Sample({
    @required this.id,
    @required this.description
  });

  // List<Sample> _items = {

  // };

  //   List<Sample> get items {

  //   // if (_showFavoritesOnly) {
  //   //   return _items.where((prodItem) => prodItem.isFavorite).toList();
  //   // }

  //   return [..._items];
  // }


}
