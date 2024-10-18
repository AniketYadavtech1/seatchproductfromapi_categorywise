import 'package:flutter/material.dart';
import 'package:searchproduct/model/product.dart';
import 'package:searchproduct/services/api_service.dart';

import '../widgets/product_list.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ApiService apiService = ApiService();

  List<Product> productList = [];
  List<Product> filteredList = [];

  @override
  void initState() {
    fetchProducts();

    super.initState();
  }

  Future<void> fetchProducts() async {
    productList = await apiService.fetchProducts();

    setState(() {
      filteredList = productList;
    });
  }

  void searchCategory(String query) {
    List<Product> filtered = productList
        .where((product) =>
            product.category.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredList = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 100,),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Search by Category',
                  border: OutlineInputBorder()),
              onChanged: (value) {
                searchCategory(value);
              },
            ),
          ),
          Expanded(child: ProductList(products: filteredList))
        ],
      ),
    );
  }
}
