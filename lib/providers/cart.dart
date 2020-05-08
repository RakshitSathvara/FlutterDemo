import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItemMap = {};

  Map<String, CartItem> get _items {
    return {..._items};
  }

  int get itemCount {
    return _cartItemMap.length;
  }

  void addCartItem(String productId, double price, String title) {
    if (_cartItemMap.containsKey(productId)) {
      _cartItemMap.update(
          productId,
          (value) => CartItem(
              id: value.id,
              quantity: value.quantity + 1,
              price: value.price,
              title: value.title));
    } else {
      _cartItemMap.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }
}
