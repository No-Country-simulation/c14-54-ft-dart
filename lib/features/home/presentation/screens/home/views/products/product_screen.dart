import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';

class ProductScreen extends StatelessWidget {
  final ProductEntity product;
  static const route = 'product';
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(product.name),
        Text(product.description),
      ],
    ));
  }
}
