import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://c4b3-114-5-146-110.ngrok-free.app/api/products'));

    if (response.statusCode == 200) {
      // Decode JSON response
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      // Extract the 'data' array
      List<dynamic> data = jsonResponse['data'];
      // Convert each item in the array to a Product object
      List<Product> products = data.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}