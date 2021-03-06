import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() async {
    isFavorite = !isFavorite;
    notifyListeners();
    final url = "https://flutter-update-fcbe2.firebaseio.com/products/$id";

    try {
      final response =
          await http.patch(url, body: json.encode({"isFavorite": isFavorite}));

      if (response.statusCode >= 400)
      {
        isFavorite = !isFavorite;
        notifyListeners();
      }
    } catch (error) {
      print(error);
      isFavorite = !isFavorite;
      notifyListeners();
    }
  }
}
