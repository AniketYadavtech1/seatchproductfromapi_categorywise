import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Center(
            child: Text('No Product found'),
          )
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                child: ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(product.title),
                  subtitle: Text('${product.category}-\$${product.price}'),
                ),
              );
            },
          );
  }
}
