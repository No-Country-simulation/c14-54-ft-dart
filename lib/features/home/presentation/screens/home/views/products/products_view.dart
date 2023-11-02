import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';

class ProductsView extends ConsumerWidget {
  const ProductsView({
    super.key,
  });
  static const route = 'view_2';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsFirebaseProvider);
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            child: ProductRow(
              product: products[index],
            ),
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
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      height: 200,
      width: size.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: textStyle.titleLarge?.copyWith(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                shadows: [
                  const Shadow(
                    color: Colors.black26,
                    offset: Offset(2, 4),
                    blurRadius: 6,
                  ),
                ],
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              product.description,
              style: textStyle.titleMedium?.copyWith(shadows: [
                const Shadow(
                  color: Colors.black26,
                  offset: Offset(2, 4),
                  blurRadius: 7,
                ),
              ]),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Precio: ${product.salePrice.toStringAsFixed(2)}',
              style: textStyle.titleMedium,
            ),
            Text(
              'Stock: ${product.stock}',
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