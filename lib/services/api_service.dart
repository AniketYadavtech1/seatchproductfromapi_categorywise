import 'dart:convert';

import 'package:searchproduct/model/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if(response.statusCode==200){
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data)=> Product.fromJson(data)).toList();
    }else{
      throw Exception('Failed to load products');
    }
  }




}