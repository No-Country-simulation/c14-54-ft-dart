import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String productId;
  static const route = 'productId';
  const ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        // AspectRatio(
        //   aspectRatio: 16 / 9,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: NetworkImage(productId.imageUrl),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        // Text(productId.name),
        // Text(productId.description),
      ],
    ));
  }
}
