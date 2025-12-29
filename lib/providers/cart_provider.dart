import 'package:appers_ecommerce_app/models/cart_Item.dart';
import 'package:appers_ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, CartItem> _items = {};
  Map<int, CartItem> get items => _items;

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    notifyListeners();
  }

  void removeFromCart(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void increaseQuantity(int productId) {
    _items[productId]!.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int productId) {
    _items[productId]!.quantity > 1
        ? _items[productId]!.quantity--
        : _items.remove(productId);
    notifyListeners();
  }

  //  total amount of all products

  double get totalAmount {
    double total = 0;
    for (var item in _items.values) {
      total += item.totalPrice;
    }
    return total;
  }

  int get itemCount => _items.length;
}
