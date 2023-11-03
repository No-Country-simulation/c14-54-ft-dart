import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/domain/entities/product_entity.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/presentation/screens/home/views/products/product_screen.dart';
import 'package:gestion_inventario/features/shared/shared.dart';
import 'package:go_router/go_router.dart';

class ProductSale extends ConsumerStatefulWidget {
  final String productId;
  static const route = 'productIdS';
  const ProductSale({super.key, required this.productId});

  @override
  ConsumerState<ProductSale> createState() => _ProductSaleState();
}

class _ProductSaleState extends ConsumerState<ProductSale> {
  @override
  void initState() {
    super.initState();
    if (widget.productId != 'new') {
      ref.read(productFirebaseProvider.notifier).loadProductbyIdFirebase(
          id: widget.productId, userId: ref.read(authProvider).user!.id);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productFirebaseProvider).product;

    if (product.id == '') {
      return const CustomLoading();
    }

    return SaleScreen(
      product: product,
    );
  }
}

class SaleScreen extends ConsumerWidget {
  const SaleScreen({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductImage(product: product),
            BuildTitleSection(
              icon: Icons.abc,
              title: "Product",
              content: product.name,
            ),
            BuildTitleSection(
              icon: Icons.book,
              title: "Description",
              content: product.stock.toString(),
            ),
            BuildTitleSection(
                icon: Icons.monetization_on,
                title: "Stock",
                content: product.salePrice.toStringAsFixed(2)),
            TextButton(
              // style: ,

              onPressed: () => context.pushNamed(
                ProductScreen.route,
                pathParameters: {'productId': product.id},
              ),
              child: const Text('Edit'),
            )
//             BuildTitleSection(Icons.shopping_cart_rounded, "Descripción:",
//                 product.description),
//             BuildTitleSection(Icons.monetization_on_outlined, "Precio:",
// product.salePrice ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Sale',
        onPressed: () async {
          await ref
              .read(productFirebaseProvider.notifier)
              .onFormSubmit(ref.read(authProvider).user!.id)
              .then((value) {
            ref.read(productFirebaseProvider.notifier).loadProductbyIdFirebase(
                id: product.id, userId: ref.read(authProvider).user!.id);
            ref
                .read(productsFirebaseProvider.notifier)
                .loadProductsFirebase(ref.read(authProvider).user!.id);
            return customErrorMessage(context, value);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BuildTitleSection extends ConsumerWidget {
  const BuildTitleSection({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });

  final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            width: 30,
          ),

          Container(  padding: const EdgeInsets.all(16),
            child: Text(content,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6F8398),
                  height: 1.5
                ),
                  textAlign: TextAlign.justify,
  ),
          ),
          const Spacer(),
          Icon(
            icon,
            color: Colors.green,
          ),
          const SizedBox(
            width: 30,
          )
        ]);
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: product.id,
              child: product.imageUrl == ''
                  ? Image.asset(
                      'assets/images/products/no-image.png',
                    )
                  : CachedNetworkImage(
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          child: FloatingActionButton(
            heroTag: 'camera',
            onPressed: () {},
            child: const Icon(
              Icons.camera_alt_outlined,
            ),
          ),
        ),
      ],
    );
  }
}
