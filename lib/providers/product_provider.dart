import 'package:appers_ecommerce_app/models/product.dart';
import 'package:appers_ecommerce_app/services/api_services.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;
  bool _loading = true;
  bool get loading => _loading;

  String selectedCategory = 'All';

  ProductProvider() {
    loadProducts();
  }

  // product grid section
  Future<void> loadProducts() async {
    try {
      _loading = true;
      notifyListeners();

      _products = await ApiServices().fetchProducts();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // category section

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') return _products;
    return _products
        .where(
          (p) => p.category.toLowerCase() == selectedCategory.toLowerCase(),
        )
        .toList();
  }

  void selectCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}
