import 'dart:convert';
import 'dart:developer';
import 'package:appers_ecommerce_app/models/product.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const _url = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_url));
    List<Product> products = [];

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        List data = jsonDecode(response.body);
        products = data.map((e) => Product.fromJson(e)).toList();
        log('length: ${products.length}');
      }
    } catch (e) {
      log(e.toString());
    }
    return products;
  }
}
