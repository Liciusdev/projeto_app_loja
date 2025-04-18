import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';


class ApiServices {
  static const String _baseUrl = 'https://fakestoreapi.com';

  static Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));
      if (response.statusCode == 200) {
       final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}