import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';

class View2 extends StatelessWidget {
  final List products;
  const View2({super.key, required this.products});
  static const route = 'view_2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => ProductRow(
            product: products[index],
          ),
          itemCount: products.length,
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final ProductEntity product;
  const _ProductImage({required this.product});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return ClipRRect(
      child: Card(
        child: Container(
          height: 200,
          width: size.width * 0.4,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          child: CachedNetworkImage(
            imageUrl: product.imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(
              color: colors.secondary,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final ProductEntity product;
  const _ProductDescription({required this.product});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: 200,
        width: size.width * 0.4,
        child: Column(
          children: [
            Text(
              product.name,
              style: textStyle.titleLarge,
            ),
            Text(
              product.description,
              style: textStyle.titleMedium,
            ),
            Text(
              product.salePrice.toString(),
              style: textStyle.titleMedium,
            ),
            Text(
              product.stock.toString(),
              style: textStyle.titleMedium,
            ),
          ],
        ));
  }
}

class ProductRow extends StatelessWidget {
  final ProductEntity product;
  const ProductRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ProductImage(
          product: product,
        ),
        _ProductDescription(product: product),
      ],
    );
  }
}
